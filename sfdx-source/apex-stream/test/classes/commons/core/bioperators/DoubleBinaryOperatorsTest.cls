/**
 * @see DoubleBinaryOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DoubleBinaryOperatorsTest {

    private static List<Double> input = IterTestUtils.generateDoubles();

    /**
     * @see DoubleBinaryOperators.min
     * @see DoubleBinaryOperators.max
     * @see DoubleBinaryOperators.product
     * @see DoubleBinaryOperators.sum
     */
    @IsTest
    static void operators() {
        // When
        new DoubleBinaryOperators();
        IDoubleBinaryOperator min = DoubleBinaryOperators.min();
        IDoubleBinaryOperator max = DoubleBinaryOperators.max();
        IDoubleBinaryOperator product = DoubleBinaryOperators.product();
        IDoubleBinaryOperator sum = DoubleBinaryOperators.sum();
        IDoubleBinaryOperator euclid = DoubleBinaryOperators.euclideanDistance();
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
