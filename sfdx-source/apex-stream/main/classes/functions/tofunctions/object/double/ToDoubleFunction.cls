/**
 * @description Provides default and static methods of 
 * {@link IToDoubleFunction} functional interface.
 *
 * @see IToDoubleFunction
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class ToDoubleFunction implements IToDoubleFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Double apply(Object o);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `ToDoubleFunction` of the `ISObjectFunction`.
     *
     * @param mapper the function
     *
     * @return the `ToDoubleFunction`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public static ToDoubleFunction compose(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new ForSObjectFunction(mapper);
    }

    /**
     * @description Returns a composed `ToDoubleFunction` of the `IFunction`.
     *
     * @param mapper the function
     *
     * @return the `ToDoubleFunction`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public static ToDoubleFunction compose(final IFunction mapper) {
        Validate.notNull(mapper);
        return new ForFunction(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class ForFunction extends ToDoubleFunction {
        private final IFunction mapper;
        private ForFunction(IFunction mapper) { this.mapper = mapper; }
        public override Double apply(Object o) { return (Double) mapper.apply(o); }
    }

    private class ForSObjectFunction extends ToDoubleFunction {
        private final ISObjectFunction mapper;
        private ForSObjectFunction(ISObjectFunction mapper) { this.mapper = mapper; }
        public override Double apply(Object o) { return (Double) mapper.apply((SObject) o); }
    }
    // @end-group
    //</editor-fold>

}
