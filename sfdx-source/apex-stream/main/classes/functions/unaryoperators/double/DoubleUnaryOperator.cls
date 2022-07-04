/**
 * @description Provides default and static methods of 
 * {@link IDoubleUnaryOperator} functional interface.
 *
 * @see IDoubleUnaryOperator
 * @see IDoubleIterable.mapTo
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class DoubleUnaryOperator implements IDoubleUnaryOperator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Double apply(Double operand);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `DoubleUnaryOperator` that executes `this` operation
     * first, then the `after` operation in that order.
     *
     * @param after the operation to perform after this operation
     *
     * @return the composed `DoubleUnaryOperator`
     *
     * @throws NullPointerException if `after` is null
     */
    public virtual DoubleUnaryOperator andThen(final IDoubleUnaryOperator after) {
        return compose(new List<IDoubleUnaryOperator>{ this, after });
    }

    /**
     * @description Returns a composed `DoubleUnaryOperator` that executes `before` operation
     * first, then the `this` operation in that order.
     *
     * @param before the operation to perform before this operation
     *
     * @return the composed `DoubleUnaryOperator`
     *
     * @throws NullPointerException if `before` is null
     */
    public virtual DoubleUnaryOperator compose(final IDoubleUnaryOperator before) {
        return compose(new List<IDoubleUnaryOperator>{ before, this });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `DoubleUnaryOperator` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     *
     * @param operators the operations to sequentially perform
     *
     * @return the composed `DoubleUnaryOperator`
     *
     * @throws NullPointerException if `operators` is null or some element is null
     */
    public static DoubleUnaryOperator compose(final List<IDoubleUnaryOperator> operators) {
        Validate.noNullElements(operators);
        return new Compose(operators);
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that always returns the input argument.
     *
     * @return the `DoubleUnaryOperator`
     */
    public static DoubleUnaryOperator identity() {
        return new Identity();
    }

    /**
     * @description Returns a `DoubleUnaryOperator` that always returns the `value`.
     *
     * @param value the Double value
     *
     * @return the `DoubleUnaryOperator`
     */
    public static DoubleUnaryOperator constant(final Double value) {
        return new Constant(value);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Identity extends DoubleUnaryOperator {
        public override Double apply(Double operand) { return operand; }
    }

    private class Compose extends DoubleUnaryOperator {
        private final List<IDoubleUnaryOperator> operators;
        private Compose(List<IDoubleUnaryOperator> operators) { this.operators = operators; }
        public override Double apply(Double d) {
            Double result = d;
            for (IDoubleUnaryOperator operator : operators) {
                result = operator.apply(result);
            }
            return result;
        }
    }

    private class Constant extends DoubleUnaryOperator {
        private final Double value;
        private Constant(Double value) { this.value = value; }
        public override Double apply(Double di) { return value; }
    }
    // @end-group
    //</editor-fold>

}
