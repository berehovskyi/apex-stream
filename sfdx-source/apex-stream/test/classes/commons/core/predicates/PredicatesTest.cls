/**
 * @see Predicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class PredicatesTest {

    private static List<Object> intInput = new List<Object>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4 };
    
    /**
     * @see Predicates.isGreater
     * @see Predicates.isGreaterOrEqual
     * @see Predicates.isEqual
     * @see Predicates.isLess
     * @see Predicates.isLessOrEqual
     * @see Predicates.isIn
     * @see Predicates.isNotEqual
     * @see Predicates.isNotIn
     * @see Predicates.isNull
     * @see Predicates.isNotNull
     */
    @IsTest
    static void comparisonPredicates() {
        // Given
        Integer value = 1;
        Integer value1 = 4;
        List<Object> subList = new List<Object>{ 5, null, 10 };
        new Predicates();
        // When
        IPredicate isNullPredicate = Predicates.isNull();
        IPredicate isNotNullPredicate = Predicates.isNotNull();
        IPredicate greaterThan1Predicate = Predicates.isGreater(value);
        IPredicate greaterOrEqual1Predicate = Predicates.isGreaterOrEqual(value);
        IPredicate greaterOrEqual1Predicate1 = Predicates.isGreaterOrEqual(Function.identity(), Function.constant(value));
        IPredicate lessThan1Predicate = Predicates.isLess(value);
        IPredicate lessOrEqual1Predicate = Predicates.isLessOrEqual(value);
        IPredicate lessOrEqual1Predicate1 = Predicates.isLessOrEqual(Function.identity(), Function.constant(value));
        IPredicate equal4Predicate = Predicates.isEqual(value1);
        IPredicate notEqual4Predicate = Predicates.isNotEqual(value1);
        IPredicate notEqual4Predicate1 = Predicates.isNotEqual(Function.identity(), Function.constant(value1));
        IPredicate inInput1Predicate = Predicates.isIn(subList);
        IPredicate notInInput1Predicate = Predicates.isNotIn(subList);
        IPredicate notInInput1Predicate1 = Predicates.isNotIn(Function.identity(), subList);
        // Then
        for (Object i : intInput) {
            Validate.assertEquals(i == null, isNullPredicate.test(i));
            Validate.assertEquals(i != null, isNotNullPredicate.test(i));
            Validate.assertEquals(((Integer) i) > value, greaterThan1Predicate.test(i));
            Validate.assertEquals(((Integer) i) >= value, greaterOrEqual1Predicate.test(i));
            Validate.assertEquals(((Integer) i) >= value, greaterOrEqual1Predicate1.test(i));
            Validate.assertEquals(i == null ? true : ((Integer) i) < value, lessThan1Predicate.test(i));
            Validate.assertEquals(i == null ? true : ((Integer) i) <= value, lessOrEqual1Predicate.test(i));
            Validate.assertEquals(i == null ? true : ((Integer) i) <= value, lessOrEqual1Predicate1.test(i));
            Validate.assertEquals(((Integer) i) == value1, equal4Predicate.test(i));
            Validate.assertEquals(((Integer) i) != value1, notEqual4Predicate.test(i));
            Validate.assertEquals(((Integer) i) != value1, notEqual4Predicate1.test(i));
            Validate.assertEquals(subList.contains(i), inInput1Predicate.test(i));
            Validate.assertEquals(!subList.contains(i), notInInput1Predicate.test(i));
            Validate.assertEquals(!subList.contains(i), notInInput1Predicate1.test(i));
        }
    }

}
