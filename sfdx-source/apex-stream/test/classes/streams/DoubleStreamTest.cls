/**
 * @see DoubleStream
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DoubleStreamTest {

    /**
     * @see DoubleStream.of
     * @see DoubleStream.ofNullable
     * @see DoubleStream.empty
     * @see DoubleStream.iterator
     * @see DoubleStream.sequence
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
        IDoubleIterable stream = DoubleStream.of(input);
        IDoubleIterable stream1 = DoubleStream.of((Iterable<Double>) new Set<Double>(input));
        IDoubleIterable stream2 = DoubleStream.ofNullable(input);
        IDoubleIterable stream3 = DoubleStream.ofNullable((Iterable<Double>) new Set<Double>(input));
        IDoubleIterable stream4 = DoubleStream.ofNullable(input1);
        IDoubleIterable stream5 = DoubleStream.ofNullable((Iterable<Double>) input2);
        IDoubleIterable stream6 = DoubleStream.of(input.iterator());
        IDoubleIterable seq = ((DoubleStream) DoubleStream.of(input)).sequence();
        // When
        List<Double> actual = stream.toList();
        List<Double> actual1 = stream1.toList();
        List<Double> actual2 = stream2.toList();
        List<Double> actual3 = stream3.toList();
        List<Double> actual4 = stream4.toList();
        List<Double> actual5 = stream5.toList();
        List<Double> actual6 = stream6.toList();
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
        Assert.areEqual(false, seq.isEmpty());
        Assert.areEqual(doubles, input, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
        Assert.isTrue(((DoubleStream) stream1).isOperated);
        Assert.isTrue(((DoubleStream) stream2).isOperated);
        Assert.isTrue(((DoubleStream) stream3).isOperated);
        Assert.isTrue(((DoubleStream) stream4).isOperated);
        Assert.isTrue(((DoubleStream) stream5).isOperated);
        Assert.isTrue(((DoubleStream) stream6).isOperated);
    }

    /**
     * @see DoubleStream.generate
     */
    @IsTest
    private static void generate() {
        // Given
        Integer lim = 10;
        IDoubleIterable stream = DoubleStream.generate(DoubleSuppliers.random()).lim(lim);
        // When
        List<Double> actual = stream.toList();
        // Then
        Assert.areEqual(lim, actual.size());
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
        IDoubleIterable stream = DoubleStream.iterate(seed, new IterTestUtils.AddDoubleOp(inc)).lim(lim);
        IDoubleIterable stream1 = DoubleStream.iterate(seed1, DoublePredicates.isGreater(0), new IterTestUtils.AddDoubleOp(-inc));
        // When
        List<Double> actual = stream.toList();
        List<Double> actual1 = stream1.toList();
        // Then
        Assert.areEqual(lim, actual.size());
        Assert.areEqual(seed, actual[0]);
        Assert.areEqual(55.0, actual[9]);
        Assert.areEqual(lim, actual1.size());
        Assert.areEqual(seed1, actual1[0]);
        Assert.areEqual(5.0, actual1[9]);
        Assert.isTrue(((DoubleStream) stream).isOperated);
        Assert.isTrue(((DoubleStream) stream1).isOperated);
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
        IDoubleIterable stream = DoubleStream.concat(DoubleStream.of(input), DoubleStream.of(input1));
        IDoubleIterable stream1 = DoubleStream.concat(new List<IDoubleIterable>{ DoubleStream.of(input), DoubleStream.of(input1), DoubleStream.of(input2) });
        // When
        List<Double> actual = stream.toList();
        List<Double> actual1 = stream1.toList();
        // Then
        List<Double> expected = new List<Double>{ -5.1, 0, 1.0, 3, 150.5, 3.0, 0, 8.5 };
        List<Double> expected1 = new List<Double>{ -5.1, 0, 1.0, 3, 150.5, 3.0, 0, 8.5, 9.1, 5.5, 7.3 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((DoubleStream) stream).isOperated);
        Assert.isTrue(((DoubleStream) stream1).isOperated);
    }

    /**
    * @see DoubleStream.zip
    */
    @IsTest
    private static void zip() {
        // Given
        List<Double> input = new List<Double>{ -5.0, 0, 1.0 };
        List<Double> input1 = new List<Double>{ 3.0, 0, 8.5 };
        IDoubleIterable stream = DoubleStream.zip(DoubleStream.of(input), DoubleStream.of(input1), DoubleBinaryOperators.sum());
        // When
        List<Double> actual = stream.toList();
        // Then
        List<Double> expected = new List<Double>{ -2.0, 0, 9.5 };
        Assert.areEqual(expected, actual);
        Assert.isTrue(((DoubleStream) stream).isOperated);
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
        IDoubleIterable stream = DoubleStream.of(input).append(DoubleStream.of(input1));
        IDoubleIterable stream1 = DoubleStream.of(input).prepend(DoubleStream.of(input1));
        // When
        List<Double> actual = stream.toList();
        List<Double> actual1 = stream1.toList();
        // Then
        List<Double> expected = new List<Double>{ -5.1, 0, 1.0, 3.0, 0, 8.5 };
        List<Double> expected1 = new List<Double>{ 3.0, 0, 8.5, -5.1, 0, 1.0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((DoubleStream) stream).isOperated);
        Assert.isTrue(((DoubleStream) stream1).isOperated);
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
        IDoubleIterable stream = DoubleStream.of(input).union(input1);
        IDoubleIterable stream1 = DoubleStream.of(input).union(DoubleStream.of(input1));
        IDoubleIterable stream2 = DoubleStream.of(input).intersect(input1);
        IDoubleIterable stream3 = DoubleStream.of(input).intersect(DoubleStream.of(input1));
        IDoubleIterable stream4 = DoubleStream.of(input).except(input1);
        IDoubleIterable stream5 = DoubleStream.of(input).except(DoubleStream.of(input1));
        // When
        List<Double> actual = stream.toList();
        List<Double> actual1 = stream1.toList();
        List<Double> actual2 = stream2.toList();
        List<Double> actual3 = stream3.toList();
        List<Double> actual4 = stream4.toList();
        List<Double> actual5 = stream5.toList();
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
        Assert.isTrue(((DoubleStream) stream).isOperated);
        Assert.isTrue(((DoubleStream) stream1).isOperated);
        Assert.isTrue(((DoubleStream) stream2).isOperated);
        Assert.isTrue(((DoubleStream) stream3).isOperated);
        Assert.isTrue(((DoubleStream) stream4).isOperated);
        Assert.isTrue(((DoubleStream) stream5).isOperated);
    }

    /**
    * @see DoubleStream.toObjectIterable
    */
    @IsTest
    private static void toObjectIterable() {
        // Given
        List<Double> input = new List<Double>{ -5.0, 0, 1.45, 3.99, 9.001, null };
        IObjectIterable stream = DoubleStream.of(input).toObjectIterable();
        // When
        List<Object> actual = stream.toList();
        // Then
        Assert.areEqual(input.size(), actual.size());
        Assert.isTrue(((ObjectStream) stream).isOperated);
    }

    /**
    * @see DoubleStream.filter
    */
    @IsTest
    private static void filter() {
        // Given
        List<Double> input = new List<Double>{ -5.5, 0, 1.0, 3, 8.99, null, -6, 4.01, 4.01 };
        IDoubleIterable stream = DoubleStream.of(input).filter(DoublePredicates.isGreater(0));
        // When
        List<Double> actual = stream.toList();
        // Then
        List<Double> expected = new List<Double>{ 1.0, 3, 8.99, 4.01, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.isTrue(((DoubleStream) stream).isOperated);
    }

    /**
    * @see DoubleStream.take
    */
    @IsTest
    private static void take() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, null, -6, 4.01, 4.01 };
        IDoubleIterable stream = DoubleStream.of(input).take(DoublePredicates.isGreater(0));
        IDoubleIterable stream1 = DoubleStream.of(input).take(DoublePredicates.isGreater(1));
        // When
        List<Double> actual = stream.toList();
        Iterator<Double> iterator = stream1.iterator();
        // Then
        List<Double> expected = new List<Double>{ 5.5, 0.01, 1.0, 3 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input[0], iterator.next());
        try {
            iterator.next();
        } catch (Exception exc) {
            Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
        }
        Assert.isTrue(((DoubleStream) stream).isOperated);
        Assert.isTrue(((DoubleStream) stream1).isOperated);
    }

    /**
    * @see DoubleStream.drop
    */
    @IsTest
    private static void drop() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, null, -6, 4.01, 4.01 };
        IDoubleIterable stream = DoubleStream.of(input).drop(DoublePredicates.isGreater(0));
        // When
        List<Double> actual = stream.toList();
        // Then
        List<Double> expected = new List<Double>{ -8.99, null, -6, 4.01, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.isTrue(((DoubleStream) stream).isOperated);
    }

    /**
    * @see DoubleIterable.withoutNulls
    */
    @IsTest
    private static void withoutNulls() {
        // Given
        List<Double> input = new List<Double>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4, null };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone).withoutNulls();
        // When
        List<Double> actual = stream.toList();
        // Then
        List<Double> expected = new List<Double>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
    }

    /**
    * @see DoubleStream.mapTo
    */
    @IsTest
    private static void mapTo() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone).mapTo(new IterTestUtils.MultiplyDoubleOp(2));
        // When
        List<Double> actual = stream.toList();
        // Then
        List<Double> expected = new List<Double>{ 11, 0.02, 2.0, 6.0, -17.98, -12.0, 8.02, 8.02 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
    }

    /**
    * @see DoubleStream.mapToLong
    */
    @IsTest
    private static void mapToLong() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        ILongIterable stream = DoubleStream.of(clone).mapToLong(DoubleToLongFunctions.roundToLong());
        // When
        List<Long> actual = stream.toList();
        // Then
        List<Long> expected = new List<Long>{ 6L, 0L, 1L, 3L, -9L, -6L, 4L, 4L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((LongStream) stream).isOperated);
    }

    /**
    * @see DoubleStream.mapToInt
    */
    @IsTest
    private static void mapToInt() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IIntIterable stream = DoubleStream.of(clone).mapToInt(DoubleToIntFunctions.round());
        // When
        List<Integer> actual = stream.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 6, 0, 1, 3, -9, -6, 4, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
    }

    /**
     * @see DoubleStream.mapToSObject
     */
    @IsTest
    private static void mapToSObject() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        ISObjectIterable stream = DoubleStream.of(clone).mapToSObject(new IterTestUtils.CreateAccountFromDoubles());
        // When
        List<Account> actual = stream.toList();
        // Then
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        for (Integer i = 0, size = input.size(); i < size; i++ ) {
            Assert.areEqual(Math.abs(clone[i]), actual[i].AnnualRevenue);
        }
        Assert.isTrue(((SObjectStream) stream).isOperated);
    }

    /**
     * @see DoubleStream.mapToObject
     */
    @IsTest
    private static void mapToObject() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IObjectIterable stream = DoubleStream.of(clone).mapToObject(new IterTestUtils.DoubleToString());
        // When
        List<Object> actual = stream.toList();
        // Then
        List<String> expected = new List<String>{ '5.5', '0.01', '1.0', '3.0', '-8.99', '-6.0', '4.01', '4.01' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((ObjectStream) stream).isOperated);
    }

    /**
     * @see DoubleStream.forEach
     */
    @IsTest
    private static void forEach() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone).forEach(new IterTestUtils.DoNothingDoubleConsumer());
        // When
        List<Double> actual = stream.toList();
        // Then
        Assert.areEqual(clone, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
    }

    /**
     * @see DoubleStream.distinct
     */
    @IsTest
    private static void distinct() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone).distinct();
        // When
        List<Double> actual = stream.toList();
        // Then
        List<Double> expected = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
    }

    /**
     * @see DoubleStream.sort
     */
    @IsTest
    private static void sort() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone).sort();
        // When
        List<Double> actual = stream.toList();
        // Then
        List<Double> expected = new List<Double>{ null, -8.99, -6, 0.01, 1.0, 3, 4.01, 4.01, 5.5 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
    }

    /**
     * @see DoubleStream.lim
     */
    @IsTest
    private static void lim() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone).lim(25);
        IDoubleIterable stream1 = DoubleStream.of(clone).lim(3);
        IDoubleIterable stream2 = DoubleStream.of(clone).lim(0);
        IDoubleIterable stream3 = DoubleStream.of(clone);
        // When
        List<Double> actual = stream.toList();
        List<Double> actual1 = stream1.toList();
        List<Double> actual2 = stream2.toList();
        Exception exc1;
        try {
            stream3.lim(-2);
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
        Assert.isTrue(((DoubleStream) stream).isOperated);
        Assert.isTrue(((DoubleStream) stream1).isOperated);
        Assert.isTrue(((DoubleStream) stream2).isOperated);
        Assert.isTrue(!((DoubleStream) stream3).isOperated);
    }

    /**
     * @see DoubleStream.skip
     */
    @IsTest
    private static void skip() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone).skip(5);
        IDoubleIterable stream1 = DoubleStream.of(clone).skip(0);
        IDoubleIterable stream2 = DoubleStream.of(clone).skip(25);
        IDoubleIterable stream3 = DoubleStream.of(clone);
        // When
        List<Double> actual = stream.toList();
        List<Double> actual1 = stream1.toList();
        List<Double> actual2 = stream2.toList();
        Exception exc1;
        try {
            stream3.skip(-2);
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
        Assert.isTrue(((DoubleStream) stream).isOperated);
        Assert.isTrue(((DoubleStream) stream1).isOperated);
        Assert.isTrue(((DoubleStream) stream2).isOperated);
        Assert.isTrue(!((DoubleStream) stream3).isOperated);
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
        IDoubleIterable stream = DoubleStream.of(clone);
        IDoubleIterable stream1 = DoubleStream.of(clone);
        IDoubleIterable stream2 = DoubleStream.of(cloneWithNulls);
        Double seed = 10;
        // When
        Double actual = stream.reduce(seed, DoubleBinaryOperators.max());
        Double actual1 = stream1.reduce(DoubleBinaryOperators.max()).get();
        Exception exc1;
        try {
            stream2.reduce(DoubleBinaryOperators.sum());
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
        Assert.isTrue(((DoubleStream) stream).isOperated);
        Assert.isTrue(((DoubleStream) stream1).isOperated);
        Assert.isTrue(((DoubleStream) stream2).isOperated);
    }

    /**
     * @see DoubleStream.collect
     */
    @IsTest
    private static void collect() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone);
        // When
        Set<Double> actual = (Set<Double>) stream.collect(Supplier.of(Set<Double>.class), ObjectDoubleConsumer.compose(new IterTestUtils.AddToDoubleSet()));
        // Then
        Set<Double> expected = new Set<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
    }

    /**
     * @see DoubleStream.find
     */
    @IsTest
    private static void find() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone);
        IDoubleIterable stream1 = DoubleStream.of(clone);
        // When
        Double actual = stream.find(DoublePredicates.isLess(0)).get();
        Double actual1 = stream1.find(DoublePredicates.isGreater(50)).orElse((Double) 42.0);
        // Then
        Assert.areEqual(-8.99, actual);
        Assert.areEqual(42.0, actual1);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
        Assert.isTrue(((DoubleStream) stream1).isOperated);
    }

    /**
     * @see DoubleStream.every
     */
    @IsTest
    private static void every() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone);
        IDoubleIterable stream1 = DoubleStream.of(clone);
        // When
        Boolean actual = stream.every(DoublePredicates.isLess(42));
        Boolean actual1 = stream1.every(DoublePredicates.isGreater(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
        Assert.isTrue(((DoubleStream) stream1).isOperated);
    }

    /**
     * @see DoubleStream.some
     */
    @IsTest
    private static void some() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone);
        IDoubleIterable stream1 = DoubleStream.of(clone);
        // When
        Boolean actual = stream.some(DoublePredicates.isLess(0));
        Boolean actual1 = stream1.some(DoublePredicates.isEqual(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
        Assert.isTrue(((DoubleStream) stream1).isOperated);
    }

    /**
     * @see DoubleIterable.none
     */
    @IsTest
    private static void none() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone);
        IDoubleIterable stream1 = DoubleStream.of(clone);
        // When
        Boolean actual = stream.none(DoublePredicates.isGreater(42));
        Boolean actual1 = stream1.none(DoublePredicates.isLess(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
        Assert.isTrue(((DoubleStream) stream1).isOperated);
    }

    /**
     * @see DoubleIterable.max
     */
    @IsTest
    private static void max() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone);
        // When
        Double actual = stream.max().get();
        // Then
        Assert.areEqual(5.5, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
    }

    /**
     * @see DoubleIterable.min
     */
    @IsTest
    private static void min() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone);
        // When
        Double actual = stream.min().get();
        // Then
        Assert.areEqual(-8.99, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
    }

    /**
     * @see DoubleIterable.sum
     */
    @IsTest
    private static void sum() {
        // Given
        List<Double> input = new List<Double>{ 0.1, 0.2, 0.3, -0.4, 0.5, 0.6, 0.7, 0.8, 0.9 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone);
        // When
        Double actual = stream.sum();
        // Then
        Assert.areEqual(3.7, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
    }

    /**
     * @see DoubleIterable.avg
     */
    @IsTest
    private static void avg() {
        // Given
        List<Double> input = new List<Double>{ 0.1, 0.2, 0.3, -0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.3 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone);
        // When
        Double actual = stream.avg().get();
        // Then
        Assert.areEqual(0.4, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
    }

    /**
     * @see DoubleStream.count
     */
    @IsTest
    private static void count() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone);
        IDoubleIterable stream1 = DoubleStream.of(new List<Double>());
        IDoubleIterable stream2 = DoubleStream.empty();
        // When
        Double actual = stream.count();
        Double actual1 = stream1.count();
        Double actual2 = stream2.count();
        // Then
        Assert.areEqual(8, actual);
        Assert.areEqual(0, actual1);
        Assert.areEqual(0, actual2);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
        Assert.isTrue(((DoubleStream) stream1).isOperated);
        Assert.isTrue(((DoubleStream) stream2).isOperated);
    }

    /**
     * @see DoubleStream.isEmpty
     */
    @IsTest
    private static void isEmpty() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone);
        IDoubleIterable stream1 = DoubleStream.of(new List<Double>());
        IDoubleIterable stream2 = DoubleStream.empty();
        // When
        Boolean actual = stream.isEmpty();
        Boolean actual1 = stream1.isEmpty();
        Boolean actual2 = stream2.isEmpty();
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(true, actual2);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
        Assert.isTrue(((DoubleStream) stream1).isOperated);
        Assert.isTrue(((DoubleStream) stream2).isOperated);
    }

    /**
     * @see DoubleStream.toList
     */
    @IsTest
    private static void toList() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone);
        // When
        List<Double> actual = stream.toList();
        // Then
        Assert.areEqual(input, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
    }

    /**
     * @see DoubleStream.toSet
     */
    @IsTest
    private static void toSet() {
        // Given
        List<Double> input = new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 };
        List<Double> clone = input.clone();
        IDoubleIterable stream = DoubleStream.of(clone);
        // When
        Set<Double> actual = stream.toSet();
        // Then
        Set<Double> expected = new Set<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
    }

}
