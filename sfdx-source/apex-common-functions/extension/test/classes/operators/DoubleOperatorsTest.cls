/**
 * @see DoubleOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexAssertionsShouldIncludeMessage')
private class DoubleOperatorsTest {

    private static final List<Double> INPUT = AfTestData.generateDoubles();

    static {
        new DoubleOperators();
    }

    /**
     * @see DoubleOperators.abs
     * @see DoubleOperators.add
     * @see DoubleOperators.acos
     * @see DoubleOperators.asin
     * @see DoubleOperators.atan
     * @see DoubleOperators.cbrt
     * @see DoubleOperators.ceil
     * @see DoubleOperators.ceil
     * @see DoubleOperators.cos
     * @see DoubleOperators.cosh
     * @see DoubleOperators.divide
     * @see DoubleOperators.exp
     * @see DoubleOperators.floor
     * @see DoubleOperators.ln
     * @see DoubleOperators.log
     * @see DoubleOperators.max
     * @see DoubleOperators.min
     * @see DoubleOperators.multiply
     * @see DoubleOperators.pow
     * @see DoubleOperators.rint
     * @see DoubleOperators.signum
     * @see DoubleOperators.sin
     * @see DoubleOperators.sinh
     * @see DoubleOperators.sqrt
     * @see DoubleOperators.subtract
     * @see DoubleOperators.tan
     * @see DoubleOperators.tanh
     */
    @IsTest
    @SuppressWarnings('PMD.ApexUnitTestClassShouldHaveRunAs')
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
            Assert.areEqual(Math.abs(d), DoubleOperators.abs().apply(d));
            Assert.areEqual(d + inc, DoubleOperators.add(inc).apply(d));
            Assert.areEqual(Math.atan(d), DoubleOperators.atan().apply(d));
            Assert.areEqual(Math.cbrt(d), DoubleOperators.cbrt().apply(d));
            Assert.areEqual(Math.ceil(d), DoubleOperators.ceil().apply(d));
            Assert.areEqual(Math.cos(d), DoubleOperators.cos().apply(d));
            Assert.areEqual(Math.cosh(d), DoubleOperators.cosh().apply(d));
            Assert.areEqual(d / div, DoubleOperators.divide(div).apply(d));
            Assert.areEqual(Math.exp(d), DoubleOperators.exp().apply(d));
            Assert.areEqual(Math.floor(d), DoubleOperators.floor().apply(d));
            Assert.areEqual(Math.log(d), DoubleOperators.ln().apply(d));
            Assert.areEqual(Math.log10(d), DoubleOperators.log().apply(d));
            Assert.areEqual(Math.max(d, lim), DoubleOperators.max(lim).apply(d));
            Assert.areEqual(Math.min(d, lim), DoubleOperators.min(lim).apply(d));
            Assert.areEqual(d * div, DoubleOperators.multiply(div).apply(d));
            Assert.areEqual(Math.pow(d, exp), DoubleOperators.pow(exp).apply(d));
            Assert.areEqual(Math.rint(d), DoubleOperators.rint().apply(d));
            Assert.areEqual(Math.signum(d), DoubleOperators.signum().apply(d));
            Assert.areEqual(Math.sin(d), DoubleOperators.sin().apply(d));
            Assert.areEqual(Math.sinh(d), DoubleOperators.sinh().apply(d));
            Assert.areEqual(d - inc, DoubleOperators.subtract(inc).apply(d));
            Assert.areEqual(Math.tan(d), DoubleOperators.tan().apply(d));
            Assert.areEqual(Math.tanh(d), DoubleOperators.tanh().apply(d));
        }
        for (Double d : trig) {
            Assert.areEqual(Math.acos(d), DoubleOperators.acos().apply(d));
            Assert.areEqual(Math.asin(d), DoubleOperators.asin().apply(d));
        }
        for (Double d : positive) {
            Assert.areEqual(Math.sqrt(d), DoubleOperators.sqrt().apply(d));
        }
    }

}
