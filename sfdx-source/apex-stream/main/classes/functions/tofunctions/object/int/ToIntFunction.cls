/**
 * @description Provides default and static methods of 
 * {@link IToIntFunction} functional interface.
 *
 * @see IToIntFunction
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class ToIntFunction implements IToIntFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Integer apply(Object o);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `ToDoubleFunction` of the `ISObjectFunction`.
     *
     * @param mapper the function
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public static ToIntFunction compose(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new ForSObjectFunction(mapper);
    }

    /**
     * @description Returns a composed `ToDoubleFunction` of the `IFunction`.
     *
     * @param mapper the function
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public static ToIntFunction compose(final IFunction mapper) {
        Validate.notNull(mapper);
        return new ForFunction(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class ForFunction extends ToIntFunction {
        private final IFunction mapper;
        private ForFunction(IFunction mapper) { this.mapper = mapper; }
        public override Integer apply(Object o) { return (Integer) mapper.apply(o); }
    }

    private class ForSObjectFunction extends ToIntFunction {
        private final ISObjectFunction mapper;
        private ForSObjectFunction(ISObjectFunction mapper) { this.mapper = mapper; }
        public override Integer apply(Object o) { return (Integer) mapper.apply((SObject) o); }
    }
    // @end-group
    //</editor-fold>

}
