/**
 * @see IntStream
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class IntStreamTest {

    private static final List<Integer> INTS = IterTestUtils.generateInts();

    /**
     * @see IntStream.of
     * @see IntStream.ofNullable
     * @see IntStream.empty
     * @see IntStream.iterator
     * @see IntStream.sequence
     */
    @IsTest
    private static void of() {
        // Given
        INTS.add(0, null);
        INTS.add(null);
        List<Integer> input = INTS.clone();
        List<Integer> input1;
        Set<Integer> input2;
        IIntIterable stream = IntStream.of(input);
        IIntIterable stream1 = IntStream.of((Iterable<Integer>) new Set<Integer>(input));
        IIntIterable stream2 = IntStream.ofNullable(input);
        IIntIterable stream3 = IntStream.ofNullable((Iterable<Integer>) new Set<Integer>(input));
        IIntIterable stream4 = IntStream.ofNullable(input1);
        IIntIterable stream5 = IntStream.ofNullable((Iterable<Integer>) input2);
        IIntIterable stream6 = IntStream.of(input.iterator());
        IIntIterable seq = ((IntStream) IntStream.of(input)).sequence();
        // When
        List<Integer> actual = stream.toList();
        List<Integer> actual1 = stream1.toList();
        List<Integer> actual2 = stream2.toList();
        List<Integer> actual3 = stream3.toList();
        List<Integer> actual4 = stream4.toList();
        List<Integer> actual5 = stream5.toList();
        List<Integer> actual6 = stream6.toList();
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
        Assert.areEqual(false, seq.isEmpty());
        Assert.areEqual(INTS, input, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
        Assert.isTrue(((IntStream) stream2).isOperated);
        Assert.isTrue(((IntStream) stream3).isOperated);
        Assert.isTrue(((IntStream) stream4).isOperated);
        Assert.isTrue(((IntStream) stream5).isOperated);
        Assert.isTrue(((IntStream) stream6).isOperated);
    }

    /**
     * @see IntStream.range
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
        IIntIterable stream = IntStream.range(fromI, toI);
        IIntIterable stream1 = IntStream.range(fromI1, toI1);
        IIntIterable stream2 = IntStream.range(fromI2, toI1);
        IIntIterable stream3 = IntStream.range(fromI2, toI2);
        // When
        List<Integer> actual = stream.toList();
        List<Integer> actual1 = stream1.toList();
        List<Integer> actual2 = stream2.toList();
        List<Integer> actual3 = stream3.toList();
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
        Assert.isTrue(((IntStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
        Assert.isTrue(((IntStream) stream2).isOperated);
        Assert.isTrue(((IntStream) stream3).isOperated);
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
        IIntIterable stream = IntStream.generate(IntSuppliers.fibonacci()).lim(lim);
        IIntIterable stream1 = IntStream.generate(IntSuppliers.increment(fromInt, 10)).lim(step);
        // When
        List<Integer> actual = stream.toList();
        List<Integer> actual1 = stream1.toList();
        // Then
        Assert.areEqual(lim, actual.size());
        Assert.areEqual(1, actual[0]);
        Assert.areEqual(55, actual[9]);
        Assert.areEqual(lim, actual1.size());
        Assert.areEqual(fromInt, actual1[0]);
        Assert.areEqual(fromInt + (lim - 1) * step, actual1[9]);
        Assert.isTrue(((IntStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
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
        IIntIterable stream = IntStream.iterate(seed, new IterTestUtils.AddIntOp(1)).lim(lim);
        IIntIterable stream1 = IntStream.iterate(seed1, new IterTestUtils.AddIntOp(i)).lim(lim);
        IIntIterable stream2 = IntStream.iterate(seed2, IntPredicates.isGreater(0), new IterTestUtils.AddIntOp(-i));
        // When
        List<Integer> actual = stream.toList();
        List<Integer> actual1 = stream1.toList();
        List<Integer> actual2 = stream2.toList();
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
        Assert.isTrue(((IntStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
        Assert.isTrue(((IntStream) stream2).isOperated);
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
        IIntIterable stream = IntStream.concat(IntStream.of(input1), IntStream.of(input2));
        IIntIterable stream1 = IntStream.concat(new List<IIntIterable>{ IntStream.of(input1), IntStream.of(input2), IntStream.of(input3) });
        // When
        List<Integer> actual = stream.toList();
        List<Integer> actual1 = stream1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ -5, 0, 1, 3, 150, 3, 0, 8 };
        List<Integer> expected1 = new List<Integer>{ -5, 0, 1, 3, 150, 3, 0, 8, 9, 5, 7 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((IntStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
    }

    /**
     * @see IntStream.zip
     */
    @IsTest
    private static void zip() {
        // Given
        List<Integer> input = new List<Integer>{ -5, 0, 1 };
        List<Integer> input1 = new List<Integer>{ 3, 0, 8 };
        IIntIterable stream = IntStream.zip(IntStream.of(input), IntStream.of(input1), IntBinaryOperators.sum());
        // When
        List<Integer> actual = stream.toList();
        // Then
        List<Integer> expected = new List<Integer>{ -2, 0, 9 };
        Assert.areEqual(expected, actual);
        Assert.isTrue(((IntStream) stream).isOperated);
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
        IIntIterable stream = IntStream.of(input).append(IntStream.of(input1));
        IIntIterable stream1 = IntStream.of(input).prepend(IntStream.of(input1));
        // When
        List<Integer> actual = stream.toList();
        List<Integer> actual1 = stream1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ -5, 0, 1, 3, 0, 8 };
        List<Integer> expected1 = new List<Integer>{ 3, 0, 8, -5, 0, 1 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((IntStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
    }

    /**
     * @see IntIterable.union
     * @see IntIterable.intersect
     * @see IntIterable.except
     */
    @IsTest
    private static void setOperations() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
        List<Integer> input1 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
        IIntIterable stream = IntStream.of(input).union(input1);
        IIntIterable stream1 = IntStream.of(input).union(IntStream.of(input1));
        IIntIterable stream2 = IntStream.of(input).intersect(input1);
        IIntIterable stream3 = IntStream.of(input).intersect(IntStream.of(input1));
        IIntIterable stream4 = IntStream.of(input).except(input1);
        IIntIterable stream5 = IntStream.of(input).except(IntStream.of(input1));
        // When
        List<Integer> actual = stream.toList();
        List<Integer> actual1 = stream1.toList();
        List<Integer> actual2 = stream2.toList();
        List<Integer> actual3 = stream3.toList();
        List<Integer> actual4 = stream4.toList();
        List<Integer> actual5 = stream5.toList();
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
        Assert.isTrue(((IntStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
        Assert.isTrue(((IntStream) stream2).isOperated);
        Assert.isTrue(((IntStream) stream3).isOperated);
        Assert.isTrue(((IntStream) stream4).isOperated);
        Assert.isTrue(((IntStream) stream5).isOperated);
    }

    /**
     * @see IntStream.toObjectIterable
     * @see IntIterable.toLongIterable
     * @see IntIterable.toDoubleIterable
     */
    @IsTest
    private static void convert() {
        // Given
        List<Integer> input = new List<Integer>{ -5, 0, 1, 3, 8, null };
        IObjectIterable stream = IntStream.of(input).toObjectIterable();
        ILongIterable stream1 = IntStream.of(input).toLongIterable();
        IDoubleIterable stream2 = IntStream.of(input).toDoubleIterable();
        // When
        List<Object> actual = stream.toList();
        List<Long> actual1 = stream1.toList();
        List<Double> actual2 = stream2.toList();
        // Then
        List<Object> expected = new List<Object>{ -5, 0, 1, 3, 8, null };
        List<Long> expected1 = new List<Long>{ -5, 0, 1, 3, 8, null };
        List<Double> expected2 = new List<Double>{ -5, 0, 1, 3, 8, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected2, actual2);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
        Assert.isTrue(((DoubleStream) stream2).isOperated);
    }

    /**
     * @see IntStream.filter
     */
    @IsTest
    private static void filter() {
        // Given
        List<Integer> input = new List<Integer>{ -5, 0, 1, 3, 8, null, -6, 4, 4 };
        IIntIterable stream = IntStream.of(input).filter(IntPredicates.isGreater(0));
        // When
        List<Integer> actual = stream.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 1, 3, 8, 4, 4 };
        Assert.areEqual(expected, actual);
        Assert.isTrue(((IntStream) stream).isOperated);
    }

    /**
     * @see IntStream.take
     */
    @IsTest
    private static void take() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, null, -6, 4, 4 };
        IIntIterable stream = IntStream.of(input).take(IntPredicates.isGreater(0));
        IIntIterable stream1 = IntStream.of(input).take(IntPredicates.isGreater(2));
        // When
        List<Integer> actual = stream.toList();
        Iterator<Integer> iterator = stream1.iterator();
        // Then
        List<Integer> expected = new List<Integer>{ 5, 1, 3, 8 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input[0], iterator.next());
        try {
            iterator.next();
        } catch (Exception exc) {
            Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
        }
        Assert.isTrue(((IntStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
    }

    /**
     * @see IntStream.drop
     */
    @IsTest
    private static void drop() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, null, -6, 4, 4 };
        IIntIterable stream = IntStream.of(input).drop(IntPredicates.isGreater(0));
        // When
        List<Integer> actual = stream.toList();
        // Then
        List<Integer> expected = new List<Integer>{ -3, null, -6, 4, 4 };
        Assert.areEqual(expected, actual);
        Assert.isTrue(((IntStream) stream).isOperated);
    }

    /**
     * @see IntIterable.withoutNulls
     */
    @IsTest
    private static void withoutNulls() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4, null };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone).withoutNulls();
        // When
        List<Integer> actual = stream.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
    }

    /**
     * @see IntStream.mapTo
     */
    @IsTest
    private static void mapTo() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone).mapTo(new IterTestUtils.MultiplyIntOp(2));
        // When
        List<Integer> actual = stream.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 10, 2, 6, 16, -6, 8, -12, 0, 8 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
    }

    /**
     * @see IntStream.mapToLong
     */
    @IsTest
    private static void mapToLong() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        ILongIterable stream = IntStream.of(clone).mapToLong(IntToLongFunctions.asLong());
        // When
        List<Long> actual = stream.toList();
        // Then
        List<Long> expected = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((LongStream) stream).isOperated);
    }

    /**
     * @see IntStream.mapToDouble
     */
    @IsTest
    private static void mapToDouble() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IDoubleIterable stream = IntStream.of(clone).mapToDouble(IntToDoubleFunctions.valueOf());
        // When
        List<Double> actual = stream.toList();
        // Then
        List<Double> expected = new List<Double>{ 5.0, 1.0, 3.0, 8.0, -3.0, 4.0, -6.0, 0.0, 4.0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((DoubleStream) stream).isOperated);
    }

    /**
     * @see IntStream.mapToSObject
     */
    @IsTest
    private static void mapToSObject() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        ISObjectIterable stream = IntStream.of(clone).mapToSObject(new IterTestUtils.CreateAccountFromInts());
        // When
        List<Account> actual = stream.toList();
        // Then
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        for (Integer i = 0, size = input.size(); i < size; i++ ) {
            Assert.areEqual(Math.abs(clone[i]), actual[i].NumberOfEmployees);
        }
        Assert.isTrue(((SObjectStream) stream).isOperated);
    }

    /**
     * @see IntStream.mapToObject
     */
    @IsTest
    private static void mapToObject() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IObjectIterable stream = IntStream.of(clone).mapToObject(new IterTestUtils.IntToString());
        // When
        List<String> actual = (List<String>) stream.toList(List<String>.class);
        // Then
        List<String> expected = new List<String>{ '5', '1', '3', '8', '-3', '4', '-6', '0', '4' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((ObjectStream) stream).isOperated);
    }

    /**
     * @see IntStream.forEach
     */
    @IsTest
    private static void forEach() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone).forEach(new IterTestUtils.DoNothingIntConsumer());
        // When
        List<Integer> actual = stream.toList();
        // Then
        Assert.areEqual(clone, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
    }

    /**
     * @see IntStream.distinct
     */
    @IsTest
    private static void distinct() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone).distinct();
        // When
        List<Integer> actual = stream.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
    }

    /**
     * @see IntStream.sort
     */
    @IsTest
    private static void sort() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone).sort();
        // When
        List<Integer> actual = stream.toList();
        // Then
        List<Integer> expected = new List<Integer>{ null, -6, -3, 0, 1, 3, 4, 4, 5, 8 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
    }

    /**
     * @see IntStream.lim
     */
    @IsTest
    private static void lim() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone).lim(25);
        IIntIterable stream1 = IntStream.of(clone).lim(3);
        IIntIterable stream2 = IntStream.of(clone).lim(0);
        IIntIterable stream3 = IntStream.of(clone);
        // When
        List<Integer> actual = stream.toList();
        List<Integer> actual1 = stream1.toList();
        List<Integer> actual2 = stream2.toList();
        Exception exc1;
        try {
            stream3.lim(-2);
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
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
        Assert.isTrue(((IntStream) stream2).isOperated);
        Assert.isTrue(!((IntStream) stream3).isOperated);
    }

    /**
     * @see IntStream.skip
     */
    @IsTest
    private static void skip() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone).skip(5);
        IIntIterable stream1 = IntStream.of(clone).skip(0);
        IIntIterable stream2 = IntStream.of(clone).skip(25);
        IIntIterable stream3 = IntStream.of(clone);
        // When
        List<Integer> actual = stream.toList();
        List<Integer> actual1 = stream1.toList();
        List<Integer> actual2 = stream2.toList();
        Exception exc1;
        try {
            stream3.skip(-2);
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
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
        Assert.isTrue(((IntStream) stream2).isOperated);
        Assert.isTrue(!((IntStream) stream3).isOperated);
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
        IIntIterable stream = IntStream.of(clone);
        IIntIterable stream1 = IntStream.of(clone);
        IIntIterable stream2 = IntStream.of(cloneWithNulls);
        Integer seed = 10;
        // When
        Integer actual = stream.reduce(seed, IntBinaryOperators.sum());
        Integer actual1 = stream1.reduce(IntBinaryOperators.sum()).get();
        Exception exc1;
        try {
            stream2.reduce(IntBinaryOperators.sum());
        } catch (Exception exc) {
            exc1 = exc;
        }
        // Then
        Integer expected = 26;
        Integer expected1 = 16;
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(10, seed, Label.InputMutatedErrorMessage);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
        Assert.isTrue(((IntStream) stream2).isOperated);
    }

    /**
     * @see IntStream.collect
     */
    @IsTest
    private static void collect() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone);
        // When
        Set<Integer> actual = (Set<Integer>) stream.collect(Supplier.of(Set<Integer>.class), ObjectIntConsumer.compose(new IterTestUtils.AddToIntSet()));
        // Then
        Set<Integer> expected = new Set<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
    }

    /**
     * @see IntStream.find
     */
    @IsTest
    private static void find() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone);
        IIntIterable stream1 = IntStream.of(clone);
        // When
        Integer actual = stream.find(IntPredicates.isLess(0)).get();
        Integer actual1 = stream1.find(IntPredicates.isGreater(50)).orElse(42);
        // Then
        Assert.areEqual(-3, actual);
        Assert.areEqual(42, actual1);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
    }

    /**
     * @see IntStream.every
     */
    @IsTest
    private static void every() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone);
        IIntIterable stream1 = IntStream.of(clone);
        // When
        Boolean actual = stream.every(IntPredicates.isEven().negate());
        Boolean actual1 = stream1.every(IntPredicates.isPrime());
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
    }

    /**
     * @see IntStream.some
     */
    @IsTest
    private static void some() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone);
        IIntIterable stream1 = IntStream.of(clone);
        // When
        Boolean actual = stream.some(IntPredicates.isLess(0));
        Boolean actual1 = stream1.some(IntPredicates.isEqual(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
    }

    /**
     * @see IntIterable.none
     */
    @IsTest
    private static void none() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone);
        IIntIterable stream1 = IntStream.of(clone);
        // When
        Boolean actual = stream.none(IntPredicates.isEven());
        Boolean actual1 = stream1.none(IntPredicates.isLess(0));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
    }

    /**
     * @see IntIterable.max
     */
    @IsTest
    private static void max() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone);
        // When
        Integer actual = stream.max().get();
        // Then
        Assert.areEqual(9, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
    }

    /**
     * @see IntIterable.min
     */
    @IsTest
    private static void min() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone);
        // When
        Integer actual = stream.min().get();
        // Then
        Assert.areEqual(-3, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
    }

    /**
     * @see IntStream.sum
     */
    @IsTest
    private static void sum() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone);
        // When
        Integer actual = stream.sum();
        // Then
        Assert.areEqual(22, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
    }

    /**
     * @see IntStream.avg
     */
    @IsTest
    private static void avg() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone);
        // When
        Double actual = stream.avg().get();
        // Then
        Assert.areEqual(3.625, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
    }

    /**
     * @see IntStream.count
     */
    @IsTest
    private static void count() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone);
        IIntIterable stream1 = IntStream.of(new List<Integer>());
        IIntIterable stream2 = IntStream.empty();
        // When
        Integer actual = stream.count();
        Integer actual1 = stream1.count();
        Integer actual2 = stream2.count();
        // Then
        Assert.areEqual(8, actual);
        Assert.areEqual(0, actual1);
        Assert.areEqual(0, actual2);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
        Assert.isTrue(((IntStream) stream2).isOperated);
    }

    /**
     * @see IntStream.isEmpty
     */
    @IsTest
    private static void isEmpty() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone);
        IIntIterable stream1 = IntStream.of(new List<Integer>());
        IIntIterable stream2 = IntStream.empty();
        // When
        Boolean actual = stream.isEmpty();
        Boolean actual1 = stream1.isEmpty();
        Boolean actual2 = stream2.isEmpty();
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(true, actual2);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
        Assert.isTrue(((IntStream) stream2).isOperated);
    }

    /**
     * @see IntStream.toList
     */
    @IsTest
    private static void toList() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone);
        // When
        List<Integer> actual = stream.toList();
        // Then
        Assert.areEqual(input, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
    }

    /**
     * @see IntStream.toSet
     */
    @IsTest
    private static void toSet() {
        // Given
        List<Integer> input = new List<Integer>{ 5, 1, 3, -3, 7, 9, 0, 7 };
        List<Integer> clone = input.clone();
        IIntIterable stream = IntStream.of(clone);
        // When
        Set<Integer> actual = stream.toSet();
        // Then
        Set<Integer> expected = new Set<Integer>{ 5, 1, 3, -3, 7, 9, 0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.InputMutatedErrorMessage);
        Assert.isTrue(((IntStream) stream).isOperated);
    }

}
