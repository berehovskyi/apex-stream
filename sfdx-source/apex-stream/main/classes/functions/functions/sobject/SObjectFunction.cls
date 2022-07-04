/**
 * @description Provides default and static methods of 
 * {@link ISObjectFunction} functional interface.
 *
 * @see ISObjectFunction
 * @see ISObjectIterable.mapToObject
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class SObjectFunction implements ISObjectFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Object apply(SObject sObj);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a `SObjectFunction` that always returns the input argument.
     *
     * @return the `SObjectFunction`
     */
    public static SObjectFunction identity() {
        return new Identity();
    }

    /**
     * @description Returns a `SObjectFunction` that always returns the `value`.
     *
     * @param value the value
     *
     * @return the `SObjectFunction`
     */
    public static SObjectFunction constant(final Object value) {
        return new Constant(value);
    }

    /**
     * @description Returns a composed `SObjectFunction` of the `predicate`.
     *
     * @param predicate the predicate
     *
     * @return the `SObjectFunction`
     *
     * @throws NullPointerException if `predicate` is null
     */
    public static SObjectFunction compose(final ISObjectPredicate predicate) {
        Validate.notNull(predicate);
        return new ForPredicate(predicate);
    }

    /**
     * @description Returns a composed `SObjectFunction` of the `operator`.
     *
     * @param operator the operator
     *
     * @return the `SObjectFunction`
     *
     * @throws NullPointerException if `operator` is null
     */
    public static SObjectFunction compose(final ISObjectUnaryOperator operator) {
        Validate.notNull(operator);
        return new ForUnaryOperator(operator);
    }

    /**
     * @description Returns a composed `SObjectFunction` of the `supplier`.
     *
     * @param supplier the supplier
     *
     * @return the `SObjectFunction`
     *
     * @throws NullPointerException if `supplier` is null
     */
    public static SObjectFunction compose(final ISupplier supplier) {
        Validate.notNull(supplier);
        return new ForSupplier(supplier);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Identity extends SObjectFunction {
        public override Object apply(SObject sObj) { return sObj; }
    }

    private class Constant extends SObjectFunction {
        private final Object value;
        private Constant(Object value) { this.value = value; }
        public override Object apply(SObject sObj) { return value; }
    }

    private class ForPredicate extends SObjectFunction {
        private final ISObjectPredicate predicate;
        private ForPredicate(ISObjectPredicate predicate) { this.predicate = predicate; }
        public override Object apply(SObject sObj) { return predicate.test(sObj); }
    }

    private class ForUnaryOperator extends SObjectFunction {
        private final ISObjectUnaryOperator operator;
        private ForUnaryOperator(ISObjectUnaryOperator operator) { this.operator = operator; }
        public override Object apply(SObject sObj) { return operator.apply(sObj); }
    }

    private class ForSupplier extends SObjectFunction {
        private final ISupplier supplier;
        private ForSupplier(ISupplier supplier) { this.supplier = supplier; }
        public override Object apply(SObject sObj) { return supplier.get(); }
    }
    // @end-group
    //</editor-fold>

}
