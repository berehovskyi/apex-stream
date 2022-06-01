/**
 * @description Inherits {@link IIntUnaryOperator} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 *
 * @see IIntIterable.mapTo
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class IntUnaryOperator implements IIntUnaryOperator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Integer apply(Integer operand);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `IntUnaryOperator` that executes `this` operation
     * first, then the `after` operation in that order.
     *
     * @param after the operation to perform after this operation
     *
     * @return the composed `IntUnaryOperator`
     *
     * @throws NullPointerException if `after` is null
     */
    public virtual IntUnaryOperator andThen(final IIntUnaryOperator after) {
        return compose(new List<IIntUnaryOperator>{ this, after });
    }

    /**
     * @description Returns a composed `IntUnaryOperator` that executes `before` operation
     * first, then the `this` operation in that order.
     *
     * @param before the operation to perform before this operation
     *
     * @return the composed `IntUnaryOperator`
     *
     * @throws NullPointerException if `before` is null
     */
    public virtual IntUnaryOperator compose(final IIntUnaryOperator before) {
        return compose(new List<IIntUnaryOperator>{ before, this });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `IntUnaryOperator` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     *
     * @param operators the operations to sequentially perform
     *
     * @return the composed `IntUnaryOperator`
     *
     * @throws NullPointerException if `operators` is null or some element is null
     */
    public static IntUnaryOperator compose(final List<IIntUnaryOperator> operators) {
        Validate.noNullElements(operators);
        return new Compose(operators);
    }

    /**
     * @description Returns a `IntUnaryOperator` that always returns the input argument.
     *
     * @return the `IntUnaryOperator`
     */
    public static IntUnaryOperator identity() {
        return new Identity();
    }

    /**
     * @description Returns a `IntUnaryOperator` that always returns the `value`.
     *
     * @param value the int value
     *
     * @return the `IntUnaryOperator`
     */
    public static IntUnaryOperator constant(final Integer value) {
        return new Constant(value);
    }
    // @end-group
    //</editor-fold>

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
    private class Identity extends IntUnaryOperator {
        public override Integer apply(Integer operand) { return operand; }
    }

    private class Compose extends IntUnaryOperator {
        private final List<IIntUnaryOperator> operators;
        private Compose(List<IIntUnaryOperator> operators) { this.operators = operators; }
        public override Integer apply(Integer i) {
            Integer result = i;
            for (IIntUnaryOperator operator : operators) {
                result = operator.apply(result);
            }
            return result;
        }
    }

    private class Constant extends IntUnaryOperator {
        private final Integer value;
        private Constant(Integer value) { this.value = value; }
        public override Integer apply(Integer i) { return value; }
    }

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
