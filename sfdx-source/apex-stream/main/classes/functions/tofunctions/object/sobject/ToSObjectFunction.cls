/**
 * @description Provides default and static methods of 
 * {@link IToSObjectFunction} functional interface.
 *
 * @see IToSObjectFunction
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class ToSObjectFunction implements IToSObjectFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract SObject apply(Object o);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `ToSObjectFunction` of the `IFunction`.
     *
     * @param mapper the function
     *
     * @return the `ToSObjectFunction`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public static ToSObjectFunction compose(final IFunction mapper) {
        Validate.notNull(mapper);
        return new ForFunction(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class ForFunction extends ToSObjectFunction {
        private final IFunction mapper;
        private ForFunction(IFunction mapper) { this.mapper = mapper; }
        public override SObject apply(Object o) { return (SObject) mapper.apply(o); }
    }
    // @end-group
    //</editor-fold>

}
