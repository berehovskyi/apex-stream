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
            Assert.areEqual(Math.abs(d), DoubleUnaryOperators.abs().apply(d));
            Assert.areEqual(d + inc, DoubleUnaryOperators.add(inc).apply(d));
            Assert.areEqual(Math.atan(d), DoubleUnaryOperators.atan().apply(d));
            Assert.areEqual(Math.cbrt(d), DoubleUnaryOperators.cbrt().apply(d));
            Assert.areEqual(Math.ceil(d), DoubleUnaryOperators.ceil().apply(d));
            Assert.areEqual(Math.cos(d), DoubleUnaryOperators.cos().apply(d));
            Assert.areEqual(Math.cosh(d), DoubleUnaryOperators.cosh().apply(d));
            Assert.areEqual(d / div, DoubleUnaryOperators.divide(div).apply(d));
            Assert.areEqual(Math.exp(d), DoubleUnaryOperators.exp().apply(d));
            Assert.areEqual(Math.floor(d), DoubleUnaryOperators.floor().apply(d));
            Assert.areEqual(Math.log(d), DoubleUnaryOperators.ln().apply(d));
            Assert.areEqual(Math.log10(d), DoubleUnaryOperators.log().apply(d));
            Assert.areEqual(Math.max(d, lim), DoubleUnaryOperators.max(lim).apply(d));
            Assert.areEqual(Math.min(d, lim), DoubleUnaryOperators.min(lim).apply(d));
            Assert.areEqual(d * div, DoubleUnaryOperators.multiply(div).apply(d));
            Assert.areEqual(Math.pow(d, exp), DoubleUnaryOperators.pow(exp).apply(d));
            Assert.areEqual(Math.rint(d), DoubleUnaryOperators.rint().apply(d));
            Assert.areEqual(Math.signum(d), DoubleUnaryOperators.signum().apply(d));
            Assert.areEqual(Math.sin(d), DoubleUnaryOperators.sin().apply(d));
            Assert.areEqual(Math.sinh(d), DoubleUnaryOperators.sinh().apply(d));
            Assert.areEqual(d - inc, DoubleUnaryOperators.subtract(inc).apply(d));
            Assert.areEqual(Math.tan(d), DoubleUnaryOperators.tan().apply(d));
            Assert.areEqual(Math.tanh(d), DoubleUnaryOperators.tanh().apply(d));
        }
        for (Double d : trig) {
            Assert.areEqual(Math.acos(d), DoubleUnaryOperators.acos().apply(d));
            Assert.areEqual(Math.asin(d), DoubleUnaryOperators.asin().apply(d));
        }
        for (Double d : positive) {
            Assert.areEqual(Math.sqrt(d), DoubleUnaryOperators.sqrt().apply(d));
        }
    }

}
