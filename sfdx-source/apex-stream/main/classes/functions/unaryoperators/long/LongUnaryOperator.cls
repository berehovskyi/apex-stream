/**
 * @description Provides default and static methods of 
 * {@link ILongUnaryOperator} functional interface.
 *
 * @see ILongUnaryOperator
 * @see ILongIterable.mapTo
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
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
     *
     * @param after the operation to perform after this operation
     *
     * @return the composed `LongUnaryOperator`
     *
     * @throws NullPointerException if `after` is null
     */
    public virtual LongUnaryOperator andThen(final ILongUnaryOperator after) {
        return compose(new List<ILongUnaryOperator>{ this, after });
    }

    /**
     * @description Returns a composed `LongUnaryOperator` that executes `before` operation
     * first, then the `this` operation in that order.
     *
     * @param before the operation to perform before this operation
     *
     * @return the composed `LongUnaryOperator`
     *
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
     *
     * @param operators the operations to sequentially perform
     *
     * @return the composed `LongUnaryOperator`
     *
     * @throws NullPointerException if `operators` is null or some element is null
     */
    public static LongUnaryOperator compose(final List<ILongUnaryOperator> operators) {
        Validate.noNullElements(operators);
        return new Compose(operators);
    }

    /**
     * @description Returns a `LongUnaryOperator` that always returns the input argument.
     *
     * @return the `LongUnaryOperator`
     */
    public static LongUnaryOperator identity() {
        return new Identity();
    }

    /**
     * @description Returns a `LongUnaryOperator` that always returns the `value`.
     *
     * @param value the Long value
     *
     * @return the `LongUnaryOperator`
     */
    public static LongUnaryOperator constant(final Long value) {
        return new Constant(value);
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
    // @end-group
    //</editor-fold>

}
