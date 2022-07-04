/**
 * @description Provides default and static methods of 
 * {@link ISObjectUnaryOperator} functional interface.
 *
 * @see ISObjectUnaryOperator
 * @see ISObjectIterable.mapTo
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class SObjectUnaryOperator implements ISObjectUnaryOperator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract SObject apply(SObject sObj);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `SObjectUnaryOperator` that executes `this` operation
     * first, then the `after` operation in that order.
     *
     * @param after the operation to perform after this operation
     *
     * @return the composed `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `after` is null
     */
    public virtual SObjectUnaryOperator andThen(final ISObjectUnaryOperator after) {
        return compose(new List<ISObjectUnaryOperator>{ this, after });
    }

    /**
     * @description Returns a composed `SObjectUnaryOperator` that executes `before` operation
     * first, then the `this` operation in that order.
     *
     * @param before the operation to perform before this operation
     *
     * @return the composed `SObjectUnaryOperator`
     *
     * @throws NullPointerException if before is null
     */
    public virtual SObjectUnaryOperator compose(final ISObjectUnaryOperator before) {
        return compose(new List<ISObjectUnaryOperator>{ before, this });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `SObjectUnaryOperator` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     *
     * @param operators the operations to sequentially perform
     *
     * @return the composed `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `operators` is null or some element is null
     */
    public static SObjectUnaryOperator compose(final List<ISObjectUnaryOperator> operators) {
        Validate.noNullElements(operators);
        return new Compose(operators);
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that always returns the input argument.
     *
     * @return the `SObjectUnaryOperator`
     */
    public static SObjectUnaryOperator identity() {
        return new Identity();
    }

    /**
     * @description Returns a `SObjectUnaryOperator` that always returns the `value`.
     *
     * @param value the const value
     *
     * @return the `SObjectUnaryOperator`
     */
    public static SObjectUnaryOperator constant(final SObject value) {
        return new Constant(value);
    }

    /**
     * @description Returns a composed `SObjectUnaryOperator` of the `consumer`.
     *
     * @param consumer the consumer
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `consumer` is null
     */
    public static SObjectUnaryOperator compose(final ISObjectConsumer consumer) {
        Validate.notNull(consumer);
        return new ForSObjectConsumer(consumer);
    }

    /**
     * @description Returns a composed `SObjectUnaryOperator` of the `supplier`.
     *
     * @param supplier the supplier
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `supplier` is null
     */
    public static SObjectUnaryOperator compose(final ISObjectSupplier supplier) {
        Validate.notNull(supplier);
        return new ForSObjectSupplier(supplier);
    }

    /**
     * @description Returns a combined `SObjectUnaryOperator` of the `operator`
     * and the `merger`.
     *
     * @param operator the operator
     * @param merger the binary operator that merges the input argument and a value returned by
     * the `operator`.
     *
     * @return the `SObjectUnaryOperator`
     *
     * @throws NullPointerException if `operator` or `merger` is null
     */
    public static SObjectUnaryOperator combine(
            final ISObjectUnaryOperator operator,
            final ISObjectBinaryOperator merger
    ) {
        Validate.notNull(operator);
        Validate.notNull(merger);
        return new Combine(operator, merger);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Identity extends SObjectUnaryOperator {
        public override SObject apply(SObject sObj) { return sObj; }
    }

    private class Compose extends SObjectUnaryOperator {
        private final List<ISObjectUnaryOperator> operators;
        private Compose(List<ISObjectUnaryOperator> operators) { this.operators = operators; }
        public override SObject apply(SObject sObj) {
            SObject result = sObj;
            for (ISObjectUnaryOperator operator : operators) {
                result = operator.apply(result);
            }
            return result;
        }
    }

    private class Constant extends SObjectUnaryOperator {
        private final SObject value;
        private Constant(SObject value) { this.value = value; }
        public override SObject apply(SObject sObj) { return value; }
    }

    private class ForSObjectConsumer extends SObjectUnaryOperator {
        private final ISObjectConsumer consumer;
        private ForSObjectConsumer(ISObjectConsumer consumer) { this.consumer = consumer; }
        public override SObject apply(SObject sObj) {
            consumer.accept(sObj);
            return sObj;
        }
    }

    private class ForSObjectSupplier extends SObjectUnaryOperator {
        private final ISObjectSupplier supplier;
        private ForSObjectSupplier(ISObjectSupplier supplier) { this.supplier = supplier; }
        public override SObject apply(SObject sObj) { return supplier.get(); }
    }

    private class Combine extends SObjectUnaryOperator {
        private final ISObjectUnaryOperator valueMapper;
        private final ISObjectBinaryOperator merger;
        private Combine(ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger) {
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override SObject apply(SObject sObj) { return merger.apply(sObj, valueMapper.apply(sObj)); }
    }
    // @end-group
    //</editor-fold>

}
