/**
 * @see ObjectSequence
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ObjectSequenceTest {

    private static final List<IterTestUtils.Person> PEOPLE = IterTestUtils.generatePersons();

    /**
     * @see ObjectSequence.of
     * @see ObjectSequence.ofNullable
     * @see ObjectSequence.empty
     * @see ObjectSequence.iterator
     * @see ObjectSequence.stream
     */
    @IsTest
    private static void of() {
        // Given
        PEOPLE.add(0, null);
        PEOPLE.add(null);
        List<Object> input = PEOPLE.clone();
        List<IterTestUtils.Person> input1;
        Set<Object> input2;
        IObjectIterable seq = ObjectSequence.of(input);
        IObjectIterable seq1 = ObjectSequence.of(new Set<Object>(input));
        IObjectIterable seq2 = ObjectSequence.ofNullable(input);
        IObjectIterable seq3 = ObjectSequence.ofNullable(new Set<Object>(input));
        IObjectIterable seq4 = ObjectSequence.ofNullable(input1);
        IObjectIterable seq5 = ObjectSequence.ofNullable(input2);
        IObjectIterable stream = ((ObjectSequence) ObjectSequence.of(input)).stream();
        // When
        List<IterTestUtils.Person> actual = (List<IterTestUtils.Person>) seq.toList(List<IterTestUtils.Person>.class);
        List<IterTestUtils.Person> actual1 = (List<IterTestUtils.Person>) seq1.toList(List<IterTestUtils.Person>.class);
        List<IterTestUtils.Person> actual2 = (List<IterTestUtils.Person>) seq2.toList(List<IterTestUtils.Person>.class);
        List<IterTestUtils.Person> actual3 = (List<IterTestUtils.Person>) seq3.toList(List<IterTestUtils.Person>.class);
        List<IterTestUtils.Person> actual4 = (List<IterTestUtils.Person>) seq4.toList(List<IterTestUtils.Person>.class);
        List<IterTestUtils.Person> actual5 = (List<IterTestUtils.Person>) seq5.toList(List<IterTestUtils.Person>.class);
        // Then
        List<Object> expected = new List<Object>(new Set<Object>(input));
        List<IterTestUtils.Person> expected1 = new List<IterTestUtils.Person>();
        Validate.assertEquals(input, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(input, actual2);
        Validate.assertEquals(expected, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(true, seq.iterator().hasNext());
        Validate.assertEquals(true, seq1.iterator().hasNext());
        Validate.assertEquals(true, seq2.iterator().hasNext());
        Validate.assertEquals(true, seq3.iterator().hasNext());
        Validate.assertEquals(false, seq4.iterator().hasNext());
        Validate.assertEquals(false, seq5.iterator().hasNext());
        Validate.assertEquals(false, stream.isEmpty());
        Validate.assertEquals(PEOPLE, input, Label.InputMutatedErrorMessage);
    }

    /**
    * @see ObjectSequence.concat
    */
    @IsTest
    private static void concat() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true };
        List<Object> input1 = new List<Object>{ john, 0, 'bar' };
        List<Object> input2 = new List<Object>{ null, jake, 'baz' };
        IObjectIterable seq = ObjectSequence.of(input);
        IObjectIterable seq1 = ObjectSequence.of(input1);
        IObjectIterable seq2 = ObjectSequence.of(input);
        IObjectIterable seq3 = ObjectSequence.of(input1);
        IObjectIterable seq4 = ObjectSequence.of(input2);
        // When
        List<Object> actual = ObjectSequence.concat(seq, seq1).toList();
        List<Object> actual1 = ObjectSequence.concat(new List<IObjectIterable>{ seq2, seq3, seq4 }).toList();
        // Then
        List<Object> expected = new List<Object>{ -5.1, '0', 10L, 3, true, john, 0, 'bar' };
        List<Object> expected1 = new List<Object>{ -5.1, '0', 10L, 3, true, john, 0, 'bar', null, jake, 'baz' };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
    }

    /**
    * @see ObjectSequence.zip
    */
    @IsTest
    private static void zip() {
        // Given
        List<Object> input = new List<Object>{ 'foo', 'bar', 'baz' };
        List<Object> input1 = new List<Object>{ 'lorem', '', null };
        IObjectIterable seq = ObjectSequence.of(input);
        IObjectIterable seq1 = ObjectSequence.of(input1);
        IObjectIterable seq2 = ObjectSequence.of(input);
        IObjectIterable seq3 = ObjectSequence.of(input1);
        IBinaryOperator right = BinaryOperator.right();
        IBinaryOperator left = BinaryOperator.left();
        IPredicate alwaysTrue = Predicate.always(true);
        IPredicate isNotBlank = new IterTestUtils.IsNotBlank();
        IBiPredicate rightIsNotBlank = BiPredicate.every(alwaysTrue, isNotBlank);
        IObjectIterable seq4 = ObjectSequence.zip(seq, seq1, right);
        IObjectIterable seq5 = ObjectSequence.zip(seq2, seq3, rightIsNotBlank, left);
        // When
        List<Object> actual = seq4.toList();
        List<Object> actual1 = seq5.toList();
        // Then
        Validate.assertEquals(new List<Object>{ 'lorem', '', null }, actual);
        Validate.assertEquals(new List<Object>{ 'foo' }, actual1);
    }

    /**
    * @see ObjectSequence.append
    * @see ObjectSequence.prepend
    */
    @IsTest
    private static void appendPrepend() {
        // Given
        List<Object> input = new List<Object>{ 'foo', 1, 'baz' };
        List<Object> input1 = new List<Object>{ true, 'ipsum', null };
        IObjectIterable seq = ObjectSequence.of(input);
        IObjectIterable seq1 = ObjectSequence.of(input1);
        IObjectIterable seq2 = ObjectSequence.of(input);
        IObjectIterable seq3 = ObjectSequence.of(input1);
        IObjectIterable seq4 = seq.append(seq1);
        IObjectIterable seq5 = seq2.prepend(seq3);
        // When
        List<Object> actual = seq4.toList();
        List<Object> actual1 = seq5.toList();
        // Then
        List<Object> expected = new List<Object>{ 'foo', 1, 'baz', true, 'ipsum', null };
        List<Object> expected1 = new List<Object>{ true, 'ipsum', null, 'foo', 1, 'baz' };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
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
        IObjectIterable seq = ObjectSequence.of(input).union(input1);
        IObjectIterable seq1 = ObjectSequence.of(input).union(ObjectSequence.of(input1));
        IObjectIterable seq2 = ObjectSequence.of(input).union(input1, Function.identity());
        IObjectIterable seq3 = ObjectSequence.of(input).intersect(input1);
        IObjectIterable seq4 = ObjectSequence.of(input).intersect(ObjectSequence.of(input1));
        IObjectIterable seq5 = ObjectSequence.of(input).intersect(input1, Function.identity());
        IObjectIterable seq6 = ObjectSequence.of(input).except(input1);
        IObjectIterable seq7 = ObjectSequence.of(input).except(ObjectSequence.of(input1));
        IObjectIterable seq8 = ObjectSequence.of(input).except(input1, Function.identity());
        // When
        List<Object> actual = seq.toList();
        List<Object> actual1 = seq1.toList();
        List<Object> actual2 = seq2.toList();
        List<Object> actual3 = seq3.toList();
        List<Object> actual4 = seq4.toList();
        List<Object> actual5 = seq5.toList();
        List<Object> actual6 = seq6.toList();
        List<Object> actual7 = seq7.toList();
        List<Object> actual8 = seq8.toList();
        // Then
        List<Object> expected = new List<Object>{ 5, 3, 9, 7, 8, 6, 4, 1, 0 };
        List<Object> expected1 = new List<Object>{ 3, 9 };
        List<Object> expected2 = new List<Object>{ 5, 7 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(expected2, actual6);
        Validate.assertEquals(expected2, actual7);
        Validate.assertEquals(expected2, actual8);
    }

    /**
    * @see ObjectSequence.filter
    */
    @IsTest
    private static void filter() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ 'foo', 1, 'baz', john, true, 'ipsum', jake };
        IPredicate isInstanceOfString = TypePredicates.isInstanceOfString();
        IPredicate isInstanceOfComparable = TypePredicates.isInstanceOfComparable();
        IObjectIterable seq = ObjectSequence.of(input).filter(isInstanceOfString);
        IObjectIterable seq1 = ObjectSequence.of(input).filter(isInstanceOfComparable);
        // When
        List<Object> actual = seq.toList();
        List<Object> actual1 = seq1.toList();
        // Then
        Validate.assertEquals(new List<String>{ 'foo', 'baz', 'ipsum' }, actual);
        Validate.assertEquals(new List<Comparable>{ john, jake }, actual1);
    }

    /**
    * @see ObjectSequence.take
    */
    @IsTest
    private static void take() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ 'foo', '', 'baz', john, true, 'ipsum', jake };
        IPredicate isInstanceOfString = TypePredicates.isInstanceOfString();
        IObjectIterable seq = ObjectSequence.of(input).take(isInstanceOfString);
        // When
        List<Object> actual = seq.toList();
        // Then
        Validate.assertEquals(new List<Object>{ 'foo', '', 'baz' }, actual);
    }

    /**
    * @see ObjectSequence.drop
    */
    @IsTest
    private static void drop() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ 'foo', '', 'baz', john, true, 'ipsum', jake };
        IPredicate isInstanceOfString = TypePredicates.isInstanceOfString();
        IObjectIterable seq = ObjectSequence.of(input).drop(isInstanceOfString);
        // When
        List<Object> actual = seq.toList();
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
        List<Object> actual = ObjectSequence.of(clone).withoutNulls().toList();
        // Then
        List<Object> expected = new List<Object>{ 'foo', '', jake, 'baz', john, true, 'ipsum', jake };
        Validate.assertEquals(IterTestUtils.deepClone(expected), actual);
        Validate.assertEquals(IterTestUtils.deepClone(input), clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see ObjectSequence.mapTo
    */
    @IsTest
    private static void mapTo() {
        // Given
        List<String> input = new List<String>{ 'foo', '', 'baz', 'ipsum', 'Hello' };
        List<String> clone = (List<String>) IterTestUtils.deepClone(input, List<String>.class);
        IObjectIterable seq = ObjectSequence.of(clone).mapTo(new IterTestUtils.Capitalize());
        // When
        List<Object> actual = seq.toList();
        // Then
        List<Object> expected = new List<Object>{ 'Foo', '', 'Baz', 'Ipsum', 'Hello' };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see ObjectSequence.mapToInt
    */
    @IsTest
    private static void mapToInt() {
        // Given
        List<String> input = new List<String>{ 'foo', '', 'baz', 'ipsum', 'Hello' };
        List<String> clone = (List<String>) IterTestUtils.deepClone(input, List<String>.class);
        IIntIterable intSeq = ObjectSequence.of(clone).mapToInt(new IterTestUtils.Length());
        // When
        List<Integer> actual = intSeq.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 3, 0, 3, 5, 5 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see ObjectSequence.mapToLong
    */
    @IsTest
    private static void mapToLong() {
        // Given
        List<String> input = new List<String>{ '6', '0', '1', '3', '-9', '-6', '4', '4' };
        List<String> clone = (List<String>) IterTestUtils.deepClone(input, List<String>.class);
        ILongIterable longSeq = ObjectSequence.of(clone).mapToLong(new IterTestUtils.LongValueOf());
        // When
        List<Long> actual = longSeq.toList();
        // Then
        List<Long> expected = new List<Long>{ 6L, 0L, 1L, 3L, -9L, -6L, 4L, 4L };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see ObjectSequence.mapToDouble
    */
    @IsTest
    private static void mapToDouble() {
        // Given
        List<String> input = new List<String>{ '6.1', '0.0', '1.66', '3.06', '-8.99', '-6.4', '4.0', '4.0' };
        List<String> clone = (List<String>) IterTestUtils.deepClone(input, List<String>.class);
        IDoubleIterable doubleSeq = ObjectSequence.of(clone).mapToDouble(new IterTestUtils.DoubleValueOf());
        // When
        List<Double> actual = doubleSeq.toList();
        // Then
        List<Double> expected = new List<Double>{ 6.1, 0.0, 1.66, 3.06, -8.99, -6.4, 4.0, 4.0 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see ObjectSequence.mapToSObject
    */
    @IsTest
    private static void mapToSObject() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ john, jake };
        List<Object> clone = IterTestUtils.deepClone(input, List<IterTestUtils.Person>.class);
        ISObjectIterable sObjSeq = ObjectSequence.of(clone).mapToSObject(new IterTestUtils.ConvertToUser());
        // When
        List<SObject> actual = sObjSeq.toList();
        // Then
        List<User> expected = new List<User>{ new User(LastName = 'John', IsActive = true), new User(LastName = 'Jake', IsActive = true) };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see ObjectSequence.flatMapTo
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
        IObjectIterable objSeq = ObjectSequence.of(clone).flatMapTo(Function.identity());
        // When
        List<String> actual = (List<String>) objSeq.toList(List<String>.class);
        // Then
        List<String> expected = new List<String>{ 'foo', 'bar', 'baz' };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see ObjectSequence.flatMapToInt
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
        IIntIterable intSeq = ObjectSequence.of(clone).flatMapToInt(Function.identity());
        // When
        List<Integer> actual = (List<Integer>) intSeq.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 1, 0, 2 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see ObjectSequence.flatMapToLong
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
        ILongIterable longSeq = ObjectSequence.of(clone).flatMapToLong(Function.identity());
        // When
        List<Long> actual = (List<Long>) longSeq.toList();
        // Then
        List<Long> expected = new List<Long>{ 1L, 0L, 2L };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see ObjectSequence.flatMapToDouble
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
        IDoubleIterable doubleSeq = ObjectSequence.of(clone).flatMapToDouble(Function.identity());
        // When
        List<Double> actual = (List<Double>) doubleSeq.toList();
        // Then
        List<Double> expected = new List<Double>{ 1.1, 0, Math.PI };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see ObjectSequence.flatMapToSObject
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
        ISObjectIterable doubleSeq = ObjectSequence.of(clone).flatMapToSObject(Function.identity());
        // When
        List<Account> actual = (List<Account>) doubleSeq.toList();
        // Then
        List<Account> expected = new List<Account>{ accounts[1], accounts[0], accounts[2] };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see ObjectSequence.forEach
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
        IObjectIterable seq = ObjectSequence.of(clone).forEach(new IterTestUtils.SetAutoId(value));
        // When
        List<IterTestUtils.Person> actual = (List<IterTestUtils.Person>) seq.toList(List<IterTestUtils.Person>.class);
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            Validate.assertEquals(value, actual[i].getAutoId());
        }
        Validate.assertNotEquals(input, clone, Label.InputNotMutatedErrorMessage);
    }

    /**
    * @see ObjectSequence.distinct
    */
    @IsTest
    private static void distinct() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 0L, true);
        List<Object> input = new List<Object>{ john, jake, 'foo', 1, 'foo', jake };
        List<Object> clone =  IterTestUtils.deepClone(input);
        IObjectIterable seq = ObjectSequence.of(clone).distinct();
        IObjectIterable seq1 = ObjectSequence.of(input).filter(TypePredicates.isInstanceOfComparable()).distinct(new IterTestUtils.GetIdFunction());
        // When
        List<Object> actual = seq.toList();
        List<Object> actual1 = seq1.toList();
        // Then
        List<Object> expected = new List<Object>{ john, jake, 'foo', 1 };
        List<Object> expected1 = new List<Object>{ john };
        Validate.assertEquals(IterTestUtils.deepClone(expected), actual);
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(IterTestUtils.deepClone(input), clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see ObjectSequence.sort
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
        IObjectIterable seq = ObjectSequence.of(clone).sort();
        IObjectIterable seq1 = ObjectSequence.of(input1).sort();
        IObjectIterable seq2 = ObjectSequence.of(clone).sort(Comparator.nullsLast(Comparator.defaultOrder()));
        IObjectIterable seq3 = ObjectSequence.of(clone1).sort(Comparator.reverseOrder());
        IObjectIterable seq4 = ObjectSequence.of(clone1).sort(SortOrder.DESCENDING);
        // When
        List<Object> actual = seq.toList();
        List<Object> actual1 = seq1.toList();
        List<Object> actual2 = seq2.toList();
        List<Object> actual3 = seq3.toList();
        List<Object> actual4 = seq4.toList();
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
    }

    /**
    * @see ObjectSequence.lim
    */
    @IsTest
    private static void lim() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        IObjectIterable seq = ObjectSequence.of(clone).lim(25);
        IObjectIterable seq1 = ObjectSequence.of(clone).lim(3);
        IObjectIterable seq2 = ObjectSequence.of(clone).lim(0);
        IObjectIterable seq3 = ObjectSequence.of(clone);
        // When
        List<Object> actual = seq.toList();
        List<Object> actual1 = seq1.toList();
        List<Object> actual2 = seq2.toList();
        Exception exc1;
        try {
            seq3.lim(-2);
        } catch (IllegalArgumentException exc) {
            exc1 = exc;
        }
        // Then
        List<Object> expected = new List<Object>{ -5.1, '0', 10L };
        List<Object> expected1 = new List<Object>();
        Validate.assertEquals(input, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected1, actual2);
        Validate.assertEquals(IllegalArgumentException.class.getName(), exc1.getTypeName());
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see ObjectSequence.skip
    */
    @IsTest
    private static void skip() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        IObjectIterable seq = ObjectSequence.of(clone).skip(5);
        IObjectIterable seq1 = ObjectSequence.of(clone).skip(0);
        IObjectIterable seq2 = ObjectSequence.of(clone).skip(25);
        IObjectIterable seq3 = ObjectSequence.of(clone);
        // When
        List<Object> actual = seq.toList();
        List<Object> actual1 = seq1.toList();
        List<Object> actual2 = seq2.toList();
        Exception exc1;
        try {
            seq3.lim(-2);
        } catch (IllegalArgumentException exc) {
            exc1 = exc;
        }
        // Then
        List<Object> expected = new List<Object>{ new Account(), null, john, Math.PI };
        List<Object> expected1 = new List<Object>();
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, actual1);
        Validate.assertEquals(expected1, actual2);
        Validate.assertEquals(IllegalArgumentException.class.getName(), exc1.getTypeName());
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see ObjectSequence.reduce
    */
    @IsTest
    private static void reduce() {
        // Given
        List<String> input = new List<String>{ 'foo', 'bar', 'baz', 'lorem' };
        List<Integer> input1 = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<String> clone = (List<String>) IterTestUtils.deepClone(input, List<String>.class);
        List<Integer> clone1 = (List<Integer>) IterTestUtils.deepClone(input1, List<Integer>.class);
        IObjectIterable seq = ObjectSequence.of(clone);
        IObjectIterable seq1 = ObjectSequence.of(clone1);
        String seed = 'seed';
        // When
        String actual = (String) seq.reduce(seed, new IterTestUtils.Concat());
        Integer actual1 = (Integer) seq1.reduce(BinaryOperator.upcast(IntBinaryOperators.sum())).get();
        // Then
        String expected = 'seedfoobarbazlorem';
        Integer expected1 = 16;
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals('seed', seed, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see ObjectSequence.collect
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
        IObjectIterable seq = ObjectSequence.of(clone);
        IObjectIterable seq1 = ObjectSequence.of(clone1);
        // When
        Set<Object> actual = (Set<Object>) seq.collect(Collector.of(Supplier.of(Set<Object>.class), new IterTestUtils.AddToSet()));
        Set<Object> actual1 = (Set<Object>) seq1.collect(Supplier.of(Set<Object>.class), new IterTestUtils.AddToSet());
        // Then
        Set<Object> expected = new Set<Object>{ john, jake, sam, lucy };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input, clone1, Label.InputMutatedErrorMessage);
    }

    /**
     * @see ObjectSequence.find
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
        IObjectIterable seq = ObjectSequence.of(clone);
        IObjectIterable seq1 = ObjectSequence.of(clone1);
        Integer elseValue = 42;
        // When
        String actual = (String) seq.find(TypePredicates.isInstanceOfString()).get();
        Integer actual1 = (Integer) seq1.find(TypePredicates.isInstanceOfInt()).orElse(elseValue);
        // Then
        Validate.assertEquals('jake', actual);
        Validate.assertEquals(elseValue, actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input, clone1, Label.InputMutatedErrorMessage);
    }

    /**
     * @see ObjectSequence.every
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
        IObjectIterable seq = ObjectSequence.of(clone);
        IObjectIterable seq1 = ObjectSequence.of(clone1);
        // When
        Boolean actual = seq.every(TypePredicates.isInstanceOfString());
        Boolean actual1 = seq1.every(TypePredicates.isInstanceOfInt().negate());
        // Then
        Validate.assertEquals(false, actual);
        Validate.assertEquals(true, actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input, clone1, Label.InputMutatedErrorMessage);
    }

    /**
     * @see ObjectSequence.some
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
        IObjectIterable seq = ObjectSequence.of(clone);
        IObjectIterable seq1 = ObjectSequence.of(clone1);
        // When
        Boolean actual = seq.some(TypePredicates.isInstanceOfString());
        Boolean actual1 = seq1.some(TypePredicates.isInstanceOfInt());
        // Then
        Validate.assertEquals(true, actual);
        Validate.assertEquals(false, actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input, clone1, Label.InputMutatedErrorMessage);
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
        IObjectIterable seq = ObjectSequence.of(clone);
        IObjectIterable seq1 = ObjectSequence.of(clone1);
        // When
        Boolean actual = seq.none(TypePredicates.isInstanceOfString());
        Boolean actual1 = seq1.none(TypePredicates.isInstanceOfInt());
        // Then
        Validate.assertEquals(false, actual);
        Validate.assertEquals(true, actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input, clone1, Label.InputMutatedErrorMessage);
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
        IObjectIterable seq = ObjectSequence.of(clone);
        IObjectIterable seq1 = ObjectSequence.of(clone1);
        IComparator defaultOrderComparator = Comparator.defaultOrder();
        // When
        IterTestUtils.Person actual = (IterTestUtils.Person) seq.max(defaultOrderComparator).get();
        String actual1 = (String) seq1.max(defaultOrderComparator).get();
        // Then
        Validate.assertEquals(lucy, actual);
        Validate.assertEquals('lucy', actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input1, clone1, Label.InputMutatedErrorMessage);
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
        IObjectIterable seq = ObjectSequence.of(clone);
        IObjectIterable seq1 = ObjectSequence.of(clone1);
        IComparator defaultOrderComparator = Comparator.defaultOrder();
        // When
        IterTestUtils.Person actual = (IterTestUtils.Person) seq.min(defaultOrderComparator).get();
        String actual1 = (String) seq1.min(defaultOrderComparator).get();
        // Then
        Validate.assertEquals(sam, actual);
        Validate.assertEquals('a', actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input1, clone1, Label.InputMutatedErrorMessage);
    }

    /**
     * @see ObjectSequence.count
     */
    @IsTest
    private static void count() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        IObjectIterable seq = ObjectSequence.of(clone);
        IObjectIterable seq1 = ObjectSequence.of(new List<Object>());
        IObjectIterable seq2 = ObjectSequence.empty();
        // When
        Integer actual = seq.count();
        Integer actual1 = seq1.count();
        Integer actual2 = seq2.count();
        // Then
        Validate.assertEquals(input.size(), actual);
        Validate.assertEquals(0, actual1);
        Validate.assertEquals(0, actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see ObjectSequence.isEmpty
     */
    @IsTest
    private static void isEmpty() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        IObjectIterable seq = ObjectSequence.of(clone);
        IObjectIterable seq1 = ObjectSequence.of(new List<Object>());
        IObjectIterable seq2 = ObjectSequence.empty();
        // When
        Boolean actual = seq.isEmpty();
        Boolean actual1 = seq1.isEmpty();
        Boolean actual2 = seq2.isEmpty();
        // Then
        Validate.assertEquals(false, actual);
        Validate.assertEquals(true, actual1);
        Validate.assertEquals(true, actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see ObjectSequence.toList
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
        IObjectIterable seq = ObjectSequence.of(clone);
        IObjectIterable seq1 = ObjectSequence.of(clone1);
        // When
        List<IterTestUtils.Person> actual = (List<IterTestUtils.Person>) seq.toList(List<IterTestUtils.Person>.class);
        List<Object> actual1 = seq1.toList();
        // Then
        Validate.assertEquals(input, actual);
        Validate.assertEquals(input1, actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
        Validate.assertEquals(input1, clone1, Label.InputMutatedErrorMessage);
    }

    /**
     * @see ObjectSequence.toSet
     */
    @IsTest
    private static void toSet() {
        // Given
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI, 3, '0' };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI, 3, '0' };
        IObjectIterable seq = ObjectSequence.of(clone);
        // When
        Set<Object> actual = seq.toSet();
        // Then
        Set<Object> expected = new Set<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

}
