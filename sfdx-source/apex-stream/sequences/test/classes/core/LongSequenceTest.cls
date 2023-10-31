/**
 * @see LongSequence
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage, PMD.CognitiveComplexity')
private class LongSequenceTest {

    /**
     * @see LongSequence.of
     * @see LongSequence.ofNullable
     * @see LongSequence.empty
     * @see LongSequence.iterator
     */
    @IsTest
    private static void of() {
        // Given
        List<Long> longs = AsTestData.generateLongs();
        longs.add(0, null);
        longs.add(null);
        List<Long> input = longs.clone();
        List<Long> input1;
        Set<Long> input2;
        LongEnumerable seq = LongSequence.of(input);
        LongEnumerable seq1 = LongSequence.of(new Set<Long>(input));
        LongEnumerable seq2 = LongSequence.ofNullable(input);
        LongEnumerable seq3 = LongSequence.ofNullable(new Set<Long>(input));
        ILongEnumerable seq4 = LongSequence.ofNullable(input1);
        ILongEnumerable seq5 = LongSequence.ofNullable(input2);
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = seq1.toList();
        List<Long> actual2 = seq2.toList();
        List<Long> actual3 = seq3.toList();
        List<Long> actual4 = (List<Long>) seq4.toList();
        List<Long> actual5 = (List<Long>) seq5.toList();
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
        Assert.areEqual(longs, input, Label.AS_ErrorMessage_InputMutated);
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
        LongEnumerable seq = LongSequence.range(fromI, toI);
        LongEnumerable seq1 = LongSequence.range(fromI1, toI1);
        ILongEnumerable seq2 = LongSequence.range(fromI2, toI1);
        ILongEnumerable seq3 = LongSequence.range(fromI2, toI2);
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = seq1.toList();
        List<Long> actual2 = (List<Long>) seq2.toList();
        List<Long> actual3 = (List<Long>) seq3.toList();
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
        LongEnumerable seq = LongSequence.concat(LongSequence.of(input1), LongSequence.of(input2));
        ILongEnumerable seq1 = LongSequence.concat(new List<ILongEnumerable>{ LongSequence.of(input1), LongSequence.of(input2), LongSequence.of(input3) });
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = (List<Long>) seq1.toList();
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
        LongEnumerable seq = LongSequence.zip(LongSequence.of(input), LongSequence.of(input1), new AsTestCommons.SumLongBiOperator());
        ILongEnumerable seq1 = LongSequence.zip(LongSequence.of(input), LongSequence.of(input1), new AsTestCommons.SumLongBiOperator());
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = (List<Long>) seq1.toList();
        // Then
        List<Long> expected = new List<Long>{ -2L, 0L, 9L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
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
        LongEnumerable seq = LongSequence.of(input).append(LongSequence.of(input1));
        ILongEnumerable seq1 = LongSequence.of(input).prepend(LongSequence.of(input1));
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = (List<Long>) seq1.toList();
        // Then
        List<Long> expected = new List<Long>{ -5L, 0L, 1L, 3L, 0L, 8L };
        List<Long> expected1 = new List<Long>{ 3L, 0L, 8L, -5L, 0L, 1L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
    }

    /**
     * @see LongEnumerable.union
     * @see LongEnumerable.intersect
     * @see LongEnumerable.except
     */
    @IsTest
    private static void setOperations() {
        // Given
        List<Long> input = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
        List<Long> input1 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
        LongEnumerable seq = LongSequence.of(input).union((Iterable<Long>) input1);
        LongEnumerable seq1 = LongSequence.of(input).union(LongSequence.of(input1));
        LongEnumerable seq2 = LongSequence.of(input).intersect((Iterable<Long>) input1);
        LongEnumerable seq3 = LongSequence.of(input).intersect(LongSequence.of(input1));
        ILongEnumerable seq4 = LongSequence.of(input).except((Iterable<Long>) input1);
        ILongEnumerable seq5 = LongSequence.of(input).except(LongSequence.of(input1));
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = seq1.toList();
        List<Long> actual2 = seq2.toList();
        List<Long> actual3 = seq3.toList();
        List<Long> actual4 = (List<Long>) seq4.toList();
        List<Long> actual5 = (List<Long>) seq5.toList();
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
     * @see LongSequence.filter
     */
    @IsTest
    private static void filter() {
        // Given
        List<Long> input = new List<Long>{ -5L, 0L, 1L, 3L, 8L, null, -6L, 4L, 4L };
        LongEnumerable seq = LongSequence.of(input).filter(new AsTestCommons.IsGreaterPredicate(0L));
        ILongEnumerable seq1 = LongSequence.of(input).filter(new AsTestCommons.IsGreaterPredicate(0L));
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = (List<Long>) seq1.toList();
        // Then
        List<Long> expected = new List<Long>{ 1L, 3L, 8L, 4L, 4L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
    }

    /**
     * @see LongSequence.take
     */
    @IsTest
    private static void take() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, null, -6L, 4L, 4L };
        LongEnumerable seq = LongSequence.of(input).take(new AsTestCommons.IsGreaterPredicate(0L));
        ILongEnumerable seq1 = LongSequence.of(input).take(new AsTestCommons.IsGreaterPredicate(0L));
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = (List<Long>) seq1.toList();
        // Then
        List<Long> expected = new List<Long>{ 5L, 1L, 3L, 8L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
    }

    /**
     * @see LongSequence.drop
     */
    @IsTest
    private static void drop() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, null, -6L, 4L, 4L };
        LongEnumerable seq = LongSequence.of(input).drop(new AsTestCommons.IsGreaterPredicate(0L));
        ILongEnumerable seq1 = LongSequence.of(input).drop(new AsTestCommons.IsGreaterPredicate(0L));
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = (List<Long>) seq1.toList();
        // Then
        List<Long> expected = new List<Long>{ -3L, null, -6L, 4L, 4L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
    }

    /**
     * @see LongEnumerable.withoutNulls
     */
    @IsTest
    private static void withoutNulls() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, null, -6L, 0L, 4L, null };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone).withoutNulls();
        ILongEnumerable seq1 = LongSequence.of(clone).withoutNulls();
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
     * @see LongSequence.mapTo
     */
    @IsTest
    private static void mapTo() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone).mapTo(new AsTestCommons.MultiplyLongOp(2));
        ILongEnumerable seq1 = LongSequence.of(clone).mapTo(new AsTestCommons.MultiplyLongOp(2));
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = (List<Long>) seq1.toList();
        // Then
        List<Long> expected = new List<Long>{ 10L, 2L, 6L, 16L, -6L, 8L, -12L, 0L, 8L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongSequence.mapToInt
     */
    @IsTest
    private static void mapToInt() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        IntEnumerable seq = LongSequence.of(clone).mapToInt(new AsTestCommons.IntValueOf());
        IIntEnumerable seq1 = LongSequence.of(clone).mapToInt(new AsTestCommons.IntValueOf());
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = (List<Long>) seq1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongSequence.mapToDouble
     */
    @IsTest
    private static void mapToDouble() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        DoubleEnumerable seq = LongSequence.of(clone).mapToDouble(new AsTestCommons.DoubleValueOf());
        IDoubleEnumerable seq1 = LongSequence.of(clone).mapToDouble(new AsTestCommons.DoubleValueOf());
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
     * @see LongSequence.mapToSObject
     */
    @IsTest
    private static void mapToSObject() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        SObjectEnumerable seq = LongSequence.of(clone).mapToSObject(new AsTestCommons.CreateAccountFromLongs());
        ISObjectEnumerable seq1 = LongSequence.of(clone).mapToSObject(new AsTestCommons.CreateAccountFromLongs());
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
     * @see LongSequence.mapToObject
     */
    @IsTest
    private static void mapToObject() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ObjectEnumerable seq = LongSequence.of(clone).mapToObject(new AsTestCommons.LongToString());
        IObjectEnumerable seq1 = LongSequence.of(clone).mapToObject(new AsTestCommons.LongToString());
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
     * @see LongSequence.flatMapTo
     */
    @IsTest
    private static void flatMapTo() {
        // Given
        List<Long> input = new List<Long>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone).flatMapTo(new AsTestCommons.DoubleLong());
        ILongEnumerable seq1 = LongSequence.of(clone).flatMapTo(new AsTestCommons.DoubleLong());
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = (List<Long>) seq1.toList();
        // Then
        List<Long> expected = new List<Long>{ 10, 2, 6, 16, -6, 8, -12, 0, 8 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongSequence.forEach
     */
    @IsTest
    private static void forEach() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone).forEach(new AsTestCommons.DoNothingConsumer());
        ILongEnumerable seq1 = LongSequence.of(clone).forEach(new AsTestCommons.DoNothingConsumer());
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = (List<Long>) seq1.toList();
        // Then
        Assert.areEqual(clone, actual);
        Assert.areEqual(clone, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongSequence.distinct
     */
    @IsTest
    private static void distinct() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone).distinct();
        ILongEnumerable seq1 = LongSequence.of(clone).distinct();
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = (List<Long>) seq1.toList();
        // Then
        List<Long> expected = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongSequence.sort
     */
    @IsTest
    private static void sort() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, null, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone).sort();
        ILongEnumerable seq1 = LongSequence.of(clone).sort(SortOrder.DESCENDING);
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = (List<Long>) seq1.toList();
        // Then
        List<Long> expected = new List<Long>{ null, -6L, -3L, 0L, 1L, 3L, 4L, 4L, 5L, 8L };
        List<Long> expected1 = new List<Long>{ 8L, 5L, 4L, 4L, 3L, 1L, 0L, -3L, -6L, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongSequence.lim
     */
    @IsTest
    private static void lim() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, null, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone).lim(25);
        LongEnumerable seq1 = LongSequence.of(clone).lim(3);
        ILongEnumerable seq2 = LongSequence.of(clone).lim(0);
        ILongEnumerable seq3 = LongSequence.of(clone);
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = seq1.toList();
        List<Long> actual2 = (List<Long>) seq2.toList();
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
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongSequence.skip
     */
    @IsTest
    private static void skip() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, null, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone).skip(5);
        LongEnumerable seq1 = LongSequence.of(clone).skip(0);
        ILongEnumerable seq2 = LongSequence.of(clone).skip(25);
        ILongEnumerable seq3 = LongSequence.of(clone);
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = seq1.toList();
        List<Long> actual2 = (List<Long>) seq2.toList();
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
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        LongEnumerable seq = LongSequence.of(clone);
        LongEnumerable seq1 = LongSequence.of(clone);
        ILongEnumerable seq2 = LongSequence.of(cloneWithNulls);
        Long seed = 10;
        // When
        Long actual = seq.reduce(seed, new AsTestCommons.SumLongBiOperator());
        Long actual1 = (Long) seq1.reduce(new AsTestCommons.SumLongBiOperator()).get();
        Exception exc1;
        try {
            seq2.reduce(new AsTestCommons.SumLongBiOperator());
        } catch (Exception exc) {
            exc1 = exc;
        }
        // Then
        Long expected = 26;
        Long expected1 = 16;
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(10, seed, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongSequence.collect
     */
    @IsTest
    private static void collect() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone);
        ILongEnumerable seq1 = LongSequence.of(clone);
        // When
        Set<Long> actual = (Set<Long>) seq.collect(Collector.of(Supplier.of(Set<Long>.class), new AsTestCommons.AddToLongSet()));
        Set<Long> actual1 = (Set<Long>) seq1.collect(Collector.of(Supplier.of(Set<Long>.class), new AsTestCommons.AddToLongSet()));
        // Then
        Set<Long> expected = new Set<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongSequence.find
     */
    @IsTest
    private static void find() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone);
        ILongEnumerable seq1 = LongSequence.of(clone);
        // When
        Long actual = (Long) seq.find(new AsTestCommons.IsLessPredicate(0L)).get();
        Long actual1 = (Long) seq1.find(new AsTestCommons.IsGreaterPredicate(50L)).orElse(42L);
        // Then
        Assert.areEqual(-3L, actual);
        Assert.areEqual(42L, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongSequence.every
     */
    @IsTest
    private static void every() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone);
        ILongEnumerable seq1 = LongSequence.of(clone);
        // When
        Boolean actual = seq.every(new AsTestCommons.IsEvenPredicate().negate());
        Boolean actual1 = seq1.every(new AsTestCommons.IsEvenPredicate());
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongSequence.some
     */
    @IsTest
    private static void some() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone);
        ILongEnumerable seq1 = LongSequence.of(clone);
        // When
        Boolean actual = seq.some(new AsTestCommons.IsLessPredicate(0L));
        Boolean actual1 = seq1.some(BasePredicates.isEqual(0L));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongEnumerable.none
     */
    @IsTest
    private static void none() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone);
        ILongEnumerable seq1 = LongSequence.of(clone);
        // When
        Boolean actual = seq.none(new AsTestCommons.IsEvenPredicate().negate());
        Boolean actual1 = seq1.none(new AsTestCommons.IsEvenPredicate());
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongEnumerable.max
     */
    @IsTest
    private static void max() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone);
        ILongEnumerable seq1 = LongSequence.of(clone);
        // When
        Long actual = (Long) seq.max().get();
        Long actual1 = (Long) seq1.max().get();
        // Then
        Assert.areEqual(9, actual);
        Assert.areEqual(9, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongEnumerable.min
     */
    @IsTest
    private static void min() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone);
        ILongEnumerable seq1 = LongSequence.of(clone);
        // When
        Long actual = (Long) seq.min().get();
        Long actual1 = (Long) seq1.min().get();
        // Then
        Assert.areEqual(-3L, actual);
        Assert.areEqual(-3L, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongSequence.sum
     */
    @IsTest
    private static void sum() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone);
        ILongEnumerable seq1 = LongSequence.of(clone);
        // When
        Long actual = seq.sum();
        Long actual1 = (Long) seq1.sum();
        // Then
        Assert.areEqual(22L, actual);
        Assert.areEqual(22L, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongSequence.avg
     */
    @IsTest
    private static void avg() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone);
        ILongEnumerable seq1 = LongSequence.of(clone);
        // When
        Double actual = (Double) seq.avg().get();
        Double actual1 = (Double) seq1.avg().get();
        // Then
        Assert.areEqual(3.625, actual);
        Assert.areEqual(3.625, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongSequence.count
     */
    @IsTest
    private static void count() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone);
        LongEnumerable seq1 = LongSequence.of(new List<Long>());
        ILongEnumerable seq2 = LongSequence.empty();
        // When
        Long actual = seq.count();
        Long actual1 = seq1.count();
        Long actual2 = seq2.count();
        // Then
        Assert.areEqual(8L, actual);
        Assert.areEqual(0L, actual1);
        Assert.areEqual(0L, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongSequence.isEmpty
     */
    @IsTest
    private static void isEmpty() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone);
        LongEnumerable seq1 = LongSequence.of(new List<Long>());
        ILongEnumerable seq2 = LongSequence.empty();
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
     * @see LongSequence.toList
     */
    @IsTest
    private static void toList() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone);
        ILongEnumerable seq1 = LongSequence.of(clone);
        // When
        List<Long> actual = seq.toList();
        List<Long> actual1 = (List<Long>) seq1.toList();
        // Then
        Assert.areEqual(input, actual);
        Assert.areEqual(input, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see LongSequence.toSet
     */
    @IsTest
    private static void toSet() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        LongEnumerable seq = LongSequence.of(clone);
        ILongEnumerable seq1 = LongSequence.of(clone);
        // When
        Set<Long> actual = seq.toSet();
        Set<Long> actual1 = (Set<Long>) seq1.toSet();
        // Then
        Set<Long> expected = new Set<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

}
