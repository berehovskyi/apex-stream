/**
 * @see ObjectStream
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings(
    'PMD.ApexAssertionsShouldIncludeMessage, PMD.ApexUnitTestClassShouldHaveRunAs, PMD.CognitiveComplexity, PMD.CyclomaticComplexity'
)
private class ObjectStreamTest {

    /**
     * @see ObjectStream.of
     * @see ObjectStream.ofNullable
     * @see ObjectStream.empty
     * @see ObjectStream.iterator
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
        ObjectEnumerable stm = ObjectStream.of(input);
        IObjectEnumerable stm1 = ObjectStream.of(new Set<Object>(input));
        ObjectEnumerable stm2 = ObjectStream.ofNullable(input);
        ObjectEnumerable stm3 = ObjectStream.ofNullable(new Set<Object>(input));
        IObjectEnumerable stm4 = ObjectStream.ofNullable(input1);
        IObjectEnumerable stm5 = ObjectStream.ofNullable(input2);
        IObjectEnumerable stm6 = ObjectStream.of(input.iterator());
        // When
        List<AsPerson> actual = (List<AsPerson>) stm.toList(AsPerson.class);
        List<AsPerson> actual1 = (List<AsPerson>) stm1.toList(AsPerson.class);
        List<AsPerson> actual2 = (List<AsPerson>) stm2.toList(AsPerson.class);
        List<AsPerson> actual3 = (List<AsPerson>) stm3.toList(AsPerson.class);
        List<AsPerson> actual4 = (List<AsPerson>) stm4.toList(AsPerson.class);
        List<AsPerson> actual5 = (List<AsPerson>) stm5.toList(AsPerson.class);
        List<AsPerson> actual6 = (List<AsPerson>) stm6.toList(AsPerson.class);
        // Then
        List<Object> expected = new List<Object>(new Set<Object>(input));
        List<AsPerson> expected1 = new List<AsPerson>();
        Assert.areEqual(input, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(input, actual6);
        Assert.areEqual(people, input, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
        Assert.isTrue(((ObjectStream) stm2).isOperated);
        Assert.isTrue(((ObjectStream) stm3).isOperated);
        Assert.isTrue(((ObjectStream) stm4).isOperated);
        Assert.isTrue(((ObjectStream) stm5).isOperated);
        Assert.isTrue(((ObjectStream) stm6).isOperated);
    }

    /**
     * @see ObjectStream.generate
     */
    @IsTest
    @SuppressWarnings('PMD.OneDeclarationPerLine')
    private static void generate() {
        // Given
        ISupplier idSupplier = new AsTestCommons.IdSupplier(Account.SObjectType);
        Integer lim = 10;
        ObjectEnumerable stm = ObjectStream.generate(idSupplier).lim(lim);
        IObjectEnumerable stm1 = ObjectStream.generate(idSupplier).lim(lim);
        // When
        List<String> actual = (List<String>) stm.toList(String.class);
        List<String> actual1 = (List<String>) stm1.toList(String.class);
        // Then
        Assert.areEqual(lim, actual.size());
        Assert.areEqual(lim, actual1.size());
        for (Integer i = 0, size = actual.size(); i < size; i++) {
            Assert.isTrue(actual[i] != null);
            Assert.isTrue(actual1[i] != null);
        }
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
    }

    /**
     * @see ObjectStream.iterate
     */
    @IsTest
    private static void iterate() {
        // Given
        Integer value = 5;
        IOperator increment = new AsTestCommons.AddIntOp(1);
        IOperator add = new AsTestCommons.AddIntOp(value);
        IOperator subtract = new AsTestCommons.AddIntOp(-value);
        IFunction toInt = new AsTestCommons.IntValueOf();
        IPredicate isPositive = new AsTestCommons.IsGreaterPredicate(0);
        Integer seed = 100;
        Integer seed1 = 10;
        Integer seed2 = 50;
        IPredicate isPositiveObj = Predicate.compose(toInt, isPositive);
        Integer lim = 10;
        ObjectEnumerable stm = ObjectStream.iterate(seed, increment).lim(lim);
        ObjectEnumerable stm1 = ObjectStream.iterate(seed1, add).lim(lim).lim(lim);
        IObjectEnumerable stm2 = ObjectStream.iterate(seed2, isPositiveObj, subtract);
        // When
        List<Object> actual = stm.toList();
        List<Object> actual1 = stm1.toList();
        List<Object> actual2 = stm2.toList();
        // Then
        Assert.areEqual(lim, actual.size());
        Assert.areEqual(lim, actual1.size());
        Assert.areEqual(lim, actual2.size());
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
        Assert.isTrue(((ObjectStream) stm2).isOperated);
    }

    /**
     * @see ObjectStream.concat
     */
    @IsTest
    private static void concat() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true };
        List<Object> input1 = new List<Object>{ john, 0, 'bar' };
        List<Object> input2 = new List<Object>{ null, jake, 'baz' };
        ObjectEnumerable stm = ObjectStream.of(input);
        ObjectEnumerable stm1 = ObjectStream.of(input1);
        IObjectEnumerable stm2 = ObjectStream.of(input);
        IObjectEnumerable stm3 = ObjectStream.of(input1);
        IObjectEnumerable stm4 = ObjectStream.of(input2);
        // When
        List<Object> actual = ObjectStream.concat(stm, stm1).toList();
        List<Object> actual1 = ObjectStream.concat(new List<IObjectEnumerable>{ stm2, stm3, stm4 }).toList();
        // Then
        List<Object> expected = new List<Object>{ -5.1, '0', 10L, 3, true, john, 0, 'bar' };
        List<Object> expected1 = new List<Object>{ -5.1, '0', 10L, 3, true, john, 0, 'bar', null, jake, 'baz' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
    }

    /**
     * @see ObjectStream.zip
     */
    @IsTest
    private static void zip() {
        // Given
        List<Object> input = new List<Object>{ 'foo', 'bar', 'baz' };
        List<Object> input1 = new List<Object>{ 'lorem', '', null };
        ObjectEnumerable stm = ObjectStream.of(input);
        ObjectEnumerable stm1 = ObjectStream.of(input1);
        IObjectEnumerable stm2 = ObjectStream.of(input);
        IObjectEnumerable stm3 = ObjectStream.of(input1);
        IBiOperator right = BiOperator.right();
        IBiOperator left = BiOperator.left();
        IPredicate alwaysTrue = Predicate.always(true);
        IPredicate isNotBlank = new AsTestCommons.IsNotBlankPredicate();
        IBiPredicate rightIsNotBlank = BiPredicate.every(alwaysTrue, isNotBlank);
        IObjectEnumerable stm4 = ObjectStream.zip(stm, stm1, right);
        IObjectEnumerable stm5 = ObjectStream.zip(stm2, stm3, rightIsNotBlank, left);
        // When
        List<Object> actual = stm4.toList();
        List<Object> actual1 = stm5.toList();
        // Then
        Assert.areEqual(new List<Object>{ 'lorem', '', null }, actual);
        Assert.areEqual(new List<Object>{ 'foo' }, actual1);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
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
        ObjectEnumerable stm = ObjectStream.of(input);
        ObjectEnumerable stm1 = ObjectStream.of(input1);
        ObjectEnumerable stm2 = ObjectStream.of(input);
        ObjectEnumerable stm3 = ObjectStream.of(input1);
        IObjectEnumerable stm4 = stm.append(stm1);
        IObjectEnumerable stm5 = stm2.prepend(stm3);
        // When
        List<Object> actual = stm4.toList();
        List<Object> actual1 = stm5.toList();
        // Then
        List<Object> expected = new List<Object>{ 'foo', 1, 'baz', true, 'ipsum', null };
        List<Object> expected1 = new List<Object>{ true, 'ipsum', null, 'foo', 1, 'baz' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
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
        ObjectEnumerable stm = ObjectStream.of(input).union(input1);
        IObjectEnumerable stm1 = ObjectStream.of(input).union(ObjectStream.of(input1));
        IObjectEnumerable stm2 = ObjectStream.of(input).union(input1, Function.identity());
        ObjectEnumerable stm3 = ObjectStream.of(input).intersect(input1);
        IObjectEnumerable stm4 = ObjectStream.of(input).intersect(ObjectStream.of(input1));
        IObjectEnumerable stm5 = ObjectStream.of(input).intersect(input1, Function.identity());
        ObjectEnumerable stm6 = ObjectStream.of(input).except(input1);
        IObjectEnumerable stm7 = ObjectStream.of(input).except(ObjectStream.of(input1));
        IObjectEnumerable stm8 = ObjectStream.of(input).except(input1, Function.identity());
        // When
        List<Object> actual = stm.toList();
        List<Object> actual1 = stm1.toList();
        List<Object> actual2 = stm2.toList();
        List<Object> actual3 = stm3.toList();
        List<Object> actual4 = stm4.toList();
        List<Object> actual5 = stm5.toList();
        List<Object> actual6 = stm6.toList();
        List<Object> actual7 = stm7.toList();
        List<Object> actual8 = stm8.toList();
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
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
        Assert.isTrue(((ObjectStream) stm2).isOperated);
        Assert.isTrue(((ObjectStream) stm3).isOperated);
        Assert.isTrue(((ObjectStream) stm4).isOperated);
        Assert.isTrue(((ObjectStream) stm5).isOperated);
    }

    /**
     * @see ObjectStream.filter
     */
    @IsTest
    private static void filter() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ 'foo', 1, 'baz', john, true, 'ipsum', jake };
        IPredicate isInstanceOfString = new AsTestCommons.IsInstanceOfStringPredicate();
        IPredicate isInstanceOfComparable = new AsTestCommons.IsInstanceOfComparablePredicate();
        ObjectEnumerable stm = ObjectStream.of(input).filter(isInstanceOfString);
        IObjectEnumerable stm1 = ObjectStream.of(input).filter(isInstanceOfString);
        IObjectEnumerable stm2 = ObjectStream.of(input).filter(isInstanceOfComparable);
        // When
        List<Object> actual = stm.toList();
        List<Object> actual1 = stm1.toList();
        List<Object> actual2 = stm2.toList();
        // Then
        Assert.areEqual(new List<String>{ 'foo', 'baz', 'ipsum' }, actual);
        Assert.areEqual(new List<String>{ 'foo', 'baz', 'ipsum' }, actual1);
        Assert.areEqual(new List<Comparable>{ john, jake }, actual2);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
        Assert.isTrue(((ObjectStream) stm2).isOperated);
    }

    /**
     * @see ObjectStream.take
     */
    @IsTest
    private static void take() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ 'foo', '', 'baz', john, true, 'ipsum', jake };
        Predicate isInstanceOfString = new AsTestCommons.IsInstanceOfStringPredicate();
        ObjectEnumerable stm = ObjectStream.of(input).take(isInstanceOfString);
        IObjectEnumerable stm1 = ObjectStream.of(input).take(isInstanceOfString);
        IObjectEnumerable stm2 = ObjectStream.of(input).take(isInstanceOfString.andAlso(new AsTestCommons.IsNotBlankPredicate()));
        // When
        List<Object> actual = stm.toList();
        List<Object> actual1 = stm1.toList();
        Iterator<Object> iterator = stm2.iterator();
        // Then
        Assert.areEqual(new List<Object>{ 'foo', '', 'baz' }, actual);
        Assert.areEqual(new List<Object>{ 'foo', '', 'baz' }, actual1);
        Assert.areEqual(input[0], iterator.next());
        try {
            iterator.next();
        } catch (Exception exc) {
            Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
        }
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
        Assert.isTrue(((ObjectStream) stm2).isOperated);
    }

    /**
     * @see ObjectStream.drop
     */
    @IsTest
    private static void drop() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ 'foo', '', 'baz', john, true, 'ipsum', jake };
        IPredicate isInstanceOfString = new AsTestCommons.IsInstanceOfStringPredicate();
        ObjectEnumerable stm = ObjectStream.of(input).drop(isInstanceOfString);
        IObjectEnumerable stm1 = ObjectStream.of(input).drop(isInstanceOfString);
        // When
        List<Object> actual = stm.toList();
        List<Object> actual1 = stm1.toList();
        // Then
        Assert.areEqual(new List<Object>{ john, true, 'ipsum', jake }, actual);
        Assert.areEqual(new List<Object>{ john, true, 'ipsum', jake }, actual1);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
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
        ObjectEnumerable stm = ObjectStream.of(clone).withoutNulls();
        IObjectEnumerable stm1 = ObjectStream.of(clone).withoutNulls();
        // When
        List<Object> actual = stm.toList();
        List<Object> actual1 = stm1.toList();
        // Then
        List<Object> expected = new List<Object>{ 'foo', '', jake, 'baz', john, true, 'ipsum', jake };
        Assert.areEqual(AsTestCommons.deepClone(expected), actual);
        Assert.areEqual(AsTestCommons.deepClone(expected), actual1);
        Assert.areEqual(AsTestCommons.deepClone(input), clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
    }

    /**
     * @see ObjectStream.mapTo
     */
    @IsTest
    private static void mapTo() {
        // Given
        List<String> input = new List<String>{ 'foo', '', 'baz', 'ipsum', 'Hello' };
        List<String> clone = (List<String>) AsTestCommons.deepClone(input, List<String>.class);
        ObjectEnumerable stm = ObjectStream.of(clone).mapTo(new AsTestCommons.Capitalize());
        IObjectEnumerable stm1 = ObjectStream.of(clone).mapTo(new AsTestCommons.Capitalize());
        // When
        List<Object> actual = stm.toList();
        List<String> actual1 = (List<String>) stm1.toList(String.class);
        // Then
        List<Object> expected = new List<Object>{ 'Foo', '', 'Baz', 'Ipsum', 'Hello' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
    }

    /**
     * @see ObjectStream.mapToInt
     */
    @IsTest
    private static void mapToInt() {
        // Given
        List<String> input = new List<String>{ 'foo', '', 'baz', 'ipsum', 'Hello' };
        List<String> clone = (List<String>) AsTestCommons.deepClone(input, List<String>.class);
        IntEnumerable stm = ObjectStream.of(clone).mapToInt(new AsTestCommons.Length());
        IIntEnumerable stm1 = ObjectStream.of(clone).mapToInt(new AsTestCommons.Length());
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = (List<Integer>) stm1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 3, 0, 3, 5, 5 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
    }

    /**
     * @see ObjectStream.mapToLong
     */
    @IsTest
    private static void mapToLong() {
        // Given
        List<String> input = new List<String>{ '6', '0', '1', '3', '-9', '-6', '4', '4' };
        List<String> clone = (List<String>) AsTestCommons.deepClone(input, List<String>.class);
        LongEnumerable stm = ObjectStream.of(clone).mapToLong(new AsTestCommons.LongValueOf());
        ILongEnumerable stm1 = ObjectStream.of(clone).mapToLong(new AsTestCommons.LongValueOf());
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
     * @see ObjectStream.mapToDouble
     */
    @IsTest
    private static void mapToDouble() {
        // Given
        List<String> input = new List<String>{ '6.1', '0.0', '1.66', '3.06', '-8.99', '-6.4', '4.0', '4.0' };
        List<String> clone = (List<String>) AsTestCommons.deepClone(input, List<String>.class);
        DoubleEnumerable stm = ObjectStream.of(clone).mapToDouble(new AsTestCommons.DoubleValueOf());
        IDoubleEnumerable stm1 = ObjectStream.of(clone).mapToDouble(new AsTestCommons.DoubleValueOf());
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = (List<Double>) stm1.toList();
        // Then
        List<Double> expected = new List<Double>{ 6.1, 0.0, 1.66, 3.06, -8.99, -6.4, 4.0, 4.0 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see ObjectStream.mapToSObject
     */
    @IsTest
    private static void mapToSObject() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        List<Object> input = new List<Object>{ john, jake };
        List<Object> clone = AsTestCommons.deepClone(input, List<AsPerson>.class);
        SObjectEnumerable stm = ObjectStream.of(clone).mapToSObject(new AsTestCommons.ConvertToUser());
        ISObjectEnumerable stm1 = ObjectStream.of(clone).mapToSObject(new AsTestCommons.ConvertToUser());
        // When
        List<SObject> actual = stm.toList();
        List<SObject> actual1 = (List<SObject>) stm1.toList();
        // Then
        List<User> expected = new List<User>{ new User(LastName = 'John', IsActive = true), new User(LastName = 'Jake', IsActive = true) };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) stm).isOperated);
        Assert.isTrue(((SObjectStream) stm1).isOperated);
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
        ObjectEnumerable stm = ObjectStream.of(clone).flatMapTo(Function.identity());
        IObjectEnumerable stm1 = ObjectStream.of(clone).flatMapTo(Function.identity());
        // When
        List<String> actual = (List<String>) stm.toList(String.class);
        List<String> actual1 = (List<String>) stm1.toList(String.class);
        // Then
        List<String> expected = new List<String>{ 'foo', 'bar', 'baz' };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
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
        IntEnumerable stm = ObjectStream.of(clone).flatMapToInt(Function.identity());
        IIntEnumerable stm1 = ObjectStream.of(clone).flatMapToInt(Function.identity());
        // When
        List<Integer> actual = stm.toList();
        List<Integer> actual1 = (List<Integer>) stm1.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 1, 0, 2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) stm).isOperated);
        Assert.isTrue(((IntStream) stm1).isOperated);
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
        LongEnumerable stm = ObjectStream.of(clone).flatMapToLong(Function.identity());
        ILongEnumerable stm1 = ObjectStream.of(clone).flatMapToLong(Function.identity());
        // When
        List<Long> actual = stm.toList();
        List<Long> actual1 = (List<Long>) stm1.toList();
        // Then
        List<Long> expected = new List<Long>{ 1L, 0L, 2L };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) stm).isOperated);
        Assert.isTrue(((LongStream) stm1).isOperated);
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
        DoubleEnumerable stm = ObjectStream.of(clone).flatMapToDouble(Function.identity());
        IDoubleEnumerable stm1 = ObjectStream.of(clone).flatMapToDouble(Function.identity());
        // When
        List<Double> actual = stm.toList();
        List<Double> actual1 = (List<Double>) stm1.toList();
        // Then
        List<Double> expected = new List<Double>{ 1.1, 0, Math.PI };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) stm).isOperated);
        Assert.isTrue(((DoubleStream) stm1).isOperated);
    }

    /**
     * @see ObjectStream.flatMapToSObject
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
        SObjectEnumerable stm = ObjectStream.of(clone).flatMapToSObject(Function.identity());
        ISObjectEnumerable stm1 = ObjectStream.of(clone).flatMapToSObject(Function.identity());
        // When
        List<Account> actual = stm.toList();
        List<Account> actual1 = (List<Account>) stm1.toList();
        // Then
        List<Account> expected = new List<Account>{ accounts[1], accounts[0], accounts[2] };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) stm).isOperated);
        Assert.isTrue(((SObjectStream) stm1).isOperated);
    }

    /**
     * @see ObjectStream.forEach
     */
    @IsTest
    @SuppressWarnings('PMD.OneDeclarationPerLine')
    private static void forEach() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        AsPerson sam = new AsPerson('Sam', 16, Date.newInstance(2005, 2, 3), 2L, false);
        AsPerson lucy = new AsPerson('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<AsPerson> input = new List<AsPerson>{ john, jake, sam, lucy };
        List<AsPerson> clone = (List<AsPerson>) AsTestCommons.deepClone(input, List<AsPerson>.class);
        Long value = 0L;
        ObjectEnumerable stm = ObjectStream.of(clone).forEach(new AsTestCommons.SetAutoId(value));
        IObjectEnumerable stm1 = ObjectStream.of(clone).forEach(new AsTestCommons.SetAutoId(value));
        // When
        List<AsPerson> actual = (List<AsPerson>) stm.toList(AsPerson.class);
        List<AsPerson> actual1 = (List<AsPerson>) stm1.toList(AsPerson.class);
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            Assert.areEqual(value, actual[i].getAutoId());
            Assert.areEqual(value, actual1[i].getAutoId());
        }
        Assert.areNotEqual(input, clone, Label.AS_ErrorMessage_InputNotMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
    }

    /**
     * @see ObjectStream.distinct
     */
    @IsTest
    private static void distinct() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 0L, true);
        List<Object> input = new List<Object>{ john, jake, 'foo', 1, 'foo', jake };
        List<Object> clone =  AsTestCommons.deepClone(input);
        ObjectEnumerable stm = ObjectStream.of(clone).distinct();
        IObjectEnumerable stm1 = ObjectStream.of(input).filter(new AsTestCommons.IsInstanceOfComparablePredicate()).distinct(new AsTestCommons.GetIdFunction());
        // When
        List<Object> actual = stm.toList();
        List<Object> actual1 = stm1.toList();
        // Then
        List<Object> expected = new List<Object>{ john, jake, 'foo', 1 };
        List<Object> expected1 = new List<Object>{ john };
        Assert.areEqual(AsTestCommons.deepClone(expected), actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(AsTestCommons.deepClone(input), clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
    }

    /**
     * @see ObjectStream.sort
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
        ObjectEnumerable stm = ObjectStream.of(clone).sort();
        ObjectEnumerable stm1 = ObjectStream.of(input1).sort();
        IObjectEnumerable stm2 = ObjectStream.of(clone).sort(Comparer.nullsLast(Comparer.defaultOrder()));
        IObjectEnumerable stm3 = ObjectStream.of(clone1).sort(Comparer.reverseOrder());
        IObjectEnumerable stm4 = ObjectStream.of(clone1).sort(SortOrder.DESCENDING);
        // When
        List<Object> actual = stm.toList();
        List<Object> actual1 = stm1.toList();
        List<Object> actual2 = stm2.toList();
        List<Object> actual3 = stm3.toList();
        List<Object> actual4 = stm4.toList();
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
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
        Assert.isTrue(((ObjectStream) stm2).isOperated);
        Assert.isTrue(((ObjectStream) stm3).isOperated);
        Assert.isTrue(((ObjectStream) stm4).isOperated);
    }

    /**
     * @see ObjectStream.lim
     */
    @IsTest
    private static void lim() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        ObjectEnumerable stm = ObjectStream.of(clone).lim(25);
        ObjectEnumerable stm1 = ObjectStream.of(clone).lim(3);
        IObjectEnumerable stm2 = ObjectStream.of(clone).lim(0);
        IObjectEnumerable stm3 = ObjectStream.of(clone);
        // When
        List<Object> actual = stm.toList();
        List<Object> actual1 = stm1.toList();
        List<Object> actual2 = stm2.toList();
        Exception exc1;
        try {
            stm3.lim(-2);
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
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
        Assert.isTrue(((ObjectStream) stm2).isOperated);
        Assert.isTrue(((ObjectStream) stm3).isOperated);
    }

    /**
     * @see ObjectStream.skip
     */
    @IsTest
    private static void skip() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        ObjectEnumerable stm = ObjectStream.of(clone).skip(5);
        IObjectEnumerable stm1 = ObjectStream.of(clone).skip(0);
        IObjectEnumerable stm2 = ObjectStream.of(clone).skip(25);
        IObjectEnumerable stm3 = ObjectStream.of(clone);
        // When
        List<Object> actual = stm.toList();
        List<Object> actual1 = stm1.toList();
        List<Object> actual2 = stm2.toList();
        Exception exc1;
        try {
            stm3.lim(-2);
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
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
        Assert.isTrue(((ObjectStream) stm2).isOperated);
        Assert.isTrue(((ObjectStream) stm3).isOperated);
    }

    /**
     * @see ObjectStream.reduce
     */
    @IsTest
    private static void reduce() {
        // Given
        List<String> input = new List<String>{ 'foo', 'bar', 'baz', 'lorem' };
        List<Integer> input1 = new List<Integer>{ 5, 1, 3, 8, -3, 4, -6, 0, 4 };
        List<String> clone = (List<String>) AsTestCommons.deepClone(input, List<String>.class);
        List<Integer> clone1 = (List<Integer>) AsTestCommons.deepClone(input1, List<Integer>.class);
        ObjectEnumerable stm = ObjectStream.of(clone);
        IObjectEnumerable stm1 = ObjectStream.of(clone1);
        String seed = 'seed';
        // When
        String actual = (String) stm.reduce(seed, new AsTestCommons.Concat());
        Integer actual1 = (Integer) stm1.reduce(new AsTestCommons.SumIntBiOperator()).get();
        // Then
        String expected = 'seedfoobarbazlorem';
        Integer expected1 = 16;
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual('seed', seed, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
    }

    /**
     * @see ObjectStream.collect
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
        ObjectEnumerable stm = ObjectStream.of(clone);
        IObjectEnumerable stm1 = ObjectStream.of(clone1);
        ICollector toObjectSetCollector = Collector.of(Supplier.of(Set<Object>.class), new AsTestCommons.AddToSet());
        // When
        Set<Object> actual = (Set<Object>) stm.collect(toObjectSetCollector);
        Set<Object> actual1 = (Set<Object>) stm1.collect(toObjectSetCollector);
        // Then
        Set<Object> expected = new Set<Object>{ john, jake, sam, lucy };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone1, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
    }

    /**
     * @see ObjectStream.find
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
        ObjectEnumerable stm = ObjectStream.of(clone);
        IObjectEnumerable stm1 = ObjectStream.of(clone1);
        Integer elseValue = 42;
        // When
        String actual = (String) stm.find(new AsTestCommons.IsInstanceOfStringPredicate()).get();
        Integer actual1 = (Integer) stm1.find(new AsTestCommons.IsInstanceOfIntPredicate()).orElse(elseValue);
        // Then
        Assert.areEqual('jake', actual);
        Assert.areEqual(elseValue, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone1, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
    }

    /**
     * @see ObjectStream.every
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
        ObjectEnumerable stm = ObjectStream.of(clone);
        IObjectEnumerable stm1 = ObjectStream.of(clone1);
        // When
        Boolean actual = stm.every(new AsTestCommons.IsInstanceOfStringPredicate());
        Boolean actual1 = stm1.every(new AsTestCommons.IsInstanceOfIntPredicate().negate());
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone1, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
    }

    /**
     * @see ObjectStream.some
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
        ObjectEnumerable stm = ObjectStream.of(clone);
        IObjectEnumerable stm1 = ObjectStream.of(clone1);
        // When
        Boolean actual = stm.some(new AsTestCommons.IsInstanceOfStringPredicate());
        Boolean actual1 = stm1.some(new AsTestCommons.IsInstanceOfIntPredicate());
        // Then
        Assert.areEqual(true, actual);
        Assert.areEqual(false, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone1, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
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
        ObjectEnumerable stm = ObjectStream.of(clone);
        IObjectEnumerable stm1 = ObjectStream.of(clone1);
        // When
        Boolean actual = stm.none(new AsTestCommons.IsInstanceOfStringPredicate());
        Boolean actual1 = stm1.none(new AsTestCommons.IsInstanceOfIntPredicate());
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input, clone1, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
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
        ObjectEnumerable stm = ObjectStream.of(clone);
        IObjectEnumerable stm1 = ObjectStream.of(clone1);
        IComparer defaultOrderComparer = Comparer.defaultOrder();
        // When
        AsPerson actual = (AsPerson) stm.max(defaultOrderComparer).get();
        String actual1 = (String) stm1.max(defaultOrderComparer).get();
        // Then
        Assert.areEqual(lucy, actual);
        Assert.areEqual('lucy', actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input1, clone1, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
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
        ObjectEnumerable stm = ObjectStream.of(clone);
        IObjectEnumerable stm1 = ObjectStream.of(clone1);
        IComparer defaultOrderComparer = Comparer.defaultOrder();
        // When
        AsPerson actual = (AsPerson) stm.min(defaultOrderComparer).get();
        String actual1 = (String) stm1.min(defaultOrderComparer).get();
        // Then
        Assert.areEqual(sam, actual);
        Assert.areEqual('a', actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input1, clone1, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
    }

    /**
     * @see ObjectStream.count
     */
    @IsTest
    private static void count() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        ObjectEnumerable stm = ObjectStream.of(clone);
        IObjectEnumerable stm1 = ObjectStream.of(new List<Object>());
        IObjectEnumerable stm2 = ObjectStream.empty();
        // When
        Integer actual = stm.count();
        Integer actual1 = stm1.count();
        Integer actual2 = stm2.count();
        // Then
        Assert.areEqual(input.size(), actual);
        Assert.areEqual(0, actual1);
        Assert.areEqual(0, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
        Assert.isTrue(((ObjectStream) stm2).isOperated);
    }

    /**
     * @see ObjectStream.isEmpty
     */
    @IsTest
    private static void isEmpty() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        ObjectEnumerable stm = ObjectStream.of(clone);
        IObjectEnumerable stm1 = ObjectStream.of(new List<Object>());
        IObjectEnumerable stm2 = ObjectStream.empty();
        // When
        Boolean actual = stm.isEmpty();
        Boolean actual1 = stm1.isEmpty();
        Boolean actual2 = stm2.isEmpty();
        // Then
        Assert.areEqual(false, actual);
        Assert.areEqual(true, actual1);
        Assert.areEqual(true, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
        Assert.isTrue(((ObjectStream) stm2).isOperated);
    }

    /**
     * @see ObjectStream.toList
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
        ObjectEnumerable stm = ObjectStream.of(clone);
        IObjectEnumerable stm1 = ObjectStream.of(clone1);
        // When
        List<AsPerson> actual = (List<AsPerson>) stm.toList(AsPerson.class);
        List<Object> actual1 = stm1.toList();
        // Then
        Assert.areEqual(input, actual);
        Assert.areEqual(input1, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(input1, clone1, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
    }

    /**
     * @see ObjectStream.toSet
     */
    @IsTest
    private static void toSet() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI, 3, '0' };
        List<Object> clone = new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI, 3, '0' };
        ObjectEnumerable stm = ObjectStream.of(clone);
        IObjectEnumerable stm1 = ObjectStream.of(clone);
        // When
        Set<Object> actual = stm.toSet();
        Set<Object> actual1 = (Set<Object>) stm1.toSet();
        // Then
        Set<Object> expected = new Set<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, john, Math.PI };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
    }

    /**
     * @see ObjectStream.run
     */
    @IsTest
    @SuppressWarnings('PMD.OneDeclarationPerLine')
    private static void run() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 0L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 1L, true);
        AsPerson sam = new AsPerson('Sam', 16, Date.newInstance(2005, 2, 3), 2L, false);
        AsPerson lucy = new AsPerson('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<AsPerson> input = new List<AsPerson>{ john, jake, sam, lucy };
        List<AsPerson> clone = (List<AsPerson>) AsTestCommons.deepClone(input, List<AsPerson>.class);
        List<AsPerson> clone1 = (List<AsPerson>) AsTestCommons.deepClone(input, List<AsPerson>.class);
        Long value = 0L;
        ObjectStream stm = (ObjectStream) ObjectStream.of(clone).forEach(new AsTestCommons.SetAutoId(value));
        IRunnable stm1 = (IRunnable) ObjectStream.of(clone1).forEach(new AsTestCommons.SetAutoId(value));
        for (Integer i = 0, size = input.size(); i < size; i++) {
            Assert.areEqual(input[i].getAutoId(), clone[i].getAutoId());
            Assert.areEqual(input[i].getAutoId(), clone1[i].getAutoId());
        }
        // When
        stm.run();
        stm1.run();
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            Assert.areEqual(value, clone[i].getAutoId());
            Assert.areEqual(value, clone1[i].getAutoId());
        }
        Assert.areNotEqual(input, clone, Label.AS_ErrorMessage_InputNotMutated);
        Assert.areNotEqual(input, clone1, Label.AS_ErrorMessage_InputNotMutated);
        Assert.isTrue(((ObjectStream) stm).isOperated);
        Assert.isTrue(((ObjectStream) stm1).isOperated);
    }

}
