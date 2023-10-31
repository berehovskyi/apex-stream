/**
 * @see DoubleBiOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage')
private class DoubleBiOperatorsTest {

    private static final List<Double> INPUT = AfTestData.generateDoubles();

    static {
        new DoubleBiOperators();
    }

    /**
     * @see DoubleBiOperators.min
     * @see DoubleBiOperators.max
     * @see DoubleBiOperators.product
     * @see DoubleBiOperators.sum
     */
    @IsTest
    static void operators() {
        // When
        IBiOperator min = DoubleBiOperators.min();
        IBiOperator max = DoubleBiOperators.max();
        IBiOperator product = DoubleBiOperators.product();
        IBiOperator sum = DoubleBiOperators.sum();
        IBiOperator euclid = DoubleBiOperators.euclideanDistance();
        // Then
        for (Integer i = 0, size = INPUT.size(); i < size; i++) {
            Double d = INPUT[i];
            Double src = 5.0;
            Assert.areEqual(Math.min(src, d), min.apply(src, d));
            Assert.areEqual(Math.max(src, d), max.apply(src, d));
            Assert.areEqual(src + d, sum.apply(src, d));
            Assert.areEqual(src * d, product.apply(src, d));
            Assert.areEqual(Math.sqrt(Math.pow(src, 2) + Math.pow(d, 2)), euclid.apply(src, d));
        }
    }
    
}
