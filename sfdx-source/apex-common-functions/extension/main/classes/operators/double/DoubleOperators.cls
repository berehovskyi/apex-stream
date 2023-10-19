/**
 * @description Provides common implementations of Double {@link Operator}
 * and related utilities.
 *
 * @see Operator
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class DoubleOperators {

    @TestVisible
    protected DoubleOperators() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Operator` that returns the absolute value
     * of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.abs
     */
    public static Operator abs() {
        return new Abs();
    }

    /**
     * @description Returns a `Operator` that returns the sum of the input argument
     * and the `d`.
     *
     * @param d the Double value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `d` is null
     */
    public static Operator add(final Double d) {
        Validate.notNull(d);
        return new Add(d);
    }

    /**
     * @description Returns a `Operator` that returns the arc cos of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.acos
     */
    public static Operator acos() {
        return new Acos();
    }

    /**
     * @description Returns a `Operator` that returns the arc sin of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.asin
     */
    public static Operator asin() {
        return new Asin();
    }

    /**
     * @description Returns a `Operator` that returns the arc tan of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.atan
     */
    public static Operator atan() {
        return new Atan();
    }

    /**
     * @description Returns a `Operator` that returns the cube root of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.cbrt
     */
    public static Operator cbrt() {
        return new Cbrt();
    }

    /**
     * @description Returns a `Operator` that returns the ceil of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.ceil
     */
    public static Operator ceil() {
        return new Ceil();
    }

    /**
     * @description Returns a `Operator` that returns the cos of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.cos
     */
    public static Operator cos() {
        return new Cos();
    }

    /**
     * @description Returns a `Operator` that returns the cosh of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.cosh
     */
    public static Operator cosh() {
        return new Cosh();
    }

    /**
     * @description Returns a `Operator` that returns the division of the input argument
     * and the `d`.
     *
     * @param d the Double value
     *
     * @return the `Operator`
     *
     * @throws IllegalArgumentException if `d` is 0
     * @throws NullPointerException if `d` is null
     */
    public static Operator divide(final Double d) {
        Validate.notNull(d);
        return new Divide(d);
    }

    /**
     * @description Returns a `Operator` that returns the e ^ the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.exp
     */
    public static Operator exp() {
        return new Exp();
    }

    /**
     * @description Returns a `Operator` that returns the floor of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.floor
     */
    public static Operator floor() {
        return new Floor();
    }

    /**
     * @description Returns a `Operator` that returns the ln of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.log
     */
    public static Operator ln() {
        return new Ln();
    }

    /**
     * @description Returns a `Operator` that returns the log of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.log10
     */
    public static Operator log() {
        return new Log();
    }

    /**
     * @description Returns a `Operator` that returns a larger value between the input argument
     * and the `d`.
     *
     * @param d the Double value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `d` is null
     *
     * @see Math.max
     */
    public static Operator max(final Double d) {
        Validate.notNull(d);
        return new Max(d);
    }

    /**
     * @description Returns a `Operator` that returns a smaller value between the input argument
     * and the `d`.
     *
     * @param d the Double value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `d` is null
     *
     * @see Math.min
     */
    public static Operator min(final Double d) {
        Validate.notNull(d);
        return new Min(d);
    }

    /**
     * @description Returns a `Operator` that returns the multiplication
     * of the of the input argument and the `d`.
     *
     * @param d the Double value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `d` is null
     */
    public static Operator multiply(final Double d) {
        Validate.notNull(d);
        return new Multiply(d);
    }

    /**
     * @description Returns a `Operator` that returns the input argument
     * raised to the power of the `exp`.
     *
     * @param exp the Double power value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `d` is null
     *
     * @see Math.pow
     */
    public static Operator pow(final Double exp) {
        Validate.notNull(exp);
        return new Pow(exp);
    }

    /**
     * @description Returns a `Operator` that returns the rint of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.rint
     */
    public static Operator rint() {
        return new Rint();
    }

    /**
     * @description Returns a `Operator` that returns the signum of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.signum
     */
    public static Operator signum() {
        return new Signum();
    }

    /**
     * @description Returns a `Operator` that returns the sin of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.sin
     */
    public static Operator sin() {
        return new Sin();
    }

    /**
     * @description Returns a `Operator` that returns the sinh of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.sinh
     */
    public static Operator sinh() {
        return new Sinh();
    }

    /**
     * @description Returns a `Operator` that returns the square root of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.sqrt
     */
    public static Operator sqrt() {
        return new Sqrt();
    }

    /**
     * @description Returns a `Operator` that returns the subtraction of the input argument
     * and the `d`.
     *
     * @param d the Double value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `d` is null
     */
    public static Operator subtract(final Double d) {
        Validate.notNull(d);
        return new Add(-d);
    }

    /**
     * @description Returns a `Operator` that returns the tan of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.tan
     */
    public static Operator tan() {
        return new Tan();
    }

    /**
     * @description Returns a `Operator` that returns the tanh of the input argument.
     *
     * @return the `Operator`
     *
     * @see Math.tanh
     */
    public static Operator tanh() {
        return new Tanh();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Abs extends Operator {
        public override Object apply(Object x) { return Math.abs((Double) x); }
    }

    private class Acos extends Operator {
        public override Object apply(Object x) { return Math.acos((Double) x); }
    }

    private class Add extends Operator {
        private final Double i;
        private Add(Double i) { this.i = i; }
        public override Object apply(Object x) { return (Double) x + i; }
    }

    private class Asin extends Operator {
        public override Object apply(Object x) { return Math.asin((Double) x); }
    }

    private class Atan extends Operator {
        public override Object apply(Object x) { return Math.atan((Double) x); }
    }

    private class Cbrt extends Operator {
        public override Object apply(Object x) { return Math.cbrt((Double) x); }
    }

    private class Ceil extends Operator {
        public override Object apply(Object x) { return Math.ceil((Double) x); }
    }

    private class Cos extends Operator {
        public override Object apply(Object x) { return Math.cos((Double) x); }
    }

    private class Cosh extends Operator {
        public override Object apply(Object x) { return Math.cosh((Double) x); }
    }

    private class Exp extends Operator {
        public override Object apply(Object x) { return Math.exp((Double) x); }
    }

    private class Floor extends Operator {
        public override Object apply(Object x) { return Math.floor((Double) x); }
    }

    private class Ln extends Operator {
        public override Object apply(Object x) { return Math.log((Double) x); }
    }

    private class Log extends Operator {
        public override Object apply(Object x) { return Math.log10((Double) x); }
    }

    private class Min extends Operator {
        private final Double i;
        private Min(Double i) { this.i = i; }
        public override Object apply(Object j) { return Math.min((Double) j, (Double) i); }
    }

    private class Max extends Operator {
        private final Double i;
        private Max(Double i) { this.i = i; }
        public override Object apply(Object j) { return Math.max((Double) j, (Double) i); }
    }

    private class Multiply extends Operator {
        private final Double i;
        private Multiply(Double i) { this.i = i; }
        public override Object apply(Object x) { return (Double) x * i; }
    }

    private class Pow extends Operator {
        private final Double exp;
        private Pow(Double exp) { this.exp = exp; }
        public override Object apply(Object x) { return Math.pow((Double) x, exp); }
    }

    private class Rint extends Operator {
        public override Object apply(Object x) { return Math.rint((Double) x); }
    }

    private class Signum extends Operator {
        public override Object apply(Object x) { return Math.signum((Double) x); }
    }

    private class Sin extends Operator {
        public override Object apply(Object x) { return Math.sin((Double) x); }
    }

    private class Sinh extends Operator {
        public override Object apply(Object x) { return Math.sinh((Double) x); }
    }

    private class Sqrt extends Operator {
        public override Object apply(Object x) { return Math.sqrt((Double) x); }
    }

    private class Tan extends Operator {
        public override Object apply(Object x) { return Math.tan((Double) x); }
    }

    private class Tanh extends Operator {
        public override Object apply(Object x) { return Math.tanh((Double) x); }
    }

    private class Divide extends Operator {
        private final Double d;
        private Divide(Double d) { this.d = d; }
        public override Object apply(Object x) { return (Double) x / d; }
    }
    // @end-group
    //</editor-fold>

}
