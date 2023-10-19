/**
 * @description Provides common implementations of Integer {@link Operator}
 * and related utilities.
 *
 * @see Operator
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class IntOperators {

    @TestVisible
    protected IntOperators() {}

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
     * and the `i`.
     *
     * @param i the int value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `i` is null
     */
    public static Operator add(final Integer i) {
        Validate.notNull(i);
        return new Add(i);
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
     * and the `i`.
     *
     * @param i the int value
     *
     * @return the `Operator`
     *
     * @throws IllegalArgumentException if `i` is 0
     * @throws NullPointerException if `i` is null
     */
    public static Operator divide(final Integer i) {
        Validate.notNull(i);
        Validate.isTrue(i != 0);
        return new Divide(i);
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
     * and the `i`.
     *
     * @param i the int value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `i` is null
     *
     * @see Math.max
     */
    public static Operator max(final Integer i) {
        Validate.notNull(i);
        return new Max(i);
    }

    /**
     * @description Returns a `Operator` that returns a smaller value between the input argument
     * and the `i`.
     *
     * @param i the int value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `i` is null
     *
     * @see Math.min
     */
    public static Operator min(final Integer i) {
        Validate.notNull(i);
        return new Min(i);
    }

    /**
     * @description Returns a `Operator` that returns a remainder of the input argument
     * divided by the `i`.
     *
     * @param i the int value
     *
     * @return the `Operator`
     *
     * @throws IllegalArgumentException if `i` is 0
     * @throws NullPointerException if `i` is null
     *
     * @see Math.mod
     */
    public static Operator mod(final Integer i) {
        Validate.notNull(i);
        Validate.isTrue(i != 0);
        return new Mod(i);
    }

    /**
     * @description Returns a `Operator` that returns the multiplication
     * of the of the input argument and the `i`.
     *
     * @param i the int value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `i` is null
     */
    public static Operator multiply(final Integer i) {
        Validate.notNull(i);
        return new Multiply(i);
    }

    /**
     * @description Returns a `Operator` that returns the subtraction of the input argument
     * and the `i`.
     *
     * @param i the int value
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `i` is null
     */
    public static Operator subtract(final Integer i) {
        return new Add(-i);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Abs extends Operator {
        public override Object apply(Object i) { return Math.abs((Integer) i); }
    }

    private class Add extends Operator {
        private final Integer i;
        private Add(Integer i) { this.i = i; }
        public override Object apply(Object j) { return (Integer) j + i; }
    }

    private class Min extends Operator {
        private final Integer i;
        private Min(Integer i) { this.i = i; }
        public override Object apply(Object j) { return Math.min((Integer) j, i); }
    }

    private class Max extends Operator {
        private final Integer i;
        private Max(Integer i) { this.i = i; }
        public override Object apply(Object j) { return Math.max((Integer) j, i); }
    }

    private class Mod extends Operator {
        private final Integer i;
        private Mod(Integer i) { this.i = i; }
        public override Object apply(Object j) { return Math.mod((Integer) j, i); }
    }

    private class Multiply extends Operator {
        private final Integer i;
        private Multiply(Integer i) { this.i = i; }
        public override Object apply(Object j) { return (Integer) j * i; }
    }

    private class Divide extends Operator {
        private final Integer i;
        private Divide(Integer i) { this.i = i; }
        public override Object apply(Object j) { return (Integer) j / i; }
    }
    // @end-group
    //</editor-fold>

}
