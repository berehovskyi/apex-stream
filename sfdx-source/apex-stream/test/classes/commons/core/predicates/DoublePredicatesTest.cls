/**
 * @see DoublePredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DoublePredicatesTest {

    private static final List<Double> INPUT = IterTestUtils.generateDoubles2();

    static {
        new DoublePredicates();
    }
    
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
        // When
        for(Double d : INPUT) {
            Assert.areEqual(d >= value, DoublePredicates.isGreaterOrEqual(value).test(d));
            Assert.areEqual(d < value, DoublePredicates.isLess(value).test(d));
            Assert.areEqual(d <= value, DoublePredicates.isLessOrEqual(value).test(d));
            Assert.areEqual(d == value1, DoublePredicates.isEqual(value1).test(d));
            Assert.areEqual(d != value1, DoublePredicates.isNotEqual(value1).test(d));
            Assert.areEqual(subList.contains(d), DoublePredicates.isIn(subList).test(d));
            Assert.areEqual(!subList.contains(d), DoublePredicates.isNotIn(subList).test(d));
            Assert.areEqual(d == null, DoublePredicates.isNull().test(d));
            Assert.areEqual(d != null, DoublePredicates.isNotNull().test(d));
        }
    }

}
