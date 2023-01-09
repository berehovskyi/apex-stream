/**
 * @see DoubleBinaryOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DoubleBinaryOperatorsTest {

    private static final List<Double> INPUT = IterTestUtils.generateDoubles();

    static {
        new DoubleBinaryOperators();
    }

    /**
     * @see DoubleBinaryOperators.min
     * @see DoubleBinaryOperators.max
     * @see DoubleBinaryOperators.product
     * @see DoubleBinaryOperators.sum
     */
    @IsTest
    static void operators() {
        // When
        IDoubleBinaryOperator min = DoubleBinaryOperators.min();
        IDoubleBinaryOperator max = DoubleBinaryOperators.max();
        IDoubleBinaryOperator product = DoubleBinaryOperators.product();
        IDoubleBinaryOperator sum = DoubleBinaryOperators.sum();
        IDoubleBinaryOperator euclid = DoubleBinaryOperators.euclideanDistance();
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
