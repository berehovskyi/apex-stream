/**
 * @author O. Berehovskyi
 * @see DoubleBinaryOperator
 */
@IsTest(IsParallel = true)
private class DoubleBinaryOperatorTest {

    private static List<Double> input = IterTestUtils.generateDoubles();

    /**
     * @see DoubleBinaryOperator.min
     * @see DoubleBinaryOperator.max
     * @see DoubleBinaryOperator.product
     * @see DoubleBinaryOperator.sum
     */
    @IsTest
    static void operators() {
        IDoubleBinaryOperator min = DoubleBinaryOperator.min();
        IDoubleBinaryOperator max = DoubleBinaryOperator.max();
        IDoubleBinaryOperator product = DoubleBinaryOperator.product();
        IDoubleBinaryOperator sum = DoubleBinaryOperator.sum();
        IDoubleBinaryOperator euclid = DoubleBinaryOperator.euclideanDistance();
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            Double d = input[i];
            Double src = 5.0;
            Validate.assertEquals(Math.min(src, d), min.apply(src, d));
            Validate.assertEquals(Math.max(src, d), max.apply(src, d));
            Validate.assertEquals(src + d, sum.apply(src, d));
            Validate.assertEquals(src * d, product.apply(src, d));
            Validate.assertEquals(Math.sqrt(Math.pow(src, 2) + Math.pow(d, 2)), euclid.apply(src, d));
        }
    }
}
