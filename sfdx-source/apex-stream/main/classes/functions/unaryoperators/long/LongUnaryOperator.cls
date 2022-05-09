/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link ILongUnaryOperator} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see ILongIterable.mapTo
 */
public abstract inherited sharing class LongUnaryOperator implements ILongUnaryOperator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Long apply(Long operand);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `LongUnaryOperator` that executes `this` operation
     * first, then the `after` operation in that order.
     * @param after the operation to perform after this operation
     * @return the composed `LongUnaryOperator`
     * @throws NullPointerException if `after` is null
     */
    public virtual LongUnaryOperator andThen(final ILongUnaryOperator after) {
        return compose(new List<ILongUnaryOperator>{ this, after });
    }

    /**
     * @description Returns a composed `LongUnaryOperator` that executes `before` operation
     * first, then the `this` operation in that order.
     * @param before the operation to perform before this operation
     * @return the composed `LongUnaryOperator`
     * @throws NullPointerException if `before` is null
     */
    public virtual LongUnaryOperator compose(final ILongUnaryOperator before) {
        return compose(new List<ILongUnaryOperator>{ before, this });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `LongUnaryOperator` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     * @param operators the operations to sequentially perform
     * @return the composed `LongUnaryOperator`
     * @throws NullPointerException if `operators` is null or some element is null
     */
    public static LongUnaryOperator compose(final List<ILongUnaryOperator> operators) {
        Validate.noNullElements(operators);
        return new Compose(operators);
    }

    /**
     * @description Returns a `LongUnaryOperator` that always returns the input argument.
     * @return the `LongUnaryOperator`
     */
    public static LongUnaryOperator identity() {
        return new Identity();
    }

    /**
     * @description Returns a `LongUnaryOperator` that always returns the `value`.
     * @param value the Long value
     * @return the `LongUnaryOperator`
     */
    public static LongUnaryOperator constant(final Long value) {
        return new Constant(value);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `LongUnaryOperator` that returns the absolute value
     * of the input argument.
     * @return the `LongUnaryOperator`
     * @see Math.abs
     */
    public static LongUnaryOperator abs() {
        return new Abs();
    }

    /**
     * @description Returns a `LongUnaryOperator` that returns the sum of the input argument
     * and the `l`.
     * @param l the Long value
     * @return the `LongUnaryOperator`
     * @throws NullPointerException if `l` is null
     */
    public static LongUnaryOperator add(final Long l) {
        Validate.notNull(l);
        return new Add(l);
    }

    /**
     * @description Returns a `LongUnaryOperator` that returns the input argument
     * decremented by 1.
     * @return the `LongUnaryOperator`
     */
    public static LongUnaryOperator decrement() {
        return new Add(-1);
    }

    /**
     * @description Returns a `LongUnaryOperator` that returns the division of the input argument
     * and the `l`.
     * @param l the Long value
     * @return the `LongUnaryOperator`
     * @throws NullPointerException if `l` is null
     * @throws IllegalArgumentException if `l` is 0
     */
    public static LongUnaryOperator divide(final Long l) {
        Validate.notNull(l);
        Validate.isTrue(l != 0);
        return new Divide(l);
    }

    /**
     * @description Returns a `LongUnaryOperator` that returns the input argument
     * incremented by 1.
     * @return the `LongUnaryOperator`
     */
    public static LongUnaryOperator increment() {
        return new Add(1);
    }

    /**
     * @description Returns a `LongUnaryOperator` that returns a larger value between the input argument
     * and the `l`.
     * @param l the Long value
     * @return the `LongUnaryOperator`
     * @throws NullPointerException if `l` is null
     * @see Math.max
     */
    public static LongUnaryOperator max(final Long l) {
        return new Max(l);
    }

    /**
     * @description Returns a `LongUnaryOperator` that returns a smaller value between the input argument
     * and the `l`.
     * @param l the Long value
     * @return the `LongUnaryOperator`
     * @throws NullPointerException if `l` is null
     * @see Math.min
     */
    public static LongUnaryOperator min(final Long l) {
        return new Min(l);
    }

    /**
     * @description Returns a `LongUnaryOperator` that returns a remainder of the input argument
     * divided by the `l`.
     * @param l the Long value
     * @return the `LongUnaryOperator`
     * @throws NullPointerException if `l` is null
     * @throws IllegalArgumentException if `l` is 0
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
     * @param l the Long value
     * @return the `LongUnaryOperator`
     * @throws NullPointerException if `l` is null
     */
    public static LongUnaryOperator multiply(final Long l) {
        Validate.notNull(l);
        return new Multiply(l);
    }

    /**
     * @description Returns a `LongUnaryOperator` that returns the subtraction of the input argument
     * and the `l`.
     * @param l the Long value
     * @return the `LongUnaryOperator`
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
    private class Identity extends LongUnaryOperator {
        public override Long apply(Long operand) { return operand; }
    }

    private class Compose extends LongUnaryOperator {
        private final List<ILongUnaryOperator> operators;
        private Compose(List<ILongUnaryOperator> operators) { this.operators = operators; }
        public override Long apply(Long l) {
            Long result = l;
            for (ILongUnaryOperator operator : operators) {
                result = operator.apply(result);
            }
            return result;
        }
    }

    private class Constant extends LongUnaryOperator {
        private final Long value;
        private Constant(Long value) { this.value = value; }
        public override Long apply(Long l) { return value; }
    }

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
