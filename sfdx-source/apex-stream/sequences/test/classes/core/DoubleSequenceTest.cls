/**
 * @see DoubleSequence
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage, PMD.CognitiveComplexity')
private class DoubleSequenceTest {

    /**
     * @see DoubleSequence.of
     * @see DoubleSequence.ofNullable
     * @see DoubleSequence.empty
     * @see DoubleSequence.iterator
     */
    @IsTest
    private static void of() {
        // Given
        List<Double> doubles = AsTestData.generateDoubles();
        doubles.add(0, null);
        doubles.add(null);
        List<Double> input = doubles.clone();
        List<Double> input1;
        Set<Double> input2;
        DoubleEnumerable seq = DoubleSequence.of(input);
        DoubleEnumerable seq1 = DoubleSequence.of(new Set<Double>(input));
        DoubleEnumerable seq2 = DoubleSequence.ofNullable(input);
        DoubleEnumerable seq3 = DoubleSequence.ofNullable(new Set<Double>(input));
        IDoubleEnumerable seq4 = DoubleSequence.ofNullable(input1);
        IDoubleEnumerable seq5 = DoubleSequence.ofNullable(input2);
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = seq1.toList();
        List<Double> actual2 = seq2.toList();
        List<Double> actual3 = seq3.toList();
        List<Double> actual4 = (List<Double>) seq4.toList();
        List<Double> actual5 = (List<Double>) seq5.toList();
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
        Assert.areEqual(doubles, input, Label.AS_ErrorMessage_InputMutated);
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
        DoubleEnumerable seq = DoubleSequence.concat(DoubleSequence.of(input), DoubleSequence.of(input1));
        IDoubleEnumerable seq1 = DoubleSequence.concat(new List<IDoubleEnumerable>{ DoubleSequence.of(input), DoubleSequence.of(input1), DoubleSequence.of(input2) });
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = (List<Double>) seq1.toList();
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
        DoubleEnumerable seq = DoubleSequence.zip(DoubleSequence.of(input), DoubleSequence.of(input1), new AsTestCommons.SumDoubleBiOperator());
        IDoubleEnumerable seq1 = DoubleSequence.zip(DoubleSequence.of(input), DoubleSequence.of(input1), new AsTestCommons.SumDoubleBiOperator());
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = (List<Double>) seq1.toList();
        // Then
        List<Double> expected = new List<Double>{ -2.0, 0, 9.5 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
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
        DoubleEnumerable seq = DoubleSequence.of(input).append(DoubleSequence.of(input1));
        IDoubleEnumerable seq1 = DoubleSequence.of(input).prepend(DoubleSequence.of(input1));
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = (List<Double>) seq1.toList();
        // Then
        List<Double> expected = new List<Double>{ -5.1, 0, 1.0, 3.0, 0, 8.5 };
        List<Double> expected1 = new List<Double>{ 3.0, 0, 8.5, -5.1, 0, 1.0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
    }

    /**
     * @see DoubleEnumerable.union
     * @see DoubleEnumerable.intersect
     * @see DoubleEnumerable.except
     */
    @IsTest
    private static void setOperations() {
        // Given
        List<Double> input = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
        List<Double> input1 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
        DoubleEnumerable seq = DoubleSequence.of(input).union((Iterable<Double>) input1);
        DoubleEnumerable seq1 = DoubleSequence.of(input).union(DoubleSequence.of(input1));
        DoubleEnumerable seq2 = DoubleSequence.of(input).intersect((Iterable<Double>) input1);
        DoubleEnumerable seq3 = DoubleSequence.of(input).intersect(DoubleSequence.of(input1));
        IDoubleEnumerable seq4 = DoubleSequence.of(input).except((Iterable<Double>) input1);
        IDoubleEnumerable seq5 = DoubleSequence.of(input).except(DoubleSequence.of(input1));
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = seq1.toList();
        List<Double> actual2 = seq2.toList();
        List<Double> actual3 = seq3.toList();
        List<Double> actual4 = (List<Double>) seq4.toList();
        List<Double> actual5 = (List<Double>) seq5.toList();
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
     * @see DoubleSequence.filter
     */
    @IsTest
    private static void filter() {
        // Given
        List<Double> input = new List<Double>{ -5.5, 0, 1.0, 3, 8.99, null, -6, 4.01, 4.01 };
        DoubleEnumerable seq = DoubleSequence.of(input).filter(new AsTestCommons.IsGreaterPredicate(0));
        IDoubleEnumerable seq1 = DoubleSequence.of(input).filter(new AsTestCommons.IsGreaterPredicate(0));
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = (List<Double>) seq1.toList();
        // Then
        List<Double> expected = new List<Double>{ 1.0, 3, 8.99, 4.01, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
    }

    /**
     * @see DoubleSequence.take
     */
    @IsTest
    private static void take() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, null, -6, 4.01, 4.01 };
        DoubleEnumerable seq = DoubleSequence.of(input).take(new AsTestCommons.IsGreaterPredicate(0));
        IDoubleEnumerable seq1 = DoubleSequence.of(input).take(new AsTestCommons.IsGreaterPredicate(0));
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = (List<Double>) seq1.toList();
        // Then
        List<Double> expected = new List<Double>{ 5.5, 0.01, 1.0, 3 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
    }

    /**
     * @see DoubleSequence.drop
     */
    @IsTest
    private static void drop() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, null, -6, 4.01, 4.01 };
        DoubleEnumerable seq = DoubleSequence.of(input).drop(new AsTestCommons.IsGreaterPredicate(0));
        IDoubleEnumerable seq1 = DoubleSequence.of(input).drop(new AsTestCommons.IsGreaterPredicate(0));
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = (List<Double>) seq1.toList();
        // Then
        List<Double> expected = new List<Double>{ -8.99, null, -6, 4.01, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
    }

    /**
     * @see DoubleEnumerable.withoutNulls
     */
    @IsTest
    private static void withoutNulls() {
        // Given
        List<Double> input = new List<Double>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4, null };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone).withoutNulls();
        IDoubleEnumerable seq1 = DoubleSequence.of(clone).withoutNulls();
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = (List<Double>) seq1.toList();
        // Then
        List<Double> expected = new List<Double>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleSequence.mapTo
     */
    @IsTest
    private static void mapTo() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone).mapTo(new AsTestCommons.MultiplyDoubleOp(2));
        IDoubleEnumerable seq1 = DoubleSequence.of(clone).mapTo(new AsTestCommons.MultiplyDoubleOp(2));
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = (List<Double>) seq1.toList();
        // Then
        List<Double> expected = new List<Double>{ 11, 0.02, 2.0, 6.0, -17.98, -12.0, 8.02, 8.02 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleSequence.mapToInt
     */
    @IsTest
    private static void mapToInt() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IntEnumerable seq = DoubleSequence.of(clone).mapToInt(new AsTestCommons.RoundToInt());
        IIntEnumerable seq1 = DoubleSequence.of(clone).mapToInt(new AsTestCommons.RoundToInt());
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = (List<Integer>) seq1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 6, 0, 1, 3, -9, -6, 4, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleSequence.mapToLong
     */
    @IsTest
    private static void mapToLong() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        LongEnumerable seq = DoubleSequence.of(clone).mapToLong(new AsTestCommons.RoundToLong());
        ILongEnumerable seq1 = DoubleSequence.of(clone).mapToLong(new AsTestCommons.RoundToLong());
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = (List<Long>) seq1.toList();
        // Then
        List<Long> expected = new List<Long>{ 6L, 0L, 1L, 3L, -9L, -6L, 4L, 4L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleSequence.mapToSObject
     */
    @IsTest
    private static void mapToSObject() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        SObjectEnumerable seq = DoubleSequence.of(clone).mapToSObject(new AsTestCommons.CreateAccountFromDoubles());
        ISObjectEnumerable seq1 = DoubleSequence.of(clone).mapToSObject(new AsTestCommons.CreateAccountFromDoubles());
        // When
        List<Account> actual = seq.toList();
        List<Account> actual1 = (List<Account>) seq1.toList();
        // Then
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        for (Integer i = 0, size = input.size(); i < size; i++ ) {
            Assert.areEqual(Math.abs(clone[i]), actual[i].AnnualRevenue);
            Assert.areEqual(Math.abs(clone[i]), actual1[i].AnnualRevenue);
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
        ObjectEnumerable seq = DoubleSequence.of(clone).mapToObject(new AsTestCommons.DoubleToString());
        IObjectEnumerable seq1 = DoubleSequence.of(clone).mapToObject(new AsTestCommons.DoubleToString());
        // When
        List<Object> actual = seq.toList();
        List<Object> actual1 = seq1.toList();
        // Then
        List<String> expected = new List<String>{ '5.5', '0.01', '1.0', '3.0', '-8.99', '-6.0', '4.01', '4.01' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }
    
    /**
     * @see DoubleSequence.flatMapTo
     */
    @IsTest
    private static void flatMapTo() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone).flatMapTo(new AsTestCommons.DoubleDouble());
        IDoubleEnumerable seq1 = DoubleSequence.of(clone).flatMapTo(new AsTestCommons.DoubleDouble());
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = (List<Double>) seq1.toList();
        // Then
        List<Double> expected = new List<Double>{ 11, 0.02, 2.0, 6, -17.98, -12, 8.02, 8.02 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleSequence.forEach
     */
    @IsTest
    private static void forEach() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone).forEach(new AsTestCommons.DoNothingConsumer());
        IDoubleEnumerable seq1 = DoubleSequence.of(clone).forEach(new AsTestCommons.DoNothingConsumer());
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = (List<Double>) seq1.toList();
        // Then
        Assert.areEqual(clone, actual);
        Assert.areEqual(clone, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleSequence.distinct
     */
    @IsTest
    private static void distinct() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone).distinct();
        IDoubleEnumerable seq1 = DoubleSequence.of(clone).distinct();
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = (List<Double>) seq1.toList();
        // Then
        List<Double> expected = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleSequence.sort
     */
    @IsTest
    private static void sort() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone).sort();
        IDoubleEnumerable seq1 = DoubleSequence.of(clone).sort(SortOrder.DESCENDING);
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = (List<Double>) seq1.toList();
        // Then
        List<Double> expected = new List<Double>{ null, -8.99, -6, 0.01, 1.0, 3, 4.01, 4.01, 5.5 };
        List<Double> expected1 = new List<Double>{ 5.5, 4.01, 4.01, 3, 1.0, 0.01, -6, -8.99, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleSequence.lim
     */
    @IsTest
    private static void lim() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone).lim(25);
        DoubleEnumerable seq1 = DoubleSequence.of(clone).lim(3);
        IDoubleEnumerable seq2 = DoubleSequence.of(clone).lim(0);
        IDoubleEnumerable seq3 = DoubleSequence.of(clone);
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = seq1.toList();
        List<Double> actual2 = (List<Double>) seq2.toList();
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
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleSequence.skip
     */
    @IsTest
    private static void skip() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone).skip(5);
        DoubleEnumerable seq1 = DoubleSequence.of(clone).skip(0);
        IDoubleEnumerable seq2 = DoubleSequence.of(clone).skip(25);
        IDoubleEnumerable seq3 = DoubleSequence.of(clone);
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = seq1.toList();
        List<Double> actual2 = (List<Double>) seq2.toList();
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
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        DoubleEnumerable seq = DoubleSequence.of(clone);
        DoubleEnumerable seq1 = DoubleSequence.of(clone);
        IDoubleEnumerable seq2 = DoubleSequence.of(cloneWithNulls);
        Double seed = 10;
        // When
        Double actual = seq.reduce(seed, BaseBiOperators.max());
        Double actual1 = (Double) seq1.reduce(BaseBiOperators.max()).get();
        Exception exc1;
        try {
            seq2.reduce(new AsTestCommons.SumDoubleBiOperator());
        } catch (Exception exc) {
            exc1 = exc;
        }
        // Then
        Double expected = 10;
        Double expected1 = 5.5;
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(10, seed, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleSequence.collect
     */
    @IsTest
    private static void collect() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone);
        IDoubleEnumerable seq1 = DoubleSequence.of(clone);
        // When
        Set<Double> actual = (Set<Double>) seq.collect(Collector.of(Supplier.of(Set<Double>.class), new AsTestCommons.AddToDoubleSet()));
        Set<Double> actual1 = (Set<Double>) seq1.collect(Collector.of(Supplier.of(Set<Double>.class), new AsTestCommons.AddToDoubleSet()));
        // Then
        Set<Double> expected = new Set<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleSequence.find
     */
    @IsTest
    private static void find() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone);
        IDoubleEnumerable seq1 = DoubleSequence.of(clone);
        // When
        Double actual = (Double) seq.find(new AsTestCommons.IsLessPredicate(0)).get();
        Double actual1 = (Double) seq1.find(new AsTestCommons.IsGreaterPredicate(50)).orElse(42.0);
        // Then
        Assert.areEqual(-8.99, actual);
        Assert.areEqual(42.0, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleSequence.every
     */
    @IsTest
    private static void every() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone);
        IDoubleEnumerable seq1 = DoubleSequence.of(clone);
        // When
        Boolean actual = seq.every(new AsTestCommons.IsLessPredicate(42));
        Boolean actual1 = seq1.every(new AsTestCommons.IsGreaterPredicate(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleSequence.some
     */
    @IsTest
    private static void some() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone);
        IDoubleEnumerable seq1 = DoubleSequence.of(clone);
        // When
        Boolean actual = seq.some(new AsTestCommons.IsLessPredicate(0));
        Boolean actual1 = seq1.some(BasePredicates.isEqual(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleEnumerable.none
     */
    @IsTest
    private static void none() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone);
        IDoubleEnumerable seq1 = DoubleSequence.of(clone);
        // When
        Boolean actual = seq.none(new AsTestCommons.IsGreaterPredicate(42));
        Boolean actual1 = seq1.none(new AsTestCommons.IsLessPredicate(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleEnumerable.max
     */
    @IsTest
    private static void max() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone);
        IDoubleEnumerable seq1 = DoubleSequence.of(clone);
        // When
        Double actual = (Double) seq.max().get();
        Double actual1 = (Double) seq1.max().get();
        // Then
        Assert.areEqual(5.5, actual);
        Assert.areEqual(5.5, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleEnumerable.min
     */
    @IsTest
    private static void min() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone);
        IDoubleEnumerable seq1 = DoubleSequence.of(clone);
        // When
        Double actual = (Double) seq.min().get();
        Double actual1 = (Double) seq1.min().get();
        // Then
        Assert.areEqual(-8.99, actual);
        Assert.areEqual(-8.99, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleEnumerable.sum
     */
    @IsTest
    private static void sum() {
        // Given
        List<Double> input = new List<Double>{ 0.1, 0.2, 0.3, -0.4, 0.5, 0.6, 0.7, 0.8, 0.9 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone);
        IDoubleEnumerable seq1 = DoubleSequence.of(clone);
        // When
        Double actual = seq.sum();
        Double actual1 = (Double) seq1.sum();
        // Then
        Assert.areEqual(3.7, actual);
        Assert.areEqual(3.7, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleEnumerable.avg
     */
    @IsTest
    private static void avg() {
        // Given
        List<Double> input = new List<Double>{ 0.1, 0.2, 0.3, -0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.3 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone);
        IDoubleEnumerable seq1 = DoubleSequence.of(clone);
        // When
        Double actual = (Double) seq.avg().get();
        Double actual1 = (Double) seq1.avg().get();
        // Then
        Assert.areEqual(0.4, actual);
        Assert.areEqual(0.4, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleSequence.count
     */
    @IsTest
    private static void count() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone);
        DoubleEnumerable seq1 = DoubleSequence.of(new List<Double>());
        IDoubleEnumerable seq2 = DoubleSequence.empty();
        // When
        Double actual = seq.count();
        Double actual1 = seq1.count();
        Double actual2 = seq2.count();
        // Then
        Assert.areEqual(8, actual);
        Assert.areEqual(0, actual1);
        Assert.areEqual(0, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleSequence.isEmpty
     */
    @IsTest
    private static void isEmpty() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone);
        DoubleEnumerable seq1 = DoubleSequence.of(new List<Double>());
        IDoubleEnumerable seq2 = DoubleSequence.empty();
        // When
        Boolean actual = seq.isEmpty();
        Boolean actual1 = seq1.isEmpty();
        Boolean actual2 = seq2.isEmpty();
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(true, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleSequence.toList
     */
    @IsTest
    private static void toList() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone);
        IDoubleEnumerable seq1 = DoubleSequence.of(clone);
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = (List<Double>) seq1.toList();
        // Then
        Assert.areEqual(input, actual);
        Assert.areEqual(input, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see DoubleSequence.toSet
     */
    @IsTest
    private static void toSet() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable seq = DoubleSequence.of(clone);
        IDoubleEnumerable seq1 = DoubleSequence.of(clone);
        // When
        Set<Double> actual = seq.toSet();
        Set<Double> actual1 = (Set<Double>) seq1.toSet();
        // Then
        Set<Double> expected = new Set<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

}
