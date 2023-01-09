/**
 * @see DoubleUnaryOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DoubleUnaryOperatorsTest {

    private static final List<Double> INPUT = IterTestUtils.generateDoubles();

    static {
        new DoubleUnaryOperators();
    }

    /**
     * @see DoubleUnaryOperators.abs
     * @see DoubleUnaryOperators.add
     * @see DoubleUnaryOperators.acos
     * @see DoubleUnaryOperators.asin
     * @see DoubleUnaryOperators.atan
     * @see DoubleUnaryOperators.cbrt
     * @see DoubleUnaryOperators.ceil
     * @see DoubleUnaryOperators.ceil
     * @see DoubleUnaryOperators.cos
     * @see DoubleUnaryOperators.cosh
     * @see DoubleUnaryOperators.divide
     * @see DoubleUnaryOperators.exp
     * @see DoubleUnaryOperators.floor
     * @see DoubleUnaryOperators.ln
     * @see DoubleUnaryOperators.log
     * @see DoubleUnaryOperators.max
     * @see DoubleUnaryOperators.min
     * @see DoubleUnaryOperators.multiply
     * @see DoubleUnaryOperators.pow
     * @see DoubleUnaryOperators.rint
     * @see DoubleUnaryOperators.signum
     * @see DoubleUnaryOperators.sin
     * @see DoubleUnaryOperators.sinh
     * @see DoubleUnaryOperators.sqrt
     * @see DoubleUnaryOperators.subtract
     * @see DoubleUnaryOperators.tan
     * @see DoubleUnaryOperators.tanh
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
        for (Double d : INPUT) {
            Validate.assertEquals(Math.abs(d), DoubleUnaryOperators.abs().apply(d));
            Validate.assertEquals(d + inc, DoubleUnaryOperators.add(inc).apply(d));
            Validate.assertEquals(Math.atan(d), DoubleUnaryOperators.atan().apply(d));
            Validate.assertEquals(Math.cbrt(d), DoubleUnaryOperators.cbrt().apply(d));
            Validate.assertEquals(Math.ceil(d), DoubleUnaryOperators.ceil().apply(d));
            Validate.assertEquals(Math.cos(d), DoubleUnaryOperators.cos().apply(d));
            Validate.assertEquals(Math.cosh(d), DoubleUnaryOperators.cosh().apply(d));
            Validate.assertEquals(d / div, DoubleUnaryOperators.divide(div).apply(d));
            Validate.assertEquals(Math.exp(d), DoubleUnaryOperators.exp().apply(d));
            Validate.assertEquals(Math.floor(d), DoubleUnaryOperators.floor().apply(d));
            Validate.assertEquals(Math.log(d), DoubleUnaryOperators.ln().apply(d));
            Validate.assertEquals(Math.log10(d), DoubleUnaryOperators.log().apply(d));
            Validate.assertEquals(Math.max(d, lim), DoubleUnaryOperators.max(lim).apply(d));
            Validate.assertEquals(Math.min(d, lim), DoubleUnaryOperators.min(lim).apply(d));
            Validate.assertEquals(d * div, DoubleUnaryOperators.multiply(div).apply(d));
            Validate.assertEquals(Math.pow(d, exp), DoubleUnaryOperators.pow(exp).apply(d));
            Validate.assertEquals(Math.rint(d), DoubleUnaryOperators.rint().apply(d));
            Validate.assertEquals(Math.signum(d), DoubleUnaryOperators.signum().apply(d));
            Validate.assertEquals(Math.sin(d), DoubleUnaryOperators.sin().apply(d));
            Validate.assertEquals(Math.sinh(d), DoubleUnaryOperators.sinh().apply(d));
            Validate.assertEquals(d - inc, DoubleUnaryOperators.subtract(inc).apply(d));
            Validate.assertEquals(Math.tan(d), DoubleUnaryOperators.tan().apply(d));
            Validate.assertEquals(Math.tanh(d), DoubleUnaryOperators.tanh().apply(d));
        }
        for (Double d : trig) {
            Validate.assertEquals(Math.acos(d), DoubleUnaryOperators.acos().apply(d));
            Validate.assertEquals(Math.asin(d), DoubleUnaryOperators.asin().apply(d));
        }
        for (Double d : positive) {
            Validate.assertEquals(Math.sqrt(d), DoubleUnaryOperators.sqrt().apply(d));
        }
    }

}
