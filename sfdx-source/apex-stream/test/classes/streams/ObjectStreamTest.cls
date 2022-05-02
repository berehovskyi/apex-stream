/**
 * @author O. Berehovskyi
 * @see ObjectStream
 */
@IsTest(IsParallel = true)
private class ObjectStreamTest {

    private static List<IterTestUtils.Person> persons = IterTestUtils.generatePersons();

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
        persons.add(0, null);
        persons.add(null);
        List<Object> input = persons.clone();
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
        Validate.assertEquals(input, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(input, actual2);
        Validate.assertEquals(expected, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(input, actual6);
        Validate.assertEquals(false, seq.isEmpty());
        Validate.assertEquals(persons, input, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
        Validate.assert(((ObjectStream) stream2).isOperated);
        Validate.assert(((ObjectStream) stream3).isOperated);
        Validate.assert(((ObjectStream) stream4).isOperated);
        Validate.assert(((ObjectStream) stream5).isOperated);
        Validate.assert(((ObjectStream) stream6).isOperated);
    }

    /**
     * @see ObjectStream.generate
     */
    @IsTest
    private static void generate() {
        // Given
        ISupplier uuid = StringSupplier.uuid();
        Integer lim = 10;
        IObjectIterable stream = ObjectStream.generate(uuid).lim(lim);
        // When
        List<String> actual = (List<String>) stream.toList(List<String>.class);
        // Then
        Validate.assertEquals(lim, actual.size());
        for (Integer i = 0, size = actual.size(); i < size; i++) {
            Validate.assert( actual[i] != null);
        }
        Validate.assert(((ObjectStream) stream).isOperated);
    }

    /**
     * @see ObjectStream.iterate
     */
    @IsTest
    private static void iterate() {
        // Given
        Integer value = 5;
        IIntUnaryOperator increment = IntUnaryOperator.increment();
        IIntUnaryOperator add = IntUnaryOperator.add(value);
        IIntUnaryOperator subtract = IntUnaryOperator.subtract(value);
        IToIntFunction toInt = ToIntFunction.valueOf();
        IIntPredicate isPositive = IntPredicate.isPositive();
        Integer seed = 100;
        Integer seed1 = 10;
        Integer seed2 = 50;
        IUnaryOperator incrementObj = UnaryOperator.upcast(increment);
        IUnaryOperator addObj = UnaryOperator.upcast(add);
        IUnaryOperator subtractObj = UnaryOperator.upcast(subtract);
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
        Validate.assertEquals(lim, actual.size());
        Validate.assertEquals(lim, actual1.size());
        Validate.assertEquals(lim, actual2.size());
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
        Validate.assert(((ObjectStream) stream2).isOperated);
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
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
        Validate.assert(((ObjectStream) stream2).isOperated);
        Validate.assert(((ObjectStream) stream3).isOperated);
        Validate.assert(((ObjectStream) stream4).isOperated);
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
        IPredicate isNotBlank = StringPredicate.isNotBlank();
        IBiPredicate rightIsNotBlank = BiPredicate.everyPredicate(alwaysTrue, isNotBlank);
        IObjectIterable stream4 = ObjectStream.zip(stream, stream1, right);
        IObjectIterable stream5 = ObjectStream.zip(stream2, stream3, rightIsNotBlank, left);
        // When
        List<Object> actual = stream4.toList();
        List<Object> actual1 = stream5.toList();
        // Then
        Validate.assertEquals(new List<Object>{ 'lorem', '', null }, actual);
        Validate.assertEquals(new List<Object>{ 'foo' }, actual1);
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
        Validate.assert(((ObjectStream) stream2).isOperated);
        Validate.assert(((ObjectStream) stream3).isOperated);
        Validate.assert(((ObjectStream) stream4).isOperated);
        Validate.assert(((ObjectStream) stream5).isOperated);
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
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
        Validate.assert(((ObjectStream) stream2).isOperated);
        Validate.assert(((ObjectStream) stream3).isOperated);
        Validate.assert(((ObjectStream) stream4).isOperated);
        Validate.assert(((ObjectStream) stream5).isOperated);
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
        IPredicate isInstanceOfString = Predicate.isInstanceOfString();
        IPredicate isInstanceOfComparable = Predicate.isInstanceOfComparable();
        IObjectIterable stream = ObjectStream.of(input).filter(isInstanceOfString);
        IObjectIterable stream1 = ObjectStream.of(input).filter(isInstanceOfComparable);
        // When
        List<Object> actual = stream.toList();
        List<Object> actual1 = stream1.toList();
        // Then
        Validate.assertEquals(new List<String>{ 'foo', 'baz', 'ipsum' }, actual);
        Validate.assertEquals(new List<Comparable>{ john, jake }, actual1);
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
        IPredicate isInstanceOfString = Predicate.isInstanceOfString();
        IObjectIterable stream = ObjectStream.of(input).take(isInstanceOfString);
        // When
        List<Object> actual = stream.toList();
        // Then
        Validate.assertEquals(new List<Object>{ 'foo', '', 'baz' }, actual);
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
        IPredicate isInstanceOfString = Predicate.isInstanceOfString();
        IObjectIterable stream = ObjectStream.of(input).drop(isInstanceOfString);
        // When
        List<Object> actual = stream.toList();
        // Then
        Validate.assertEquals(new List<Object>{ john, true, 'ipsum', jake }, actual);
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
        Validate.assertEquals(IterTestUtils.deepClone(expected), actual);
        Validate.assertEquals(IterTestUtils.deepClone(input), clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see ObjectStream.mapTo
    */
    @IsTest
    private static void mapTo() {
        // Given
        List<String> input = new List<String>{ 'foo', '', 'baz', 'ipsum', 'Hello' };
        List<String> clone = (List<String>) IterTestUtils.deepClone(input, List<String>.class);
        IObjectIterable stream = ObjectStream.of(clone).mapTo(StringFunction.capitalize());
        // When
        List<Object> actual = stream.toList();
        // Then
        List<Object> expected = new List<Object>{ 'Foo', '', 'Baz', 'Ipsum', 'Hello' };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
    }

    /**
    * @see ObjectStream.mapToInt
    */
    @IsTest
    private static void mapToInt() {
        // Given
        List<String> input = new List<String>{ 'foo', '', 'baz', 'ipsum', 'Hello' };
        List<String> clone = (List<String>) IterTestUtils.deepClone(input, List<String>.class);
        IIntIterable intStream = ObjectStream.of(clone).mapToInt(StringToIntFunction.length());
        // When
        List<Integer> actual = intStream.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 3, 0, 3, 5, 5 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assert(((IntStream) intStream).isOperated);
    }

    /**
    * @see ObjectStream.mapToLong
    */
    @IsTest
    private static void mapToLong() {
        // Given
        List<String> input = new List<String>{ '6', '0', '1', '3', '-9', '-6', '4', '4' };
        List<String> clone = (List<String>) IterTestUtils.deepClone(input, List<String>.class);
        ILongIterable longStream = ObjectStream.of(clone).mapToLong(StringToLongFunction.valueOf());
        // When
        List<Long> actual = longStream.toList();
        // Then
        List<Long> expected = new List<Long>{ 6L, 0L, 1L, 3L, -9L, -6L, 4L, 4L };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assert(((LongStream) longStream).isOperated);
    }

    /**
    * @see ObjectStream.mapToDouble
    */
    @IsTest
    private static void mapToDouble() {
        // Given
        List<String> input = new List<String>{ '6.1', '0.0', '1.66', '3.06', '-8.99', '-6.4', '4.0', '4.0' };
        List<String> clone = (List<String>) IterTestUtils.deepClone(input, List<String>.class);
        IDoubleIterable doubleStream = ObjectStream.of(clone).mapToDouble(ToDoubleFunction.valueOf());
        // When
        List<Double> actual = doubleStream.toList();
        // Then
        List<Double> expected = new List<Double>{ 6.1, 0.0, 1.66, 3.06, -8.99, -6.4, 4.0, 4.0 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assert(((DoubleStream) doubleStream).isOperated);
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
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assert(((SObjectStream) sObjStream).isOperated);
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
            Validate.assertEquals(value, actual[i].getAutoId());
        }
        Validate.assertNotEquals(input, clone, Label.InputNotMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
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
        IObjectIterable stream1 = ObjectStream.of(input).filter(Predicate.isInstanceOfComparable()).distinct(new IterTestUtils.GetIdFunction());
        // When
        List<Object> actual = stream.toList();
        List<Object> actual1 = stream1.toList();
        // Then
        List<Object> expected = new List<Object>{ john, jake, 'foo', 1 };
        List<Object> expected1 = new List<Object>{ john };
        Validate.assertEquals(IterTestUtils.deepClone(expected), actual);
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(IterTestUtils.deepClone(input), clone, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
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
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(expected2, actual2);
        Validate.assertEquals(expected3, actual3);
        Validate.assertEquals(expected3, actual4);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
        Validate.assert(((ObjectStream) stream2).isOperated);
        Validate.assert(((ObjectStream) stream3).isOperated);
        Validate.assert(((ObjectStream) stream4).isOperated);
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
        Validate.assertEquals(input, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected1, actual2);
        Validate.assertEquals('System.IllegalArgumentException', exc1.getTypeName());
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
        Validate.assert(((ObjectStream) stream2).isOperated);
        Validate.assert(!((ObjectStream) stream3).isOperated);
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
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, actual1);
        Validate.assertEquals(expected1, actual2);
        Validate.assertEquals('System.IllegalArgumentException', exc1.getTypeName());
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
        Validate.assert(((ObjectStream) stream2).isOperated);
        Validate.assert(!((ObjectStream) stream3).isOperated);
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
        String actual = (String) stream.reduce(seed, StringBinaryOperator.concat());
        Integer actual1 = (Integer) stream1.reduce(BinaryOperator.upcast(IntBinaryOperator.sum())).get();
        // Then
        String expected = 'seedfoobarbazlorem';
        Integer expected1 = 16;
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals('seed', seed, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
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
        Set<Object> actual = (Set<Object>) stream.collect(Collector.toSet());
        Set<Object> actual1 = (Set<Object>) stream1.collect(Supplier.of(Set<Object>.class), SetObjectConsumer.addToSet());
        // Then
        Set<Object> expected = new Set<Object>{ john, jake, sam, lucy };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input, clone1, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
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
        String actual = (String) stream.find(Predicate.isInstanceOfString()).get();
        Integer actual1 = (Integer) stream1.find(Predicate.isInstanceOfInt()).orElse(elseValue);
        // Then
        Validate.assertEquals('jake', actual);
        Validate.assertEquals(elseValue, actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input, clone1, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
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
        Boolean actual = stream.every(Predicate.isInstanceOfString());
        Boolean actual1 = stream1.every(Predicate.isInstanceOfInt().negate());
        // Then
        Validate.assertEquals(false, actual);
        Validate.assertEquals(true, actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input, clone1, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
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
        Boolean actual = stream.some(Predicate.isInstanceOfString());
        Boolean actual1 = stream1.some(Predicate.isInstanceOfInt());
        // Then
        Validate.assertEquals(true, actual);
        Validate.assertEquals(false, actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input, clone1, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
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
        Boolean actual = stream.none(Predicate.isInstanceOfString());
        Boolean actual1 = stream1.none(Predicate.isInstanceOfInt());
        // Then
        Validate.assertEquals(false, actual);
        Validate.assertEquals(true, actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input, clone1, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
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
        Validate.assertEquals(lucy, actual);
        Validate.assertEquals('lucy', actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input1, clone1, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
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
        Validate.assertEquals(sam, actual);
        Validate.assertEquals('a', actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input1, clone1, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
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
        Validate.assertEquals(input.size(), actual);
        Validate.assertEquals(0, actual1);
        Validate.assertEquals(0, actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
        Validate.assert(((ObjectStream) stream2).isOperated);
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
        Validate.assertEquals(false, actual);
        Validate.assertEquals(true, actual1);
        Validate.assertEquals(true, actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
        Validate.assert(((ObjectStream) stream1).isOperated);
        Validate.assert(((ObjectStream) stream2).isOperated);
    }

    /**
     * @see ObjectStream.toList
     */
    @IsTest
    private static void toList() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        IObjectIterable stream = ObjectStream.of(clone);
        // When
        List<Object> actual = stream.toList();
        // Then
        Validate.assertEquals(input, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
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
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assert(((ObjectStream) stream).isOperated);
    }

}
