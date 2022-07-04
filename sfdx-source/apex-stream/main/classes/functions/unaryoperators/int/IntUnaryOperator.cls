/**
 * @description Provides default and static methods of 
 * {@link IIntUnaryOperator} functional interface.
 *
 * @see IIntUnaryOperator
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
    // @end-group
    //</editor-fold>

}
