/**
 * @author O. Berehovskyi
 * @see IntSequence
 */
@IsTest(IsParallel = true)
private class IntSequenceTest {

    /**
     * @see IntSequence.of
     * @see IntSequence.ofNullable
     * @see IntSequence.empty
     * @see IntSequence.iterator
     * @see IntSequence.stream
     */
    @IsTest
    private static void of() {
        // Given
        List<Integer> ints = IterTestUtils.generateInts();
        ints.add(0, null);
        ints.add(null);
        List<Integer> input = ints.clone();
        List<Integer> input1;
        Set<Integer> input2;
        IIntIterable seq = IntSequence.of(input);
        IIntIterable seq1 = IntSequence.of(new Set<Integer>(input));
        IIntIterable seq2 = IntSequence.ofNullable(input);
        IIntIterable seq3 = IntSequence.ofNullable(new Set<Integer>(input));
        IIntIterable seq4 = IntSequence.ofNullable(input1);
        IIntIterable seq5 = IntSequence.ofNullable(input2);
        IIntIterable stream = ((IntSequence) IntSequence.of(input)).stream();
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = seq1.toList();
        List<Integer> actual2 = seq2.toList();
        List<Integer> actual3 = seq3.toList();
        List<Integer> actual4 = seq4.toList();
        List<Integer> actual5 = seq5.toList();
        // Then
        List<Integer> expected = new List<Integer>(new Set<Integer>(input));
        List<Integer> expected1 = new List<Integer>();
        Validate.assertEquals(input, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(input, actual2);
        Validate.assertEquals(expected, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(true, seq.iterator().hasNext());
        Validate.assertEquals(true, seq1.iterator().hasNext());
        Validate.assertEquals(true, seq2.iterator().hasNext());
        Validate.assertEquals(true, seq3.iterator().hasNext());
        Validate.assertEquals(false, seq4.iterator().hasNext());
        Validate.assertEquals(false, seq5.iterator().hasNext());
        Validate.assert(!((IntStream) stream).isOperated);
        Validate.assertEquals(ints, input, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.range
     */
    @IsTest
    private static void range() {
        // Given
        Integer fromI = 0;
        Integer fromI1 = -100;
        Integer fromI2 = 100;
        Integer toI = 200;
        Integer toI1 = 100;
        Integer toI2 = 0;
        IIntIterable seq = IntSequence.range(fromI, toI);
        IIntIterable seq1 = IntSequence.range(fromI1, toI1);
        IIntIterable seq2 = IntSequence.range(fromI2, toI1);
        IIntIterable seq3 = IntSequence.range(fromI2, toI2);
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = seq1.toList();
        List<Integer> actual2 = seq2.toList();
        List<Integer> actual3 = seq3.toList();
        // Then
        Validate.assertEquals(toI - fromI + 1, actual.size());
        for (Integer i = 0, size = actual.size(); i < size; i++) {
            Validate.assertEquals(i, actual[i]);
        }
        Validate.assertEquals(toI1 - fromI1 + 1, actual1.size());
        for (Integer i = 0, size = actual1.size(); i < size; i++)  {
            Validate.assertEquals(i + fromI1, actual1[i]);
        }
        Validate.assertEquals(toI1 - fromI2 + 1, actual2.size());
        for (Integer i = 0, size = actual2.size(); i < size; i++) {
            Validate.assertEquals(i + fromI2, actual2[i]);
        }
        Validate.assertEquals(0, actual3.size());
    }

    /**
    * @see IntSequence.concat
    */
    @IsTest
    private static void concat() {
        // Given
        List<Integer> input1 = new List<Integer>{ -5, 0, 1, 3, 150 };
        List<Integer> input2 = new List<Integer>{ 3, 0, 8 };
        List<Integer> input3 = new List<Integer>{ 9, 5, 7 };
        IIntIterable seq = IntSequence.concat(IntSequence.of(input1), IntSequence.of(input2));
        IIntIterable seq1 = IntSequence.concat(new List<IIntIterable>{ IntSequence.of(input1), IntSequence.of(input2), IntSequence.of(input3) });
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = seq1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ -5, 0, 1, 3, 150, 3, 0, 8 };
        List<Integer> expected1 = new List<Integer>{ -5, 0, 1, 3, 150, 3, 0, 8, 9, 5, 7 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
    }

    /**
    * @see IntSequence.zip
    */
    @IsTest
    private static void zip() {
        // Given
        List<Integer> input = new List<Integer>{ -5, 0, 1 };
        List<Integer> input1 = new List<Integer>{ 3, 0, 8 };
        IIntIterable seq = IntSequence.zip(IntSequence.of(input), IntSequence.of(input1), IntBinaryOperator.sum());
        // When
        List<Integer> actual = seq.toList();
        // Then
        List<Integer> expected = new List<Integer>{ -2, 0, 9 };
        Validate.assertEquals(expected, actual);
    }

    /**
    * @see IntSequence.append
    * @see IntSequence.prepend
    */
    @IsTest
    private static void appendPrepend() {
        // Given
        List<Integer> input = new List<Integer>{ -5, 0, 1 };
        List<Integer> input1 = new List<Integer>{ 3, 0, 8 };
        IIntIterable seq = IntSequence.of(input).append(IntSequence.of(input1));
        IIntIterable seq1 = IntSequence.of(input).prepend(IntSequence.of(input1));
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = seq1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ -5, 0, 1, 3, 0, 8 };
        List<Integer> expected1 = new List<Integer>{ 3, 0, 8, -5, 0, 1 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
    }

    /**
    * @see IntSequence.toObjectIterable
    * @see IntIterable.toLongIterable
    * @see IntIterable.toDoubleIterable
    */
    @IsTest
    private static void convert() {
        // Given
        List<Integer> input = new List<Integer>{ -5, 0, 1, 3, 8, null };
        IObjectIterable seq = IntSequence.of(input).toObjectIterable();
        ILongIterable seq1 = IntSequence.of(input).toLongIterable();
        IDoubleIterable seq2 = IntSequence.of(input).toDoubleIterable();
        // When
        List<Object> actual = seq.toList();
        List<Long> actual1 = seq1.toList();
        List<Double> actual2 = seq2.toList();
        // Then
        List<Object> expected = new List<Object>{ -5, 0, 1, 3, 8, null };
        List<Long> expected1 = new List<Long>{ -5, 0, 1, 3, 8, null };
        List<Double> expected2 = new List<Double>{ -5, 0, 1, 3, 8, null };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(expected2, actual2);
    }

    /**
    * @see IntSequence.filter
    */
    @IsTest
    private static void filter() {
        // Given
        List<Integer> input = new List<Integer>{ -5, 0, 1, 3, 8, null, -6, 4, 4 };
        IIntIterable seq = IntSequence.of(input).filter(IntPredicate.isPositive());
        // When
        List<Integer> actual = seq.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 1, 3, 8, 4, 4 };
        Validate.assertEquals(expected, actual);
    }

    /**
    * @see IntSequence.take
    */
    @IsTest
    private static void take() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, null, -6, 4, 4 };
        IIntIterable seq = IntSequence.of(input).take(IntPredicate.isPositive());
        // When
        List<Integer> actual = seq.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 5, 1, 3, 8 };
        Validate.assertEquals(expected, actual);
    }

