/**
 * @description Provides default and static methods of 
 * {@link ISObjectToDoubleFunction} functional interface.
 *
 * @see ISObjectToDoubleFunction
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class SObjectToDoubleFunction implements ISObjectToDoubleFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Double apply(SObject sObj);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `SObjectToDoubleFunction` of the `ISObjectFunction`.
     *
     * @param mapper the function
     *
     * @return the `SObjectToDoubleFunction`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public static SObjectToDoubleFunction compose(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new ForSObjectFunction(mapper);
    }

    /**
     * @description Returns a composed `SObjectToDoubleFunction` of the `IFunction`.
     *
     * @param mapper the function
     *
     * @return the `SObjectToDoubleFunction`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public static SObjectToDoubleFunction downcast(final IFunction mapper) {
        Validate.notNull(mapper);
        return new ForFunction(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class ForSObjectFunction extends SObjectToDoubleFunction {
        private final ISObjectFunction mapper;
        private ForSObjectFunction(ISObjectFunction mapper) { this.mapper = mapper; }
        public override Double apply(SObject sObj) { return (Double) mapper.apply(sObj); }
    }

    private class ForFunction extends SObjectToDoubleFunction {
        private final IFunction mapper;
        private ForFunction(IFunction mapper) { this.mapper = mapper; }
        public override Double apply(SObject sObj) { return (Double) mapper.apply(sObj); }
    }
    // @end-group
    //</editor-fold>

}
