/**
 * @see IntSequence
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage, PMD.CognitiveComplexity')
private class IntSequenceTest {

    /**
     * @see IntSequence.of
     * @see IntSequence.ofNullable
     * @see IntSequence.empty
     * @see IntSequence.iterator
     */
    @IsTest
    private static void of() {
        // Given
        List<Integer> ints = AsTestData.generateInts();
        ints.add(0, null);
        ints.add(null);
        List<Integer> input = ints.clone();
        List<Integer> input1;
        Set<Integer> input2;
        IntEnumerable seq = IntSequence.of(input);
        IntEnumerable seq1 = IntSequence.of(new Set<Integer>(input));
        IntEnumerable seq2 = IntSequence.ofNullable(input);
        IntEnumerable seq3 = IntSequence.ofNullable(new Set<Integer>(input));
        IIntEnumerable seq4 = IntSequence.ofNullable(input1);
        IIntEnumerable seq5 = IntSequence.ofNullable(input2);
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = seq1.toList();
        List<Integer> actual2 = seq2.toList();
        List<Integer> actual3 = seq3.toList();
        List<Integer> actual4 = (List<Integer>) seq4.toList();
        List<Integer> actual5 = (List<Integer>) seq5.toList();
        // Then
        List<Integer> expected = new List<Integer>(new Set<Integer>(input));
        List<Integer> expected1 = new List<Integer>();
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
        Assert.areEqual(ints, input, Label.AS_ErrorMessage_InputMutated);
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
        IntEnumerable seq = IntSequence.range(fromI, toI);
        IntEnumerable seq1 = IntSequence.range(fromI1, toI1);
        IIntEnumerable seq2 = IntSequence.range(fromI2, toI1);
        IIntEnumerable seq3 = IntSequence.range(fromI2, toI2);
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = seq1.toList();
        List<Integer> actual2 = (List<Integer>) seq2.toList();
        List<Integer> actual3 = (List<Integer>) seq3.toList();
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
    * @see IntSequence.concat
    */
    @IsTest
    private static void concat() {
        // Given
        List<Integer> input1 = new List<Integer>{ -5, 0, 1, 3, 150 };
        List<Integer> input2 = new List<Integer>{ 3, 0, 8 };
        List<Integer> input3 = new List<Integer>{ 9, 5, 7 };
        IntEnumerable seq = IntSequence.concat(IntSequence.of(input1), IntSequence.of(input2));
        IIntEnumerable seq1 = IntSequence.concat(new List<IIntEnumerable>{ IntSequence.of(input1), IntSequence.of(input2), IntSequence.of(input3) });
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = (List<Integer>) seq1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ -5, 0, 1, 3, 150, 3, 0, 8 };
        List<Integer> expected1 = new List<Integer>{ -5, 0, 1, 3, 150, 3, 0, 8, 9, 5, 7 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
    }

    /**
    * @see IntSequence.zip
    */
    @IsTest
    private static void zip() {
        // Given
        List<Integer> input = new List<Integer>{ -5, 0, 1 };
        List<Integer> input1 = new List<Integer>{ 3, 0, 8 };
        IntEnumerable seq = IntSequence.zip(IntSequence.of(input), IntSequence.of(input1), new AsTestCommons.SumIntBiOperator());
        IIntEnumerable seq1 = IntSequence.zip(IntSequence.of(input), IntSequence.of(input1), new AsTestCommons.SumIntBiOperator());
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = (List<Integer>) seq1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ -2, 0, 9 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
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
        IntEnumerable seq = IntSequence.of(input).append(IntSequence.of(input1));
        IIntEnumerable seq1 = IntSequence.of(input).prepend(IntSequence.of(input1));
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = (List<Integer>) seq1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ -5, 0, 1, 3, 0, 8 };
        List<Integer> expected1 = new List<Integer>{ 3, 0, 8, -5, 0, 1 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
    }

    /**
     * @see IntEnumerable.union
     * @see IntEnumerable.intersect
     * @see IntEnumerable.except
     */
    @IsTest
    private static void setOperations() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
        List<Integer> input1 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
        IntEnumerable seq = IntSequence.of(input).union((Iterable<Integer>) input1);
        IntEnumerable seq1 = IntSequence.of(input).union(IntSequence.of(input1));
        IntEnumerable seq2 = IntSequence.of(input).intersect((Iterable<Integer>) input1);
        IntEnumerable seq3 = IntSequence.of(input).intersect(IntSequence.of(input1));
        IIntEnumerable seq4 = IntSequence.of(input).except((Iterable<Integer>) input1);
        IIntEnumerable seq5 = IntSequence.of(input).except(IntSequence.of(input1));
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = seq1.toList();
        List<Integer> actual2 = seq2.toList();
        List<Integer> actual3 = seq3.toList();
        List<Integer> actual4 = (List<Integer>) seq4.toList();
        List<Integer> actual5 = (List<Integer>) seq5.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 5, 3, 9, 7, 8, 6, 4, 1, 0 };
        List<Integer> expected1 = new List<Integer>{ 3, 9 };
        List<Integer> expected2 = new List<Integer>{ 5, 7 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
    }

    /**
     * @see IntSequence.filter
     */
    @IsTest
    private static void filter() {
        // Given
        List<Integer> input = new List<Integer>{ -5, 0, 1, 3, 8, null, -6, 4, 4 };
        IntEnumerable seq = IntSequence.of(input).filter(new AsTestCommons.IsGreaterPredicate(0));
        IIntEnumerable seq1 = IntSequence.of(input).filter(new AsTestCommons.IsGreaterPredicate(0));
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = (List<Integer>) seq1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 1, 3, 8, 4, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
    }

    /**
     * @see IntSequence.take
     */
    @IsTest
    private static void take() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, null, -6, 4, 4 };
        IntEnumerable seq = IntSequence.of(input).take(new AsTestCommons.IsGreaterPredicate(0));
        IIntEnumerable seq1 = IntSequence.of(input).take(new AsTestCommons.IsGreaterPredicate(0));
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = (List<Integer>) seq1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 5, 1, 3, 8 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
    }

    /**
     * @see IntSequence.drop
     */
    @IsTest
    private static void drop() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, null, -6, 4, 4 };
        IntEnumerable seq = IntSequence.of(input).drop(new AsTestCommons.IsGreaterPredicate(0));
        IIntEnumerable seq1 = IntSequence.of(input).drop(new AsTestCommons.IsGreaterPredicate(0));
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = (List<Integer>) seq1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ -3, null, -6, 4, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
    }

    /**
     * @see IntEnumerable.withoutNulls
     */
    @IsTest
    private static void withoutNulls() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4, null };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone).withoutNulls();
        IIntEnumerable seq1 = IntSequence.of(clone).withoutNulls();
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = (List<Integer>) seq1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.mapTo
     */
    @IsTest
    private static void mapTo() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone).mapTo(new AsTestCommons.MultiplyIntOp(2));
        IIntEnumerable seq1 = IntSequence.of(clone).mapTo(new AsTestCommons.MultiplyIntOp(2));
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = (List<Integer>) seq1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 10, 2, 6, 16, -6, 8, -12, 0, 8 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.mapToLong
     */
    @IsTest
    private static void mapToLong() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        LongEnumerable seq = IntSequence.of(clone).mapToLong(new AsTestCommons.LongValueOfInt());
        ILongEnumerable seq1 = IntSequence.of(clone).mapToLong(new AsTestCommons.LongValueOfInt());
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = (List<Long>) seq1.toList();
        // Then
        List<Long> expected = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.mapToDouble
     */
    @IsTest
    private static void mapToDouble() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        DoubleEnumerable seq = IntSequence.of(clone).mapToDouble(new AsTestCommons.DoubleValueOf());
        IDoubleEnumerable seq1 = IntSequence.of(clone).mapToDouble(new AsTestCommons.DoubleValueOf());
        // When
        List<Double> actual = seq.toList();
        List<Double> actual1 = (List<Double>) seq1.toList();
        // Then
        List<Double> expected = new List<Double>{ 5.0, 1.0, 3.0, 8.0, -3.0, 4.0, -6.0, 0.0, 4.0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.mapToSObject
     */
    @IsTest
    private static void mapToSObject() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        SObjectEnumerable seq = IntSequence.of(clone).mapToSObject(new AsTestCommons.CreateAccountFromInts());
        ISObjectEnumerable seq1 = IntSequence.of(clone).mapToSObject(new AsTestCommons.CreateAccountFromInts());
        // When
        List<Account> actual = seq.toList();
        List<Account> actual1 = (List<Account>) seq1.toList();
        // Then
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        for (Integer i = 0, size = input.size(); i < size; i++ ) {
            Assert.areEqual(Math.abs(clone[i]), actual[i].NumberOfEmployees);
            Assert.areEqual(Math.abs(clone[i]), actual1[i].NumberOfEmployees);
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
        ObjectEnumerable seq = IntSequence.of(clone).mapToObject(new AsTestCommons.IntToString());
        IObjectEnumerable seq1 = IntSequence.of(clone).mapToObject(new AsTestCommons.IntToString());
        // When
        List<String> actual = (List<String>) seq.toList(String.class);
        List<String> actual1 = (List<String>) seq1.toList(String.class);
        // Then
        List<String> expected = new List<String>{ '5', '1', '3', '8', '-3', '4', '-6', '0', '4' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.flatMapTo
     */
    @IsTest
    private static void flatMapTo() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone).flatMapTo(new AsTestCommons.DoubleInt());
        IIntEnumerable seq1 = IntSequence.of(clone).flatMapTo(new AsTestCommons.DoubleInt());
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = (List<Integer>) seq1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 10, 2, 6, 16, -6, 8, -12, 0, 8 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.forEach
     */
    @IsTest
    private static void forEach() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone).forEach(new AsTestCommons.DoNothingConsumer());
        IIntEnumerable seq1 = IntSequence.of(clone).forEach(new AsTestCommons.DoNothingConsumer());
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = (List<Integer>) seq1.toList();
        // Then
        Assert.areEqual(clone, actual);
        Assert.areEqual(clone, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.distinct
     */
    @IsTest
    private static void distinct() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone).distinct();
        IIntEnumerable seq1 = IntSequence.of(clone).distinct();
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = (List<Integer>) seq1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.sort
     */
    @IsTest
    private static void sort() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone).sort();
        IIntEnumerable seq1 = IntSequence.of(clone).sort(SortOrder.DESCENDING);
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = (List<Integer>) seq1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ null, -6, -3, 0, 1, 3, 4, 4, 5, 8 };
        List<Integer> expected1 = new List<Integer>{ 8, 5, 4, 4, 3, 1, 0, -3, -6, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.lim
     */
    @IsTest
    private static void lim() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone).lim(25);
        IntEnumerable seq1 = IntSequence.of(clone).lim(3);
        IIntEnumerable seq2 = IntSequence.of(clone).lim(0);
        IIntEnumerable seq3 = IntSequence.of(clone);
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = seq1.toList();
        List<Integer> actual2 = (List<Integer>) seq2.toList();
        Exception exc1;
        try {
            seq3.lim(-2);
        } catch (IllegalArgumentException exc) {
            exc1 = exc;
        }
        // Then
        List<Integer> expected = new List<Integer>{ 5, 1, 3 };
        List<Integer> expected1 = new List<Integer>();
        Assert.areEqual(input, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(IllegalArgumentException.class.getName(), exc1.getTypeName());
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.skip
     */
    @IsTest
    private static void skip() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone).skip(5);
        IntEnumerable seq1 = IntSequence.of(clone).skip(0);
        IIntEnumerable seq2 = IntSequence.of(clone).skip(25);
        IIntEnumerable seq3 = IntSequence.of(clone);
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = seq1.toList();
        List<Integer> actual2 = (List<Integer>) seq2.toList();
        Exception exc1;
        try {
            seq3.skip(-2);
        } catch (IllegalArgumentException exc) {
            exc1 = exc;
        }
        // Then
        List<Integer> expected = new List<Integer>{ 4, null, -6, 0, 4 };
        List<Integer> expected1 = new List<Integer>();
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(IllegalArgumentException.class.getName(), exc1.getTypeName());
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        IntEnumerable seq = IntSequence.of(clone);
        IntEnumerable seq1 = IntSequence.of(clone);
        IIntEnumerable seq2 = IntSequence.of(cloneWithNulls);
        Integer seed = 10;
        // When
        Integer actual = seq.reduce(seed, new AsTestCommons.SumIntBiOperator());
        Integer actual1 = (Integer) seq1.reduce(new AsTestCommons.SumIntBiOperator()).get();
        Exception exc1;
        try {
            seq2.reduce(new AsTestCommons.SumIntBiOperator());
        } catch (Exception exc) {
            exc1 = exc;
        }
        // Then
        Integer expected = 26;
        Integer expected1 = 16;
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(10, seed, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.collect
     */
    @IsTest
    private static void collect() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone);
        IIntEnumerable seq1 = IntSequence.of(clone);
        // When
        Set<Integer> actual = (Set<Integer>) seq.collect(Collector.of(Supplier.of(Set<Integer>.class), new AsTestCommons.AddToIntSet()));
        Set<Integer> actual1 = (Set<Integer>) seq1.collect(Collector.of(Supplier.of(Set<Integer>.class), new AsTestCommons.AddToIntSet()));
        // Then
        Set<Integer> expected = new Set<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.find
     */
    @IsTest
    private static void find() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone);
        IIntEnumerable seq1 = IntSequence.of(clone);
        // When
        Integer actual = (Integer) seq.find(new AsTestCommons.IsLessPredicate(0)).get();
        Integer actual1 = (Integer) seq1.find(new AsTestCommons.IsGreaterPredicate(50)).orElse(42);
        // Then
        Assert.areEqual(-3, actual);
        Assert.areEqual(42, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.every
     */
    @IsTest
    private static void every() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone);
        IIntEnumerable seq1 = IntSequence.of(clone);
        // When
        Boolean actual = seq.every(new AsTestCommons.IsEvenPredicate().negate());
        Boolean actual1 = seq1.every(new AsTestCommons.IsEvenPredicate());
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.some
     */
    @IsTest
    private static void some() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone);
        IIntEnumerable seq1 = IntSequence.of(clone);
        // When
        Boolean actual = seq.some(new AsTestCommons.IsLessPredicate(0));
        Boolean actual1 = seq1.some(BasePredicates.isEqual(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntEnumerable.none
     */
    @IsTest
    private static void none() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone);
        IIntEnumerable seq1 = IntSequence.of(clone);
        // When
        Boolean actual = seq.none(new AsTestCommons.IsEvenPredicate());
        Boolean actual1 = seq1.none(new AsTestCommons.IsLessPredicate(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntEnumerable.max
     */
    @IsTest
    private static void max() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone);
        IIntEnumerable seq1 = IntSequence.of(clone);
        // When
        Integer actual = (Integer) seq.max().get();
        Integer actual1 = (Integer) seq1.max().get();
        // Then
        Assert.areEqual(9, actual);
        Assert.areEqual(9, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntEnumerable.min
     */
    @IsTest
    private static void min() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone);
        IIntEnumerable seq1 = IntSequence.of(clone);
        // When
        Integer actual = (Integer) seq.min().get();
        Integer actual1 = (Integer) seq1.min().get();
        // Then
        Assert.areEqual(-3, actual);
        Assert.areEqual(-3, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.sum
     */
    @IsTest
    private static void sum() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone);
        IIntEnumerable seq1 = IntSequence.of(clone);
        // When
        Integer actual = seq.sum();
        Integer actual1 = (Integer) seq1.sum();
        // Then
        Assert.areEqual(22, actual);
        Assert.areEqual(22, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.avg
     */
    @IsTest
    private static void avg() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone);
        IIntEnumerable seq1 = IntSequence.of(clone);
        // When
        Double actual = (Double) seq.avg().get();
        Double actual1 = (Double) seq1.avg().get();
        // Then
        Assert.areEqual(3.625, actual);
        Assert.areEqual(3.625, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.count
     */
    @IsTest
    private static void count() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone);
        IntEnumerable seq1 = IntSequence.of(new List<Integer>());
        IIntEnumerable seq2 = IntSequence.empty();
        // When
        Integer actual = seq.count();
        Integer actual1 = seq1.count();
        Integer actual2 = seq2.count();
        // Then
        Assert.areEqual(8, actual);
        Assert.areEqual(0, actual1);
        Assert.areEqual(0, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.isEmpty
     */
    @IsTest
    private static void isEmpty() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone);
        IntEnumerable seq1 = IntSequence.of(new List<Integer>());
        IIntEnumerable seq2 = IntSequence.empty();
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
     * @see IntSequence.toList
     */
    @IsTest
    private static void toList() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone);
        IIntEnumerable seq1 = IntSequence.of(clone);
        // When
        List<Integer> actual = seq.toList();
        List<Integer> actual1 = (List<Integer>) seq1.toList();
        // Then
        Assert.areEqual(input, actual);
        Assert.areEqual(input, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see IntSequence.toSet
     */
    @IsTest
    private static void toSet() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IntEnumerable seq = IntSequence.of(clone);
        IIntEnumerable seq1 = IntSequence.of(clone);
        // When
        Set<Integer> actual = seq.toSet();
        Set<Integer> actual1 = (Set<Integer>) seq1.toSet();
        // Then
        Set<Integer> expected = new Set<Integer>{ 5, 1, 3, -3, 7, 9, 0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

}
