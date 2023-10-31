/**
 * @see DoubleStream
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage, PMD.CognitiveComplexity')
private class DoubleStreamTest {

    /**
     * @see DoubleStream.of
     * @see DoubleStream.ofNullable
     * @see DoubleStream.empty
     * @see DoubleStream.iterator
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
        DoubleEnumerable stm = DoubleStream.of(input);
        DoubleEnumerable stm1 = DoubleStream.of(new Set<Double>(input));
        DoubleEnumerable stm2 = DoubleStream.ofNullable(input);
        DoubleEnumerable stm3 = DoubleStream.ofNullable(new Set<Double>(input));
        IDoubleEnumerable stm4 = DoubleStream.ofNullable(input1);
        IDoubleEnumerable stm5 = DoubleStream.ofNullable(input2);
        IDoubleEnumerable stm6 = DoubleStream.of(input.iterator());
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = stm1.toList();
        List<Double> actual2 = stm2.toList();
        List<Double> actual3 = stm3.toList();
        List<Double> actual4 = (List<Double>) stm4.toList();
        List<Double> actual5 = (List<Double>) stm5.toList();
        List<Double> actual6 = (List<Double>) stm6.toList();
        // Then
        List<Double> expected = new List<Double>(new Set<Double>(input));
        List<Double> expected1 = new List<Double>();
        Assert.areEqual(input, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(input, actual6);
        Assert.areEqual(doubles, input, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
        Assert.isTrue(((DoubleStream) stm2).isOperated);
        Assert.isTrue(((DoubleStream) stm3).isOperated);
        Assert.isTrue(((DoubleStream) stm4).isOperated);
        Assert.isTrue(((DoubleStream) stm5).isOperated);
        Assert.isTrue(((DoubleStream) stm6).isOperated);
    }
    
    /**
     * @see DoubleStream.generate
     */
    @IsTest
    private static void generate() {
        // Given
        Integer lim = 10;
        DoubleEnumerable stm = DoubleStream.generate(new AsTestCommons.RandomDoubleSupplier()).lim(lim);
        IDoubleEnumerable stm1 = DoubleStream.generate(new AsTestCommons.RandomDoubleSupplier()).lim(lim);
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = (List<Double>) stm1.toList();
        // Then
        Assert.areEqual(lim, actual.size());
        Assert.areEqual(lim, actual1.size());
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.iterate
     */
    @IsTest
    private static void iterate() {
        Double seed = 10;
        Double seed1 = 50;
        Integer lim = 10;
        Double inc = 5;
        DoubleEnumerable stm = DoubleStream.iterate(seed, new AsTestCommons.AddDoubleOp(inc)).lim(lim);
        IDoubleEnumerable stm1 = DoubleStream.iterate(seed1, new AsTestCommons.IsGreaterPredicate(0), new AsTestCommons.AddDoubleOp(-inc));
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = (List<Double>) stm1.toList();
        // Then
        Assert.areEqual(lim, actual.size());
        Assert.areEqual(seed, actual[0]);
        Assert.areEqual(55.0, actual[9]);
        Assert.areEqual(lim, actual1.size());
        Assert.areEqual(seed1, actual1[0]);
        Assert.areEqual(5.0, actual1[9]);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.concat
     */
    @IsTest
    private static void concat() {
        // Given
        List<Double> input = new List<Double>{ -5.1, 0, 1.0, 3, 150.5 };
        List<Double> input1 = new List<Double>{ 3.0, 0, 8.5 };
        List<Double> input2 = new List<Double>{ 9.1, 5.5, 7.3 };
        DoubleEnumerable stm = DoubleStream.concat(DoubleStream.of(input), DoubleStream.of(input1));
        IDoubleEnumerable stm1 = DoubleStream.concat(new List<IDoubleEnumerable>{ DoubleStream.of(input), DoubleStream.of(input1), DoubleStream.of(input2) });
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = (List<Double>) stm1.toList();
        // Then
        List<Double> expected = new List<Double>{ -5.1, 0, 1.0, 3, 150.5, 3.0, 0, 8.5 };
        List<Double> expected1 = new List<Double>{ -5.1, 0, 1.0, 3, 150.5, 3.0, 0, 8.5, 9.1, 5.5, 7.3 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.zip
     */
    @IsTest
    private static void zip() {
        // Given
        List<Double> input = new List<Double>{ -5.0, 0, 1.0 };
        List<Double> input1 = new List<Double>{ 3.0, 0, 8.5 };
        DoubleEnumerable stm = DoubleStream.zip(DoubleStream.of(input), DoubleStream.of(input1), new AsTestCommons.SumDoubleBiOperator());
        IDoubleEnumerable stm1 = DoubleStream.zip(DoubleStream.of(input), DoubleStream.of(input1), new AsTestCommons.SumDoubleBiOperator());
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = (List<Double>) stm1.toList();
        // Then
        List<Double> expected = new List<Double>{ -2.0, 0, 9.5 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.append
     * @see DoubleStream.prepend
     */
    @IsTest
    private static void appendPrepend() {
        // Given
        List<Double> input = new List<Double>{ -5.1, 0, 1.0 };
        List<Double> input1 = new List<Double>{ 3.0, 0, 8.5 };
        DoubleEnumerable stm = DoubleStream.of(input).append(DoubleStream.of(input1));
        IDoubleEnumerable stm1 = DoubleStream.of(input).prepend(DoubleStream.of(input1));
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = (List<Double>) stm1.toList();
        // Then
        List<Double> expected = new List<Double>{ -5.1, 0, 1.0, 3.0, 0, 8.5 };
        List<Double> expected1 = new List<Double>{ 3.0, 0, 8.5, -5.1, 0, 1.0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
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
        DoubleEnumerable stm = DoubleStream.of(input).union((Iterable<Double>) input1);
        DoubleEnumerable stm1 = DoubleStream.of(input).union(DoubleStream.of(input1));
        DoubleEnumerable stm2 = DoubleStream.of(input).intersect((Iterable<Double>) input1);
        DoubleEnumerable stm3 = DoubleStream.of(input).intersect(DoubleStream.of(input1));
        IDoubleEnumerable stm4 = DoubleStream.of(input).except((Iterable<Double>) input1);
        IDoubleEnumerable stm5 = DoubleStream.of(input).except(DoubleStream.of(input1));
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = stm1.toList();
        List<Double> actual2 = stm2.toList();
        List<Double> actual3 = stm3.toList();
        List<Double> actual4 = (List<Double>) stm4.toList();
        List<Double> actual5 = (List<Double>) stm5.toList();
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
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
        Assert.isTrue(((DoubleStream) stm2).isOperated);
        Assert.isTrue(((DoubleStream) stm3).isOperated);
        Assert.isTrue(((DoubleStream) stm4).isOperated);
        Assert.isTrue(((DoubleStream) stm5).isOperated);
    }

    /**
     * @see DoubleStream.filter
     */
    @IsTest
    private static void filter() {
        // Given
        List<Double> input = new List<Double>{ -5.5, 0, 1.0, 3, 8.99, null, -6, 4.01, 4.01 };
        DoubleEnumerable stm = DoubleStream.of(input).filter(new AsTestCommons.IsGreaterPredicate(0));
        IDoubleEnumerable stm1 = DoubleStream.of(input).filter(new AsTestCommons.IsGreaterPredicate(0));
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = (List<Double>) stm1.toList();
        // Then
        List<Double> expected = new List<Double>{ 1.0, 3, 8.99, 4.01, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.take
     */
    @IsTest
    private static void take() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, null, -6, 4.01, 4.01 };
        DoubleEnumerable stm = DoubleStream.of(input).take(new AsTestCommons.IsGreaterPredicate(0));
        IDoubleEnumerable stm1 = DoubleStream.of(input).take(new AsTestCommons.IsGreaterPredicate(0));
        // When
        List<Double> actual = stm.toList();
        Iterator<Double> it = stm1.iterator();
        // Then
        List<Double> expected = new List<Double>{ 5.5, 0.01, 1.0, 3 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input[0], it.next());
        try {
            it.next();
        } catch (Exception exc) {
            Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
        }
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.drop
     */
    @IsTest
    private static void drop() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, null, -6, 4.01, 4.01 };
        DoubleEnumerable stm = DoubleStream.of(input).drop(new AsTestCommons.IsGreaterPredicate(0));
        IDoubleEnumerable stm1 = DoubleStream.of(input).drop(new AsTestCommons.IsGreaterPredicate(0));
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = (List<Double>) stm1.toList();
        // Then
        List<Double> expected = new List<Double>{ -8.99, null, -6, 4.01, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleEnumerable.withoutNulls
     */
    @IsTest
    private static void withoutNulls() {
        // Given
        List<Double> input = new List<Double>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4, null };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone).withoutNulls();
        IDoubleEnumerable stm1 = DoubleStream.of(clone).withoutNulls();
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = (List<Double>) stm1.toList();
        // Then
        List<Double> expected = new List<Double>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.mapTo
     */
    @IsTest
    private static void mapTo() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone).mapTo(new AsTestCommons.MultiplyDoubleOp(2));
        IDoubleEnumerable stm1 = DoubleStream.of(clone).mapTo(new AsTestCommons.MultiplyDoubleOp(2));
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = (List<Double>) stm1.toList();
        // Then
        List<Double> expected = new List<Double>{ 11, 0.02, 2.0, 6.0, -17.98, -12.0, 8.02, 8.02 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.mapToInt
     */
    @IsTest
    private static void mapToInt() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IntEnumerable stm = DoubleStream.of(clone).mapToInt(new AsTestCommons.RoundToInt());
        IIntEnumerable stm1 = DoubleStream.of(clone).mapToInt(new AsTestCommons.RoundToInt());
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = (List<Integer>) stm1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 6, 0, 1, 3, -9, -6, 4, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.mapToLong
     */
    @IsTest
    private static void mapToLong() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        LongEnumerable stm = DoubleStream.of(clone).mapToLong(new AsTestCommons.RoundToLong());
        ILongEnumerable stm1 = DoubleStream.of(clone).mapToLong(new AsTestCommons.RoundToLong());
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = (List<Long>) stm1.toList();
        // Then
        List<Long> expected = new List<Long>{ 6L, 0L, 1L, 3L, -9L, -6L, 4L, 4L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.mapToSObject
     */
    @IsTest
    private static void mapToSObject() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        SObjectEnumerable stm = DoubleStream.of(clone).mapToSObject(new AsTestCommons.CreateAccountFromDoubles());
        ISObjectEnumerable stm1 = DoubleStream.of(clone).mapToSObject(new AsTestCommons.CreateAccountFromDoubles());
        // When
        List<Account> actual = stm.toList();
        List<Account> actual1 = (List<Account>) stm1.toList();
        // Then
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        for (Integer i = 0, size = input.size(); i < size; i++ ) {
            Assert.areEqual(Math.abs(clone[i]), actual[i].AnnualRevenue);
            Assert.areEqual(Math.abs(clone[i]), actual1[i].AnnualRevenue);
        }
        Assert.isTrue(((SObjectStream) stm).isOperated);
        Assert.isTrue(((SObjectStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.mapToObject
     */
    @IsTest
    private static void mapToObject() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        ObjectEnumerable stm = DoubleStream.of(clone).mapToObject(new AsTestCommons.DoubleToString());
        IObjectEnumerable stm1 = DoubleStream.of(clone).mapToObject(new AsTestCommons.DoubleToString());
        // When
        List<Object> actual = stm.toList();
        List<Object> actual1 = stm1.toList();
        // Then
        List<String> expected = new List<String>{ '5.5', '0.01', '1.0', '3.0', '-8.99', '-6.0', '4.01', '4.01' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.flatMapTo
     */
    @IsTest
    private static void flatMapTo() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone).flatMapTo(new AsTestCommons.DoubleDouble());
        IDoubleEnumerable stm1 = DoubleStream.of(clone).flatMapTo(new AsTestCommons.DoubleDouble());
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = (List<Double>) stm1.toList();
        // Then
        List<Double> expected = new List<Double>{ 11, 0.02, 2.0, 6, -17.98, -12, 8.02, 8.02 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.forEach
     */
    @IsTest
    private static void forEach() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone).forEach(new AsTestCommons.DoNothingConsumer());
        IDoubleEnumerable stm1 = DoubleStream.of(clone).forEach(new AsTestCommons.DoNothingConsumer());
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = (List<Double>) stm1.toList();
        // Then
        Assert.areEqual(clone, actual);
        Assert.areEqual(clone, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.distinct
     */
    @IsTest
    private static void distinct() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone).distinct();
        IDoubleEnumerable stm1 = DoubleStream.of(clone).distinct();
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = (List<Double>) stm1.toList();
        // Then
        List<Double> expected = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.sort
     */
    @IsTest
    private static void sort() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone).sort();
        IDoubleEnumerable stm1 = DoubleStream.of(clone).sort(SortOrder.DESCENDING);
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = (List<Double>) stm1.toList();
        // Then
        List<Double> expected = new List<Double>{ null, -8.99, -6, 0.01, 1.0, 3, 4.01, 4.01, 5.5 };
        List<Double> expected1 = new List<Double>{ 5.5, 4.01, 4.01, 3, 1.0, 0.01, -6, -8.99, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.lim
     */
    @IsTest
    private static void lim() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone).lim(25);
        DoubleEnumerable stm1 = DoubleStream.of(clone).lim(3);
        IDoubleEnumerable stm2 = DoubleStream.of(clone).lim(0);
        IDoubleEnumerable stm3 = DoubleStream.of(clone);
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = stm1.toList();
        List<Double> actual2 = (List<Double>) stm2.toList();
        Exception exc1;
        try {
            stm3.lim(-2);
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
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
        Assert.isTrue(((DoubleStream) stm2).isOperated);
        Assert.isTrue(((DoubleStream) stm3).isOperated);
    }

    /**
     * @see DoubleStream.skip
     */
    @IsTest
    private static void skip() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone).skip(5);
        DoubleEnumerable stm1 = DoubleStream.of(clone).skip(0);
        IDoubleEnumerable stm2 = DoubleStream.of(clone).skip(25);
        IDoubleEnumerable stm3 = DoubleStream.of(clone);
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = stm1.toList();
        List<Double> actual2 = (List<Double>) stm2.toList();
        Exception exc1;
        try {
            stm3.skip(-2);
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
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
        Assert.isTrue(((DoubleStream) stm2).isOperated);
        Assert.isTrue(((DoubleStream) stm3).isOperated);
    }

    /**
     * @see DoubleStream.reduce
     */
    @IsTest
    private static void reduce() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        List<Double> cloneWithNulls = input.clone();
        cloneWithNulls.add(null);
        DoubleEnumerable stm = DoubleStream.of(clone);
        DoubleEnumerable stm1 = DoubleStream.of(clone);
        IDoubleEnumerable stm2 = DoubleStream.of(cloneWithNulls);
        Double seed = 10;
        // When
        Double actual = stm.reduce(seed, BaseBiOperators.max());
        Double actual1 = (Double) stm1.reduce(BaseBiOperators.max()).get();
        Exception exc1;
        try {
            stm2.reduce(new AsTestCommons.SumDoubleBiOperator());
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
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
        Assert.isTrue(((DoubleStream) stm2).isOperated);
    }

    /**
     * @see DoubleStream.collect
     */
    @IsTest
    private static void collect() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone);
        IDoubleEnumerable stm1 = DoubleStream.of(clone);
        // When
        Set<Double> actual = (Set<Double>) stm.collect(Collector.of(Supplier.of(Set<Double>.class), new AsTestCommons.AddToDoubleSet()));
        Set<Double> actual1 = (Set<Double>) stm1.collect(Collector.of(Supplier.of(Set<Double>.class), new AsTestCommons.AddToDoubleSet()));
        // Then
        Set<Double> expected = new Set<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.find
     */
    @IsTest
    private static void find() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone);
        IDoubleEnumerable stm1 = DoubleStream.of(clone);
        // When
        Double actual = (Double) stm.find(new AsTestCommons.IsLessPredicate(0)).get();
        Double actual1 = (Double) stm1.find(new AsTestCommons.IsGreaterPredicate(50)).orElse(42.0);
        // Then
        Assert.areEqual(-8.99, actual);
        Assert.areEqual(42.0, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.every
     */
    @IsTest
    private static void every() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone);
        IDoubleEnumerable stm1 = DoubleStream.of(clone);
        // When
        Boolean actual = stm.every(new AsTestCommons.IsLessPredicate(42));
        Boolean actual1 = stm1.every(new AsTestCommons.IsGreaterPredicate(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.some
     */
    @IsTest
    private static void some() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone);
        IDoubleEnumerable stm1 = DoubleStream.of(clone);
        // When
        Boolean actual = stm.some(new AsTestCommons.IsLessPredicate(0));
        Boolean actual1 = stm1.some(BasePredicates.isEqual(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleEnumerable.none
     */
    @IsTest
    private static void none() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone);
        IDoubleEnumerable stm1 = DoubleStream.of(clone);
        // When
        Boolean actual = stm.none(new AsTestCommons.IsGreaterPredicate(42));
        Boolean actual1 = stm1.none(new AsTestCommons.IsLessPredicate(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleEnumerable.max
     */
    @IsTest
    private static void max() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone);
        IDoubleEnumerable stm1 = DoubleStream.of(clone);
        // When
        Double actual = (Double) stm.max().get();
        Double actual1 = (Double) stm1.max().get();
        // Then
        Assert.areEqual(5.5, actual);
        Assert.areEqual(5.5, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleEnumerable.min
     */
    @IsTest
    private static void min() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone);
        IDoubleEnumerable stm1 = DoubleStream.of(clone);
        // When
        Double actual = (Double) stm.min().get();
        Double actual1 = (Double) stm1.min().get();
        // Then
        Assert.areEqual(-8.99, actual);
        Assert.areEqual(-8.99, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleEnumerable.sum
     */
    @IsTest
    private static void sum() {
        // Given
        List<Double> input = new List<Double>{ 0.1, 0.2, 0.3, -0.4, 0.5, 0.6, 0.7, 0.8, 0.9 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone);
        IDoubleEnumerable stm1 = DoubleStream.of(clone);
        // When
        Double actual = stm.sum();
        Double actual1 = (Double) stm1.sum();
        // Then
        Assert.areEqual(3.7, actual);
        Assert.areEqual(3.7, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleEnumerable.avg
     */
    @IsTest
    private static void avg() {
        // Given
        List<Double> input = new List<Double>{ 0.1, 0.2, 0.3, -0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.3 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone);
        IDoubleEnumerable stm1 = DoubleStream.of(clone);
        // When
        Double actual = (Double) stm.avg().get();
        Double actual1 = (Double) stm1.avg().get();
        // Then
        Assert.areEqual(0.4, actual);
        Assert.areEqual(0.4, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.count
     */
    @IsTest
    private static void count() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone);
        DoubleEnumerable stm1 = DoubleStream.of(new List<Double>());
        IDoubleEnumerable stm2 = DoubleStream.empty();
        // When
        Double actual = stm.count();
        Double actual1 = stm1.count();
        Double actual2 = stm2.count();
        // Then
        Assert.areEqual(8, actual);
        Assert.areEqual(0, actual1);
        Assert.areEqual(0, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
        Assert.isTrue(((DoubleStream) stm2).isOperated);
    }

    /**
     * @see DoubleStream.isEmpty
     */
    @IsTest
    private static void isEmpty() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone);
        DoubleEnumerable stm1 = DoubleStream.of(new List<Double>());
        IDoubleEnumerable stm2 = DoubleStream.empty();
        // When
        Boolean actual = stm.isEmpty();
        Boolean actual1 = stm1.isEmpty();
        Boolean actual2 = stm2.isEmpty();
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(true, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
        Assert.isTrue(((DoubleStream) stm2).isOperated);
    }

    /**
     * @see DoubleStream.toList
     */
    @IsTest
    private static void toList() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone);
        IDoubleEnumerable stm1 = DoubleStream.of(clone);
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = (List<Double>) stm1.toList();
        // Then
        Assert.areEqual(input, actual);
        Assert.areEqual(input, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see DoubleStream.toSet
     */
    @IsTest
    private static void toSet() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        DoubleEnumerable stm = DoubleStream.of(clone);
        IDoubleEnumerable stm1 = DoubleStream.of(clone);
        // When
        Set<Double> actual = stm.toSet();
        Set<Double> actual1 = (Set<Double>) stm1.toSet();
        // Then
        Set<Double> expected = new Set<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

}
