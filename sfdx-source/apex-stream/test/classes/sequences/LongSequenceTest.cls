/**
 * @see LongSequence
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class LongSequenceTest {

    private static final List<Long> LONGS = IterTestUtils.generateLongs();

    /**
     * @see LongSequence.of
     * @see LongSequence.ofNullable
     * @see LongSequence.empty
     * @see LongSequence.iterator
     * @see LongSequence.stream
     */
    @IsTest
    private static void of() {
        // Given
        LONGS.add(0, null);
        LONGS.add(null);
        List<Long> input = LONGS.clone();
        List<Long> input1;
        Set<Long> input2;
        ILongIterable seq = LongSequence.of(input);
        ILongIterable seq1 = LongSequence.of(new Set<Long>(input));
        ILongIterable seq2 = LongSequence.ofNullable(input);
        ILongIterable seq3 = LongSequence.ofNullable(new Set<Long>(input));
        ILongIterable seq4 = LongSequence.ofNullable(input1);
        ILongIterable seq5 = LongSequence.ofNullable(input2);
        ILongIterable stream = ((LongSequence) LongSequence.of(input)).stream();
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = seq1.toList();
        List<Long> actual2 = seq2.toList();
        List<Long> actual3 = seq3.toList();
        List<Long> actual4 = seq4.toList();
        List<Long> actual5 = seq5.toList();
        // Then
        List<Long> expected = new List<Long>(new Set<Long>(input));
        List<Long> expected1 = new List<Long>();
        Assert.areEqual(input, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(true, seq.iterator().hasNext());
        Assert.areEqual(true, seq1.iterator().hasNext());
        Assert.areEqual(true, seq2.iterator().hasNext());
        Assert.areEqual(true, seq3.iterator().hasNext());
        Assert.areEqual(false, seq4.iterator().hasNext());
        Assert.areEqual(false, seq5.iterator().hasNext());
        Assert.areEqual(false, stream.isEmpty());
        Assert.areEqual(LONGS, input, Label.InputMutatedErrorMessage);
        Assert.isTrue(((LongStream) stream).isOperated);
    }

    /**
     * @see LongSequence.range
     */
    @IsTest
    private static void range() {
        // Given
        Long fromI = 0L;
        Long fromI1 = -100L;
        Long fromI2 = 100L;
        Long toI = 200L;
        Long toI1 = 100L;
        Long toI2 = 0L;
        ILongIterable seq = LongSequence.range(fromI, toI);
        ILongIterable seq1 = LongSequence.range(fromI1, toI1);
        ILongIterable seq2 = LongSequence.range(fromI2, toI1);
        ILongIterable seq3 = LongSequence.range(fromI2, toI2);
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = seq1.toList();
        List<Long> actual2 = seq2.toList();
        List<Long> actual3 = seq3.toList();
        // Then
        Assert.areEqual(toI - fromI + 1, actual.size());
        for (Integer i = 0, size = actual.size(); i < size; i++) {
            Assert.areEqual(i, actual[i]);
        }
        Assert.areEqual(toI1 - fromI1 + 1, actual1.size());
        for (Integer i = 0, size = actual1.size(); i < size; i++)  {
            Assert.areEqual(i + fromI1, actual1[i]);
        }
        Assert.areEqual(toI1 - fromI2 + 1, actual2.size());
        for (Integer i = 0, size = actual2.size(); i < size; i++) {
            Assert.areEqual(i + fromI2, actual2[i]);
        }
        Assert.areEqual(0, actual3.size());
    }

    /**
    * @see LongSequence.concat
    */
    @IsTest
    private static void concat() {
        // Given
        List<Long> input1 = new List<Long>{ -5L, 0L, 1L, 3L, 150L };
        List<Long> input2 = new List<Long>{ 3L, 0L, 8L };
        List<Long> input3 = new List<Long>{ 9L, 5L, 7L };
        ILongIterable seq = LongSequence.concat(LongSequence.of(input1), LongSequence.of(input2));
        ILongIterable seq1 = LongSequence.concat(new List<ILongIterable>{ LongSequence.of(input1), LongSequence.of(input2), LongSequence.of(input3) });
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = seq1.toList();
        // Then
        List<Long> expected = new List<Long>{ -5L, 0L, 1L, 3L, 150L, 3L, 0L, 8L };
        List<Long> expected1 = new List<Long>{ -5L, 0L, 1L, 3L, 150L, 3L, 0L, 8L, 9L, 5L, 7L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
    }

    /**
    * @see LongSequence.zip
    */
    @IsTest
    private static void zip() {
        // Given
        List<Long> input = new List<Long>{ -5L, 0L, 1L };
        List<Long> input1 = new List<Long>{ 3L, 0L, 8L };
        ILongIterable seq = LongSequence.zip(LongSequence.of(input), LongSequence.of(input1), LongBinaryOperators.sum());
        // When
        List<Long> actual = seq.toList();
        // Then
        List<Long> expected = new List<Long>{ -2L, 0L, 9L };
        Assert.areEqual(expected, actual);
    }

    /**
    * @see LongSequence.append
    * @see LongSequence.prepend
    */
    @IsTest
    private static void appendPrepend() {
        // Given
        List<Long> input = new List<Long>{ -5L, 0L, 1L };
        List<Long> input1 = new List<Long>{ 3L, 0L, 8L };
        ILongIterable seq = LongSequence.of(input).append(LongSequence.of(input1));
        ILongIterable seq1 = LongSequence.of(input).prepend(LongSequence.of(input1));
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = seq1.toList();
        // Then
        List<Long> expected = new List<Long>{ -5L, 0L, 1L, 3L, 0L, 8L };
        List<Long> expected1 = new List<Long>{ 3L, 0L, 8L, -5L, 0L, 1L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
    }
    
    /**
     * @see LongIterable.union
     * @see LongIterable.intersect
     * @see LongIterable.except
     */
    @IsTest
    private static void setOperations() {
        // Given
        List<Long> input = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
        List<Long> input1 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
        ILongIterable seq = LongSequence.of(input).union(input1);
        ILongIterable seq1 = LongSequence.of(input).union(LongSequence.of(input1));
        ILongIterable seq2 = LongSequence.of(input).intersect(input1);
        ILongIterable seq3 = LongSequence.of(input).intersect(LongSequence.of(input1));
        ILongIterable seq4 = LongSequence.of(input).except(input1);
        ILongIterable seq5 = LongSequence.of(input).except(LongSequence.of(input1));
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = seq1.toList();
        List<Long> actual2 = seq2.toList();
        List<Long> actual3 = seq3.toList();
        List<Long> actual4 = seq4.toList();
        List<Long> actual5 = seq5.toList();
        // Then
        List<Long> expected = new List<Long>{ 5L, 3L, 9L, 7L, 8L, 6L, 4L, 1L, 0L };
        List<Long> expected1 = new List<Long>{ 3L, 9L };
        List<Long> expected2 = new List<Long>{ 5L, 7L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
    }
    
    /**
    * @see LongSequence.toObjectIterable
    * @see LongIterable.toIntIterable
    * @see LongIterable.toDoubleIterable
    */
    @IsTest
    private static void convert() {
        // Given
        List<Long> input = new List<Long>{ -5L, 0L, 1L, 3L, 8L, null };
        IObjectIterable seq = LongSequence.of(input).toObjectIterable();
        IIntIterable seq1 = LongSequence.of(input).toIntIterable();
        IDoubleIterable seq2 = LongSequence.of(input).toDoubleIterable();
        // When
        List<Object> actual = seq.toList();
        List<Integer> actual1 = seq1.toList();
        List<Double> actual2 = seq2.toList();
        // Then
        List<Object> expected = new List<Object>{ -5L, 0L, 1L, 3L, 8L, null };
        List<Integer> expected1 = new List<Integer>{ -5, 0, 1, 3, 8, null };
        List<Double> expected2 = new List<Double>{ -5, 0, 1, 3, 8, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected2, actual2);
    }

    /**
    * @see LongSequence.filter
    */
    @IsTest
    private static void filter() {
        // Given
        List<Long> input = new List<Long>{ -5L, 0L, 1L, 3L, 8L, null, -6L, 4L, 4L };
        ILongIterable seq = LongSequence.of(input).filter(LongPredicates.isGreater(0L));
        // When
        List<Long> actual = seq.toList();
        // Then
        List<Long> expected = new List<Long>{ 1L, 3L, 8L, 4L, 4L };
        Assert.areEqual(expected, actual);
    }

    /**
    * @see LongSequence.take
    */
    @IsTest
    private static void take() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, null, -6L, 4L, 4L };
        ILongIterable seq = LongSequence.of(input).take(LongPredicates.isGreater(0L));
        // When
        List<Long> actual = seq.toList();
        // Then
        List<Long> expected = new List<Long>{ 5L, 1L, 3L, 8L };
        Assert.areEqual(expected, actual);
    }

    /**
    * @see LongSequence.drop
    */
    @IsTest
    private static void drop() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, null, -6L, 4L, 4L };
        ILongIterable seq = LongSequence.of(input).drop(LongPredicates.isGreater(0L));
        // When
        List<Long> actual = seq.toList();
        // Then
        List<Long> expected = new List<Long>{ -3L, null, -6L, 4L, 4L };
        Assert.areEqual(expected, actual);
    }

    /**
    * @see LongIterable.withoutNulls
    */
    @IsTest
    private static void withoutNulls() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, null, -6L, 0L, 4L, null };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone).withoutNulls();
        // When
        List<Long> actual = seq.toList();
        // Then
        List<Long> expected = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see LongSequence.mapTo
    */
    @IsTest
    private static void mapTo() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone).mapTo(new IterTestUtils.MultiplyLongOp(2));
        // When
        List<Long> actual = seq.toList();
        // Then
        List<Long> expected = new List<Long>{ 10L, 2L, 6L, 16L, -6L, 8L, -12L, 0L, 8L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see LongSequence.mapToInt
    */
    @IsTest
    private static void mapToInt() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        IIntIterable seq = LongSequence.of(clone).mapToInt(LongToIntFunctions.valueOf());
        // When
        List<Long> actual = seq.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see LongSequence.mapToDouble
    */
    @IsTest
    private static void mapToDouble() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        IDoubleIterable seq = LongSequence.of(clone).mapToDouble(LongToDoubleFunctions.valueOf());
        // When
        List<Double> actual = seq.toList();
        // Then
        List<Double> expected = new List<Double>{ 5.0, 1.0, 3.0, 8.0, -3.0, 4.0, -6.0, 0.0, 4.0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongSequence.mapToSObject
     */
    @IsTest
    private static void mapToSObject() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ISObjectIterable seq = LongSequence.of(clone).mapToSObject(new IterTestUtils.CreateAccountFromLongs());
        // When
        List<Account> actual = seq.toList();
        // Then
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        for (Integer i = 0, size = input.size(); i < size; i++ ) {
            Assert.areEqual(Math.abs(clone[i]), actual[i].NumberOfEmployees);
        }
    }

    /**
     * @see LongSequence.mapToObject
     */
    @IsTest
    private static void mapToObject() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        IObjectIterable seq = LongSequence.of(clone).mapToObject(new IterTestUtils.LongToString());
        // When
        List<String> actual = (List<String>) seq.toList(List<String>.class);
        // Then
        List<String> expected = new List<String>{ '5', '1', '3', '8', '-3', '4', '-6', '0', '4' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongSequence.forEach
     */
    @IsTest
    private static void forEach() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone).forEach(new IterTestUtils.DoNothingLongConsumer());
        // When
        List<Long> actual = seq.toList();
        // Then
        Assert.areEqual(clone, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongSequence.distinct
     */
    @IsTest
    private static void distinct() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone).distinct();
        // When
        List<Long> actual = seq.toList();
        // Then
        List<Long> expected = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongSequence.sort
     */
    @IsTest
    private static void sort() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, null, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone).sort();
        // When
        List<Long> actual = seq.toList();
        // Then
        List<Long> expected = new List<Long>{ null, -6L, -3L, 0L, 1L, 3L, 4L, 4L, 5L, 8L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongSequence.lim
     */
    @IsTest
    private static void lim() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, null, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone).lim(25);
        ILongIterable seq1 = LongSequence.of(clone).lim(3);
        ILongIterable seq2 = LongSequence.of(clone).lim(0);
        ILongIterable seq3 = LongSequence.of(clone);
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = seq1.toList();
        List<Long> actual2 = seq2.toList();
        Exception exc1;
        try {
            seq3.lim(-2);
        } catch (IllegalArgumentException exc) {
            exc1 = exc;
        }
        // Then
        List<Long> expected = new List<Long>{ 5L, 1L, 3L };
        List<Long> expected1 = new List<Long>();
        Assert.areEqual(input, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(IllegalArgumentException.class.getName(), exc1.getTypeName());
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongSequence.skip
     */
    @IsTest
    private static void skip() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, null, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone).skip(5);
        ILongIterable seq1 = LongSequence.of(clone).skip(0);
        ILongIterable seq2 = LongSequence.of(clone).skip(25);
        ILongIterable seq3 = LongSequence.of(clone);
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = seq1.toList();
        List<Long> actual2 = seq2.toList();
        Exception exc1;
        try {
            seq3.skip(-2);
        } catch (IllegalArgumentException exc) {
            exc1 = exc;
        }
        // Then
        List<Long> expected = new List<Long>{ 4L, null, -6L, 0L, 4L };
        List<Long> expected1 = new List<Long>();
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(IllegalArgumentException.class.getName(), exc1.getTypeName());
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongSequence.reduce
     */
    @IsTest
    private static void reduce() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        List<Long> cloneWithNulls = input.clone();
        cloneWithNulls.add(null);
        ILongIterable seq = LongSequence.of(clone);
        ILongIterable seq1 = LongSequence.of(clone);
        ILongIterable seq2 = LongSequence.of(cloneWithNulls);
        Long seed = 10;
        // When
        Long actual = seq.reduce(seed, LongBinaryOperators.sum());
        Long actual1 = seq1.reduce(LongBinaryOperators.sum()).get();
        Exception exc1;
        try {
            seq2.reduce(LongBinaryOperators.sum());
        } catch (Exception exc) {
            exc1 = exc;
        }
        // Then
        Long expected = 26;
        Long expected1 = 16;
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(10, seed, Label.InputMutatedErrorMessage);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongSequence.collect
     */
    @IsTest
    private static void collect() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone);
        // When
        Set<Long> actual = (Set<Long>) seq.collect(Supplier.of(Set<Long>.class), ObjectLongConsumer.compose(new IterTestUtils.AddToLongSet()));
        // Then
        Set<Long> expected = new Set<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongSequence.find
     */
    @IsTest
    private static void find() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone);
        ILongIterable seq1 = LongSequence.of(clone);
        // When
        Long actual = seq.find(LongPredicates.isLess(0L)).get();
        Long actual1 =seq1.find(LongPredicates.isGreater(50L)).orElse(42L);
        // Then
        Assert.areEqual(-3L, actual);
        Assert.areEqual(42L, actual1);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongSequence.every
     */
    @IsTest
    private static void every() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone);
        ILongIterable seq1 = LongSequence.of(clone);
        // When
        Boolean actual = seq.every(LongPredicates.isEven().negate());
        Boolean actual1 = seq1.every(LongPredicates.isPrime());
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongSequence.some
     */
    @IsTest
    private static void some() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone);
        ILongIterable seq1 = LongSequence.of(clone);
        // When
        Boolean actual = seq.some(LongPredicates.isLess(0L));
        Boolean actual1 = seq1.some(LongPredicates.isEqual(0L));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongIterable.none
     */
    @IsTest
    private static void none() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone);
        ILongIterable seq1 = LongSequence.of(clone);
        // When
        Boolean actual = seq.none(LongPredicates.isEven());
        Boolean actual1 = seq1.none(LongPredicates.isLess(0L));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongIterable.max
     */
    @IsTest
    private static void max() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone);
        // When
        Long actual = seq.max().get();
        // Then
        Assert.areEqual(9, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongIterable.min
     */
    @IsTest
    private static void min() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone);
        // When
        Long actual = seq.min().get();
        // Then
        Assert.areEqual(-3L, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongSequence.sum
     */
    @IsTest
    private static void sum() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone);
        // When
        Long actual = seq.sum();
        // Then
        Assert.areEqual(22L, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongSequence.avg
     */
    @IsTest
    private static void avg() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone);
        // When
        Double actual = seq.avg().get();
        // Then
        Assert.areEqual(3.625, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongSequence.count
     */
    @IsTest
    private static void count() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone);
        ILongIterable seq1 = LongSequence.of(new List<Long>());
        ILongIterable seq2 = LongSequence.empty();
        // When
        Long actual = seq.count();
        Long actual1 = seq1.count();
        Long actual2 = seq2.count();
        // Then
        Assert.areEqual(8L, actual);
        Assert.areEqual(0L, actual1);
        Assert.areEqual(0L, actual2);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongSequence.isEmpty
     */
    @IsTest
    private static void isEmpty() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone);
        ILongIterable seq1 = LongSequence.of(new List<Long>());
        ILongIterable seq2 = LongSequence.empty();
        // When
        Boolean actual = seq.isEmpty();
        Boolean actual1 = seq1.isEmpty();
        Boolean actual2 = seq2.isEmpty();
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(true, actual2);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongSequence.toList
     */
    @IsTest
    private static void toList() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone);
        // When
        List<Long> actual = seq.toList();
        // Then
        Assert.areEqual(input, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see LongSequence.toSet
     */
    @IsTest
    private static void toSet() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        ILongIterable seq = LongSequence.of(clone);
        // When
        Set<Long> actual = seq.toSet();
        // Then
        Set<Long> expected = new Set<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

}
