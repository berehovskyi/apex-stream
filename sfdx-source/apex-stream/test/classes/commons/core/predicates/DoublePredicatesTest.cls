/**
 * @see DoublePredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DoublePredicatesTest {

    private static List<Double> input = IterTestUtils.generateDoubles2();
    
    /**
     * @see DoublePredicates.isGreater
     * @see DoublePredicates.isGreaterOrEqual
     * @see DoublePredicates.isEqual
     * @see DoublePredicates.isLess
     * @see DoublePredicates.isLessOrEqual
     * @see DoublePredicates.isIn
     * @see DoublePredicates.isNotEqual
     * @see DoublePredicates.isNotIn
     * @see DoublePredicates.isNull
     * @see DoublePredicates.isNotNull
     */
    @IsTest
    static void predicates() {
        // Given
        Double value = 1.0;
        Double value1 = 13;
        List<Double> subList = new List<Double>{ -5.2, 11L };
        new DoublePredicates();
        // When
        for(Double d : input) {
            Validate.assertEquals(d >= value, DoublePredicates.isGreaterOrEqual(value).test(d));
            Validate.assertEquals(d < value, DoublePredicates.isLess(value).test(d));
            Validate.assertEquals(d <= value, DoublePredicates.isLessOrEqual(value).test(d));
            Validate.assertEquals(d == value1, DoublePredicates.isEqual(value1).test(d));
            Validate.assertEquals(d != value1, DoublePredicates.isNotEqual(value1).test(d));
            Validate.assertEquals(subList.contains(d), DoublePredicates.isIn(subList).test(d));
            Validate.assertEquals(!subList.contains(d), DoublePredicates.isNotIn(subList).test(d));
            Validate.assertEquals(d == null, DoublePredicates.isNull().test(d));
            Validate.assertEquals(d != null, DoublePredicates.isNotNull().test(d));
        }
    }

}
