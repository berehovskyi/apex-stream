/**
 * @description Provides default and static methods of 
 * {@link IOperator} functional interface.
 *
 * @see IOperator
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class Operator implements IOperator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Object apply(Object o);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `Operator` that executes `this` operation
     * first, then the `after` operation in that order.
     *
     * @param after the operation to perform after this operation
     *
     * @return the composed `Operator`
     *
     * @throws NullPointerException if `after` is null
     */
    public virtual Operator andThen(final IOperator after) {
        return compose(new List<IOperator>{ this, after });
    }

    /**
     * @description Returns a composed `Operator` that executes `before` operation
     * first, then the `this` operation in that order.
     *
     * @param before the operation to perform before this operation
     *
     * @return the composed `Operator`
     *
     * @throws NullPointerException if `before` is null
     */
    public virtual Operator compose(final IOperator before) {
        return compose(new List<IOperator>{ before, this });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `Operator` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     *
     * @param operators the operations to sequentially perform
     *
     * @return the composed `Operator`
     *
     * @throws NullPointerException if `operators` is null or some element is null
     */
    public static Operator compose(final List<IOperator> operators) {
        return new Compose(operators);
    }

    /**
     * @description Returns a `Operator` that always returns the input argument.
     *
     * @return the `Operator`
     */
    public static Operator identity() {
        return new Identity();
    }

    /**
     * @description Returns a `Operator` that always returns the `value`.
     *
     * @param value the value
     *
     * @return the `Operator`
     */
    public static Operator constant(final Object value) {
        return new Constant(value);
    }

    /**
     * @description Returns a composed `Operator` of the `consumer`.
     *
     * @param consumer the consumer
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `consumer` is null
     */
    public static Operator compose(final IConsumer consumer) {
        return new ForConsumer(consumer);
    }

    /**
     * @description Returns a composed `Operator` of the `supplier`.
     *
     * @param supplier the supplier
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `supplier` is null
     */
    public static Operator compose(final ISupplier supplier) {
        return new ForSupplier(supplier);
    }

    /**
     * @description Returns a combined `Operator` of the `operator`
     * and the `merger`.
     *
     * @param operator the operator
     * @param merger the binary operator that merges the input argument and a value returned by
     * the `operator`.
     *
     * @return the `Operator`
     *
     * @throws NullPointerException if `operator` or `merger` is null
     */
    public static Operator combine(final IOperator operator, final IBiOperator merger) {
        return new Combine(operator, merger);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Identity extends Operator {
        public override Object apply(Object o) { return o; }
    }

    private class Compose extends Operator {
        private final List<IOperator> operators;
        private Compose(List<IOperator> operators) {
            Validate.noNullElements(operators);
            this.operators = operators;
        }
        public override Object apply(Object o) {
            Object result = o;
            for (IOperator operator : operators) {
                result = operator.apply(result);
            }
            return result;
        }
    }

    private class Constant extends Operator {
        private final Object value;
        private Constant(Object value) { this.value = value; }
        public override Object apply(Object o) { return value; }
    }

    private class ForConsumer extends Operator {
        private final IConsumer consumer;
        private ForConsumer(IConsumer consumer) {
            Validate.notNull(consumer);
            this.consumer = consumer;
        }
        public override Object apply(Object o) {
            consumer.accept(o);
            return o;
        }
    }

    private class ForSupplier extends Operator {
        private final ISupplier supplier;
        private ForSupplier(ISupplier supplier) {
            Validate.notNull(supplier);
            this.supplier = supplier;
        }
        public override Object apply(Object o) { return supplier.get(); }
    }

    private class Combine extends Operator {
        private final IOperator valueMapper;
        private final IBiOperator merger;
        private Combine(IOperator valueMapper, IBiOperator merger) {
            Validate.notNull(valueMapper);
            Validate.notNull(merger);
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override Object apply(Object o) { return merger.apply(o, valueMapper.apply(o)); }
    }
    // @end-group
    //</editor-fold>

}
