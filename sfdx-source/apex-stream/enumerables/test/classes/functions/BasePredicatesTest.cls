/**
 * @see BasePredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.CognitiveComplexity, PMD.ApexAssertionsShouldIncludeMessage')
private class BasePredicatesTest {

    private static final List<Integer> INTS = AsTestData.generateInts();
    private static final List<Object> MIX = AsTestData.generateMix();

    static {
        new BasePredicates();
    }

    /**
     * @see BasePredicates.isEqual
     */
    @IsTest
    static void isEqual() {
        // Given
        Integer value1 = 4;
        // When
        Predicate equal4Predicate = BasePredicates.isEqual(value1);
        IPredicate equal4Predicate1 = BasePredicates.isEqual(value1);
        Predicate equal4Predicate2 = BasePredicates.isEqual(Function.identity(), Function.constant(value1));
        IPredicate equal4Predicate3 = BasePredicates.isEqual(Function.identity(), Function.constant(value1));
        // Then
        for (Integer i : INTS) {
            Assert.areEqual(i == value1, equal4Predicate.test(i));
            Assert.areEqual(i == value1, equal4Predicate1.test(i));
            Assert.areEqual(i == value1, equal4Predicate2.test(i));
            Assert.areEqual(i == value1, equal4Predicate3.test(i));
        }
        for (Object o : MIX) {
            Assert.areEqual(o == value1, equal4Predicate.test(o));
            Assert.areEqual(o == value1, equal4Predicate1.test(o));
            Assert.areEqual(o == value1, equal4Predicate2.test(o));
            Assert.areEqual(o == value1, equal4Predicate3.test(o));
        }
    }

    /**
     * @see BasePredicates.isIn
     */
    @IsTest
    static void isIn() {
        // Given
        List<Object> subList = new List<Object>{ 5, null, 10 };
        // When
        Predicate inInput1Predicate = BasePredicates.isIn(subList);
        IPredicate inInput1Predicate1 = BasePredicates.isIn(subList);
        // Then
        for (Integer i : INTS) {
            Assert.areEqual(subList.contains(i), inInput1Predicate.test(i));
            Assert.areEqual(subList.contains(i), inInput1Predicate1.test(i));
        }
        for (Object o : MIX) {
            Assert.areEqual(subList.contains(o), inInput1Predicate.test(o));
            Assert.areEqual(subList.contains(o), inInput1Predicate1.test(o));
        }
    }

    /**
     * @see BasePredicates.isNull
     */
    @IsTest
    static void isNull() {
        // When
        Predicate isNullPredicate = BasePredicates.isNull();
        IPredicate isNullPredicate1 = BasePredicates.isNull();
        // Then
        for (Integer i : INTS) {
            Assert.areEqual(i == null, isNullPredicate.test(i));
            Assert.areEqual(i == null, isNullPredicate1.test(i));
        }
        for (Object o : MIX) {
            Assert.areEqual(o == null, isNullPredicate.test(o));
            Assert.areEqual(o == null, isNullPredicate1.test(o));
        }
    }

    /**
     * @see BasePredicates.isNotNull
     */
    @IsTest
    static void isNotNull() {
        // When
        Predicate isNullPredicate = BasePredicates.isNotNull();
        IPredicate isNullPredicate1 = BasePredicates.isNotNull();
        // Then
        for (Integer i : INTS) {
            Assert.areEqual(i != null, isNullPredicate.test(i));
            Assert.areEqual(i != null, isNullPredicate1.test(i));
        }
        for (Object o : MIX) {
            Assert.areEqual(o != null, isNullPredicate.test(o));
            Assert.areEqual(o != null, isNullPredicate1.test(o));
        }
    }

}
