/**
 * @see ObjectSequence
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage, PMD.CognitiveComplexity')
private class ObjectSequenceTest {

    /**
     * @see ObjectSequence.of
     * @see ObjectSequence.ofNullable
     * @see ObjectSequence.empty
     * @see ObjectSequence.iterator
     */
    @IsTest
    private static void of() {
        // Given
        List<AsPerson> people = AsTestData.generatePersons();
        people.add(0, null);
        people.add(null);
        List<Object> input = people.clone();
        List<AsPerson> input1;
        Set<Object> input2;
        ObjectEnumerable seq = ObjectSequence.of(input);
        IObjectEnumerable seq1 = ObjectSequence.of(new Set<Object>(input));
        ObjectEnumerable seq2 = ObjectSequence.ofNullable(input);
        ObjectEnumerable seq3 = ObjectSequence.ofNullable(new Set<Object>(input));
        IObjectEnumerable seq4 = ObjectSequence.ofNullable(input1);
        IObjectEnumerable seq5 = ObjectSequence.ofNullable(input2);
        // When
        List<AsPerson> actual = (List<AsPerson>) seq.toList(AsPerson.class);
        List<AsPerson> actual1 = (List<AsPerson>) seq1.toList(AsPerson.class);
        List<AsPerson> actual2 = (List<AsPerson>) seq2.toList(AsPerson.class);
        List<AsPerson> actual3 = (List<AsPerson>) seq3.toList(AsPerson.class);
        List<AsPerson> actual4 = (List<AsPerson>) seq4.toList(AsPerson.class);
        List<AsPerson> actual5 = (List<AsPerson>) seq5.toList(AsPerson.class);
        // Then
        List<Object> expected = new List<Object>(new Set<Object>(input));
        List<AsPerson> expected1 = new List<AsPerson>();
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
        Assert.areEqual(people, input, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.concat
     */
    @IsTest
    private static void concat() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true };
        List<Object> input1 = new List<Object>{ john, 0, 'bar' };
        List<Object> input2 = new List<Object>{ null, jake, 'baz' };
        ObjectEnumerable seq = ObjectSequence.of(input);
        ObjectEnumerable seq1 = ObjectSequence.of(input1);
        IObjectEnumerable seq2 = ObjectSequence.of(input);
        IObjectEnumerable seq3 = ObjectSequence.of(input1);
        IObjectEnumerable seq4 = ObjectSequence.of(input2);
        // When
        List<Object> actual = ObjectSequence.concat(seq, seq1).toList();
        List<Object> actual1 = ObjectSequence.concat(new List<IObjectEnumerable>{ seq2, seq3, seq4 }).toList();
        // Then
        List<Object> expected = new List<Object>{ -5.1, '0', 10L, 3, true, john, 0, 'bar' };
        List<Object> expected1 = new List<Object>{ -5.1, '0', 10L, 3, true, john, 0, 'bar', null, jake, 'baz' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
    }

    /**
     * @see ObjectSequence.zip
     */
    @IsTest
    private static void zip() {
        // Given
        List<Object> input = new List<Object>{ 'foo', 'bar', 'baz' };
        List<Object> input1 = new List<Object>{ 'lorem', '', null };
        ObjectEnumerable seq = ObjectSequence.of(input);
        ObjectEnumerable seq1 = ObjectSequence.of(input1);
        IObjectEnumerable seq2 = ObjectSequence.of(input);
        IObjectEnumerable seq3 = ObjectSequence.of(input1);
        IBiOperator right = BiOperator.right();
        IBiOperator left = BiOperator.left();
        IPredicate alwaysTrue = Predicate.always(true);
        IPredicate isNotBlank = new AsTestCommons.IsNotBlankPredicate();
        IBiPredicate rightIsNotBlank = BiPredicate.every(alwaysTrue, isNotBlank);
        IObjectEnumerable seq4 = ObjectSequence.zip(seq, seq1, right);
        IObjectEnumerable seq5 = ObjectSequence.zip(seq2, seq3, rightIsNotBlank, left);
        // When
        List<Object> actual = seq4.toList();
        List<Object> actual1 = seq5.toList();
        // Then
        Assert.areEqual(new List<Object>{ 'lorem', '', null }, actual);
        Assert.areEqual(new List<Object>{ 'foo' }, actual1);
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
        ObjectEnumerable seq = ObjectSequence.of(input);
        ObjectEnumerable seq1 = ObjectSequence.of(input1);
        ObjectEnumerable seq2 = ObjectSequence.of(input);
        ObjectEnumerable seq3 = ObjectSequence.of(input1);
        IObjectEnumerable seq4 = seq.append(seq1);
        IObjectEnumerable seq5 = seq2.prepend(seq3);
        // When
        List<Object> actual = seq4.toList();
        List<Object> actual1 = seq5.toList();
        // Then
        List<Object> expected = new List<Object>{ 'foo', 1, 'baz', true, 'ipsum', null };
        List<Object> expected1 = new List<Object>{ true, 'ipsum', null, 'foo', 1, 'baz' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
    }

    /**
     * @see ObjectEnumerable.union
     * @see ObjectEnumerable.intersect
     * @see ObjectEnumerable.except
     */
    @IsTest
    private static void setOperations() {
        // Given
        List<Object> input = new List<Object>{ 5, 3, 9, 7, 5, 9, 3, 7 };
        List<Object> input1 = new List<Object>{ 8, 3, 6, 4, 4, 9, 1, 0 };
        ObjectEnumerable seq = ObjectSequence.of(input).union(input1);
        IObjectEnumerable seq1 = ObjectSequence.of(input).union(ObjectSequence.of(input1));
        IObjectEnumerable seq2 = ObjectSequence.of(input).union(input1, Function.identity());
        ObjectEnumerable seq3 = ObjectSequence.of(input).intersect(input1);
        IObjectEnumerable seq4 = ObjectSequence.of(input).intersect(ObjectSequence.of(input1));
        IObjectEnumerable seq5 = ObjectSequence.of(input).intersect(input1, Function.identity());
        ObjectEnumerable seq6 = ObjectSequence.of(input).except(input1);
        IObjectEnumerable seq7 = ObjectSequence.of(input).except(ObjectSequence.of(input1));
        IObjectEnumerable seq8 = ObjectSequence.of(input).except(input1, Function.identity());
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
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
    }

    /**
     * @see ObjectSequence.filter
     */
    @IsTest
    private static void filter() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ 'foo', 1, 'baz', john, true, 'ipsum', jake };
        IPredicate isInstanceOfString = new AsTestCommons.IsInstanceOfStringPredicate();
        IPredicate isInstanceOfComparable = new AsTestCommons.IsInstanceOfComparablePredicate();
        ObjectEnumerable seq = ObjectSequence.of(input).filter(isInstanceOfString);
        IObjectEnumerable seq1 = ObjectSequence.of(input).filter(isInstanceOfString);
        IObjectEnumerable seq2 = ObjectSequence.of(input).filter(isInstanceOfComparable);
        // When
        List<Object> actual = seq.toList();
        List<Object> actual1 = seq1.toList();
        List<Object> actual2 = seq2.toList();
        // Then
        Assert.areEqual(new List<String>{ 'foo', 'baz', 'ipsum' }, actual);
        Assert.areEqual(new List<String>{ 'foo', 'baz', 'ipsum' }, actual1);
        Assert.areEqual(new List<Comparable>{ john, jake }, actual2);
    }

    /**
     * @see ObjectSequence.take
     */
    @IsTest
    private static void take() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ 'foo', '', 'baz', john, true, 'ipsum', jake };
        IPredicate isInstanceOfString = new AsTestCommons.IsInstanceOfStringPredicate();
        ObjectEnumerable seq = ObjectSequence.of(input).take(isInstanceOfString);
        IObjectEnumerable seq1 = ObjectSequence.of(input).take(isInstanceOfString);
        // When
        List<Object> actual = seq.toList();
        List<Object> actual1 = seq1.toList();
        // Then
        Assert.areEqual(new List<Object>{ 'foo', '', 'baz' }, actual);
        Assert.areEqual(new List<Object>{ 'foo', '', 'baz' }, actual1);
    }

    /**
     * @see ObjectSequence.drop
     */
    @IsTest
    private static void drop() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ 'foo', '', 'baz', john, true, 'ipsum', jake };
        IPredicate isInstanceOfString = new AsTestCommons.IsInstanceOfStringPredicate();
        ObjectEnumerable seq = ObjectSequence.of(input).drop(isInstanceOfString);
        IObjectEnumerable seq1 = ObjectSequence.of(input).drop(isInstanceOfString);
        // When
        List<Object> actual = seq.toList();
        List<Object> actual1 = seq1.toList();
        // Then
        Assert.areEqual(new List<Object>{ john, true, 'ipsum', jake }, actual);
        Assert.areEqual(new List<Object>{ john, true, 'ipsum', jake }, actual1);
    }

    /**
     * @see ObjectEnumerable.withoutNulls
     */
    @IsTest
    private static void withoutNulls() {
        // Given
        Object john = (Object) new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        Object jake = (Object) new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ 'foo', '', jake, null, 'baz', john, true, 'ipsum', jake, null };
        List<Object> clone = AsTestCommons.deepClone(input);
        ObjectEnumerable seq = ObjectSequence.of(clone).withoutNulls();
        IObjectEnumerable seq1 = ObjectSequence.of(clone).withoutNulls();
        // When
        List<Object> actual = seq.toList();
        List<Object> actual1 = seq1.toList();
        // Then
        List<Object> expected = new List<Object>{ 'foo', '', jake, 'baz', john, true, 'ipsum', jake };
        Assert.areEqual(AsTestCommons.deepClone(expected), actual);
        Assert.areEqual(AsTestCommons.deepClone(expected), actual1);
        Assert.areEqual(AsTestCommons.deepClone(input), clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.mapTo
     */
    @IsTest
    private static void mapTo() {
        // Given
        List<String> input = new List<String>{ 'foo', '', 'baz', 'ipsum', 'Hello' };
        List<String> clone = (List<String>) AsTestCommons.deepClone(input, List<String>.class);
        ObjectEnumerable seq = ObjectSequence.of(clone).mapTo(new AsTestCommons.Capitalize());
        IObjectEnumerable seq1 = ObjectSequence.of(clone).mapTo(new AsTestCommons.Capitalize());
        // When
        List<Object> actual = seq.toList();
        List<String> actual1 = (List<String>) seq1.toList(String.class);
        // Then
        List<Object> expected = new List<Object>{ 'Foo', '', 'Baz', 'Ipsum', 'Hello' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.mapToInt
     */
    @IsTest
    private static void mapToInt() {
        // Given
        List<String> input = new List<String>{ 'foo', '', 'baz', 'ipsum', 'Hello' };
        List<String> clone = (List<String>) AsTestCommons.deepClone(input, List<String>.class);
        IntEnumerable intSeq = ObjectSequence.of(clone).mapToInt(new AsTestCommons.Length());
        IIntEnumerable intSeq1 = ObjectSequence.of(clone).mapToInt(new AsTestCommons.Length());
        // When
        List<Integer> actual = intSeq.toList();
        List<Integer> actual1 = (List<Integer>) intSeq1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 3, 0, 3, 5, 5 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.mapToLong
     */
    @IsTest
    private static void mapToLong() {
        // Given
        List<String> input = new List<String>{ '6', '0', '1', '3', '-9', '-6', '4', '4' };
        List<String> clone = (List<String>) AsTestCommons.deepClone(input, List<String>.class);
        LongEnumerable longSeq = ObjectSequence.of(clone).mapToLong(new AsTestCommons.LongValueOf());
        ILongEnumerable longSeq1 = ObjectSequence.of(clone).mapToLong(new AsTestCommons.LongValueOf());
        // When
        List<Long> actual = longSeq.toList();
        List<Long> actual1 = (List<Long>) longSeq1.toList();
        // Then
        List<Long> expected = new List<Long>{ 6L, 0L, 1L, 3L, -9L, -6L, 4L, 4L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.mapToDouble
     */
    @IsTest
    private static void mapToDouble() {
        // Given
        List<String> input = new List<String>{ '6.1', '0.0', '1.66', '3.06', '-8.99', '-6.4', '4.0', '4.0' };
        List<String> clone = (List<String>) AsTestCommons.deepClone(input, List<String>.class);
        DoubleEnumerable doubleSeq = ObjectSequence.of(clone).mapToDouble(new AsTestCommons.DoubleValueOf());
        IDoubleEnumerable doubleSeq1 = ObjectSequence.of(clone).mapToDouble(new AsTestCommons.DoubleValueOf());
        // When
        List<Double> actual = doubleSeq.toList();
        List<Double> actual1 = (List<Double>) doubleSeq1.toList();
        // Then
        List<Double> expected = new List<Double>{ 6.1, 0.0, 1.66, 3.06, -8.99, -6.4, 4.0, 4.0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.mapToSObject
     */
    @IsTest
    private static void mapToSObject() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ john, jake };
        List<Object> clone = AsTestCommons.deepClone(input, List<AsPerson>.class);
        SObjectEnumerable sObjSeq = ObjectSequence.of(clone).mapToSObject(new AsTestCommons.ConvertToUser());
        ISObjectEnumerable sObjSeq1 = ObjectSequence.of(clone).mapToSObject(new AsTestCommons.ConvertToUser());
        // When
        List<SObject> actual = sObjSeq.toList();
        List<SObject> actual1 = (List<SObject>) sObjSeq1.toList();
        // Then
        List<User> expected = new List<User>{ new User(LastName = 'John', IsActive = true), new User(LastName = 'Jake', IsActive = true) };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        ObjectEnumerable objSeq = ObjectSequence.of(clone).flatMapTo(Function.identity());
        IObjectEnumerable objSeq1 = ObjectSequence.of(clone).flatMapTo(Function.identity());
        // When
        List<String> actual = (List<String>) objSeq.toList(String.class);
        List<String> actual1 = (List<String>) objSeq1.toList(String.class);
        // Then
        List<String> expected = new List<String>{ 'foo', 'bar', 'baz' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        IntEnumerable intSeq = ObjectSequence.of(clone).flatMapToInt(Function.identity());
        IIntEnumerable intSeq1 = ObjectSequence.of(clone).flatMapToInt(Function.identity());
        // When
        List<Integer> actual = intSeq.toList();
        List<Integer> actual1 = (List<Integer>) intSeq1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 1, 0, 2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        LongEnumerable longSeq = ObjectSequence.of(clone).flatMapToLong(Function.identity());
        ILongEnumerable longSeq1 = ObjectSequence.of(clone).flatMapToLong(Function.identity());
        // When
        List<Long> actual = longSeq.toList();
        List<Long> actual1 = (List<Long>) longSeq1.toList();
        // Then
        List<Long> expected = new List<Long>{ 1L, 0L, 2L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        DoubleEnumerable doubleSeq = ObjectSequence.of(clone).flatMapToDouble(Function.identity());
        IDoubleEnumerable doubleSeq1 = ObjectSequence.of(clone).flatMapToDouble(Function.identity());
        // When
        List<Double> actual = doubleSeq.toList();
        List<Double> actual1 = (List<Double>) doubleSeq1.toList();
        // Then
        List<Double> expected = new List<Double>{ 1.1, 0, Math.PI };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.flatMapToSObject
     */
    @IsTest
    private static void flatMapToSObject() {
        // Given
        List<Account> accounts = AsTestData.generateAccounts1();
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
        SObjectEnumerable doubleSeq = ObjectSequence.of(clone).flatMapToSObject(Function.identity());
        ISObjectEnumerable doubleSeq1 = ObjectSequence.of(clone).flatMapToSObject(Function.identity());
        // When
        List<Account> actual = doubleSeq.toList();
        List<Account> actual1 = (List<Account>) doubleSeq1.toList();
        // Then
        List<Account> expected = new List<Account>{ accounts[1], accounts[0], accounts[2] };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.forEach
     */
    @IsTest
    private static void forEach() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        AsPerson sam = new AsPerson('Sam', 16, Date.newInstance(2005, 2, 3), 2L, false);
        AsPerson lucy = new AsPerson('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<AsPerson> input = new List<AsPerson>{ john, jake, sam, lucy };
        List<AsPerson> clone = (List<AsPerson>) AsTestCommons.deepClone(input, List<AsPerson>.class);
        Long value = 0L;
        ObjectEnumerable seq = ObjectSequence.of(clone).forEach(new AsTestCommons.SetAutoId(value));
        IObjectEnumerable seq1 = ObjectSequence.of(clone).forEach(new AsTestCommons.SetAutoId(value));
        // When
        List<AsPerson> actual = (List<AsPerson>) seq.toList(AsPerson.class);
        List<AsPerson> actual1 = (List<AsPerson>) seq1.toList(AsPerson.class);
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            Assert.areEqual(value, actual[i].getAutoId());
            Assert.areEqual(value, actual1[i].getAutoId());
        }
        Assert.areNotEqual(input, clone, Label.AS_ErrorMessage_InputNotMutated);
    }

    /**
     * @see ObjectSequence.distinct
     */
    @IsTest
    private static void distinct() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 0L, true);
        List<Object> input = new List<Object>{ john, jake, 'foo', 1, 'foo', jake };
        List<Object> clone =  AsTestCommons.deepClone(input);
        ObjectEnumerable seq = ObjectSequence.of(clone).distinct();
        IObjectEnumerable seq1 = ObjectSequence.of(input).filter(new AsTestCommons.IsInstanceOfComparablePredicate()).distinct(new AsTestCommons.GetIdFunction());
        // When
        List<Object> actual = seq.toList();
        List<Object> actual1 = seq1.toList();
        // Then
        List<Object> expected = new List<Object>{ john, jake, 'foo', 1 };
        List<Object> expected1 = new List<Object>{ john };
        Assert.areEqual(AsTestCommons.deepClone(expected), actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(AsTestCommons.deepClone(input), clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.sort
     */
    @IsTest
    private static void sort() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 2L, true);
        AsPerson sam = new AsPerson('Sam', 16, Date.newInstance(2005, 2, 3), 0L, true);
        AsPerson lucy = new AsPerson('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<AsPerson> input = new List<AsPerson>{ john, jake, null, sam, lucy };
        List<String> input1 = new List<String>{ 'foo', 'bar', 'baz', '', null };
        List<AsPerson> clone = new List<AsPerson>{ john, jake, null, sam, lucy };
        List<String> clone1 = (List<String>) AsTestCommons.deepClone(input1, List<String>.class);
        ObjectEnumerable seq = ObjectSequence.of(clone).sort();
        ObjectEnumerable seq1 = ObjectSequence.of(input1).sort();
        IObjectEnumerable seq2 = ObjectSequence.of(clone).sort(Comparer.nullsLast(Comparer.defaultOrder()));
        IObjectEnumerable seq3 = ObjectSequence.of(clone1).sort(Comparer.reverseOrder());
        IObjectEnumerable seq4 = ObjectSequence.of(clone1).sort(SortOrder.DESCENDING);
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
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected2, actual2);
        Assert.areEqual(expected3, actual3);
        Assert.areEqual(expected3, actual4);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.lim
     */
    @IsTest
    private static void lim() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        ObjectEnumerable seq = ObjectSequence.of(clone).lim(25);
        ObjectEnumerable seq1 = ObjectSequence.of(clone).lim(3);
        IObjectEnumerable seq2 = ObjectSequence.of(clone).lim(0);
        IObjectEnumerable seq3 = ObjectSequence.of(clone);
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
        Assert.areEqual(input, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(IllegalArgumentException.class.getName(), exc1.getTypeName());
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.skip
     */
    @IsTest
    private static void skip() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        ObjectEnumerable seq = ObjectSequence.of(clone).skip(5);
        IObjectEnumerable seq1 = ObjectSequence.of(clone).skip(0);
        IObjectEnumerable seq2 = ObjectSequence.of(clone).skip(25);
        IObjectEnumerable seq3 = ObjectSequence.of(clone);
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
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(IllegalArgumentException.class.getName(), exc1.getTypeName());
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.reduce
     */
    @IsTest
    private static void reduce() {
        // Given
        List<String> input = new List<String>{ 'foo', 'bar', 'baz', 'lorem' };
        List<Integer> input1 = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<String> clone = (List<String>) AsTestCommons.deepClone(input, List<String>.class);
        List<Integer> clone1 = (List<Integer>) AsTestCommons.deepClone(input1, List<Integer>.class);
        ObjectEnumerable seq = ObjectSequence.of(clone);
        IObjectEnumerable seq1 = ObjectSequence.of(clone1);
        String seed = 'seed';
        // When
        String actual = (String) seq.reduce(seed, new AsTestCommons.Concat());
        Integer actual1 = (Integer) seq1.reduce(new AsTestCommons.SumIntBiOperator()).get();
        // Then
        String expected = 'seedfoobarbazlorem';
        Integer expected1 = 16;
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual('seed', seed, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.collect
     */
    @IsTest
    private static void collect() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 2L, false);
        AsPerson sam = new AsPerson('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        AsPerson lucy = new AsPerson('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<Object> input = new List<Object>{ john, jake, sam, lucy, lucy, jake };
        List<Object> clone = new List<Object>{ john, jake, sam, lucy, lucy, jake };
        List<Object> clone1 = new List<Object>{ john, jake, sam, lucy, lucy, jake };
        ObjectEnumerable seq = ObjectSequence.of(clone);
        IObjectEnumerable seq1 = ObjectSequence.of(clone1);
        ICollector toObjectSetCollector = Collector.of(Supplier.of(Set<Object>.class), new AsTestCommons.AddToSet());
        // When
        Set<Object> actual = (Set<Object>) seq.collect(toObjectSetCollector);
        Set<Object> actual1 = (Set<Object>) seq1.collect(toObjectSetCollector);
        // Then
        Set<Object> expected = new Set<Object>{ john, jake, sam, lucy };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone1, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.find
     */
    @IsTest
    private static void find() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        AsPerson sam = new AsPerson('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        AsPerson lucy = new AsPerson('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<Object> input = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        List<Object> clone = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        List<Object> clone1 = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        ObjectEnumerable seq = ObjectSequence.of(clone);
        IObjectEnumerable seq1 = ObjectSequence.of(clone1);
        Integer elseValue = 42;
        // When
        String actual = (String) seq.find(new AsTestCommons.IsInstanceOfStringPredicate()).get();
        Integer actual1 = (Integer) seq1.find(new AsTestCommons.IsInstanceOfIntPredicate()).orElse(elseValue);
        // Then
        Assert.areEqual('jake', actual);
        Assert.areEqual(elseValue, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone1, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.every
     */
    @IsTest
    private static void every() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        AsPerson sam = new AsPerson('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        AsPerson lucy = new AsPerson('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<Object> input = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        List<Object> clone = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        List<Object> clone1 = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        ObjectEnumerable seq = ObjectSequence.of(clone);
        IObjectEnumerable seq1 = ObjectSequence.of(clone1);
        // When
        Boolean actual = seq.every(new AsTestCommons.IsInstanceOfStringPredicate());
        Boolean actual1 = seq1.every(new AsTestCommons.IsInstanceOfIntPredicate().negate());
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone1, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.some
     */
    @IsTest
    private static void some() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        AsPerson sam = new AsPerson('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        AsPerson lucy = new AsPerson('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<Object> input = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        List<Object> clone = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        List<Object> clone1 = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        ObjectEnumerable seq = ObjectSequence.of(clone);
        IObjectEnumerable seq1 = ObjectSequence.of(clone1);
        // When
        Boolean actual = seq.some(new AsTestCommons.IsInstanceOfStringPredicate());
        Boolean actual1 = seq1.some(new AsTestCommons.IsInstanceOfIntPredicate());
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone1, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectEnumerable.none
     */
    @IsTest
    private static void none() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        AsPerson sam = new AsPerson('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        AsPerson lucy = new AsPerson('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<Object> input = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        List<Object> clone = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        List<Object> clone1 = new List<Object>{ john, 'jake', sam, 'lucy', lucy, 'jake' };
        ObjectEnumerable seq = ObjectSequence.of(clone);
        IObjectEnumerable seq1 = ObjectSequence.of(clone1);
        // When
        Boolean actual = seq.none(new AsTestCommons.IsInstanceOfStringPredicate());
        Boolean actual1 = seq1.none(new AsTestCommons.IsInstanceOfIntPredicate());
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone1, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectEnumerable.max
     */
    @IsTest
    private static void max() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 2L, false);
        AsPerson sam = new AsPerson('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        AsPerson lucy = new AsPerson('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<AsPerson> input = new List<AsPerson>{ john, jake, sam, lucy, lucy, jake };
        List<String> input1 = new List<String>{ 'a', 'jake', 'foo', 'lucy', 'bar', 'jake' };
        List<AsPerson> clone = new List<AsPerson>{ john, jake, sam, lucy, lucy, jake };
        List<String> clone1 = (List<String>) AsTestCommons.deepClone(input1, List<String>.class);
        ObjectEnumerable seq = ObjectSequence.of(clone);
        IObjectEnumerable seq1 = ObjectSequence.of(clone1);
        IComparer defaultOrderComparer = Comparer.defaultOrder();
        // When
        AsPerson actual = (AsPerson) seq.max(defaultOrderComparer).get();
        String actual1 = (String) seq1.max(defaultOrderComparer).get();
        // Then
        Assert.areEqual(lucy, actual);
        Assert.areEqual('lucy', actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input1, clone1, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectEnumerable.min
     */
    @IsTest
    private static void min() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 2L, false);
        AsPerson sam = new AsPerson('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        AsPerson lucy = new AsPerson('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<AsPerson> input = new List<AsPerson>{ john, jake, sam, lucy, lucy, jake };
        List<String> input1 = new List<String>{ 'a', 'jake', 'foo', 'lucy', 'bar', 'jake' };
        List<AsPerson> clone = new List<AsPerson>{ john, jake, sam, lucy, lucy, jake };
        List<String> clone1 = (List<String>) AsTestCommons.deepClone(input1, List<String>.class);
        ObjectEnumerable seq = ObjectSequence.of(clone);
        IObjectEnumerable seq1 = ObjectSequence.of(clone1);
        IComparer defaultOrderComparer = Comparer.defaultOrder();
        // When
        AsPerson actual = (AsPerson) seq.min(defaultOrderComparer).get();
        String actual1 = (String) seq1.min(defaultOrderComparer).get();
        // Then
        Assert.areEqual(sam, actual);
        Assert.areEqual('a', actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input1, clone1, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.count
     */
    @IsTest
    private static void count() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        ObjectEnumerable seq = ObjectSequence.of(clone);
        IObjectEnumerable seq1 = ObjectSequence.of(new List<Object>());
        IObjectEnumerable seq2 = ObjectSequence.empty();
        // When
        Integer actual = seq.count();
        Integer actual1 = seq1.count();
        Integer actual2 = seq2.count();
        // Then
        Assert.areEqual(input.size(), actual);
        Assert.areEqual(0, actual1);
        Assert.areEqual(0, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.isEmpty
     */
    @IsTest
    private static void isEmpty() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        ObjectEnumerable seq = ObjectSequence.of(clone);
        IObjectEnumerable seq1 = ObjectSequence.of(new List<Object>());
        IObjectEnumerable seq2 = ObjectSequence.empty();
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
     * @see ObjectSequence.toList
     */
    @IsTest
    private static void toList() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 2L, false);
        AsPerson sam = new AsPerson('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        AsPerson lucy = new AsPerson('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<AsPerson> input = new List<AsPerson>{ john, jake, sam, lucy, lucy, jake };
        List<AsPerson> clone = (List<AsPerson>) AsTestCommons.deepClone(input, List<AsPerson>.class);
        List<Object> input1 = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone1 = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        ObjectEnumerable seq = ObjectSequence.of(clone);
        IObjectEnumerable seq1 = ObjectSequence.of(clone1);
        // When
        List<AsPerson> actual = (List<AsPerson>) seq.toList(AsPerson.class);
        List<Object> actual1 = seq1.toList();
        // Then
        Assert.areEqual(input, actual);
        Assert.areEqual(input1, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input1, clone1, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see ObjectSequence.toSet
     */
    @IsTest
    private static void toSet() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI, 3, '0' };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI, 3, '0' };
        ObjectEnumerable seq = ObjectSequence.of(clone);
        IObjectEnumerable seq1 = ObjectSequence.of(clone);
        // When
        Set<Object> actual = (Set<Object>) seq.toSet();
        Set<Object> actual1 = (Set<Object>) seq1.toSet();
        // Then
        Set<Object> expected = new Set<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

}
