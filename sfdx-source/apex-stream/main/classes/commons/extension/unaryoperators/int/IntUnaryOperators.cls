/**
 * @description Provides common implementations of {@link IntUnaryOperator}
 * and related utilities.
 *
 * @see IntUnaryOperator
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class IntUnaryOperators {

    @TestVisible
    private IntUnaryOperators() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `IntUnaryOperator` that returns the absolute value
     * of the input argument.
     *
     * @return the `IntUnaryOperator`
     *
     * @see Math.abs
     */
    public static IntUnaryOperator abs() {
        return new Abs();
    }

    /**
     * @description Returns a `IntUnaryOperator` that returns the sum of the input argument
     * and the `i`.
     *
     * @param i the int value
     *
     * @return the `IntUnaryOperator`
     *
     * @throws NullPointerException if `i` is null
     */
    public static IntUnaryOperator add(final Integer i) {
        Validate.notNull(i);
        return new Add(i);
    }

    /**
     * @description Returns a `IntUnaryOperator` that returns the input argument
     * decremented by 1.
     *
     * @return the `IntUnaryOperator`
     */
    public static IntUnaryOperator decrement() {
        return new Add(-1);
    }

    /**
     * @description Returns a `IntUnaryOperator` that returns the division of the input argument
     * and the `i`.
     *
     * @param i the int value
     *
     * @return the `IntUnaryOperator`
     *
     * @throws IllegalArgumentException if `i` is 0
     * @throws NullPointerException if `i` is null
     */
    public static IntUnaryOperator divide(final Integer i) {
        Validate.notNull(i);
        Validate.isTrue(i != 0);
        return new Divide(i);
    }

    /**
     * @description Returns a `IntUnaryOperator` that returns the input argument
     * incremented by 1.
     *
     * @return the `IntUnaryOperator`
     */
    public static IntUnaryOperator increment() {
        return new Add(1);
    }

    /**
     * @description Returns a `IntUnaryOperator` that returns a larger value between the input argument
     * and the `i`.
     *
     * @param i the int value
     *
     * @return the `IntUnaryOperator`
     *
     * @throws NullPointerException if `i` is null
     *
     * @see Math.max
     */
    public static IntUnaryOperator max(final Integer i) {
        Validate.notNull(i);
        return new Max(i);
    }

    /**
     * @description Returns a `IntUnaryOperator` that returns a smaller value between the input argument
     * and the `i`.
     *
     * @param i the int value
     *
     * @return the `IntUnaryOperator`
     *
     * @throws NullPointerException if `i` is null
     *
     * @see Math.min
     */
    public static IntUnaryOperator min(final Integer i) {
        Validate.notNull(i);
        return new Min(i);
    }

    /**
     * @description Returns a `IntUnaryOperator` that returns a remainder of the input argument
     * divided by the `i`.
     *
     * @param i the int value
     *
     * @return the `IntUnaryOperator`
     *
     * @throws IllegalArgumentException if `i` is 0
     * @throws NullPointerException if `i` is null
     *
     * @see Math.mod
     */
    public static IntUnaryOperator mod(final Integer i) {
        Validate.notNull(i);
        Validate.isTrue(i != 0);
        return new Mod(i);
    }

    /**
     * @description Returns a `IntUnaryOperator` that returns the multiplication
     * of the of the input argument and the `i`.
     *
     * @param i the int value
     *
     * @return the `IntUnaryOperator`
     *
     * @throws NullPointerException if `i` is null
     */
    public static IntUnaryOperator multiply(final Integer i) {
        Validate.notNull(i);
        return new Multiply(i);
    }

    /**
     * @description Returns a `IntUnaryOperator` that returns the subtraction of the input argument
     * and the `i`.
     *
     * @param i the int value
     *
     * @return the `IntUnaryOperator`
     *
     * @throws NullPointerException if `i` is null
     */
    public static IntUnaryOperator subtract(final Integer i) {
        return new Add(-i);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Abs extends IntUnaryOperator {
        public override Integer apply(Integer i) { return Math.abs(i); }
    }

    private class Add extends IntUnaryOperator {
        private final Integer i;
        private Add(Integer i) { this.i = i; }
        public override Integer apply(Integer j) { return j + i; }
    }

    private class Min extends IntUnaryOperator {
        private final Integer i;
        private Min(Integer i) { this.i = i; }
        public override Integer apply(Integer j) { return Math.min(j, i); }
    }

    private class Max extends IntUnaryOperator {
        private final Integer i;
        private Max(Integer i) { this.i = i; }
        public override Integer apply(Integer j) { return Math.max(j, i); }
    }

    private class Mod extends IntUnaryOperator {
        private final Integer i;
        private Mod(Integer i) { this.i = i; }
        public override Integer apply(Integer j) { return Math.mod(j, i); }
    }

    private class Multiply extends IntUnaryOperator {
        private final Integer i;
        private Multiply(Integer i) { this.i = i; }
        public override Integer apply(Integer j) { return j * i; }
    }

    private class Divide extends IntUnaryOperator {
        private final Integer i;
        private Divide(Integer i) { this.i = i; }
        public override Integer apply(Integer j) { return j / i; }
    }
    // @end-group
    //</editor-fold>

}
