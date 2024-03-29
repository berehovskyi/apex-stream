/**
 * @description Provides default and static methods of 
 * {@link IFunction} functional interface.
 * 
 * @see IFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class Function implements IFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Object apply(Object o);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `Function` that executes `this` operation
     * first, then the `after` operation in that order.
     *
     * @param after the operation to perform after this operation
     *
     * @return the composed `Function`
     *
     * @throws NullPointerException if `after` is null
     */
    public virtual Function andThen(final IFunction after) {
        return compose(new List<IFunction>{ this, after });
    }

    /**
     * @description Returns a composed `Function` that executes `before` operation
     * first, then the `this` operation in that order.
     *
     * @param before the operation to perform before this operation
     *
     * @return the composed `Function`
     *
     * @throws NullPointerException if `before` is null
     */
    public virtual Function compose(final IFunction before) {
        return compose(new List<IFunction>{ before, this });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `Function` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     *
     * @param functions the functions to sequentially perform
     *
     * @return the composed `Function`
     *
     * @throws NullPointerException if `operators` is null or some element is null
     */
    public static Function compose(final List<IFunction> functions) {
        return new Compose(functions);
    }

    /**
     * @description Returns a `Function` that always returns the input argument.
     *
     * @return the `Function`
     */
    public static Function identity() {
        return new Identity();
    }

    /**
     * @description Returns a `Function` that always returns the `value`.
     *
     * @param value the value
     *
     * @return the `Function`
     */
    public static Function constant(final Object value) {
        return new Constant(value);
    }

    /**
     * @description Returns a composed `Function` of the `predicate`.
     *
     * @param predicate the predicate
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `predicate` is null
     */
    public static Function compose(final IPredicate predicate) {
        return new ForPredicate(predicate);
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
    public static Function compose(final ISupplier supplier) {
        return new ForSupplier(supplier);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Identity extends Function {
        public override Object apply(Object o) { return o; }
    }

    private class Compose extends Function {
        private final List<IFunction> functions;
        private Compose(List<IFunction> functions) {
            Validate.noNullElements(functions);
            this.functions = functions;
        }
        public override Object apply(Object o) {
            Object result = o;
            for (IFunction function : functions) {
                result = function.apply(result);
            }
            return result;
        }
    }

    private class ForPredicate extends Function {
        private final IPredicate predicate;
        private ForPredicate(IPredicate predicate) {
            Validate.notNull(predicate);
            this.predicate = predicate;
        }
        public override Object apply(Object o) { return predicate.test(o); }
    }
    
    private class Constant extends Function {
        private final Object value;
        private Constant(Object value) { this.value = value; }
        public override Object apply(Object o) { return value; }
    }

    private class ForSupplier extends Function {
        private final ISupplier supplier;
        private ForSupplier(ISupplier supplier) {
            Validate.notNull(supplier);
            this.supplier = supplier;
        }
        public override Object apply(Object o) { return supplier.get(); }
    }
    // @end-group
    //</editor-fold>

}
