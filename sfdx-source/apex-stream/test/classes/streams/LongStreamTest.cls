/**
 * @see LongStream
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
public class LongStreamTest {

    private static final List<Long> LONGS = IterTestUtils.generateLongs();

    /**
     * @see LongStream.of
     * @see LongStream.ofNullable
     * @see LongStream.empty
     * @see LongStream.iterator
     * @see LongStream.sequence
     */
    @IsTest
    private static void of() {
        // Given
        LONGS.add(0, null);
        LONGS.add(null);
        List<Long> input = LONGS.clone();
        List<Long> input1;
        Set<Long> input2;
        ILongIterable stream = LongStream.of(input);
        ILongIterable stream1 = LongStream.of((Iterable<Long>) new Set<Long>(input));
        ILongIterable stream2 = LongStream.ofNullable(input);
        ILongIterable stream3 = LongStream.ofNullable((Iterable<Long>) new Set<Long>(input));
        ILongIterable stream4 = LongStream.ofNullable(input1);
        ILongIterable stream5 = LongStream.ofNullable((Iterable<Long>) input2);
        ILongIterable stream6 = LongStream.of(input.iterator());
        ILongIterable seq = ((LongStream) LongStream.of(input)).sequence();
        // When
        List<Long> actual = stream.toList();
        List<Long> actual1 = stream1.toList();
        List<Long> actual2 = stream2.toList();
        List<Long> actual3 = stream3.toList();
        List<Long> actual4 = stream4.toList();
        List<Long> actual5 = stream5.toList();
        List<Long> actual6 = stream6.toList();
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
        Assert.areEqual(false, seq.isEmpty());
        Assert.areEqual(LONGS, input, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
        Assert.isTrue(((LongStream) stream2).isOperated);
        Assert.isTrue(((LongStream) stream3).isOperated);
        Assert.isTrue(((LongStream) stream4).isOperated);
        Assert.isTrue(((LongStream) stream5).isOperated);
        Assert.isTrue(((LongStream) stream6).isOperated);
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
        ILongIterable stream = LongStream.range(fromI, toI);
        ILongIterable stream1 = LongStream.range(fromI1, toI1);
        ILongIterable stream2 = LongStream.range(fromI2, toI1);
        ILongIterable stream3 = LongStream.range(fromI2, toI2);
        // When
        List<Long> actual = stream.toList();
        List<Long> actual1 = stream1.toList();
        List<Long> actual2 = stream2.toList();
        List<Long> actual3 = stream3.toList();
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
        Assert.isTrue(((LongStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
        Assert.isTrue(((LongStream) stream2).isOperated);
        Assert.isTrue(((LongStream) stream3).isOperated);
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
        ILongIterable stream = LongStream.generate(LongSuppliers.fibonacci()).lim(lim);
        ILongIterable stream1 = LongStream.generate(LongSuppliers.increment(fromLong, 10)).lim(step);
        // When
        List<Long> actual = stream.toList();
        List<Long> actual1 = stream1.toList();
        // Then
        Assert.areEqual(lim, actual.size());
        Assert.areEqual(1L, actual[0]);
        Assert.areEqual(55L, actual[9]);
        Assert.areEqual(lim, actual1.size());
        Assert.areEqual(fromLong, actual1[0]);
        Assert.areEqual(fromLong + (lim - 1) * step, actual1[9]);
        Assert.isTrue(((LongStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
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
        ILongIterable stream = LongStream.iterate(seed, new IterTestUtils.AddLongOp(1)).lim(lim);
        ILongIterable stream1 = LongStream.iterate(seed1, new IterTestUtils.AddLongOp(i)).lim(lim);
        ILongIterable stream2 = LongStream.iterate(seed2, LongPredicates.isGreater(0L), new IterTestUtils.AddLongOp(-i));
        // When
        List<Long> actual = stream.toList();
        List<Long> actual1 = stream1.toList();
        List<Long> actual2 = stream2.toList();
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
        Assert.isTrue(((LongStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
        Assert.isTrue(((LongStream) stream2).isOperated);
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
        ILongIterable stream = LongStream.concat(LongStream.of(input1), LongStream.of(input2));
        ILongIterable stream1 = LongStream.concat(new List<ILongIterable>{ LongStream.of(input1), LongStream.of(input2), LongStream.of(input3) });
        // When
        List<Long> actual = stream.toList();
        List<Long> actual1 = stream1.toList();
        // Then
        List<Long> expected = new List<Long>{ -5L, 0L, 1L, 3L, 150L, 3L, 0L, 8L };
        List<Long> expected1 = new List<Long>{ -5L, 0L, 1L, 3L, 150L, 3L, 0L, 8L, 9L, 5L, 7L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((LongStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
    }

    /**
    * @see LongStream.zip
    */
    @IsTest
    private static void zip() {
        // Given
        List<Long> input = new List<Long>{ -5L, 0L, 1L };
        List<Long> input1 = new List<Long>{ 3L, 0L, 8L };
        ILongIterable stream = LongStream.zip(LongStream.of(input), LongStream.of(input1), LongBinaryOperators.sum());
        // When
        List<Long> actual = stream.toList();
        // Then
        List<Long> expected = new List<Long>{ -2L, 0L, 9L };
        Assert.areEqual(expected, actual);
        Assert.isTrue(((LongStream) stream).isOperated);
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
        ILongIterable stream = LongStream.of(input).append(LongStream.of(input1));
        ILongIterable stream1 = LongStream.of(input).prepend(LongStream.of(input1));
        // When
        List<Long> actual = stream.toList();
        List<Long> actual1 = stream1.toList();
        // Then
        List<Long> expected = new List<Long>{ -5L, 0L, 1L, 3L, 0L, 8L };
        List<Long> expected1 = new List<Long>{ 3L, 0L, 8L, -5L, 0L, 1L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((LongStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
    }

    /**
     * @see ILongIterable.union
     * @see ILongIterable.intersect
     * @see ILongIterable.except
     */
    @IsTest
    private static void setOperations() {
        // Given
        List<Long> input = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
        List<Long> input1 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
        ILongIterable stream = LongStream.of(input).union(input1);
        ILongIterable stream1 = LongStream.of(input).union(LongStream.of(input1));
        ILongIterable stream2 = LongStream.of(input).intersect(input1);
        ILongIterable stream3 = LongStream.of(input).intersect(LongStream.of(input1));
        ILongIterable stream4 = LongStream.of(input).except(input1);
        ILongIterable stream5 = LongStream.of(input).except(LongStream.of(input1));
        // When
        List<Long> actual = stream.toList();
        List<Long> actual1 = stream1.toList();
        List<Long> actual2 = stream2.toList();
        List<Long> actual3 = stream3.toList();
        List<Long> actual4 = stream4.toList();
        List<Long> actual5 = stream5.toList();
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
        Assert.isTrue(((LongStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
        Assert.isTrue(((LongStream) stream2).isOperated);
        Assert.isTrue(((LongStream) stream3).isOperated);
        Assert.isTrue(((LongStream) stream4).isOperated);
        Assert.isTrue(((LongStream) stream5).isOperated);
    }

    /**
    * @see LongStream.toObjectIterable
    * @see LongIterable.toIntIterable
    * @see LongIterable.toDoubleIterable
    */
    @IsTest
    private static void convert() {
        // Given
        List<Long> input = new List<Long>{ -5L, 0L, 1L, 3L, 8L, null };
        IObjectIterable stream = LongStream.of(input).toObjectIterable();
        IIntIterable stream1 = LongStream.of(input).toIntIterable();
        IDoubleIterable stream2 = LongStream.of(input).toDoubleIterable();
        // When
        List<Object> actual = stream.toList();
        List<Integer> actual1 = stream1.toList();
        List<Double> actual2 = stream2.toList();
        // Then
        List<Object> expected = new List<Object>{ -5L, 0L, 1L, 3L, 8L, null };
        List<Integer> expected1 = new List<Integer>{ -5, 0, 1, 3, 8, null };
        List<Double> expected2 = new List<Double>{ -5, 0, 1, 3, 8, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected2, actual2);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((IntStream) stream1).isOperated);
        Assert.isTrue(((DoubleStream) stream2).isOperated);
    }

    /**
    * @see LongStream.filter
    */
    @IsTest
    private static void filter() {
        // Given
        List<Long> input = new List<Long>{ -5L, 0L, 1L, 3L, 8L, null, -6L, 4L, 4L };
        ILongIterable stream = LongStream.of(input).filter(LongPredicates.isGreater(0L));
        // When
        List<Long> actual = stream.toList();
        // Then
        List<Long> expected = new List<Long>{ 1L, 3L, 8L, 4L, 4L };
        Assert.areEqual(expected, actual);
        Assert.isTrue(((LongStream) stream).isOperated);
    }

    /**
    * @see LongStream.take
    */
    @IsTest
    private static void take() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, null, -6L, 4L, 4L };
        ILongIterable stream = LongStream.of(input).take(LongPredicates.isGreater(0L));
        ILongIterable stream1 = LongStream.of(input).take(LongPredicates.isGreater(2L));
        // When
        List<Long> actual = stream.toList();
        Iterator<Long> iterator = stream1.iterator();
        // Then
        List<Long> expected = new List<Long>{ 5L, 1L, 3L, 8L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input[0], iterator.next());
        try {
            iterator.next();
        } catch (Exception exc) {
            Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
        }
        Assert.isTrue(((LongStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
    }

    /**
    * @see LongStream.drop
    */
    @IsTest
    private static void drop() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, null, -6L, 4L, 4L };
        ILongIterable stream = LongStream.of(input).drop(LongPredicates.isGreater(0L));
        // When
        List<Long> actual = stream.toList();
        // Then
        List<Long> expected = new List<Long>{ -3L, null, -6L, 4L, 4L };
        Assert.areEqual(expected, actual);
        Assert.isTrue(((LongStream) stream).isOperated);
    }

    /**
    * @see LongIterable.withoutNulls
    */
    @IsTest
    private static void withoutNulls() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, null, -6L, 0L, 4L, null };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone).withoutNulls();
        // When
        List<Long> actual = stream.toList();
        // Then
        List<Long> expected = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
    }

    /**
    * @see LongStream.mapTo
    */
    @IsTest
    private static void mapTo() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone).mapTo(new IterTestUtils.MultiplyLongOp(2));
        // When
        List<Long> actual = stream.toList();
        // Then
        List<Long> expected = new List<Long>{ 10L, 2L, 6L, 16L, -6L, 8L, -12L, 0L, 8L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
    }

    /**
    * @see LongStream.mapToInt
    */
    @IsTest
    private static void mapToInt() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        IIntIterable stream = LongStream.of(clone).mapToInt(LongToIntFunctions.valueOf());
        // When
        List<Long> actual = stream.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stream).isOperated);
    }

    /**
    * @see LongStream.mapToDouble
    */
    @IsTest
    private static void mapToDouble() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        IDoubleIterable stream = LongStream.of(clone).mapToDouble(LongToDoubleFunctions.valueOf());
        // When
        List<Double> actual = stream.toList();
        // Then
        List<Double> expected = new List<Double>{ 5.0, 1.0, 3.0, 8.0, -3.0, 4.0, -6.0, 0.0, 4.0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stream).isOperated);
    }

    /**
     * @see LongStream.mapToSObject
     */
    @IsTest
    private static void mapToSObject() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ISObjectIterable stream = LongStream.of(clone).mapToSObject(new IterTestUtils.CreateAccountFromLongs());
        // When
        List<Account> actual = stream.toList();
        // Then
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        for (Integer i = 0, size = input.size(); i < size; i++ ) {
            Assert.areEqual(Math.abs(clone[i]), actual[i].NumberOfEmployees);
        }
        Assert.isTrue(((SObjectStream) stream).isOperated);
    }

    /**
     * @see LongStream.mapToObject
     */
    @IsTest
    private static void mapToObject() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        IObjectIterable stream = LongStream.of(clone).mapToObject(new IterTestUtils.LongToString());
        // When
        List<String> actual = (List<String>) stream.toList(List<String>.class);
        // Then
        List<String> expected = new List<String>{ '5', '1', '3', '8', '-3', '4', '-6', '0', '4' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
    }

    /**
     * @see LongStream.forEach
     */
    @IsTest
    private static void forEach() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone).forEach(new IterTestUtils.DoNothingLongConsumer());
        // When
        List<Long> actual = stream.toList();
        // Then
        Assert.areEqual(clone, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
    }

    /**
     * @see LongStream.distinct
     */
    @IsTest
    private static void distinct() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone).distinct();
        // When
        List<Long> actual = stream.toList();
        // Then
        List<Long> expected = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
    }

    /**
     * @see LongStream.sort
     */
    @IsTest
    private static void sort() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, null, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone).sort();
        // When
        List<Long> actual = stream.toList();
        // Then
        List<Long> expected = new List<Long>{ null, -6L, -3L, 0L, 1L, 3L, 4L, 4L, 5L, 8L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
    }

    /**
     * @see LongStream.lim
     */
    @IsTest
    private static void lim() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, null, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone).lim(25);
        ILongIterable stream1 = LongStream.of(clone).lim(3);
        ILongIterable stream2 = LongStream.of(clone).lim(0);
        ILongIterable stream3 = LongStream.of(clone);
        // When
        List<Long> actual = stream.toList();
        List<Long> actual1 = stream1.toList();
        List<Long> actual2 = stream2.toList();
        Exception exc1;
        try {
            stream3.lim(-2);
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
        Assert.isTrue(((LongStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
        Assert.isTrue(((LongStream) stream2).isOperated);
        Assert.isTrue(!((LongStream) stream3).isOperated);
    }

    /**
     * @see LongStream.skip
     */
    @IsTest
    private static void skip() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, null, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone).skip(5);
        ILongIterable stream1 = LongStream.of(clone).skip(0);
        ILongIterable stream2 = LongStream.of(clone).skip(25);
        ILongIterable stream3 = LongStream.of(clone);
        // When
        List<Long> actual = stream.toList();
        List<Long> actual1 = stream1.toList();
        List<Long> actual2 = stream2.toList();
        Exception exc1;
        try {
            stream3.skip(-2);
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
        Assert.isTrue(((LongStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
        Assert.isTrue(((LongStream) stream2).isOperated);
        Assert.isTrue(!((LongStream) stream3).isOperated);
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
        ILongIterable stream = LongStream.of(clone);
        ILongIterable stream1 = LongStream.of(clone);
        ILongIterable stream2 = LongStream.of(cloneWithNulls);
        Long seed = 10;
        // When
        Long actual = stream.reduce(seed, LongBinaryOperators.sum());
        Long actual1 = stream1.reduce(LongBinaryOperators.sum()).get();
        Exception exc1;
        try {
            stream2.reduce(LongBinaryOperators.sum());
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
        Assert.isTrue(((LongStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
    }

    /**
     * @see LongStream.collect
     */
    @IsTest
    private static void collect() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone);
        // When
        Set<Long> actual = (Set<Long>) stream.collect(Supplier.of(Set<Long>.class), ObjectLongConsumer.compose(new IterTestUtils.AddToLongSet()));
        // Then
        Set<Long> expected = new Set<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
    }

    /**
     * @see LongStream.find
     */
    @IsTest
    private static void find() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, 8L, -3L, 4L, -6L, 0L, 4L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone);
        ILongIterable stream1 = LongStream.of(clone);
        // When
        Long actual = stream.find(LongPredicates.isLess(0L)).get();
        Long actual1 =stream1.find(LongPredicates.isGreater(50L)).orElse(42L);
        // Then
        Assert.areEqual(-3L, actual);
        Assert.areEqual(42L, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
    }

    /**
     * @see LongStream.every
     */
    @IsTest
    private static void every() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone);
        ILongIterable stream1 = LongStream.of(clone);
        // When
        Boolean actual = stream.every(LongPredicates.isEven().negate());
        Boolean actual1 = stream1.every(LongPredicates.isPrime());
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
    }

    /**
     * @see LongStream.some
     */
    @IsTest
    private static void some() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone);
        ILongIterable stream1 = LongStream.of(clone);
        // When
        Boolean actual = stream.some(LongPredicates.isLess(0L));
        Boolean actual1 = stream1.some(LongPredicates.isEqual(0L));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
    }

    /**
     * @see LongIterable.none
     */
    @IsTest
    private static void none() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone);
        ILongIterable stream1 = LongStream.of(clone);
        // When
        Boolean actual = stream.none(LongPredicates.isEven());
        Boolean actual1 = stream1.none(LongPredicates.isLess(0L));
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
    }

    /**
     * @see LongIterable.max
     */
    @IsTest
    private static void max() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone);
        // When
        Long actual = stream.max().get();
        // Then
        Assert.areEqual(9, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
    }

    /**
     * @see LongIterable.min
     */
    @IsTest
    private static void min() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone);
        // When
        Long actual = stream.min().get();
        // Then
        Assert.areEqual(-3L, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
    }

    /**
     * @see LongStream.sum
     */
    @IsTest
    private static void sum() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone);
        // When
        Long actual = stream.sum();
        // Then
        Assert.areEqual(22L, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
    }

    /**
     * @see LongStream.avg
     */
    @IsTest
    private static void avg() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone);
        // When
        Double actual = stream.avg().get();
        // Then
        Assert.areEqual(3.625, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
    }

    /**
     * @see LongStream.count
     */
    @IsTest
    private static void count() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone);
        ILongIterable stream1 = LongStream.of(new List<Long>());
        ILongIterable stream2 = LongStream.empty();
        // When
        Long actual = stream.count();
        Long actual1 = stream1.count();
        Long actual2 = stream2.count();
        // Then
        Assert.areEqual(8L, actual);
        Assert.areEqual(0L, actual1);
        Assert.areEqual(0L, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
        Assert.isTrue(((LongStream) stream2).isOperated);
    }

    /**
     * @see LongStream.isEmpty
     */
    @IsTest
    private static void isEmpty() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone);
        ILongIterable stream1 = LongStream.of(new List<Long>());
        ILongIterable stream2 = LongStream.empty();
        // When
        Boolean actual = stream.isEmpty();
        Boolean actual1 = stream1.isEmpty();
        Boolean actual2 = stream2.isEmpty();
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(true, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
        Assert.isTrue(((LongStream) stream1).isOperated);
        Assert.isTrue(((LongStream) stream2).isOperated);
    }

    /**
     * @see LongStream.toList
     */
    @IsTest
    private static void toList() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone);
        // When
        List<Long> actual = stream.toList();
        // Then
        Assert.areEqual(input, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
    }

    /**
     * @see LongStream.toSet
     */
    @IsTest
    private static void toSet() {
        // Given
        List<Long> input = new List<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L, 7L };
        List<Long> clone = input.clone();
        ILongIterable stream = LongStream.of(clone);
        // When
        Set<Long> actual = stream.toSet();
        // Then
        Set<Long> expected = new Set<Long>{ 5L, 1L, 3L, -3L, 7L, 9L, 0L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stream).isOperated);
    }

}
