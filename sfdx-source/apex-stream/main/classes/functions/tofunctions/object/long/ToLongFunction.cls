/**
 * @description Provides default and static methods of 
 * {@link IToLongFunction} functional interface.
 *
 * @see IToLongFunction
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class ToLongFunction implements IToLongFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Long apply(Object o);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `ToLongFunction` of the `ISObjectFunction`.
     *
     * @param mapper the function
     *
     * @return the `ToLongFunction`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public static ToLongFunction compose(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new ForSObjectFunction(mapper);
    }

    /**
     * @description Returns a composed `ToLongFunction` of the `IFunction`.
     *
     * @param mapper the function
     *
     * @return the `ToLongFunction`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public static ToLongFunction compose(final IFunction mapper) {
        Validate.notNull(mapper);
        return new ForFunction(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class ForSObjectFunction extends ToLongFunction {
        private final ISObjectFunction mapper;
        private ForSObjectFunction(ISObjectFunction mapper) { this.mapper = mapper; }
        public override Long apply(Object o) { return (Long) mapper.apply((SObject) o); }
    }

    private class ForFunction extends ToLongFunction {
        private final IFunction mapper;
        private ForFunction(IFunction mapper) { this.mapper = mapper; }
        public override Long apply(Object o) { return (Long) mapper.apply(o); }
    }
    // @end-group
    //</editor-fold>

}
