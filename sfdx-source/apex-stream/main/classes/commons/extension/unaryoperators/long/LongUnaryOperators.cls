/**
 * @description Provides common implementations of {@link LongUnaryOperator}
 * and related utilities.
 *
 * @see LongUnaryOperator
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class LongUnaryOperators {

    @TestVisible
    private LongUnaryOperators(){}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `LongUnaryOperator` that returns the absolute value
     * of the input argument.
     *
     * @return the `LongUnaryOperator`
     *
     * @see Math.abs
     */
    public static LongUnaryOperator abs() {
        return new Abs();
    }

    /**
     * @description Returns a `LongUnaryOperator` that returns the sum of the input argument
     * and the `l`.
     *
     * @param l the Long value
     *
     * @return the `LongUnaryOperator`
     *
     * @throws NullPointerException if `l` is null
     */
    public static LongUnaryOperator add(final Long l) {
        Validate.notNull(l);
        return new Add(l);
    }

    /**
     * @description Returns a `LongUnaryOperator` that returns the input argument
     * decremented by 1.
     *
     * @return the `LongUnaryOperator`
     */
    public static LongUnaryOperator decrement() {
        return new Add(-1);
    }

    /**
     * @description Returns a `LongUnaryOperator` that returns the division of the input argument
     * and the `l`.
     *
     * @param l the Long value
     *
     * @return the `LongUnaryOperator`
     *
     * @throws IllegalArgumentException if `l` is 0
     * @throws NullPointerException if `l` is null
     */
    public static LongUnaryOperator divide(final Long l) {
        Validate.notNull(l);
        Validate.isTrue(l != 0);
        return new Divide(l);
    }

    /**
     * @description Returns a `LongUnaryOperator` that returns the input argument
     * incremented by 1.
     *
     * @return the `LongUnaryOperator`
     */
    public static LongUnaryOperator increment() {
        return new Add(1);
    }

    /**
     * @description Returns a `LongUnaryOperator` that returns a larger value between the input argument
     * and the `l`.
     *
     * @param l the Long value
     *
     * @return the `LongUnaryOperator`
     *
     * @throws NullPointerException if `l` is null
     *
     * @see Math.max
     */
    public static LongUnaryOperator max(final Long l) {
        return new Max(l);
    }

    /**
     * @description Returns a `LongUnaryOperator` that returns a smaller value between the input argument
     * and the `l`.
     *
     * @param l the Long value
     *
     * @return the `LongUnaryOperator`
     *
     * @throws NullPointerException if `l` is null
     *
     * @see Math.min
     */
    public static LongUnaryOperator min(final Long l) {
        return new Min(l);
    }

    /**
     * @description Returns a `LongUnaryOperator` that returns a remainder of the input argument
     * divided by the `l`.
     *
     * @param l the Long value
     *
     * @return the `LongUnaryOperator`
     *
     * @throws IllegalArgumentException if `l` is 0
     * @throws NullPointerException if `l` is null
     *
     * @see Math.mod
     */
    public static LongUnaryOperator mod(final Long l) {
        Validate.notNull(l);
        Validate.isTrue(l != 0);
        return new Mod(l);
    }

    /**
     * @description Returns a `LongUnaryOperator` that returns the multiplication
     * of the of the input argument and the `l`.
     *
     * @param l the Long value
     *
     * @return the `LongUnaryOperator`
     *
     * @throws NullPointerException if `l` is null
     */
    public static LongUnaryOperator multiply(final Long l) {
        Validate.notNull(l);
        return new Multiply(l);
    }

    /**
     * @description Returns a `LongUnaryOperator` that returns the subtraction of the input argument
     * and the `l`.
     *
     * @param l the Long value
     *
     * @return the `LongUnaryOperator`
     *
     * @throws NullPointerException if `l` is null
     */
    public static LongUnaryOperator subtract(final Long l) {
        Validate.notNull(l);
        return new Add(-l);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Abs extends LongUnaryOperator {
        public override Long apply(Long l) { return Math.abs(l); }
    }

    private class Add extends LongUnaryOperator {
        private final Long l;
        private Add(Long l) { this.l = l; }
        public override Long apply(Long j) { return j + l; }
    }

    private class Min extends LongUnaryOperator {
        private final Long l;
        private Min(Long l) { this.l = l; }
        public override Long apply(Long j) { return Math.min(j, l); }
    }

    private class Max extends LongUnaryOperator {
        private final Long l;
        private Max(Long l) { this.l = l; }
        public override Long apply(Long j) { return Math.max(j, l); }
    }

    private class Mod extends LongUnaryOperator {
        private final Long l;
        private Mod(Long l) { this.l = l; }
        public override Long apply(Long j) { return Math.mod(j, l); }
    }

    private class Multiply extends LongUnaryOperator {
        private final Long l;
        private Multiply(Long l) { this.l = l; }
        public override Long apply(Long j) { return j * l; }
    }

    private class Divide extends LongUnaryOperator {
        private final Long l;
        private Divide(Long l) { this.l = l; }
        public override Long apply(Long j) { return j / l; }
    }
    // @end-group
    //</editor-fold>

}
