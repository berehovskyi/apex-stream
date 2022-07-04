/**
 * @description Provides default and static methods of 
 * {@link ISObjectToIntFunction} functional interface.
 *
 * @see ISObjectToIntFunction
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class SObjectToIntFunction implements ISObjectToIntFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Integer apply(SObject sObj);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `SObjectToIntFunction` of the `ISObjectFunction`.
     *
     * @param mapper the function
     *
     * @return the `SObjectToIntFunction`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public static SObjectToIntFunction compose(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new ForSObjectFunction(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class ForSObjectFunction extends SObjectToIntFunction {
        private final ISObjectFunction mapper;
        private ForSObjectFunction(ISObjectFunction mapper) { this.mapper = mapper; }
        public override Integer apply(SObject sObj) { return (Integer) mapper.apply(sObj); }
    }
    // @end-group
    //</editor-fold>

}
