/**
 * @author O. Berehovskyi
 * @see DoubleUnaryOperator
 */
@IsTest(IsParallel = true)
private class DoubleUnaryOperatorTest {

    private static List<Double> input = IterTestUtils.generateDoubles();

    /**
     * @see DoubleUnaryOperator.andThen
     * @see DoubleUnaryOperator.compose
     * @see DoubleUnaryOperator.identity
     * @see DoubleUnaryOperator.constant
     */
    @IsTest
    static void defaultMethods() {
        // Given
        Double inc = 1;
        Double factor = 2;
        Double constant = 10.00;
        // When
        IDoubleUnaryOperator identity = DoubleUnaryOperator.identity();
        IDoubleUnaryOperator of1 = DoubleUnaryOperator.constant(constant);
        DoubleUnaryOperator incOperator = DoubleUnaryOperator.add(inc);
        DoubleUnaryOperator x2IntOperator = DoubleUnaryOperator.multiply(factor);
        IDoubleUnaryOperator operator = incOperator.andThen(x2IntOperator);
        IDoubleUnaryOperator operator1 = x2IntOperator.compose(incOperator);
        IDoubleUnaryOperator operator2 = DoubleUnaryOperator.compose(new List<IDoubleUnaryOperator>{ incOperator, x2IntOperator });
        // Then
        for (Double d : input) {
            Validate.assertEquals(d, identity.apply(d));
            Validate.assertEquals(constant, of1.apply(d));
            Validate.assertEquals(d + inc, incOperator.apply(d));
            Validate.assertEquals(d * factor, x2IntOperator.apply(d));
            Validate.assertEquals((d + inc) * factor, operator.apply(d));
            Validate.assertEquals((d + inc) * factor, operator1.apply(d));
            Validate.assertEquals((d + inc) * factor, operator2.apply(d));
        }
    }

    /**
     * @see DoubleUnaryOperator.abs
     * @see DoubleUnaryOperator.add
     * @see DoubleUnaryOperator.acos
     * @see DoubleUnaryOperator.asin
     * @see DoubleUnaryOperator.atan
     * @see DoubleUnaryOperator.cbrt
     * @see DoubleUnaryOperator.ceil
     * @see DoubleUnaryOperator.ceil
     * @see DoubleUnaryOperator.cos
     * @see DoubleUnaryOperator.cosh
     * @see DoubleUnaryOperator.divide
     * @see DoubleUnaryOperator.exp
     * @see DoubleUnaryOperator.floor
     * @see DoubleUnaryOperator.ln
     * @see DoubleUnaryOperator.log
     * @see DoubleUnaryOperator.max
     * @see DoubleUnaryOperator.min
     * @see DoubleUnaryOperator.multiply
     * @see DoubleUnaryOperator.pow
     * @see DoubleUnaryOperator.rint
     * @see DoubleUnaryOperator.signum
     * @see DoubleUnaryOperator.sin
     * @see DoubleUnaryOperator.sinh
     * @see DoubleUnaryOperator.sqrt
     * @see DoubleUnaryOperator.subtract
     * @see DoubleUnaryOperator.tan
     * @see DoubleUnaryOperator.tanh
     */
    @IsTest
    static void doubleUnaryOperators() {
        // Given
        List<Double> trig = new List<Double>{ 0.0, 0.5, -0.2 };
        List<Double> positive = new List<Double>{ 0, 1.0, 3, 8.99, Math.PI };
        Double inc = 1;
        Double div = 2;
        Double lim = 5;
        Double exp = 2;
        // Then
        for (Double d : input) {
            Validate.assertEquals(Math.abs(d), DoubleUnaryOperator.abs().apply(d));
            Validate.assertEquals(d + inc, DoubleUnaryOperator.add(inc).apply(d));
            Validate.assertEquals(Math.atan(d), DoubleUnaryOperator.atan().apply(d));
            Validate.assertEquals(Math.cbrt(d), DoubleUnaryOperator.cbrt().apply(d));
            Validate.assertEquals(Math.ceil(d), DoubleUnaryOperator.ceil().apply(d));
            Validate.assertEquals(Math.cos(d), DoubleUnaryOperator.cos().apply(d));
            Validate.assertEquals(Math.cosh(d), DoubleUnaryOperator.cosh().apply(d));
            Validate.assertEquals(d / div, DoubleUnaryOperator.divide(div).apply(d));
            Validate.assertEquals(Math.exp(d), DoubleUnaryOperator.exp().apply(d));
            Validate.assertEquals(Math.floor(d), DoubleUnaryOperator.floor().apply(d));
            Validate.assertEquals(Math.log(d), DoubleUnaryOperator.ln().apply(d));
            Validate.assertEquals(Math.log10(d), DoubleUnaryOperator.log().apply(d));
            Validate.assertEquals(Math.max(d, lim), DoubleUnaryOperator.max(lim).apply(d));
            Validate.assertEquals(Math.min(d, lim), DoubleUnaryOperator.min(lim).apply(d));
            Validate.assertEquals(d * div, DoubleUnaryOperator.multiply(div).apply(d));
            Validate.assertEquals(Math.pow(d, exp), DoubleUnaryOperator.pow(exp).apply(d));
            Validate.assertEquals(Math.rint(d), DoubleUnaryOperator.rint().apply(d));
            Validate.assertEquals(Math.signum(d), DoubleUnaryOperator.signum().apply(d));
            Validate.assertEquals(Math.sin(d), DoubleUnaryOperator.sin().apply(d));
            Validate.assertEquals(Math.sinh(d), DoubleUnaryOperator.sinh().apply(d));
            Validate.assertEquals(d - inc, DoubleUnaryOperator.subtract(inc).apply(d));
            Validate.assertEquals(Math.tan(d), DoubleUnaryOperator.tan().apply(d));
            Validate.assertEquals(Math.tanh(d), DoubleUnaryOperator.tanh().apply(d));
        }
        for (Double d : trig) {
            Validate.assertEquals(Math.acos(d), DoubleUnaryOperator.acos().apply(d));
            Validate.assertEquals(Math.asin(d), DoubleUnaryOperator.asin().apply(d));
        }
        for (Double d : positive) {
            Validate.assertEquals(Math.sqrt(d), DoubleUnaryOperator.sqrt().apply(d));
        }
    }

}
