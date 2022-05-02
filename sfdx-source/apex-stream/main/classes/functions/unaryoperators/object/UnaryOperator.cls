/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Inherits {@link IUnaryOperator} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see IObjectIterable.mapTo
 */
public abstract inherited sharing class UnaryOperator implements IUnaryOperator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Object apply(Object o);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `UnaryOperator` that executes `this` operation
     * first, then the `after` operation in that order.
     * @param after the operation to perform after this operation
     * @return the composed `UnaryOperator`
     * @throws NullPointerException if `after` is null
     */
    public virtual UnaryOperator andThen(final IUnaryOperator after) {
        return compose(new List<IUnaryOperator>{ this, after });
    }

    /**
     * @description Returns a composed `UnaryOperator` that executes `before` operation
     * first, then the `this` operation in that order.
     * @param before the operation to perform before this operation
     * @return the composed `UnaryOperator`
     * @throws NullPointerException if `before` is null
     */
    public virtual UnaryOperator compose(final IUnaryOperator before) {
        return compose(new List<IUnaryOperator>{ before, this });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `UnaryOperator` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     * @param operators the operations to sequentially perform
     * @return the composed `UnaryOperator`
     * @throws NullPointerException if `operators` is null or some element is null
     */
    public static UnaryOperator compose(final List<IUnaryOperator> operators) {
        Validate.noNullElements(operators);
        return new Compose(operators);
    }

    /**
     * @description Returns a `UnaryOperator` that always returns the input argument.
     * @return the `UnaryOperator`
     */
    public static UnaryOperator identity() {
        return new Identity();
    }

    /**
     * @description Returns a `UnaryOperator` that always returns the `value`.
     * @param value the value
     * @return the `UnaryOperator`
     */
    public static UnaryOperator constant(final Object value) {
        return new Constant(value);
    }

    /**
     * @description Returns a composed `UnaryOperator` of the `IIntUnaryOperator`.
     * @param operator applied to the input argument casted to `Integer`
     * @return the `UnaryOperator`
     * @throws NullPointerException if `operator` is null
     */
    public static UnaryOperator upcast(final IIntUnaryOperator operator) {
        Validate.notNull(operator);
        return new ForIntUnaryOperator(operator);
    }

    /**
     * @description Returns a composed `UnaryOperator` of the `ILongUnaryOperator`.
     * @param operator applied to the input argument casted to `Long`
     * @return the `UnaryOperator`
     * @throws NullPointerException if `operator` is null
     */
    public static UnaryOperator upcast(final ILongUnaryOperator operator) {
        Validate.notNull(operator);
        return new ForLongUnaryOperator(operator);
    }

    /**
     * @description Returns a composed `UnaryOperator` of the `IDoubleUnaryOperator`.
     * @param operator applied to the input argument casted to `Double`
     * @return the `UnaryOperator`
     * @throws NullPointerException if `operator` is null
     */
    public static UnaryOperator upcast(final IDoubleUnaryOperator operator) {
        Validate.notNull(operator);
        return new ForDoubleUnaryOperator(operator);
    }

    /**
     * @description Returns a composed `UnaryOperator` of the `ISObjectUnaryOperator`.
     * @param operator applied to the input argument casted to `SObject`
     * @return the `UnaryOperator`
     * @throws NullPointerException if `operator` is null
     */
    public static UnaryOperator upcast(final ISObjectUnaryOperator operator) {
        Validate.notNull(operator);
        return new ForSObjectUnaryOperator(operator);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Identity extends UnaryOperator {
        public override Object apply(Object o) { return o; }
    }

    private class Compose extends UnaryOperator {
        private final List<IUnaryOperator> operators;
        private Compose(List<IUnaryOperator> operators) { this.operators = operators; }
        public override Object apply(Object o) {
            Object result = o;
            for (IUnaryOperator operator : operators) {
                result = operator.apply(result);
            }
            return result;
        }
    }

    private class Constant extends UnaryOperator {
        private final Object value;
        private Constant(Object value) { this.value = value; }
        public override Object apply(Object o) { return value; }
    }

    private class ForIntUnaryOperator extends UnaryOperator {
        private final IIntUnaryOperator operator;
        private ForIntUnaryOperator(IIntUnaryOperator operator) { this.operator = operator; }
        public override Object apply(Object o) { return operator.apply((Integer) o); }
    }

    private class ForLongUnaryOperator extends UnaryOperator {
        private final ILongUnaryOperator operator;
        private ForLongUnaryOperator(ILongUnaryOperator operator) { this.operator = operator; }
        public override Object apply(Object o) { return operator.apply((Long) o); }
    }

    private class ForDoubleUnaryOperator extends UnaryOperator {
        private final IDoubleUnaryOperator operator;
        private ForDoubleUnaryOperator(IDoubleUnaryOperator operator) { this.operator = operator; }
        public override Object apply(Object o) { return operator.apply((Double) o); }
    }

    private class ForSObjectUnaryOperator extends UnaryOperator {
        private final ISObjectUnaryOperator operator;
        private ForSObjectUnaryOperator(ISObjectUnaryOperator operator) { this.operator = operator; }
        public override Object apply(Object o) { return operator.apply((SObject) o); }
    }
    // @end-group
    //</editor-fold>

}
