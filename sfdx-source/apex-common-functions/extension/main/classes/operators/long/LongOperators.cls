/**
 * @description Provides common implementations of Long {@link Operator}
 * and related utilities.
 *
 * @see Operator
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class LongOperators {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected LongOperators() {}

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
     * and the `l`.
     *
     * @param l the Long value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `l` is null
     */
    public static Operator add(final Long l) {
        return new Add(l);
    }

    /**
     * @description Returns a `Operator` that returns the input argument
     * decremented by 1.
     *
     * @return the `Operator`
     */
    public static Operator decrement() {
        return new Add(-1);
    }

    /**
     * @description Returns a `Operator` that returns the division of the input argument
     * and the `l`.
     *
     * @param l the Long value
     *
     * @return the `Operator`
     *
     * @throws IllegalArgumentException if `l` is 0
     * @throws NullPointerException if `l` is null
     */
    public static Operator divide(final Long l) {
        return new Divide(l);
    }

    /**
     * @description Returns a `Operator` that returns the input argument
     * incremented by 1.
     *
     * @return the `Operator`
     */
    public static Operator increment() {
        return new Add(1);
    }

    /**
     * @description Returns a `Operator` that returns a larger value between the input argument
     * and the `l`.
     *
     * @param l the Long value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `l` is null
     *
     * @see Math.max
     */
    public static Operator max(final Long l) {
        return new Max(l);
    }

    /**
     * @description Returns a `Operator` that returns a smaller value between the input argument
     * and the `l`.
     *
     * @param l the Long value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `l` is null
     *
     * @see Math.min
     */
    public static Operator min(final Long l) {
        return new Min(l);
    }

    /**
     * @description Returns a `Operator` that returns a remainder of the input argument
     * divided by the `l`.
     *
     * @param l the Long value
     *
     * @return the `Operator`
     *
     * @throws IllegalArgumentException if `l` is 0
     * @throws NullPointerException if `l` is null
     *
     * @see Math.mod
     */
    public static Operator mod(final Long l) {
        return new Mod(l);
    }

    /**
     * @description Returns a `Operator` that returns the multiplication
     * of the of the input argument and the `l`.
     *
     * @param l the Long value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `l` is null
     */
    public static Operator multiply(final Long l) {
        return new Multiply(l);
    }

    /**
     * @description Returns a `Operator` that returns the subtraction of the input argument
     * and the `l`.
     *
     * @param l the Long value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `l` is null
     */
    public static Operator subtract(final Long l) {
        return new Add(-l);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Abs extends Operator {
        public override Object apply(Object l) { return Math.abs((Long) l); }
    }

    private class Add extends Operator {
        private final Long l;
        private Add(Long l) { Validate.notNull(l); this.l = l; }
        public override Object apply(Object j) { return (Long) j + l; }
    }

    private class Min extends Operator {
        private final Long l;
        private Min(Long l) { this.l = l; }
        public override Object apply(Object j) { return Math.min((Long) j, l); }
    }

    private class Max extends Operator {
        private final Long l;
        private Max(Long l) { this.l = l; }
        public override Object apply(Object j) { return Math.max((Long) j, l); }
    }

    private class Mod extends Operator {
        private final Long l;
        private Mod(Long l) {
            Validate.notNull(l);
            Validate.isTrue(l != 0);
            this.l = l;
        }
        public override Object apply(Object j) { return Math.mod((Long) j, l); }
    }

    private class Multiply extends Operator {
        private final Long l;
        private Multiply(Long l) { Validate.notNull(l); this.l = l; }
        public override Object apply(Object j) { return (Long) j * l; }
    }

    private class Divide extends Operator {
        private final Long l;
        private Divide(Long l) {
            Validate.notNull(l);
            Validate.isTrue(l != 0);
            this.l = l;
        }
        public override Object apply(Object j) { return (Long) j / l; }
    }
    // @end-group
    //</editor-fold>

}
