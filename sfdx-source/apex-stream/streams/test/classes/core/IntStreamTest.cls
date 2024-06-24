/**
 * @see IntStream
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings(
    'PMD.ApexAssertionsShouldIncludeMessage, PMD.ApexUnitTestClassShouldHaveRunAs, PMD.CognitiveComplexity, PMD.CyclomaticComplexity'
)
private class IntStreamTest {

    /**
     * @see IntStream.of
     * @see IntStream.ofNullable
     * @see IntStream.empty
     * @see IntStream.iterator
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
        IntEnumerable stm = IntStream.of(input);
        IntEnumerable stm1 = IntStream.of(new Set<Integer>(input));
        IntEnumerable stm2 = IntStream.ofNullable(input);
        IntEnumerable stm3 = IntStream.ofNullable(new Set<Integer>(input));
        IIntEnumerable stm4 = IntStream.ofNullable(input1);
        IIntEnumerable stm5 = IntStream.ofNullable(input2);
        IIntEnumerable stm6 = IntStream.of(input.iterator());
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = stm1.toList();
        List<Integer> actual2 = stm2.toList();
        List<Integer> actual3 = stm3.toList();
        List<Integer> actual4 = (List<Integer>) stm4.toList();
        List<Integer> actual5 = (List<Integer>) stm5.toList();
        List<Integer> actual6 = (List<Integer>) stm6.toList();
        // Then
        List<Integer> expected = new List<Integer>(new Set<Integer>(input));
        List<Integer> expected1 = new List<Integer>();
        Assert.areEqual(input, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(input, actual6);
        Assert.areEqual(ints, input, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
        Assert.isTrue(((IntStream) stm2).isOperated);
        Assert.isTrue(((IntStream) stm3).isOperated);
        Assert.isTrue(((IntStream) stm4).isOperated);
        Assert.isTrue(((IntStream) stm5).isOperated);
        Assert.isTrue(((IntStream) stm6).isOperated);
    }

    /**
     * @see IntStream.range
     */
    @IsTest
    @SuppressWarnings('PMD.OneDeclarationPerLine')
    private static void range() {
        // Given
        Integer fromI = 0;
        Integer fromI1 = -100;
        Integer fromI2 = 100;
        Integer toI = 200;
        Integer toI1 = 100;
        Integer toI2 = 0;
        IntEnumerable stm = IntStream.range(fromI, toI);
        IntEnumerable stm1 = IntStream.range(fromI1, toI1);
        IIntEnumerable stm2 = IntStream.range(fromI2, toI1);
        IIntEnumerable stm3 = IntStream.range(fromI2, toI2);
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = stm1.toList();
        List<Integer> actual2 = (List<Integer>) stm2.toList();
        List<Integer> actual3 = (List<Integer>) stm3.toList();
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
     * @see IntStream.generate
     */
    @IsTest
    private static void generate() {
        // Given
        Integer lim = 10;
        Integer fromInt = 10;
        Integer step = 10;
        IntEnumerable stm = IntStream.generate(new AsTestCommons.FibonacciSupplier()).lim(lim);
        IIntEnumerable stm1 = IntStream.generate(new AsTestCommons.IncrementSupplier(fromInt, 10)).lim(step);
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = (List<Integer>) stm1.toList();
        // Then
        Assert.areEqual(lim, actual.size());
        Assert.areEqual(1, actual[0]);
        Assert.areEqual(55, actual[9]);
        Assert.areEqual(lim, actual1.size());
        Assert.areEqual(fromInt, actual1[0]);
        Assert.areEqual(fromInt + (lim - 1) * step, actual1[9]);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntStream.iterate
     */
    @IsTest
    private static void iterate() {
        // Given
        Integer seed = 100;
        Integer seed1 = 10;
        Integer seed2 = 50;
        Integer lim = 10;
        Integer i = 5;
        IntEnumerable stm = IntStream.iterate(seed, new AsTestCommons.AddIntOp(1)).lim(lim);
        IntEnumerable stm1 = IntStream.iterate(seed1, new AsTestCommons.AddIntOp(i)).lim(lim);
        IIntEnumerable stm2 = IntStream.iterate(seed2, new AsTestCommons.IsGreaterPredicate(0), new AsTestCommons.AddIntOp(-i));
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = stm1.toList();
        List<Integer> actual2 = (List<Integer>) stm2.toList();
        // Then
        Assert.areEqual(lim, actual.size());
        Assert.areEqual(seed, actual[0]);
        Assert.areEqual(109, actual[9]);
        Assert.areEqual(lim, actual1.size());
        Assert.areEqual(seed1, actual1[0]);
        Assert.areEqual(55, actual1[9]);
        Assert.areEqual(lim, actual2.size());
        Assert.areEqual(seed2, actual2[0]);
        Assert.areEqual(5, actual2[9]);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
        Assert.isTrue(((IntStream) stm2).isOperated);
    }

    /**
     * @see IntStream.concat
     */
    @IsTest
    private static void concat() {
        // Given
        List<Integer> input1 = new List<Integer>{ -5, 0, 1, 3, 150 };
        List<Integer> input2 = new List<Integer>{ 3, 0, 8 };
        List<Integer> input3 = new List<Integer>{ 9, 5, 7 };
        IntEnumerable stm = IntStream.concat(IntStream.of(input1), IntStream.of(input2));
        IIntEnumerable stm1 = IntStream.concat(new List<IIntEnumerable>{ IntStream.of(input1), IntStream.of(input2), IntStream.of(input3) });
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = (List<Integer>) stm1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ -5, 0, 1, 3, 150, 3, 0, 8 };
        List<Integer> expected1 = new List<Integer>{ -5, 0, 1, 3, 150, 3, 0, 8, 9, 5, 7 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntStream.zip
     */
    @IsTest
    private static void zip() {
        // Given
        List<Integer> input = new List<Integer>{ -5, 0, 1 };
        List<Integer> input1 = new List<Integer>{ 3, 0, 8 };
        IntEnumerable stm = IntStream.zip(IntStream.of(input), IntStream.of(input1), new AsTestCommons.SumIntBiOperator());
        IIntEnumerable stm1 = IntStream.zip(IntStream.of(input), IntStream.of(input1), new AsTestCommons.SumIntBiOperator());
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = (List<Integer>) stm1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ -2, 0, 9 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntStream.append
     * @see IntStream.prepend
     */
    @IsTest
    private static void appendPrepend() {
        // Given
        List<Integer> input = new List<Integer>{ -5, 0, 1 };
        List<Integer> input1 = new List<Integer>{ 3, 0, 8 };
        IntEnumerable stm = IntStream.of(input).append(IntStream.of(input1));
        IIntEnumerable stm1 = IntStream.of(input).prepend(IntStream.of(input1));
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = (List<Integer>) stm1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ -5, 0, 1, 3, 0, 8 };
        List<Integer> expected1 = new List<Integer>{ 3, 0, 8, -5, 0, 1 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
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
        IntEnumerable stm = IntStream.of(input).union(input1);
        IntEnumerable stm1 = IntStream.of(input).union(IntStream.of(input1));
        IntEnumerable stm2 = IntStream.of(input).intersect(input1);
        IntEnumerable stm3 = IntStream.of(input).intersect(IntStream.of(input1));
        IIntEnumerable stm4 = IntStream.of(input).except(input1);
        IIntEnumerable stm5 = IntStream.of(input).except(IntStream.of(input1));
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = stm1.toList();
        List<Integer> actual2 = stm2.toList();
        List<Integer> actual3 = stm3.toList();
        List<Integer> actual4 = (List<Integer>) stm4.toList();
        List<Integer> actual5 = (List<Integer>) stm5.toList();
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
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
        Assert.isTrue(((IntStream) stm2).isOperated);
        Assert.isTrue(((IntStream) stm3).isOperated);
        Assert.isTrue(((IntStream) stm4).isOperated);
        Assert.isTrue(((IntStream) stm5).isOperated);
    }

    /**
     * @see IntStream.filter
     */
    @IsTest
    private static void filter() {
        // Given
        List<Integer> input = new List<Integer>{ -5, 0, 1, 3, 8, null, -6, 4, 4 };
        IntEnumerable stm = IntStream.of(input).filter(new AsTestCommons.IsGreaterPredicate(0));
        IIntEnumerable stm1 = IntStream.of(input).filter(new AsTestCommons.IsGreaterPredicate(0));
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = (List<Integer>) stm1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 1, 3, 8, 4, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntStream.take
     */
    @IsTest
    private static void take() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, null, -6, 4, 4 };
        IntEnumerable stm = IntStream.of(input).take(new AsTestCommons.IsGreaterPredicate(0));
        IIntEnumerable stm1 = IntStream.of(input).take(new AsTestCommons.IsGreaterPredicate(0));
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = (List<Integer>) stm1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 5, 1, 3, 8 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntStream.drop
     */
    @IsTest
    private static void drop() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, null, -6, 4, 4 };
        IntEnumerable stm = IntStream.of(input).drop(new AsTestCommons.IsGreaterPredicate(0));
        IIntEnumerable stm1 = IntStream.of(input).drop(new AsTestCommons.IsGreaterPredicate(0));
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = (List<Integer>) stm1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ -3, null, -6, 4, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntEnumerable.withoutNulls
     */
    @IsTest
    private static void withoutNulls() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4, null };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone).withoutNulls();
        IIntEnumerable stm1 = IntStream.of(clone).withoutNulls();
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
     * @see IntStream.mapTo
     */
    @IsTest
    private static void mapTo() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone).mapTo(new AsTestCommons.MultiplyIntOp(2));
        IIntEnumerable stm1 = IntStream.of(clone).mapTo(new AsTestCommons.MultiplyIntOp(2));
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = (List<Integer>) stm1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 10, 2, 6, 16, -6, 8, -12, 0, 8 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntStream.mapToLong
     */
    @IsTest
    private static void mapToLong() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        LongEnumerable stm = IntStream.of(clone).mapToLong(new AsTestCommons.LongValueOfInt());
        ILongEnumerable stm1 = IntStream.of(clone).mapToLong(new AsTestCommons.LongValueOfInt());
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
     * @see IntStream.mapToDouble
     */
    @IsTest
    private static void mapToDouble() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        DoubleEnumerable stm = IntStream.of(clone).mapToDouble(new AsTestCommons.DoubleValueOf());
        IDoubleEnumerable stm1 = IntStream.of(clone).mapToDouble(new AsTestCommons.DoubleValueOf());
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
     * @see IntStream.mapToSObject
     */
    @IsTest
    @SuppressWarnings('PMD.OneDeclarationPerLine')
    private static void mapToSObject() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        SObjectEnumerable stm = IntStream.of(clone).mapToSObject(new AsTestCommons.CreateAccountFromInts());
        ISObjectEnumerable stm1 = IntStream.of(clone).mapToSObject(new AsTestCommons.CreateAccountFromInts());
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
     * @see IntStream.mapToObject
     */
    @IsTest
    private static void mapToObject() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        ObjectEnumerable stm = IntStream.of(clone).mapToObject(new AsTestCommons.IntToString());
        IObjectEnumerable stm1 = IntStream.of(clone).mapToObject(new AsTestCommons.IntToString());
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
     * @see IntStream.flatMapTo
     */
    @IsTest
    private static void flatMapTo() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone).flatMapTo(new AsTestCommons.DoubleInt());
        IIntEnumerable stm1 = IntStream.of(clone).flatMapTo(new AsTestCommons.DoubleInt());
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = (List<Integer>) stm1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 10, 2, 6, 16, -6, 8, -12, 0, 8 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);

    }

    /**
     * @see IntStream.forEach
     */
    @IsTest
    private static void forEach() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone).forEach(new AsTestCommons.DoNothingConsumer());
        IIntEnumerable stm1 = IntStream.of(clone).forEach(new AsTestCommons.DoNothingConsumer());
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = (List<Integer>) stm1.toList();
        // Then
        Assert.areEqual(clone, actual);
        Assert.areEqual(clone, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntStream.distinct
     */
    @IsTest
    private static void distinct() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone).distinct();
        IIntEnumerable stm1 = IntStream.of(clone).distinct();
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = (List<Integer>) stm1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntStream.sort
     */
    @IsTest
    private static void sort() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone).sort();
        IIntEnumerable stm1 = IntStream.of(clone).sort(SortOrder.DESCENDING);
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = (List<Integer>) stm1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ null, -6, -3, 0, 1, 3, 4, 4, 5, 8 };
        List<Integer> expected1 = new List<Integer>{ 8, 5, 4, 4, 3, 1, 0, -3, -6, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntStream.lim
     */
    @IsTest
    private static void lim() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone).lim(25);
        IntEnumerable stm1 = IntStream.of(clone).lim(3);
        IIntEnumerable stm2 = IntStream.of(clone).lim(0);
        IIntEnumerable stm3 = IntStream.of(clone);
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = stm1.toList();
        List<Integer> actual2 = (List<Integer>) stm2.toList();
        Exception exc1;
        try {
            stm3.lim(-2);
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
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
        Assert.isTrue(((IntStream) stm2).isOperated);
        Assert.isTrue(((IntStream) stm3).isOperated);
    }

    /**
     * @see IntStream.skip
     */
    @IsTest
    private static void skip() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone).skip(5);
        IntEnumerable stm1 = IntStream.of(clone).skip(0);
        IIntEnumerable stm2 = IntStream.of(clone).skip(25);
        IIntEnumerable stm3 = IntStream.of(clone);
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = stm1.toList();
        List<Integer> actual2 = (List<Integer>) stm2.toList();
        Exception exc1;
        try {
            stm3.skip(-2);
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
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
        Assert.isTrue(((IntStream) stm2).isOperated);
        Assert.isTrue(((IntStream) stm3).isOperated);
    }

    /**
     * @see IntStream.reduce
     */
    @IsTest
    private static void reduce() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        List<Integer> cloneWithNulls = input.clone();
        cloneWithNulls.add(null);
        IntEnumerable stm = IntStream.of(clone);
        IntEnumerable stm1 = IntStream.of(clone);
        IIntEnumerable stm2 = IntStream.of(cloneWithNulls);
        Integer seed = 10;
        // When
        Integer actual = stm.reduce(seed, new AsTestCommons.SumIntBiOperator());
        Integer actual1 = (Integer) stm1.reduce(new AsTestCommons.SumIntBiOperator()).get();
        Exception exc1;
        try {
            stm2.reduce(new AsTestCommons.SumIntBiOperator());
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
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
        Assert.isTrue(((IntStream) stm2).isOperated);
    }

    /**
     * @see IntStream.collect
     */
    @IsTest
    private static void collect() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone);
        IIntEnumerable stm1 = IntStream.of(clone);
        // When
        Set<Integer> actual = (Set<Integer>) stm.collect(Collector.of(Supplier.of(Set<Integer>.class), new AsTestCommons.AddToIntSet()));
        Set<Integer> actual1 = (Set<Integer>) stm1.collect(Collector.of(Supplier.of(Set<Integer>.class), new AsTestCommons.AddToIntSet()));
        // Then
        Set<Integer> expected = new Set<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);

    }

    /**
     * @see IntStream.find
     */
    @IsTest
    private static void find() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone);
        IIntEnumerable stm1 = IntStream.of(clone);
        // When
        Integer actual = (Integer) stm.find(new AsTestCommons.IsLessPredicate(0)).get();
        Integer actual1 = (Integer) stm1.find(new AsTestCommons.IsGreaterPredicate(50)).orElse(42);
        // Then
        Assert.areEqual(-3, actual);
        Assert.areEqual(42, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntStream.every
     */
    @IsTest
    private static void every() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone);
        IIntEnumerable stm1 = IntStream.of(clone);
        // When
        Boolean actual = stm.every(new AsTestCommons.IsEvenPredicate().negate());
        Boolean actual1 = stm1.every(new AsTestCommons.IsEvenPredicate());
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntStream.some
     */
    @IsTest
    private static void some() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone);
        IIntEnumerable stm1 = IntStream.of(clone);
        // When
        Boolean actual = stm.some(new AsTestCommons.IsLessPredicate(0));
        Boolean actual1 = stm1.some(EnumerableSupport.isEqual(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntEnumerable.none
     */
    @IsTest
    private static void none() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone);
        IIntEnumerable stm1 = IntStream.of(clone);
        // When
        Boolean actual = stm.none(new AsTestCommons.IsEvenPredicate());
        Boolean actual1 = stm1.none(new AsTestCommons.IsLessPredicate(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntEnumerable.max
     */
    @IsTest
    private static void max() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone);
        IIntEnumerable stm1 = IntStream.of(clone);
        // When
        Integer actual = (Integer) stm.max().get();
        Integer actual1 = (Integer) stm1.max().get();
        // Then
        Assert.areEqual(9, actual);
        Assert.areEqual(9, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntEnumerable.min
     */
    @IsTest
    private static void min() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone);
        IIntEnumerable stm1 = IntStream.of(clone);
        // When
        Integer actual = (Integer) stm.min().get();
        Integer actual1 = (Integer) stm1.min().get();
        // Then
        Assert.areEqual(-3, actual);
        Assert.areEqual(-3, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntStream.sum
     */
    @IsTest
    private static void sum() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone);
        IIntEnumerable stm1 = IntStream.of(clone);
        // When
        Integer actual = stm.sum();
        Integer actual1 = (Integer) stm1.sum();
        // Then
        Assert.areEqual(22, actual);
        Assert.areEqual(22, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntStream.avg
     */
    @IsTest
    private static void avg() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone);
        IIntEnumerable stm1 = IntStream.of(clone);
        // When
        Double actual = (Double) stm.avg().get();
        Double actual1 = (Double) stm1.avg().get();
        // Then
        Assert.areEqual(3.625, actual);
        Assert.areEqual(3.625, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntStream.count
     */
    @IsTest
    private static void count() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone);
        IntEnumerable stm1 = IntStream.of(new List<Integer>());
        IIntEnumerable stm2 = IntStream.empty();
        // When
        Integer actual = stm.count();
        Integer actual1 = stm1.count();
        Integer actual2 = stm2.count();
        // Then
        Assert.areEqual(8, actual);
        Assert.areEqual(0, actual1);
        Assert.areEqual(0, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
        Assert.isTrue(((IntStream) stm2).isOperated);
    }

    /**
     * @see IntStream.isEmpty
     */
    @IsTest
    private static void isEmpty() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone);
        IntEnumerable stm1 = IntStream.of(new List<Integer>());
        IIntEnumerable stm2 = IntStream.empty();
        // When
        Boolean actual = stm.isEmpty();
        Boolean actual1 = stm1.isEmpty();
        Boolean actual2 = stm2.isEmpty();
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(true, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntStream.toList
     */
    @IsTest
    private static void toList() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone);
        IIntEnumerable stm1 = IntStream.of(clone);
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = (List<Integer>) stm1.toList();
        // Then
        Assert.areEqual(input, actual);
        Assert.areEqual(input, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntStream.toSet
     */
    @IsTest
    private static void toSet() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IntEnumerable stm = IntStream.of(clone);
        IIntEnumerable stm1 = IntStream.of(clone);
        // When
        Set<Integer> actual = stm.toSet();
        Set<Integer> actual1 = (Set<Integer>) stm1.toSet();
        // Then
        Set<Integer> expected = new Set<Integer>{ 5, 1, 3, -3, 7, 9, 0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see IntStream.run
     */
    @IsTest
    private static void run() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IntStream stm = (IntStream) IntStream.of(clone);
        IRunnable stm1 = (IRunnable) IntStream.of(clone);
        // When
        stm.run();
        stm1.run();
        // Then
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }


}
