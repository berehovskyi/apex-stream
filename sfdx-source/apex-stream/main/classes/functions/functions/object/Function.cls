/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link IFunction} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see IObjectIterable.mapTo
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
     * @param after the operation to perform after this operation
     * @return the composed `Function`
     * @throws NullPointerException if `after` is null
     */
    public virtual Function andThen(final IFunction after) {
        return compose(new List<IFunction>{ this, after });
    }

    /**
     * @description Returns a composed `Function` that executes `before` operation
     * first, then the `this` operation in that order.
     * @param before the operation to perform before this operation
     * @return the composed `Function`
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
     * @param functions the functions to sequentially perform
     * @return the composed `Function`
     * @throws NullPointerException if `operators` is null or some element is null
     */
    public static Function compose(final List<IFunction> functions) {
        Validate.noNullElements(functions);
        return new Compose(functions);
    }

    /**
     * @description Returns a `Function` that always returns the input argument.
     * @return the `Function`
     */
    public static Function identity() {
        return new Identity();
    }

    /**
     * @description Returns a `Function` that always returns the `value`.
     * @param value the value
     * @return the `Function`
     */
    public static Function constant(final Object value) {
        return new Constant(value);
    }

    /**
     * @description Returns a composed `Function` of the `predicate`.
     * @param predicate the predicate
     * @return the `Function`
     * @throws NullPointerException if `predicate` is null
     */
    public static Function forPredicate(final IPredicate predicate) {
        Validate.notNull(predicate);
        return new ForPredicate(predicate);
    }

    /**
     * @description Returns a composed `Function` of the `ISObjectFunction`.
     * @param function the function
     * @return the `Function`
     * @throws NullPointerException if `function` is null
     */
    public static Function upcast(final ISObjectFunction function) {
        Validate.notNull(function);
        return new ForSObjectFunction(function);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Identity extends Function {
        public override Object apply(Object o) { return o; }
    }

    private class Compose extends Function {
        private final  List<IFunction> functions;
        private Compose(List<IFunction> functions) { this.functions = functions; }
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
        private ForPredicate(IPredicate predicate) { this.predicate = predicate; }
        public override Object apply(Object o) { return predicate.test(o); }
    }

    private class ForSObjectFunction extends Function {
        private final ISObjectFunction mapper;
        private ForSObjectFunction(ISObjectFunction mapper) { this.mapper = mapper; }
        public override Object apply(Object o) { return mapper.apply((SObject) o); }
    }

    private class Constant extends Function {
        private final Object value;
        private Constant(Object value) { this.value = value; }
        public override Object apply(Object o) { return value; }
    }
    // @end-group
    //</editor-fold>

}