    /**
    * @see IntSequence.drop
    */
    @IsTest
    private static void drop() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, null, -6, 4, 4 };
        IIntIterable seq = IntSequence.of(input).drop(IntPredicate.isPositive());
        // When
        List<Integer> actual = seq.toList();
        // Then
        List<Integer> expected = new List<Integer>{ -3, null, -6, 4, 4 };
        Validate.assertEquals(expected, actual);
    }

    /**
    * @see IntIterable.withoutNulls
    */
    @IsTest
    private static void withoutNulls() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4, null };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone).withoutNulls();
        // When
        List<Integer> actual = seq.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see IntSequence.mapTo
    */
    @IsTest
    private static void mapTo() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone).mapTo(IntUnaryOperator.multiply(2));
        // When
        List<Integer> actual = seq.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 10, 2, 6, 16, -6, 8, -12, 0, 8 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see IntSequence.mapToLong
    */
    @IsTest
    private static void mapToLong() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        ILongIterable seq = IntSequence.of(clone).mapToLong(IntToLongFunction.asLong());
        // When
        List<Long> actual = seq.toList();
        // Then
        List<Long> expected = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see IntSequence.mapToDouble
    */
    @IsTest
    private static void mapToDouble() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IDoubleIterable seq = IntSequence.of(clone).mapToDouble(IntToDoubleFunction.valueOf());
        // When
        List<Double> actual = seq.toList();
        // Then
        List<Double> expected = new List<Double>{ 5.0, 1.0, 3.0, 8.0, -3.0, 4.0, -6.0, 0.0, 4.0 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.mapToSObject
     */
    @IsTest
    private static void mapToSObject() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        ISObjectIterable seq = IntSequence.of(clone).mapToSObject(new IterTestUtils.CreateAccountFromInts());
        // When
        List<Account> actual = seq.toList();
        // Then
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        for (Integer i = 0, size = input.size(); i < size; i++ ) {
            Validate.assertEquals(Math.abs(clone[i]), actual[i].NumberOfEmployees);
        }
    }

    /**
     * @see IntSequence.mapToObject
     */
    @IsTest
    private static void mapToObject() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IObjectIterable seq = IntSequence.of(clone).mapToObject(IntFunction.toString());
        // When
        List<String> actual = (List<String>) seq.toList(List<String>.class);
        // Then
        List<String> expected = new List<String>{ '5', '1', '3', '8', '-3', '4', '-6', '0', '4' };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.forEach
     */
    @IsTest
    private static void forEach() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone).forEach(IntConsumer.debug());
        // When
        List<Integer> actual = seq.toList();
        // Then
        Validate.assertEquals(clone, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.distinct
     */
    @IsTest
    private static void distinct() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone).distinct();
        // When
        List<Integer> actual = seq.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.sort
     */
    @IsTest
    private static void sort() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone).sort();
        // When
        List<Integer> actual = seq.toList();
        // Then
        List<Integer> expected = new List<Integer>{ null, -6, -3, 0, 1, 3, 4, 4, 5, 8 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.lim
     */
    @IsTest
    private static void lim() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone).lim(25);
        IIntIterable seq1 = IntSequence.of(clone).lim(3);
        IIntIterable seq2 = IntSequence.of(clone).lim(0);
        IIntIterable seq3 = IntSequence.of(clone);
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = seq1.toList();
        List<Integer> actual2 = seq2.toList();
        Exception exc1;
        try {
            seq3.lim(-2);
        } catch (IllegalArgumentException exc) {
            exc1 = exc;
        }
        // Then
        List<Integer> expected = new List<Integer>{ 5, 1, 3 };
        List<Integer> expected1 = new List<Integer>();
        Validate.assertEquals(input, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected1, actual2);
        Validate.assertEquals('System.IllegalArgumentException', exc1.getTypeName());
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.skip
     */
    @IsTest
    private static void skip() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone).skip(5);
        IIntIterable seq1 = IntSequence.of(clone).skip(0);
        IIntIterable seq2 = IntSequence.of(clone).skip(25);
        IIntIterable seq3 = IntSequence.of(clone);
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = seq1.toList();
        List<Integer> actual2 = seq2.toList();
        Exception exc1;
        try {
            seq3.skip(-2);
        } catch (IllegalArgumentException exc) {
            exc1 = exc;
        }
        // Then
        List<Integer> expected = new List<Integer>{ 4, null, -6, 0, 4 };
        List<Integer> expected1 = new List<Integer>();
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, actual1);
        Validate.assertEquals(expected1, actual2);
        Validate.assertEquals('System.IllegalArgumentException', exc1.getTypeName());
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.reduce
     */
    @IsTest
    private static void reduce() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        List<Integer> cloneWithNulls = input.clone();
        cloneWithNulls.add(null);
        IIntIterable seq = IntSequence.of(clone);
        IIntIterable seq1 = IntSequence.of(clone);
        IIntIterable seq2 = IntSequence.of(cloneWithNulls);
        Integer seed = 10;
        // When
        Integer actual = seq.reduce(seed, IntBinaryOperator.sum());
        Integer actual1 = seq1.reduce(IntBinaryOperator.sum()).get();
        Exception exc1;
        try {
            seq2.reduce(IntBinaryOperator.sum());
        } catch (Exception exc) {
            exc1 = exc;
        }
        // Then
        Integer expected = 26;
        Integer expected1 = 16;
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(10, seed, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.collect
     */
    @IsTest
    private static void collect() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone);
        // When
        Set<Integer> actual = (Set<Integer>) seq.collect(Supplier.of(Set<Integer>.class), ObjectIntConsumer.of(SetObjectConsumer.addToIntSet()));
        // Then
        Set<Integer> expected = new Set<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.find
     */
    @IsTest
    private static void find() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone);
        IIntIterable seq1 = IntSequence.of(clone);
        // When
        Integer actual = seq.find(IntPredicate.isNegative()).get();
        Integer actual1 =seq1.find(IntPredicate.isGreater(50)).orElse(42);
        // Then
        Validate.assertEquals(-3, actual);
        Validate.assertEquals(42, actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.every
     */
    @IsTest
    private static void every() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone);
        IIntIterable seq1 = IntSequence.of(clone);
        // When
        Boolean actual = seq.every(IntPredicate.isOdd());
        Boolean actual1 = seq1.every(IntPredicate.isPrime());
        // Then
        Validate.assertEquals(true, actual);
        Validate.assertEquals(false, actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.some
     */
    @IsTest
    private static void some() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone);
        IIntIterable seq1 = IntSequence.of(clone);
        // When
        Boolean actual = seq.some(IntPredicate.isNegative());
        Boolean actual1 = seq1.some(IntPredicate.isZero());
        // Then
        Validate.assertEquals(true, actual);
        Validate.assertEquals(false, actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntIterable.none
     */
    @IsTest
    private static void none() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone);
        IIntIterable seq1 = IntSequence.of(clone);
        // When
        Boolean actual = seq.none(IntPredicate.isEven());
        Boolean actual1 = seq1.none(IntPredicate.isNegative());
        // Then
        Validate.assertEquals(true, actual);
        Validate.assertEquals(false, actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntIterable.max
     */
    @IsTest
    private static void max() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone);
        // When
        Integer actual = seq.max().get();
        // Then
        Validate.assertEquals(9, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntIterable.min
     */
    @IsTest
    private static void min() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone);
        // When
        Integer actual = seq.min().get();
        // Then
        Validate.assertEquals(-3, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.sum
     */
    @IsTest
    private static void sum() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone);
        // When
        Integer actual = seq.sum();
        // Then
        Validate.assertEquals(22, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.avg
     */
    @IsTest
    private static void avg() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone);
        // When
        Double actual = seq.avg().get();
        // Then
        Validate.assertEquals(3.625, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.count
     */
    @IsTest
    private static void count() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone);
        IIntIterable seq1 = IntSequence.of(new List<Integer>());
        IIntIterable seq2 = IntSequence.empty();
        // When
        Integer actual = seq.count();
        Integer actual1 = seq1.count();
        Integer actual2 = seq2.count();
        // Then
        Validate.assertEquals(8, actual);
        Validate.assertEquals(0, actual1);
        Validate.assertEquals(0, actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.isEmpty
     */
    @IsTest
    private static void isEmpty() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone);
        IIntIterable seq1 = IntSequence.of(new List<Integer>());
        IIntIterable seq2 = IntSequence.empty();
        // When
        Boolean actual = seq.isEmpty();
        Boolean actual1 = seq1.isEmpty();
        Boolean actual2 = seq2.isEmpty();
        // Then
        Validate.assertEquals(false, actual);
        Validate.assertEquals(true, actual1);
        Validate.assertEquals(true, actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.toList
     */
    @IsTest
    private static void toList() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone);
        // When
        List<Integer> actual = seq.toList();
        // Then
        Validate.assertEquals(input, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see IntSequence.toSet
     */
    @IsTest
    private static void toSet() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IIntIterable seq = IntSequence.of(clone);
        // When
        Set<Integer> actual = seq.toSet();
        // Then
        Set<Integer> expected = new Set<Integer>{ 5, 1, 3, -3, 7, 9, 0 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

}
