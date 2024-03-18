/**
 * @see LongStream
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage, PMD.CognitiveComplexity')
private class LongStreamTest {

    /**
     * @see LongStream.of
     * @see LongStream.ofNullable
     * @see LongStream.empty
     * @see LongStream.iterator
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
        LongEnumerable stm = LongStream.of(input);
        LongEnumerable stm1 = LongStream.of(new Set<Long>(input));
        LongEnumerable stm2 = LongStream.ofNullable(input);
        LongEnumerable stm3 = LongStream.ofNullable(new Set<Long>(input));
        ILongEnumerable stm4 = LongStream.ofNullable(input1);
        ILongEnumerable stm5 = LongStream.ofNullable(input2);
        ILongEnumerable stm6 = LongStream.of(input.iterator());
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = stm1.toList();
        List<Long> actual2 = stm2.toList();
        List<Long> actual3 = stm3.toList();
        List<Long> actual4 = (List<Long>) stm4.toList();
        List<Long> actual5 = (List<Long>) stm5.toList();
        List<Long> actual6 = (List<Long>) stm6.toList();
        // Then
        List<Long> expected = new List<Long>(new Set<Long>(input));
        List<Long> expected1 = new List<Long>();
        Assert.areEqual(input, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(input, actual6);
        Assert.areEqual(longs, input, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
        Assert.isTrue(((LongStream) stm2).isOperated);
        Assert.isTrue(((LongStream) stm3).isOperated);
        Assert.isTrue(((LongStream) stm4).isOperated);
        Assert.isTrue(((LongStream) stm5).isOperated);
        Assert.isTrue(((LongStream) stm6).isOperated);
    }

    /**
     * @see LongStream.range
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
        LongEnumerable stm = LongStream.range(fromI, toI);
        LongEnumerable stm1 = LongStream.range(fromI1, toI1);
        ILongEnumerable stm2 = LongStream.range(fromI2, toI1);
        ILongEnumerable stm3 = LongStream.range(fromI2, toI2);
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = stm1.toList();
        List<Long> actual2 = (List<Long>) stm2.toList();
        List<Long> actual3 = (List<Long>) stm3.toList();
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
     * @see LongStream.generate
     */
    @IsTest
    private static void generate() {
        // Given
        Integer lim = 10;
        Long fromLong = 10L;
        Integer step = 10;
        LongEnumerable stm = LongStream.generate(new AsTestCommons.FibonacciSupplier()).lim(lim);
        ILongEnumerable stm1 = LongStream.generate(new AsTestCommons.IncrementSupplier((Integer) fromLong, 10)).lim(step);
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = (List<Long>) stm1.toList();
        // Then
        Assert.areEqual(lim, actual.size());
        Assert.areEqual(1L, actual[0]);
        Assert.areEqual(55L, actual[9]);
        Assert.areEqual(lim, actual1.size());
        Assert.areEqual(fromLong, actual1[0]);
        Assert.areEqual(fromLong + (lim - 1) * step, actual1[9]);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.iterate
     */
    @IsTest
    private static void iterate() {
        // Given
        Long seed = 100L;
        Long seed1 = 10L;
        Long seed2 = 50L;
        Integer lim = 10;
        Long i = 5;
        LongEnumerable stm = LongStream.iterate(seed, new AsTestCommons.AddLongOp(1)).lim(lim);
        LongEnumerable stm1 = LongStream.iterate(seed1, new AsTestCommons.AddLongOp(i)).lim(lim);
        ILongEnumerable stm2 = LongStream.iterate(seed2, new AsTestCommons.IsGreaterPredicate(0L), new AsTestCommons.AddLongOp(-i));
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = stm1.toList();
        List<Long> actual2 = (List<Long>) stm2.toList();
        // Then
        Assert.areEqual(lim, actual.size());
        Assert.areEqual(seed, actual[0]);
        Assert.areEqual(109L, actual[9]);
        Assert.areEqual(lim, actual1.size());
        Assert.areEqual(seed1, actual1[0]);
        Assert.areEqual(55L, actual1[9]);
        Assert.areEqual(lim, actual2.size());
        Assert.areEqual(seed2, actual2[0]);
        Assert.areEqual(5L, actual2[9]);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
        Assert.isTrue(((LongStream) stm2).isOperated);
    }

    /**
     * @see LongStream.concat
     */
    @IsTest
    private static void concat() {
        // Given
        List<Long> input1 = new List<Long>{ -5L, 0L, 1L, 3L, 150L };
        List<Long> input2 = new List<Long>{ 3L, 0L, 8L };
        List<Long> input3 = new List<Long>{ 9L, 5L, 7L };
        LongEnumerable stm = LongStream.concat(LongStream.of(input1), LongStream.of(input2));
        ILongEnumerable stm1 = LongStream.concat(new List<ILongEnumerable>{ LongStream.of(input1), LongStream.of(input2), LongStream.of(input3) });
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = (List<Long>) stm1.toList();
        // Then
        List<Long> expected = new List<Long>{ -5L, 0L, 1L, 3L, 150L, 3L, 0L, 8L };
        List<Long> expected1 = new List<Long>{ -5L, 0L, 1L, 3L, 150L, 3L, 0L, 8L, 9L, 5L, 7L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.zip
     */
    @IsTest
    private static void zip() {
        // Given
        List<Long> input = new List<Long>{ -5L, 0L, 1L };
        List<Long> input1 = new List<Long>{ 3L, 0L, 8L };
        LongEnumerable stm = LongStream.zip(LongStream.of(input), LongStream.of(input1), new AsTestCommons.SumLongBiOperator());
        ILongEnumerable stm1 = LongStream.zip(LongStream.of(input), LongStream.of(input1), new AsTestCommons.SumLongBiOperator());
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = (List<Long>) stm1.toList();
        // Then
        List<Long> expected = new List<Long>{ -2L, 0L, 9L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.append
     * @see LongStream.prepend
     */
    @IsTest
    private static void appendPrepend() {
        // Given
        List<Long> input = new List<Long>{ -5L, 0L, 1L };
        List<Long> input1 = new List<Long>{ 3L, 0L, 8L };
        LongEnumerable stm = LongStream.of(input).append(LongStream.of(input1));
        ILongEnumerable stm1 = LongStream.of(input).prepend(LongStream.of(input1));
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = (List<Long>) stm1.toList();
        // Then
        List<Long> expected = new List<Long>{ -5L, 0L, 1L, 3L, 0L, 8L };
        List<Long> expected1 = new List<Long>{ 3L, 0L, 8L, -5L, 0L, 1L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
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
        LongEnumerable stm = LongStream.of(input).union(input1);
        LongEnumerable stm1 = LongStream.of(input).union(LongStream.of(input1));
        LongEnumerable stm2 = LongStream.of(input).intersect(input1);
        LongEnumerable stm3 = LongStream.of(input).intersect(LongStream.of(input1));
        ILongEnumerable stm4 = LongStream.of(input).except(input1);
        ILongEnumerable stm5 = LongStream.of(input).except(LongStream.of(input1));
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = stm1.toList();
        List<Long> actual2 = stm2.toList();
        List<Long> actual3 = stm3.toList();
        List<Long> actual4 = (List<Long>) stm4.toList();
        List<Long> actual5 = (List<Long>) stm5.toList();
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
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
        Assert.isTrue(((LongStream) stm2).isOperated);
        Assert.isTrue(((LongStream) stm3).isOperated);
        Assert.isTrue(((LongStream) stm4).isOperated);
        Assert.isTrue(((LongStream) stm5).isOperated);
    }

    /**
     * @see LongStream.filter
     */
    @IsTest
    private static void filter() {
        // Given
        List<Long> input = new List<Long>{ -5L, 0L, 1L, 3L, 8L, null, -6L, 4L, 4L };
        LongEnumerable stm = LongStream.of(input).filter(new AsTestCommons.IsGreaterPredicate(0L));
        ILongEnumerable stm1 = LongStream.of(input).filter(new AsTestCommons.IsGreaterPredicate(0L));
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = (List<Long>) stm1.toList();
        // Then
        List<Long> expected = new List<Long>{ 1L, 3L, 8L, 4L, 4L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.take
     */
    @IsTest
    private static void take() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, null, -6L, 4L, 4L };
        LongEnumerable stm = LongStream.of(input).take(new AsTestCommons.IsGreaterPredicate(0L));
        ILongEnumerable stm1 = LongStream.of(input).take(new AsTestCommons.IsGreaterPredicate(0L));
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = (List<Long>) stm1.toList();
        // Then
        List<Long> expected = new List<Long>{ 5L, 1L, 3L, 8L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.drop
     */
    @IsTest
    private static void drop() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, null, -6L, 4L, 4L };
        LongEnumerable stm = LongStream.of(input).drop(new AsTestCommons.IsGreaterPredicate(0L));
        ILongEnumerable stm1 = LongStream.of(input).drop(new AsTestCommons.IsGreaterPredicate(0L));
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = (List<Long>) stm1.toList();
        // Then
        List<Long> expected = new List<Long>{ -3L, null, -6L, 4L, 4L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongEnumerable.withoutNulls
     */
    @IsTest
    private static void withoutNulls() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, null, -6L, 0L, 4L, null };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone).withoutNulls();
        ILongEnumerable stm1 = LongStream.of(clone).withoutNulls();
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = (List<Long>) stm1.toList();
        // Then
        List<Long> expected = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.mapTo
     */
    @IsTest
    private static void mapTo() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone).mapTo(new AsTestCommons.MultiplyLongOp(2));
        ILongEnumerable stm1 = LongStream.of(clone).mapTo(new AsTestCommons.MultiplyLongOp(2));
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = (List<Long>) stm1.toList();
        // Then
        List<Long> expected = new List<Long>{ 10L, 2L, 6L, 16L, -6L, 8L, -12L, 0L, 8L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.mapToInt
     */
    @IsTest
    private static void mapToInt() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        IntEnumerable stm = LongStream.of(clone).mapToInt(new AsTestCommons.IntValueOf());
        IIntEnumerable stm1 = LongStream.of(clone).mapToInt(new AsTestCommons.IntValueOf());
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = (List<Integer>) stm1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see LongStream.mapToDouble
     */
    @IsTest
    private static void mapToDouble() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        DoubleEnumerable stm = LongStream.of(clone).mapToDouble(new AsTestCommons.DoubleValueOf());
        IDoubleEnumerable stm1 = LongStream.of(clone).mapToDouble(new AsTestCommons.DoubleValueOf());
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = (List<Double>) stm1.toList();
        // Then
        List<Double> expected = new List<Double>{ 5.0, 1.0, 3.0, 8.0, -3.0, 4.0, -6.0, 0.0, 4.0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see LongStream.mapToSObject
     */
    @IsTest
    private static void mapToSObject() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        SObjectEnumerable stm = LongStream.of(clone).mapToSObject(new AsTestCommons.CreateAccountFromLongs());
        ISObjectEnumerable stm1 = LongStream.of(clone).mapToSObject(new AsTestCommons.CreateAccountFromLongs());
        // When
        List<Account> actual = stm.toList();
        List<Account> actual1 = (List<Account>) stm1.toList();
        // Then
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        for (Integer i = 0, size = input.size(); i < size; i++ ) {
            Assert.areEqual(Math.abs(clone[i]), actual[i].NumberOfEmployees);
            Assert.areEqual(Math.abs(clone[i]), actual1[i].NumberOfEmployees);
        }
        Assert.isTrue(((SObjectStream) stm).isOperated);
        Assert.isTrue(((SObjectStream) stm1).isOperated);
    }

    /**
     * @see LongStream.mapToObject
     */
    @IsTest
    private static void mapToObject() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ObjectEnumerable stm = LongStream.of(clone).mapToObject(new AsTestCommons.LongToString());
        IObjectEnumerable stm1 = LongStream.of(clone).mapToObject(new AsTestCommons.LongToString());
        // When
        List<String> actual = (List<String>) stm.toList(String.class);
        List<String> actual1 = (List<String>) stm1.toList(String.class);
        // Then
        List<String> expected = new List<String>{ '5', '1', '3', '8', '-3', '4', '-6', '0', '4' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
    }

    /**
     * @see LongStream.flatMapTo
     */
    @IsTest
    private static void flatMapTo() {
        // Given
        List<Long> input = new List<Long>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone).flatMapTo(new AsTestCommons.DoubleLong());
        ILongEnumerable stm1 = LongStream.of(clone).flatMapTo(new AsTestCommons.DoubleLong());
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = (List<Long>) stm1.toList();
        // Then
        List<Long> expected = new List<Long>{ 10, 2, 6, 16, -6, 8, -12, 0, 8 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.forEach
     */
    @IsTest
    private static void forEach() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone).forEach(new AsTestCommons.DoNothingConsumer());
        ILongEnumerable stm1 = LongStream.of(clone).forEach(new AsTestCommons.DoNothingConsumer());
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = (List<Long>) stm1.toList();
        // Then
        Assert.areEqual(clone, actual);
        Assert.areEqual(clone, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.distinct
     */
    @IsTest
    private static void distinct() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone).distinct();
        ILongEnumerable stm1 = LongStream.of(clone).distinct();
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = (List<Long>) stm1.toList();
        // Then
        List<Long> expected = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.sort
     */
    @IsTest
    private static void sort() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, null, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone).sort();
        ILongEnumerable stm1 = LongStream.of(clone).sort(SortOrder.DESCENDING);
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = (List<Long>) stm1.toList();
        // Then
        List<Long> expected = new List<Long>{ null, -6L, -3L, 0L, 1L, 3L, 4L, 4L, 5L, 8L };
        List<Long> expected1 = new List<Long>{ 8L, 5L, 4L, 4L, 3L, 1L, 0L, -3L, -6L, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.lim
     */
    @IsTest
    private static void lim() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, null, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone).lim(25);
        LongEnumerable stm1 = LongStream.of(clone).lim(3);
        ILongEnumerable stm2 = LongStream.of(clone).lim(0);
        ILongEnumerable stm3 = LongStream.of(clone);
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = stm1.toList();
        List<Long> actual2 = (List<Long>) stm2.toList();
        Exception exc1;
        try {
            stm3.lim(-2);
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
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
        Assert.isTrue(((LongStream) stm2).isOperated);
        Assert.isTrue(((LongStream) stm3).isOperated);
    }

    /**
     * @see LongStream.skip
     */
    @IsTest
    private static void skip() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, null, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone).skip(5);
        LongEnumerable stm1 = LongStream.of(clone).skip(0);
        ILongEnumerable stm2 = LongStream.of(clone).skip(25);
        ILongEnumerable stm3 = LongStream.of(clone);
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = stm1.toList();
        List<Long> actual2 = (List<Long>) stm2.toList();
        Exception exc1;
        try {
            stm3.skip(-2);
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
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
        Assert.isTrue(((LongStream) stm2).isOperated);
        Assert.isTrue(((LongStream) stm3).isOperated);
    }

    /**
     * @see LongStream.reduce
     */
    @IsTest
    private static void reduce() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        List<Long> cloneWithNulls = input.clone();
        cloneWithNulls.add(null);
        LongEnumerable stm = LongStream.of(clone);
        LongEnumerable stm1 = LongStream.of(clone);
        ILongEnumerable stm2 = LongStream.of(cloneWithNulls);
        Long seed = 10;
        // When
        Long actual = stm.reduce(seed, new AsTestCommons.SumLongBiOperator());
        Long actual1 = (Long) stm1.reduce(new AsTestCommons.SumLongBiOperator()).get();
        Exception exc1;
        try {
            stm2.reduce(new AsTestCommons.SumLongBiOperator());
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
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
        Assert.isTrue(((LongStream) stm2).isOperated);
    }

    /**
     * @see LongStream.collect
     */
    @IsTest
    private static void collect() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone);
        ILongEnumerable stm1 = LongStream.of(clone);
        // When
        Set<Long> actual = (Set<Long>) stm.collect(Collector.of(Supplier.of(Set<Long>.class), new AsTestCommons.AddToLongSet()));
        Set<Long> actual1 = (Set<Long>) stm1.collect(Collector.of(Supplier.of(Set<Long>.class), new AsTestCommons.AddToLongSet()));
        // Then
        Set<Long> expected = new Set<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.find
     */
    @IsTest
    private static void find() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone);
        ILongEnumerable stm1 = LongStream.of(clone);
        // When
        Long actual = (Long) stm.find(new AsTestCommons.IsLessPredicate(0L)).get();
        Long actual1 = (Long) stm1.find(new AsTestCommons.IsGreaterPredicate(50L)).orElse(42L);
        // Then
        Assert.areEqual(-3L, actual);
        Assert.areEqual(42L, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.every
     */
    @IsTest
    private static void every() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone);
        ILongEnumerable stm1 = LongStream.of(clone);
        // When
        Boolean actual = stm.every(new AsTestCommons.IsEvenPredicate().negate());
        Boolean actual1 = stm1.every(new AsTestCommons.IsEvenPredicate());
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.some
     */
    @IsTest
    private static void some() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone);
        ILongEnumerable stm1 = LongStream.of(clone);
        // When
        Boolean actual = stm.some(new AsTestCommons.IsLessPredicate(0L));
        Boolean actual1 = stm1.some(BasePredicates.isEqual(0L));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongEnumerable.none
     */
    @IsTest
    private static void none() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone);
        ILongEnumerable stm1 = LongStream.of(clone);
        // When
        Boolean actual = stm.none(new AsTestCommons.IsEvenPredicate().negate());
        Boolean actual1 = stm1.none(new AsTestCommons.IsEvenPredicate());
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongEnumerable.max
     */
    @IsTest
    private static void max() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone);
        ILongEnumerable stm1 = LongStream.of(clone);
        // When
        Long actual = (Long) stm.max().get();
        Long actual1 = (Long) stm1.max().get();
        // Then
        Assert.areEqual(9, actual);
        Assert.areEqual(9, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongEnumerable.min
     */
    @IsTest
    private static void min() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone);
        ILongEnumerable stm1 = LongStream.of(clone);
        // When
        Long actual = (Long) stm.min().get();
        Long actual1 = (Long) stm1.min().get();
        // Then
        Assert.areEqual(-3L, actual);
        Assert.areEqual(-3L, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.sum
     */
    @IsTest
    private static void sum() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone);
        ILongEnumerable stm1 = LongStream.of(clone);
        // When
        Long actual = stm.sum();
        Long actual1 = (Long) stm1.sum();
        // Then
        Assert.areEqual(22L, actual);
        Assert.areEqual(22L, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.avg
     */
    @IsTest
    private static void avg() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone);
        ILongEnumerable stm1 = LongStream.of(clone);
        // When
        Double actual = (Double) stm.avg().get();
        Double actual1 = (Double) stm1.avg().get();
        // Then
        Assert.areEqual(3.625, actual);
        Assert.areEqual(3.625, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.count
     */
    @IsTest
    private static void count() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone);
        LongEnumerable stm1 = LongStream.of(new List<Long>());
        ILongEnumerable stm2 = LongStream.empty();
        // When
        Long actual = stm.count();
        Long actual1 = stm1.count();
        Long actual2 = stm2.count();
        // Then
        Assert.areEqual(8L, actual);
        Assert.areEqual(0L, actual1);
        Assert.areEqual(0L, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.isEmpty
     */
    @IsTest
    private static void isEmpty() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone);
        LongEnumerable stm1 = LongStream.of(new List<Long>());
        ILongEnumerable stm2 = LongStream.empty();
        // When
        Boolean actual = stm.isEmpty();
        Boolean actual1 = stm1.isEmpty();
        Boolean actual2 = stm2.isEmpty();
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(true, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.toList
     */
    @IsTest
    private static void toList() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone);
        ILongEnumerable stm1 = LongStream.of(clone);
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = (List<Long>) stm1.toList();
        // Then
        Assert.areEqual(input, actual);
        Assert.areEqual(input, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.toSet
     */
    @IsTest
    private static void toSet() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        LongEnumerable stm = LongStream.of(clone);
        ILongEnumerable stm1 = LongStream.of(clone);
        // When
        Set<Long> actual = stm.toSet();
        Set<Long> actual1 = (Set<Long>) stm1.toSet();
        // Then
        Set<Long> expected = new Set<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see LongStream.run
     */
    @IsTest
    private static void run() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        LongStream stm = (LongStream) LongStream.of(clone);
        IRunnable stm1 = (IRunnable) LongStream.of(clone);
        // When
        stm.run();
        stm1.run();
        // Then
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

}
