/**
 * @description Provides default and static methods of 
 * {@link ISObjectToLongFunction} functional interface.
 *
 * @see ISObjectToLongFunction
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class SObjectToLongFunction implements ISObjectToLongFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Long apply(SObject sObj);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `SObjectToLongFunction` of the `ISObjectFunction`.
     *
     * @param mapper the function
     *
     * @return the `SObjectToLongFunction`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public static SObjectToLongFunction compose(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new ForSObjectFunction(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class ForSObjectFunction extends SObjectToLongFunction {
        private final ISObjectFunction mapper;
        private ForSObjectFunction(ISObjectFunction mapper) { this.mapper = mapper; }
        public override Long apply(SObject sObj) { return (Long) mapper.apply(sObj); }
    }
    // @end-group
    //</editor-fold>

}
