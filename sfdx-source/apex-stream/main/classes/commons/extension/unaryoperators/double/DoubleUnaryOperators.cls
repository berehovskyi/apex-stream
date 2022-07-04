/**
 * @description Provides common implementations of {@link DoubleUnaryOperator}
 * and related utilities.
 *
 * @see DoubleUnaryOperator
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class DoubleUnaryOperators {

    @TestVisible
    private DoubleUnaryOperators(){}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `DoubleUnaryOperator` that returns the absolute value
     * of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.abs
     */
    public static DoubleUnaryOperator abs() {
        return new Abs();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the sum of the input argument
     * and the `d`.
     *
     * @param d the Double value
     *
     * @return the `DoubleUnaryOperator`
     *
     * @throws NullPointerException if `d` is null
     */
    public static DoubleUnaryOperator add(final Double d) {
        Validate.notNull(d);
        return new Add(d);
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the arc cos of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.acos
     */
    public static DoubleUnaryOperator acos() {
        return new Acos();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the arc sin of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.asin
     */
    public static DoubleUnaryOperator asin() {
        return new Asin();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the arc tan of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.atan
     */
    public static DoubleUnaryOperator atan() {
        return new Atan();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the cube root of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.cbrt
     */
    public static DoubleUnaryOperator cbrt() {
        return new Cbrt();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the ceil of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.ceil
     */
    public static DoubleUnaryOperator ceil() {
        return new Ceil();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the cos of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.cos
     */
    public static DoubleUnaryOperator cos() {
        return new Cos();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the cosh of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.cosh
     */
    public static DoubleUnaryOperator cosh() {
        return new Cosh();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the division of the input argument
     * and the `d`.
     *
     * @param d the Double value
     *
     * @return the `DoubleUnaryOperator`
     *
     * @throws IllegalArgumentException if `d` is 0
     * @throws NullPointerException if `d` is null
     */
    public static DoubleUnaryOperator divide(final Double d) {
        Validate.notNull(d);
        return new Divide(d);
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the e ^ the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.exp
     */
    public static DoubleUnaryOperator exp() {
        return new Exp();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the floor of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.floor
     */
    public static DoubleUnaryOperator floor() {
        return new Floor();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the ln of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.log
     */
    public static DoubleUnaryOperator ln() {
        return new Ln();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the log of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.log10
     */
    public static DoubleUnaryOperator log() {
        return new Log();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns a larger value between the input argument
     * and the `d`.
     *
     * @param d the Double value
     *
     * @return the `DoubleUnaryOperator`
     *
     * @throws NullPointerException if `d` is null
     *
     * @see Math.max
     */
    public static DoubleUnaryOperator max(final Double d) {
        Validate.notNull(d);
        return new Max(d);
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns a smaller value between the input argument
     * and the `d`.
     *
     * @param d the Double value
     *
     * @return the `DoubleUnaryOperator`
     *
     * @throws NullPointerException if `d` is null
     *
     * @see Math.min
     */
    public static DoubleUnaryOperator min(final Double d) {
        Validate.notNull(d);
        return new Min(d);
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the multiplication
     * of the of the input argument and the `d`.
     *
     * @param d the Double value
     *
     * @return the `DoubleUnaryOperator`
     *
     * @throws NullPointerException if `d` is null
     */
    public static DoubleUnaryOperator multiply(final Double d) {
        Validate.notNull(d);
        return new Multiply(d);
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the input argument
     * raised to the power of the `exp`.
     *
     * @param exp the Double power value
     *
     * @return the `DoubleUnaryOperator`
     *
     * @throws NullPointerException if `d` is null
     *
     * @see Math.pow
     */
    public static DoubleUnaryOperator pow(final Double exp) {
        Validate.notNull(exp);
        return new Pow(exp);
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the rint of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.rint
     */
    public static DoubleUnaryOperator rint() {
        return new Rint();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the signum of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.signum
     */
    public static DoubleUnaryOperator signum() {
        return new Signum();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the sin of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.sin
     */
    public static DoubleUnaryOperator sin() {
        return new Sin();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the sinh of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.sinh
     */
    public static DoubleUnaryOperator sinh() {
        return new Sinh();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the square root of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.sqrt
     */
    public static DoubleUnaryOperator sqrt() {
        return new Sqrt();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the subtraction of the input argument
     * and the `d`.
     *
     * @param d the Double value
     *
     * @return the `DoubleUnaryOperator`
     *
     * @throws NullPointerException if `d` is null
     */
    public static DoubleUnaryOperator subtract(final Double d) {
        Validate.notNull(d);
        return new Add(-d);
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the tan of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.tan
     */
    public static DoubleUnaryOperator tan() {
        return new Tan();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that returns the tanh of the input argument.
     *
     * @return the `DoubleUnaryOperator`
     *
     * @see Math.tanh
     */
    public static DoubleUnaryOperator tanh() {
        return new Tanh();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Abs extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.abs(x); }
    }

    private class Acos extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.acos(x); }
    }

    private class Add extends DoubleUnaryOperator {
        private final Double i;
        private Add(Double i) { this.i = i; }
        public override Double apply(Double x) { return x + i; }
    }

    private class Asin extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.asin(x); }
    }

    private class Atan extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.atan(x); }
    }

    private class Cbrt extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.cbrt(x); }
    }

    private class Ceil extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.ceil(x); }
    }

    private class Cos extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.cos(x); }
    }

    private class Cosh extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.cosh(x); }
    }

    private class Exp extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.exp(x); }
    }

    private class Floor extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.floor(x); }
    }

    private class Ln extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.log(x); }
    }

    private class Log extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.log10(x); }
    }

    private class Min extends DoubleUnaryOperator {
        private final Double i;
        private Min(Double i) { this.i = i; }
        public override Double apply(Double j) { return Math.min(j, i); }
    }

    private class Max extends DoubleUnaryOperator {
        private final Double i;
        private Max(Double i) { this.i = i; }
        public override Double apply(Double j) { return Math.max(j, i); }
    }

    private class Multiply extends DoubleUnaryOperator {
        private final Double i;
        private Multiply(Double i) { this.i = i; }
        public override Double apply(Double x) { return x * i; }
    }

    private class Pow extends DoubleUnaryOperator {
        private final Double exp;
        private Pow(Double exp) { this.exp = exp; }
        public override Double apply(Double x) { return Math.pow(x, exp); }
    }

    private class Rint extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.rint(x); }
    }

    private class Signum extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.signum(x); }
    }

    private class Sin extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.sin(x); }
    }

    private class Sinh extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.sinh(x); }
    }

    private class Sqrt extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.sqrt(x); }
    }

    private class Tan extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.tan(x); }
    }

    private class Tanh extends DoubleUnaryOperator {
        public override Double apply(Double x) { return Math.tanh(x); }
    }

    private class Divide extends DoubleUnaryOperator {
        private final Double d;
        private Divide(Double d) { this.d = d; }
        public override Double apply(Double x) { return x / d; }
    }
    // @end-group
    //</editor-fold>

}
