/**
 * @see ObjectStream
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ObjectStreamTest {

    private static final List<IterTestUtils.Person> PEOPLE = IterTestUtils.generatePersons();

    /**
     * @see ObjectStream.of
     * @see ObjectStream.ofNullable
     * @see ObjectStream.empty
     * @see ObjectStream.iterator
     * @see ObjectStream.sequence
     */
    @IsTest
    private static void of() {
        // Given
        PEOPLE.add(0, null);
        PEOPLE.add(null);
        List<Object> input = PEOPLE.clone();
        List<IterTestUtils.Person> input1;
        Set<Object> input2;
        IObjectIterable stream = ObjectStream.of(input);
        IObjectIterable stream1 = ObjectStream.of(new Set<Object>(input));
        IObjectIterable stream2 = ObjectStream.ofNullable(input);
        IObjectIterable stream3 = ObjectStream.ofNullable(new Set<Object>(input));
        IObjectIterable stream4 = ObjectStream.ofNullable(input1);
        IObjectIterable stream5 = ObjectStream.ofNullable(input2);
        IObjectIterable stream6 = ObjectStream.of(input.iterator());
        IObjectIterable seq = ((ObjectStream) ObjectStream.of(input)).sequence();
        // When
        List<IterTestUtils.Person> actual = (List<IterTestUtils.Person>) stream.toList(List<IterTestUtils.Person>.class);
        List<IterTestUtils.Person> actual1 = (List<IterTestUtils.Person>) stream1.toList(List<IterTestUtils.Person>.class);
        List<IterTestUtils.Person> actual2 = (List<IterTestUtils.Person>) stream2.toList(List<IterTestUtils.Person>.class);
        List<IterTestUtils.Person> actual3 = (List<IterTestUtils.Person>) stream3.toList(List<IterTestUtils.Person>.class);
        List<IterTestUtils.Person> actual4 = (List<IterTestUtils.Person>) stream4.toList(List<IterTestUtils.Person>.class);
        List<IterTestUtils.Person> actual5 = (List<IterTestUtils.Person>) stream5.toList(List<IterTestUtils.Person>.class);
        List<IterTestUtils.Person> actual6 = (List<IterTestUtils.Person>) stream6.toList(List<IterTestUtils.Person>.class);
        // Then
        List<Object> expected = new List<Object>(new Set<Object>(input));
        List<IterTestUtils.Person> expected1 = new List<IterTestUtils.Person>();
        Assert.areEqual(input, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(input, actual6);
        Assert.areEqual(false, seq.isEmpty());
        Assert.areEqual(PEOPLE, input, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
        Assert.isTrue(((ObjectStream) stream2).isOperated);
        Assert.isTrue(((ObjectStream) stream3).isOperated);
        Assert.isTrue(((ObjectStream) stream4).isOperated);
        Assert.isTrue(((ObjectStream) stream5).isOperated);
        Assert.isTrue(((ObjectStream) stream6).isOperated);
    }

    /**
     * @see ObjectStream.generate
     */
    @IsTest
    private static void generate() {
        // Given
        ISupplier uuid = StringSuppliers.uuid();
        Integer lim = 10;
        IObjectIterable stream = ObjectStream.generate(uuid).lim(lim);
        // When
        List<String> actual = (List<String>) stream.toList(List<String>.class);
        // Then
        Assert.areEqual(lim, actual.size());
        for (Integer i = 0, size = actual.size(); i < size; i++) {
            Assert.isTrue( actual[i] != null);
        }
        Assert.isTrue(((ObjectStream) stream).isOperated);
    }

    /**
     * @see ObjectStream.iterate
     */
    @IsTest
    private static void iterate() {
        // Given
        Integer value = 5;
        IIntUnaryOperator increment = new IterTestUtils.AddIntOp(1);
        IIntUnaryOperator add = new IterTestUtils.AddIntOp(value);
        IIntUnaryOperator subtract = new IterTestUtils.AddIntOp(-value);
        IToIntFunction toInt = new IterTestUtils.IntValueOf();
        IIntPredicate isPositive = IntPredicates.isGreater(0);
        Integer seed = 100;
        Integer seed1 = 10;
        Integer seed2 = 50;
        IUnaryOperator incrementObj = UnaryOperator.compose(increment);
        IUnaryOperator addObj = UnaryOperator.compose(add);
        IUnaryOperator subtractObj = UnaryOperator.compose(subtract);
        IPredicate isPositiveObj = Predicate.compose(toInt, isPositive);
        Integer lim = 10;
        IObjectIterable stream = ObjectStream.iterate(seed, incrementObj).lim(lim);
        IObjectIterable stream1 = ObjectStream.iterate(seed1, addObj).lim(lim).lim(lim);
        IObjectIterable stream2 = ObjectStream.iterate(seed2, isPositiveObj, subtractObj);
        // When
        List<Object> actual = stream.toList();
        List<Object> actual1 = stream1.toList();
        List<Object> actual2 = stream2.toList();
        // Then
        Assert.areEqual(lim, actual.size());
        Assert.areEqual(lim, actual1.size());
        Assert.areEqual(lim, actual2.size());
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
        Assert.isTrue(((ObjectStream) stream2).isOperated);
    }

    /**
    * @see ObjectStream.concat
    */
    @IsTest
    private static void concat() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true };
        List<Object> input1 = new List<Object>{ john, 0, 'bar' };
        List<Object> input2 = new List<Object>{ null, jake, 'baz' };
        IObjectIterable stream = ObjectStream.of(input);
        IObjectIterable stream1 = ObjectStream.of(input1);
        IObjectIterable stream2 = ObjectStream.of(input);
        IObjectIterable stream3 = ObjectStream.of(input1);
        IObjectIterable stream4 = ObjectStream.of(input2);
        // When
        List<Object> actual = ObjectStream.concat(stream, stream1).toList();
        List<Object> actual1 = ObjectStream.concat(new List<IObjectIterable>{ stream2, stream3, stream4 }).toList();
        // Then
        List<Object> expected = new List<Object>{ -5.1, '0', 10L, 3, true, john, 0, 'bar' };
        List<Object> expected1 = new List<Object>{ -5.1, '0', 10L, 3, true, john, 0, 'bar', null, jake, 'baz' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
        Assert.isTrue(((ObjectStream) stream2).isOperated);
        Assert.isTrue(((ObjectStream) stream3).isOperated);
        Assert.isTrue(((ObjectStream) stream4).isOperated);
    }

    /**
    * @see ObjectStream.zip
    */
    @IsTest
    private static void zip() {
        // Given
        List<Object> input = new List<Object>{ 'foo', 'bar', 'baz' };
        List<Object> input1 = new List<Object>{ 'lorem', '', null };
        IObjectIterable stream = ObjectStream.of(input);
        IObjectIterable stream1 = ObjectStream.of(input1);
        IObjectIterable stream2 = ObjectStream.of(input);
        IObjectIterable stream3 = ObjectStream.of(input1);
        IBinaryOperator right = BinaryOperator.right();
        IBinaryOperator left = BinaryOperator.left();
        IPredicate alwaysTrue = Predicate.always(true);
        IPredicate isNotBlank = new IterTestUtils.IsNotBlank();
        IBiPredicate rightIsNotBlank = BiPredicate.every(alwaysTrue, isNotBlank);
        IObjectIterable stream4 = ObjectStream.zip(stream, stream1, right);
        IObjectIterable stream5 = ObjectStream.zip(stream2, stream3, rightIsNotBlank, left);
        // When
        List<Object> actual = stream4.toList();
        List<Object> actual1 = stream5.toList();
        // Then
        Assert.areEqual(new List<Object>{ 'lorem', '', null }, actual);
        Assert.areEqual(new List<Object>{ 'foo' }, actual1);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
        Assert.isTrue(((ObjectStream) stream2).isOperated);
        Assert.isTrue(((ObjectStream) stream3).isOperated);
        Assert.isTrue(((ObjectStream) stream4).isOperated);
        Assert.isTrue(((ObjectStream) stream5).isOperated);
    }

    /**
    * @see ObjectStream.append
    * @see ObjectStream.prepend
    */
    @IsTest
    private static void appendPrepend() {
        // Given
        List<Object> input = new List<Object>{ 'foo', 1, 'baz' };
        List<Object> input1 = new List<Object>{ true, 'ipsum', null };
        IObjectIterable stream = ObjectStream.of(input);
        IObjectIterable stream1 = ObjectStream.of(input1);
        IObjectIterable stream2 = ObjectStream.of(input);
        IObjectIterable stream3 = ObjectStream.of(input1);
        IObjectIterable stream4 = stream.append(stream1);
        IObjectIterable stream5 = stream2.prepend(stream3);
        // When
        List<Object> actual = stream4.toList();
        List<Object> actual1 = stream5.toList();
        // Then
        List<Object> expected = new List<Object>{ 'foo', 1, 'baz', true, 'ipsum', null };
        List<Object> expected1 = new List<Object>{ true, 'ipsum', null, 'foo', 1, 'baz' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
        Assert.isTrue(((ObjectStream) stream2).isOperated);
        Assert.isTrue(((ObjectStream) stream3).isOperated);
        Assert.isTrue(((ObjectStream) stream4).isOperated);
        Assert.isTrue(((ObjectStream) stream5).isOperated);
    }

    /**
     * @see ObjectIterable.union
     * @see ObjectIterable.intersect
     * @see ObjectIterable.except
     */
    @IsTest
    private static void setOperations() {
        // Given
        List<Object> input = new List<Object>{ 5, 3, 9, 7, 5, 9, 3, 7 };
        List<Object> input1 = new List<Object>{ 8, 3, 6, 4, 4, 9, 1, 0 };
        IObjectIterable stream = ObjectStream.of(input).union(input1);
        IObjectIterable stream1 = ObjectStream.of(input).union(ObjectStream.of(input1));
        IObjectIterable stream2 = ObjectStream.of(input).union(input1, Function.identity());
        IObjectIterable stream3 = ObjectStream.of(input).intersect(input1);
        IObjectIterable stream4 = ObjectStream.of(input).intersect(ObjectStream.of(input1));
        IObjectIterable stream5 = ObjectStream.of(input).intersect(input1, Function.identity());
        IObjectIterable stream6 = ObjectStream.of(input).except(input1);
        IObjectIterable stream7 = ObjectStream.of(input).except(ObjectStream.of(input1));
        IObjectIterable stream8 = ObjectStream.of(input).except(input1, Function.identity());
        // When
        List<Object> actual = stream.toList();
        List<Object> actual1 = stream1.toList();
        List<Object> actual2 = stream2.toList();
        List<Object> actual3 = stream3.toList();
        List<Object> actual4 = stream4.toList();
        List<Object> actual5 = stream5.toList();
        List<Object> actual6 = stream6.toList();
        List<Object> actual7 = stream7.toList();
        List<Object> actual8 = stream8.toList();
        // Then
        List<Object> expected = new List<Object>{ 5, 3, 9, 7, 8, 6, 4, 1, 0 };
        List<Object> expected1 = new List<Object>{ 3, 9 };
        List<Object> expected2 = new List<Object>{ 5, 7 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
        Assert.isTrue(((ObjectStream) stream2).isOperated);
        Assert.isTrue(((ObjectStream) stream3).isOperated);
        Assert.isTrue(((ObjectStream) stream4).isOperated);
        Assert.isTrue(((ObjectStream) stream5).isOperated);
        Assert.isTrue(((ObjectStream) stream6).isOperated);
        Assert.isTrue(((ObjectStream) stream7).isOperated);
        Assert.isTrue(((ObjectStream) stream8).isOperated);
    }

    /**
    * @see ObjectStream.filter
    */
    @IsTest
    private static void filter() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ 'foo', 1, 'baz', john, true, 'ipsum', jake };
        IPredicate isInstanceOfString = TypePredicates.isInstanceOfString();
        IPredicate isInstanceOfComparable = TypePredicates.isInstanceOfComparable();
        IObjectIterable stream = ObjectStream.of(input).filter(isInstanceOfString);
        IObjectIterable stream1 = ObjectStream.of(input).filter(isInstanceOfComparable);
        // When
        List<Object> actual = stream.toList();
        List<Object> actual1 = stream1.toList();
        // Then
        Assert.areEqual(new List<String>{ 'foo', 'baz', 'ipsum' }, actual);
        Assert.areEqual(new List<Comparable>{ john, jake }, actual1);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
    }

    /**
    * @see ObjectStream.take
    */
    @IsTest
    private static void take() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ 'foo', '', 'baz', john, true, 'ipsum', jake };
        Predicate isInstanceOfString = TypePredicates.isInstanceOfString();
        IObjectIterable stream = ObjectStream.of(input).take(isInstanceOfString);
        IObjectIterable stream1 = ObjectStream.of(input).take(isInstanceOfString.andAlso(new IterTestUtils.IsNotBlank()));
        // When
        List<Object> actual = stream.toList();
        Iterator<Object> iterator = stream1.iterator();
        // Then
        Assert.areEqual(new List<Object>{ 'foo', '', 'baz' }, actual);
        Assert.areEqual(input[0], iterator.next());
        try {
            iterator.next();
        } catch (Exception exc) {
            Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
        }
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
    }

    /**
    * @see ObjectStream.drop
    */
    @IsTest
    private static void drop() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ 'foo', '', 'baz', john, true, 'ipsum', jake };
        IPredicate isInstanceOfString = TypePredicates.isInstanceOfString();
        IObjectIterable stream = ObjectStream.of(input).drop(isInstanceOfString);
        // When
        List<Object> actual = stream.toList();
        // Then
        Assert.areEqual(new List<Object>{ john, true, 'ipsum', jake }, actual);
        Assert.isTrue(((ObjectStream) stream).isOperated);
    }

    /**
    * @see ObjectIterable.withoutNulls
    */
    @IsTest
    private static void withoutNulls() {
        // Given
        Object john = (Object) new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        Object jake = (Object) new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ 'foo', '', jake, null, 'baz', john, true, 'ipsum', jake, null };
        List<Object> clone = IterTestUtils.deepClone(input);
        // When
        List<Object> actual = ObjectStream.of(clone).withoutNulls().toList();
        // Then
        List<Object> expected = new List<Object>{ 'foo', '', jake, 'baz', john, true, 'ipsum', jake };
        Assert.areEqual(IterTestUtils.deepClone(expected), actual);
        Assert.areEqual(IterTestUtils.deepClone(input), clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
    * @see ObjectStream.mapTo
    */
    @IsTest
    private static void mapTo() {
        // Given
        List<String> input = new List<String>{ 'foo', '', 'baz', 'ipsum', 'Hello' };
        List<String> clone = (List<String>) IterTestUtils.deepClone(input, List<String>.class);
        IObjectIterable stream = ObjectStream.of(clone).mapTo(new IterTestUtils.Capitalize());
        // When
        List<Object> actual = stream.toList();
        // Then
        List<Object> expected = new List<Object>{ 'Foo', '', 'Baz', 'Ipsum', 'Hello' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
    }

    /**
    * @see ObjectStream.mapToInt
    */
    @IsTest
    private static void mapToInt() {
        // Given
        List<String> input = new List<String>{ 'foo', '', 'baz', 'ipsum', 'Hello' };
        List<String> clone = (List<String>) IterTestUtils.deepClone(input, List<String>.class);
        IIntIterable intStream = ObjectStream.of(clone).mapToInt(new IterTestUtils.Length());
        // When
        List<Integer> actual = intStream.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 3, 0, 3, 5, 5 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) intStream).isOperated);
    }

    /**
    * @see ObjectStream.mapToLong
    */
    @IsTest
    private static void mapToLong() {
        // Given
        List<String> input = new List<String>{ '6', '0', '1', '3', '-9', '-6', '4', '4' };
        List<String> clone = (List<String>) IterTestUtils.deepClone(input, List<String>.class);
        ILongIterable longStream = ObjectStream.of(clone).mapToLong(new IterTestUtils.LongValueOf());
        // When
        List<Long> actual = longStream.toList();
        // Then
        List<Long> expected = new List<Long>{ 6L, 0L, 1L, 3L, -9L, -6L, 4L, 4L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) longStream).isOperated);
    }

    /**
    * @see ObjectStream.mapToDouble
    */
    @IsTest
    private static void mapToDouble() {
        // Given
        List<String> input = new List<String>{ '6.1', '0.0', '1.66', '3.06', '-8.99', '-6.4', '4.0', '4.0' };
        List<String> clone = (List<String>) IterTestUtils.deepClone(input, List<String>.class);
        IDoubleIterable doubleStream = ObjectStream.of(clone).mapToDouble(new IterTestUtils.DoubleValueOf());
        // When
        List<Double> actual = doubleStream.toList();
        // Then
        List<Double> expected = new List<Double>{ 6.1, 0.0, 1.66, 3.06, -8.99, -6.4, 4.0, 4.0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) doubleStream).isOperated);
    }

    /**
    * @see ObjectStream.mapToSObject
    */
    @IsTest
    private static void mapToSObject() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ john, jake };
        List<Object> clone = IterTestUtils.deepClone(input, List<IterTestUtils.Person>.class);
        ISObjectIterable sObjStream = ObjectStream.of(clone).mapToSObject(new IterTestUtils.ConvertToUser());
        // When
        List<SObject> actual = sObjStream.toList();
        // Then
        List<User> expected = new List<User>{ new User(LastName = 'John', IsActive = true), new User(LastName = 'Jake', IsActive = true) };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) sObjStream).isOperated);
    }

    /**
     * @see ObjectStream.flatMapTo
     */
    @IsTest
    private static void flatMapTo() {
        // Given
        List<List<String>> input = new List<List<String>>{
                new List<String>{},
                null,
                new List<String>{ 'foo' },
                new List<String>{ 'bar', 'baz' }
        };
        List<List<String>> clone = new List<List<String>>{
                new List<String>{},
                null,
                new List<String>{ 'foo' },
                new List<String>{ 'bar', 'baz' }
        };
        IObjectIterable objStream = ObjectStream.of(clone).flatMapTo(Function.identity());
        // When
        List<String> actual = (List<String>) objStream.toList(List<String>.class);
        // Then
        List<String> expected = new List<String>{ 'foo', 'bar', 'baz' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectStream.flatMapToInt
     */
    @IsTest
    private static void flatMapToInt() {
        // Given
        List<List<Integer>> input = new List<List<Integer>>{
                new List<Integer>{},
                null,
                new List<Integer>{ 1 },
                new List<Integer>{ 0, 2 }
        };
        List<List<Integer>> clone = new List<List<Integer>>{
                new List<Integer>{},
                null,
                new List<Integer>{ 1 },
                new List<Integer>{ 0, 2 }
        };
        IIntIterable intStream = ObjectStream.of(clone).flatMapToInt(Function.identity());
        // When
        List<Integer> actual = (List<Integer>) intStream.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 1, 0, 2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectStream.flatMapToLong
     */
    @IsTest
    private static void flatMapToLong() {
        // Given
        List<List<Long>> input = new List<List<Long>>{
                new List<Long>{},
                null,
                new List<Long>{ 1L },
                new List<Long>{ 0L, 2L }
        };
        List<List<Long>> clone = new List<List<Long>>{
                new List<Long>{},
                null,
                new List<Long>{ 1L },
                new List<Long>{ 0L, 2L }
        };
        ILongIterable longStream = ObjectStream.of(clone).flatMapToLong(Function.identity());
        // When
        List<Long> actual = (List<Long>) longStream.toList();
        // Then
        List<Long> expected = new List<Long>{ 1L, 0L, 2L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectStream.flatMapToDouble
     */
    @IsTest
    private static void flatMapToDouble() {
        // Given
        List<List<Double>> input = new List<List<Double>>{
                new List<Double>{},
                null,
                new List<Double>{ 1.1 },
                new List<Double>{ 0, Math.PI }
        };
        List<List<Double>> clone = new List<List<Double>>{
                new List<Double>{},
                null,
                new List<Double>{ 1.1 },
                new List<Double>{ 0, Math.PI }
        };
        IDoubleIterable doubleStream = ObjectStream.of(clone).flatMapToDouble(Function.identity());
        // When
        List<Double> actual = (List<Double>) doubleStream.toList();
        // Then
        List<Double> expected = new List<Double>{ 1.1, 0, Math.PI };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectStream.flatMapToSObject
     */
    @IsTest
    private static void flatMapToSObject() {
        // Given
        List<Account> accounts = IterTestUtils.generateAccounts1();
        List<List<Account>> input = new List<List<Account>>{
                new List<Account>{},
                null,
                new List<Account>{ accounts[1] },
                new List<Account>{ accounts[0], accounts[2] }
        };
        List<List<Account>> clone = new List<List<Account>>{
                new List<Account>{},
                null,
                new List<Account>{ accounts[1] },
                new List<Account>{ accounts[0], accounts[2] }
        };
        ISObjectIterable doubleStream = ObjectStream.of(clone).flatMapToSObject(Function.identity());
        // When
        List<Account> actual = (List<Account>) doubleStream.toList();
        // Then
        List<Account> expected = new List<Account>{ accounts[1], accounts[0], accounts[2] };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
    * @see ObjectStream.forEach
    */
    @IsTest
    private static void forEach() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        IterTestUtils.Person sam = new IterTestUtils.Person('Sam', 16, Date.newInstance(2005, 2, 3), 2L, false);
        IterTestUtils.Person lucy = new IterTestUtils.Person('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<IterTestUtils.Person> input = new List<IterTestUtils.Person>{ john, jake, sam, lucy };
        List<IterTestUtils.Person> clone = (List<IterTestUtils.Person>) IterTestUtils.deepClone(input, List<IterTestUtils.Person>.class);
        Long value = 0L;
        IObjectIterable stream = ObjectStream.of(clone).forEach(new IterTestUtils.SetAutoId(value));
        // When
        List<IterTestUtils.Person> actual = (List<IterTestUtils.Person>) stream.toList(List<IterTestUtils.Person>.class);
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            Assert.areEqual(value, actual[i].getAutoId());
        }
        Assert.areNotEqual(input, clone, Label.AS_ErrorMessage_InputNotMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
    }

    /**
    * @see ObjectStream.distinct
    */
    @IsTest
    private static void distinct() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 0L, true);
        List<Object> input = new List<Object>{ john, jake, 'foo', 1, 'foo', jake };
        List<Object> clone =  IterTestUtils.deepClone(input);
        IObjectIterable stream = ObjectStream.of(clone).distinct();
        IObjectIterable stream1 = ObjectStream.of(input).filter(TypePredicates.isInstanceOfComparable()).distinct(new IterTestUtils.GetIdFunction());
        // When
        List<Object> actual = stream.toList();
        List<Object> actual1 = stream1.toList();
        // Then
        List<Object> expected = new List<Object>{ john, jake, 'foo', 1 };
        List<Object> expected1 = new List<Object>{ john };
        Assert.areEqual(IterTestUtils.deepClone(expected), actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(IterTestUtils.deepClone(input), clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
    }

    /**
    * @see ObjectStream.sort
    */
    @IsTest
    private static void sort() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 2L, true);
        IterTestUtils.Person sam = new IterTestUtils.Person('Sam', 16, Date.newInstance(2005, 2, 3), 0L, true);
        IterTestUtils.Person lucy = new IterTestUtils.Person('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<IterTestUtils.Person> input = new List<IterTestUtils.Person>{ john, jake, null, sam, lucy };
        List<String> input1 = new List<String>{ 'foo', 'bar', 'baz', '', null };
        List<IterTestUtils.Person> clone = new List<IterTestUtils.Person>{ john, jake, null, sam, lucy };
        List<String> clone1 = (List<String>) IterTestUtils.deepClone(input1, List<String>.class);
        IObjectIterable stream = ObjectStream.of(clone).sort();
        IObjectIterable stream1 = ObjectStream.of(input1).sort();
        IObjectIterable stream2 = ObjectStream.of(clone).sort(Comparator.nullsLast(Comparator.defaultOrder()));
        IObjectIterable stream3 = ObjectStream.of(clone1).sort(Comparator.reverseOrder());
        IObjectIterable stream4 = ObjectStream.of(clone1).sort(SortOrder.DESCENDING);
        // When
        List<Object> actual = stream.toList();
        List<Object> actual1 = stream1.toList();
        List<Object> actual2 = stream2.toList();
        List<Object> actual3 = stream3.toList();
        List<Object> actual4 = stream4.toList();
        // Then
        List<Object> expected = new List<Object>{ null, sam, john, jake, lucy };
        List<Object> expected1 = new List<Object>{ null, '', 'bar', 'baz', 'foo' };
        List<Object> expected2 = new List<Object>{ sam, john, jake, lucy, null };
        List<Object> expected3 = new List<Object>{ 'foo', 'baz', 'bar', '', null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected2, actual2);
        Assert.areEqual(expected3, actual3);
        Assert.areEqual(expected3, actual4);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
        Assert.isTrue(((ObjectStream) stream2).isOperated);
        Assert.isTrue(((ObjectStream) stream3).isOperated);
        Assert.isTrue(((ObjectStream) stream4).isOperated);
    }

    /**
    * @see ObjectStream.lim
    */
    @IsTest
    private static void lim() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        IObjectIterable stream = ObjectStream.of(clone).lim(25);
        IObjectIterable stream1 = ObjectStream.of(clone).lim(3);
        IObjectIterable stream2 = ObjectStream.of(clone).lim(0);
        IObjectIterable stream3 = ObjectStream.of(clone);
        // When
        List<Object> actual = stream.toList();
        List<Object> actual1 = stream1.toList();
        List<Object> actual2 = stream2.toList();
        Exception exc1;
        try {
            stream3.lim(-2);
        } catch (IllegalArgumentException exc) {
            exc1 = exc;
        }
        // Then
        List<Object> expected = new List<Object>{ -5.1, '0', 10L };
        List<Object> expected1 = new List<Object>();
        Assert.areEqual(input, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(IllegalArgumentException.class.getName(), exc1.getTypeName());
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
        Assert.isTrue(((ObjectStream) stream2).isOperated);
        Assert.isTrue(!((ObjectStream) stream3).isOperated);
    }

    /**
    * @see ObjectStream.skip
    */
    @IsTest
    private static void skip() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        IObjectIterable stream = ObjectStream.of(clone).skip(5);
        IObjectIterable stream1 = ObjectStream.of(clone).skip(0);
        IObjectIterable stream2 = ObjectStream.of(clone).skip(25);
        IObjectIterable stream3 = ObjectStream.of(clone);
        // When
        List<Object> actual = stream.toList();
        List<Object> actual1 = stream1.toList();
        List<Object> actual2 = stream2.toList();
        Exception exc1;
        try {
            stream3.lim(-2);
        } catch (IllegalArgumentException exc) {
            exc1 = exc;
        }
        // Then
        List<Object> expected = new List<Object>{ new Account(), null, john, Math.PI };
        List<Object> expected1 = new List<Object>();
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(IllegalArgumentException.class.getName(), exc1.getTypeName());
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
        Assert.isTrue(((ObjectStream) stream2).isOperated);
        Assert.isTrue(!((ObjectStream) stream3).isOperated);
    }

    /**
    * @see ObjectStream.reduce
    */
    @IsTest
    private static void reduce() {
        // Given
        List<String> input = new List<String>{ 'foo', 'bar', 'baz', 'lorem' };
        List<Integer> input1 = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<String> clone = (List<String>) IterTestUtils.deepClone(input, List<String>.class);
        List<Integer> clone1 = (List<Integer>) IterTestUtils.deepClone(input1, List<Integer>.class);
        IObjectIterable stream = ObjectStream.of(clone);
        IObjectIterable stream1 = ObjectStream.of(clone1);
        String seed = 'seed';
        // When
        String actual = (String) stream.reduce(seed, new IterTestUtils.Concat());
        Integer actual1 = (Integer) stream1.reduce(BinaryOperator.upcast(IntBinaryOperators.sum())).get();
        // Then
        String expected = 'seedfoobarbazlorem';
        Integer expected1 = 16;
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual('seed', seed, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
    }

    /**
     * @see ObjectStream.collect
     */
    @IsTest
    private static void collect() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 2L, false);
        IterTestUtils.Person sam = new IterTestUtils.Person('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        IterTestUtils.Person lucy = new IterTestUtils.Person('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<Object> input = new List<Object>{ john, jake, sam, lucy, lucy, jake };
        List<Object> clone = new List<Object>{ john, jake, sam, lucy, lucy, jake };
        List<Object> clone1 = new List<Object>{ john, jake, sam, lucy, lucy, jake };
        IObjectIterable stream = ObjectStream.of(clone);
        IObjectIterable stream1 = ObjectStream.of(clone1);
        // When
        Set<Object> actual = (Set<Object>) stream.collect(Collector.of(Supplier.of(Set<Object>.class), new IterTestUtils.AddToSet()));
        Set<Object> actual1 = (Set<Object>) stream1.collect(Supplier.of(Set<Object>.class), new IterTestUtils.AddToSet());
        // Then
        Set<Object> expected = new Set<Object>{ john, jake, sam, lucy };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone1, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
    }

    /**
     * @see ObjectStream.find
     */
    @IsTest
    private static void find() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        IterTestUtils.Person sam = new IterTestUtils.Person('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        IterTestUtils.Person lucy = new IterTestUtils.Person('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<Object> input = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        List<Object> clone = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        List<Object> clone1 = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        IObjectIterable stream = ObjectStream.of(clone);
        IObjectIterable stream1 = ObjectStream.of(clone1);
        Integer elseValue = 42;
        // When
        String actual = (String) stream.find(TypePredicates.isInstanceOfString()).get();
        Integer actual1 = (Integer) stream1.find(TypePredicates.isInstanceOfInt()).orElse(elseValue);
        // Then
        Assert.areEqual('jake', actual);
        Assert.areEqual(elseValue, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone1, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
    }

    /**
     * @see ObjectStream.every
     */
    @IsTest
    private static void every() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        IterTestUtils.Person sam = new IterTestUtils.Person('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        IterTestUtils.Person lucy = new IterTestUtils.Person('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<Object> input = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        List<Object> clone = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        List<Object> clone1 = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        IObjectIterable stream = ObjectStream.of(clone);
        IObjectIterable stream1 = ObjectStream.of(clone1);
        // When
        Boolean actual = stream.every(TypePredicates.isInstanceOfString());
        Boolean actual1 = stream1.every(TypePredicates.isInstanceOfInt().negate());
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone1, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
    }

    /**
     * @see ObjectStream.some
     */
    @IsTest
    private static void some() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        IterTestUtils.Person sam = new IterTestUtils.Person('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        IterTestUtils.Person lucy = new IterTestUtils.Person('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<Object> input = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        List<Object> clone = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        List<Object> clone1 = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        IObjectIterable stream = ObjectStream.of(clone);
        IObjectIterable stream1 = ObjectStream.of(clone1);
        // When
        Boolean actual = stream.some(TypePredicates.isInstanceOfString());
        Boolean actual1 = stream1.some(TypePredicates.isInstanceOfInt());
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone1, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
    }

    /**
     * @see ObjectIterable.none
     */
    @IsTest
    private static void none() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        IterTestUtils.Person sam = new IterTestUtils.Person('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        IterTestUtils.Person lucy = new IterTestUtils.Person('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<Object> input = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        List<Object> clone = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        List<Object> clone1 = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        IObjectIterable stream = ObjectStream.of(clone);
        IObjectIterable stream1 = ObjectStream.of(clone1);
        // When
        Boolean actual = stream.none(TypePredicates.isInstanceOfString());
        Boolean actual1 = stream1.none(TypePredicates.isInstanceOfInt());
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone1, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
    }

    /**
     * @see ObjectIterable.max
     */
    @IsTest
    private static void max() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 2L, false);
        IterTestUtils.Person sam = new IterTestUtils.Person('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        IterTestUtils.Person lucy = new IterTestUtils.Person('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<IterTestUtils.Person> input = new List<IterTestUtils.Person>{ john, jake, sam, lucy, lucy, jake };
        List<String> input1 = new List<String>{ 'a', 'jake', 'foo', 'lucy', 'bar', 'jake' };
        List<IterTestUtils.Person> clone = new List<IterTestUtils.Person>{ john, jake, sam, lucy, lucy, jake };
        List<String> clone1 = (List<String>) IterTestUtils.deepClone(input1, List<String>.class);
        IObjectIterable stream = ObjectStream.of(clone);
        IObjectIterable stream1 = ObjectStream.of(clone1);
        IComparator defaultOrderComparator = Comparator.defaultOrder();
        // When
        IterTestUtils.Person actual = (IterTestUtils.Person) stream.max(defaultOrderComparator).get();
        String actual1 = (String) stream1.max(defaultOrderComparator).get();
        // Then
        Assert.areEqual(lucy, actual);
        Assert.areEqual('lucy', actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input1, clone1, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
    }

    /**
     * @see ObjectIterable.min
     */
    @IsTest
    private static void min() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 2L, false);
        IterTestUtils.Person sam = new IterTestUtils.Person('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        IterTestUtils.Person lucy = new IterTestUtils.Person('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<IterTestUtils.Person> input = new List<IterTestUtils.Person>{ john, jake, sam, lucy, lucy, jake };
        List<String> input1 = new List<String>{ 'a', 'jake', 'foo', 'lucy', 'bar', 'jake' };
        List<IterTestUtils.Person> clone = new List<IterTestUtils.Person>{ john, jake, sam, lucy, lucy, jake };
        List<String> clone1 = (List<String>) IterTestUtils.deepClone(input1, List<String>.class);
        IObjectIterable stream = ObjectStream.of(clone);
        IObjectIterable stream1 = ObjectStream.of(clone1);
        IComparator defaultOrderComparator = Comparator.defaultOrder();
        // When
        IterTestUtils.Person actual = (IterTestUtils.Person) stream.min(defaultOrderComparator).get();
        String actual1 = (String) stream1.min(defaultOrderComparator).get();
        // Then
        Assert.areEqual(sam, actual);
        Assert.areEqual('a', actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input1, clone1, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
    }

    /**
     * @see ObjectStream.count
     */
    @IsTest
    private static void count() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        IObjectIterable stream = ObjectStream.of(clone);
        IObjectIterable stream1 = ObjectStream.of(new List<Object>());
        IObjectIterable stream2 = ObjectStream.empty();
        // When
        Integer actual = stream.count();
        Integer actual1 = stream1.count();
        Integer actual2 = stream2.count();
        // Then
        Assert.areEqual(input.size(), actual);
        Assert.areEqual(0, actual1);
        Assert.areEqual(0, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
        Assert.isTrue(((ObjectStream) stream2).isOperated);
    }

    /**
     * @see ObjectStream.isEmpty
     */
    @IsTest
    private static void isEmpty() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        IObjectIterable stream = ObjectStream.of(clone);
        IObjectIterable stream1 = ObjectStream.of(new List<Object>());
        IObjectIterable stream2 = ObjectStream.empty();
        // When
        Boolean actual = stream.isEmpty();
        Boolean actual1 = stream1.isEmpty();
        Boolean actual2 = stream2.isEmpty();
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(true, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
        Assert.isTrue(((ObjectStream) stream2).isOperated);
    }

    /**
     * @see ObjectStream.toList
     */
    @IsTest
    private static void toList() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 2L, false);
        IterTestUtils.Person sam = new IterTestUtils.Person('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        IterTestUtils.Person lucy = new IterTestUtils.Person('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<IterTestUtils.Person> input = new List<IterTestUtils.Person>{ john, jake, sam, lucy, lucy, jake };
        List<IterTestUtils.Person> clone = (List<IterTestUtils.Person>) IterTestUtils.deepClone(input, List<IterTestUtils.Person>.class);
        List<Object> input1 = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone1 = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        IObjectIterable stream = ObjectStream.of(clone);
        IObjectIterable stream1 = ObjectStream.of(clone1);
        // When
        List<IterTestUtils.Person> actual = (List<IterTestUtils.Person>) stream.toList(List<IterTestUtils.Person>.class);
        List<Object> actual1 = stream1.toList();
        // Then
        Assert.areEqual(input, actual);
        Assert.areEqual(input1, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input1, clone1, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
        Assert.isTrue(((ObjectStream) stream1).isOperated);
    }

    /**
     * @see ObjectStream.toSet
     */
    @IsTest
    private static void toSet() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI, 3, '0' };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI, 3, '0' };
        IObjectIterable stream = ObjectStream.of(clone);
        // When
        Set<Object> actual = stream.toSet();
        // Then
        Set<Object> expected = new Set<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stream).isOperated);
    }

}
