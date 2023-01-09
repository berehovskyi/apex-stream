/**
 * @see DoubleSequence
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DoubleSequenceTest {

    /**
     * @see DoubleSequence.of
     * @see DoubleSequence.ofNullable
     * @see DoubleSequence.empty
     * @see DoubleSequence.iterator
     * @see DoubleSequence.stream
     */
    @IsTest
    private static void of() {
        // Given
        List<Double> doubles = IterTestUtils.generateDoubles();
        doubles.add(0, null);
        doubles.add(null);
        List<Double> input = doubles.clone();
        List<Double> input1;
        Set<Double> input2;
        IDoubleIterable seq = DoubleSequence.of(input);
        IDoubleIterable seq1 = DoubleSequence.of(new Set<Double>(input));
        IDoubleIterable seq2 = DoubleSequence.ofNullable(input);
        IDoubleIterable seq3 = DoubleSequence.ofNullable(new Set<Double>(input));
        IDoubleIterable seq4 = DoubleSequence.ofNullable(input1);
        IDoubleIterable seq5 = DoubleSequence.ofNullable(input2);
        IDoubleIterable stream = ((DoubleSequence) DoubleSequence.of(input)).stream();
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = seq1.toList();
        List<Double> actual2 = seq2.toList();
        List<Double> actual3 = seq3.toList();
        List<Double> actual4 = seq4.toList();
        List<Double> actual5 = seq5.toList();
        // Then
        List<Double> expected = new List<Double>(new Set<Double>(input));
        List<Double> expected1 = new List<Double>();
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
        Assert.areEqual(doubles, input, Label.InputMutatedErrorMessage);
    }

    /**
    * @see DoubleSequence.concat
    */
    @IsTest
    private static void concat() {
        // Given
        List<Double> input = new List<Double>{ -5.1, 0, 1.0, 3, 150.5 };
        List<Double> input1 = new List<Double>{ 3.0, 0, 8.5 };
        List<Double> input2 = new List<Double>{ 9.1, 5.5, 7.3 };
        IDoubleIterable seq = DoubleSequence.concat(DoubleSequence.of(input), DoubleSequence.of(input1));
        IDoubleIterable seq1 = DoubleSequence.concat(new List<IDoubleIterable>{ DoubleSequence.of(input), DoubleSequence.of(input1), DoubleSequence.of(input2) });
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = seq1.toList();
        // Then
        List<Double> expected = new List<Double>{ -5.1, 0, 1.0, 3, 150.5, 3.0, 0, 8.5 };
        List<Double> expected1 = new List<Double>{ -5.1, 0, 1.0, 3, 150.5, 3.0, 0, 8.5, 9.1, 5.5, 7.3 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
    }

    /**
    * @see DoubleSequence.zip
    */
    @IsTest
    private static void zip() {
        // Given
        List<Double> input = new List<Double>{ -5.0, 0, 1.0 };
        List<Double> input1 = new List<Double>{ 3.0, 0, 8.5 };
        IDoubleIterable seq = DoubleSequence.zip(DoubleSequence.of(input), DoubleSequence.of(input1), DoubleBinaryOperators.sum());
        // When
        List<Double> actual = seq.toList();
        // Then
        List<Double> expected = new List<Double>{ -2.0, 0, 9.5 };
        Assert.areEqual(expected, actual);
    }

    /**
    * @see DoubleSequence.append
    * @see DoubleSequence.prepend
    */
    @IsTest
    private static void appendPrepend() {
        // Given
        List<Double> input = new List<Double>{ -5.1, 0, 1.0 };
        List<Double> input1 = new List<Double>{ 3.0, 0, 8.5 };
        IDoubleIterable seq = DoubleSequence.of(input).append(DoubleSequence.of(input1));
        IDoubleIterable seq1 = DoubleSequence.of(input).prepend(DoubleSequence.of(input1));
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = seq1.toList();
        // Then
        List<Double> expected = new List<Double>{ -5.1, 0, 1.0, 3.0, 0, 8.5 };
        List<Double> expected1 = new List<Double>{ 3.0, 0, 8.5, -5.1, 0, 1.0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
    }

    /**
     * @see IDoubleIterable.union
     * @see IDoubleIterable.intersect
     * @see IDoubleIterable.except
     */
    @IsTest
    private static void setOperations() {
        // Given
        List<Double> input = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
        List<Double> input1 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
        IDoubleIterable seq = DoubleSequence.of(input).union(input1);
        IDoubleIterable seq1 = DoubleSequence.of(input).union(DoubleSequence.of(input1));
        IDoubleIterable seq2 = DoubleSequence.of(input).intersect(input1);
        IDoubleIterable seq3 = DoubleSequence.of(input).intersect(DoubleSequence.of(input1));
        IDoubleIterable seq4 = DoubleSequence.of(input).except(input1);
        IDoubleIterable seq5 = DoubleSequence.of(input).except(DoubleSequence.of(input1));
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = seq1.toList();
        List<Double> actual2 = seq2.toList();
        List<Double> actual3 = seq3.toList();
        List<Double> actual4 = seq4.toList();
        List<Double> actual5 = seq5.toList();
        // Then
        List<Double> expected = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 8.0, 6.0, 4.0, 1.0, 0.0 };
        List<Double> expected1 = new List<Double>{ 3.0, 9.0 };
        List<Double> expected2 = new List<Double>{ 5.0, 7.0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
    }

    /**
    * @see DoubleSequence.toObjectIterable
    */
    @IsTest
    private static void toObjectIterable() {
        // Given
        List<Double> input = new List<Double>{ -5.0, 0, 1.45, 3.99, 9.001, null };
        IObjectIterable seq = DoubleSequence.of(input).toObjectIterable();
        // When
        List<Object> actual = seq.toList();
        // Then
        Assert.areEqual(input.size(), actual.size());
    }

    /**
    * @see DoubleSequence.filter
    */
    @IsTest
    private static void filter() {
        // Given
        List<Double> input = new List<Double>{ -5.5, 0, 1.0, 3, 8.99, null, -6, 4.01, 4.01 };
        IDoubleIterable seq = DoubleSequence.of(input).filter(DoublePredicates.isGreater(0));
        // When
        List<Double> actual = seq.toList();
        // Then
        List<Double> expected = new List<Double>{ 1.0, 3, 8.99, 4.01, 4.01 };
        Assert.areEqual(expected, actual);
    }

    /**
    * @see DoubleSequence.take
    */
    @IsTest
    private static void take() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, null, -6, 4.01, 4.01 };
        IDoubleIterable seq = DoubleSequence.of(input).take(DoublePredicates.isGreater(0));
        // When
        List<Double> actual = seq.toList();
        // Then
        List<Double> expected = new List<Double>{ 5.5, 0.01, 1.0, 3 };
        Assert.areEqual(expected, actual);
    }

    /**
    * @see DoubleSequence.drop
    */
    @IsTest
    private static void drop() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, null, -6, 4.01, 4.01 };
        IDoubleIterable seq = DoubleSequence.of(input).drop(DoublePredicates.isGreater(0));
        // When
        List<Double> actual = seq.toList();
        // Then
        List<Double> expected = new List<Double>{ -8.99, null, -6, 4.01, 4.01 };
        Assert.areEqual(expected, actual);
    }

    /**
    * @see DoubleIterable.withoutNulls
    */
    @IsTest
    private static void withoutNulls() {
        // Given
        List<Double> input = new List<Double>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4, null };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone).withoutNulls();
        // When
        List<Double> actual = seq.toList();
        // Then
        List<Double> expected = new List<Double>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see DoubleSequence.mapTo
    */
    @IsTest
    private static void mapTo() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone).mapTo(new IterTestUtils.MultiplyDoubleOp(2));
        // When
        List<Double> actual = seq.toList();
        // Then
        List<Double> expected = new List<Double>{ 11, 0.02, 2.0, 6.0, -17.98, -12.0, 8.02, 8.02 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see DoubleSequence.mapToLong
    */
    @IsTest
    private static void mapToLong() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        ILongIterable seq = DoubleSequence.of(clone).mapToLong(DoubleToLongFunctions.roundToLong());
        // When
        List<Long> actual = seq.toList();
        // Then
        List<Long> expected = new List<Long>{ 6L, 0L, 1L, 3L, -9L, -6L, 4L, 4L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see DoubleSequence.mapToInt
    */
    @IsTest
    private static void mapToInt() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IIntIterable seq = DoubleSequence.of(clone).mapToInt(DoubleToIntFunctions.round());
        // When
        List<Integer> actual = seq.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 6, 0, 1, 3, -9, -6, 4, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleSequence.mapToSObject
     */
    @IsTest
    private static void mapToSObject() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        ISObjectIterable seq = DoubleSequence.of(clone).mapToSObject(new IterTestUtils.CreateAccountFromDoubles());
        // When
        List<Account> actual = seq.toList();
        // Then
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        for (Integer i = 0, size = input.size(); i < size; i++ ) {
            Assert.areEqual(Math.abs(clone[i]), actual[i].AnnualRevenue);
        }
    }

    /**
     * @see DoubleSequence.mapToObject
     */
    @IsTest
    private static void mapToObject() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IObjectIterable seq = DoubleSequence.of(clone).mapToObject(new IterTestUtils.DoubleToString());
        // When
        List<Object> actual = seq.toList();
        // Then
        List<String> expected = new List<String>{ '5.5', '0.01', '1.0', '3.0', '-8.99', '-6.0', '4.01', '4.01' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleSequence.forEach
     */
    @IsTest
    private static void forEach() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone).forEach(new IterTestUtils.DoNothingDoubleConsumer());
        // When
        List<Double> actual = seq.toList();
        // Then
        Assert.areEqual(clone, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleSequence.distinct
     */
    @IsTest
    private static void distinct() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone).distinct();
        // When
        List<Double> actual = seq.toList();
        // Then
        List<Double> expected = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleSequence.sort
     */
    @IsTest
    private static void sort() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone).sort();
        // When
        List<Double> actual = seq.toList();
        // Then
        List<Double> expected = new List<Double>{ null, -8.99, -6, 0.01, 1.0, 3, 4.01, 4.01, 5.5 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleSequence.lim
     */
    @IsTest
    private static void lim() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone).lim(25);
        IDoubleIterable seq1 = DoubleSequence.of(clone).lim(3);
        IDoubleIterable seq2 = DoubleSequence.of(clone).lim(0);
        IDoubleIterable seq3 = DoubleSequence.of(clone);
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = seq1.toList();
        List<Double> actual2 = seq2.toList();
        Exception exc1;
        try {
            seq3.lim(-2);
        } catch (IllegalArgumentException exc) {
            exc1 = exc;
        }
        // Then
        List<Double> expected = new List<Double>{ 5.5, 0.01, 1.0 };
        List<Double> expected1 = new List<Double>();
        Assert.areEqual(input, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(IllegalArgumentException.class.getName(), exc1.getTypeName());
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleSequence.skip
     */
    @IsTest
    private static void skip() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone).skip(5);
        IDoubleIterable seq1 = DoubleSequence.of(clone).skip(0);
        IDoubleIterable seq2 = DoubleSequence.of(clone).skip(25);
        IDoubleIterable seq3 = DoubleSequence.of(clone);
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = seq1.toList();
        List<Double> actual2 = seq2.toList();
        Exception exc1;
        try {
            seq3.skip(-2);
        } catch (IllegalArgumentException exc) {
            exc1 = exc;
        }
        // Then
        List<Double> expected = new List<Double>{ -8.99, -6, 4.01, 4.01 };
        List<Double> expected1 = new List<Double>();
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(IllegalArgumentException.class.getName(), exc1.getTypeName());
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleSequence.reduce
     */
    @IsTest
    private static void reduce() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        List<Double> cloneWithNulls = input.clone();
        cloneWithNulls.add(null);
        IDoubleIterable seq = DoubleSequence.of(clone);
        IDoubleIterable seq1 = DoubleSequence.of(clone);
        IDoubleIterable seq2 = DoubleSequence.of(cloneWithNulls);
        Double seed = 10;
        // When
        Double actual = seq.reduce(seed, DoubleBinaryOperators.max());
        Double actual1 = seq1.reduce(DoubleBinaryOperators.max()).get();
        Exception exc1;
        try {
            seq2.reduce(DoubleBinaryOperators.sum());
        } catch (Exception exc) {
            exc1 = exc;
        }
        // Then
        Double expected = 10;
        Double expected1 = 5.5;
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(10, seed, Label.InputMutatedErrorMessage);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleSequence.collect
     */
    @IsTest
    private static void collect() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone);
        // When
        Set<Double> actual = (Set<Double>) seq.collect(Supplier.of(Set<Double>.class), ObjectDoubleConsumer.compose(new IterTestUtils.AddToDoubleSet()));
        // Then
        Set<Double> expected = new Set<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleSequence.find
     */
    @IsTest
    private static void find() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone);
        IDoubleIterable seq1 = DoubleSequence.of(clone);
        // When
        Double actual = seq.find(DoublePredicates.isLess(0)).get();
        Double actual1 = seq1.find(DoublePredicates.isGreater(50)).orElse((Double) 42.0);
        // Then
        Assert.areEqual(-8.99, actual);
        Assert.areEqual(42.0, actual1);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleSequence.every
     */
    @IsTest
    private static void every() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone);
        IDoubleIterable seq1 = DoubleSequence.of(clone);
        // When
        Boolean actual = seq.every(DoublePredicates.isLess(42));
        Boolean actual1 = seq1.every(DoublePredicates.isGreater(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleSequence.some
     */
    @IsTest
    private static void some() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone);
        IDoubleIterable seq1 = DoubleSequence.of(clone);
        // When
        Boolean actual = seq.some(DoublePredicates.isLess(0));
        Boolean actual1 = seq1.some(DoublePredicates.isEqual(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleIterable.none
     */
    @IsTest
    private static void none() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone);
        IDoubleIterable seq1 = DoubleSequence.of(clone);
        // When
        Boolean actual = seq.none(DoublePredicates.isGreater(42));
        Boolean actual1 = seq1.none(DoublePredicates.isLess(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleIterable.max
     */
    @IsTest
    private static void max() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone);
        // When
        Double actual = seq.max().get();
        // Then
        Assert.areEqual(5.5, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleIterable.min
     */
    @IsTest
    private static void min() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone);
        // When
        Double actual = seq.min().get();
        // Then
        Assert.areEqual(-8.99, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleIterable.sum
     */
    @IsTest
    private static void sum() {
        // Given
        List<Double> input = new List<Double>{ 0.1, 0.2, 0.3, -0.4, 0.5, 0.6, 0.7, 0.8, 0.9 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone);
        // When
        Double actual = seq.sum();
        // Then
        Assert.areEqual(3.7, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleIterable.avg
     */
    @IsTest
    private static void avg() {
        // Given
        List<Double> input = new List<Double>{ 0.1, 0.2, 0.3, -0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.3 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone);
        // When
        Double actual = seq.avg().get();
        // Then
        Assert.areEqual(0.4, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleSequence.count
     */
    @IsTest
    private static void count() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone);
        IDoubleIterable seq1 = DoubleSequence.of(new List<Double>());
        IDoubleIterable seq2 = DoubleSequence.empty();
        // When
        Double actual = seq.count();
        Double actual1 = seq1.count();
        Double actual2 = seq2.count();
        // Then
        Assert.areEqual(8, actual);
        Assert.areEqual(0, actual1);
        Assert.areEqual(0, actual2);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleSequence.isEmpty
     */
    @IsTest
    private static void isEmpty() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone);
        IDoubleIterable seq1 = DoubleSequence.of(new List<Double>());
        IDoubleIterable seq2 = DoubleSequence.empty();
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
     * @see DoubleSequence.toList
     */
    @IsTest
    private static void toList() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone);
        // When
        List<Double> actual = seq.toList();
        // Then
        Assert.areEqual(input, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see DoubleSequence.toSet
     */
    @IsTest
    private static void toSet() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable seq = DoubleSequence.of(clone);
        // When
        Set<Double> actual = seq.toSet();
        // Then
        Set<Double> expected = new Set<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
    }

}
