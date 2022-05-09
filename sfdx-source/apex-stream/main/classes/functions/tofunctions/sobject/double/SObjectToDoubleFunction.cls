/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link ISObjectToDoubleFunction} functional interface and provides
 * common class level implementations, and related utilities.
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
     * @param mapper the function
     * @return the `SObjectToDoubleFunction`
     * @throws NullPointerException if `mapper` is null
     */
    public static SObjectToDoubleFunction downcast(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new ForSObjectFunction(mapper);
    }

    /**
     * @description Returns a composed `SObjectToDoubleFunction` of the `IFunction`.
     * @param mapper the function
     * @return the `SObjectToDoubleFunction`
     * @throws NullPointerException if `mapper` is null
     */
    public static SObjectToDoubleFunction downcast(final IFunction mapper) {
        Validate.notNull(mapper);
        return new ForFunction(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `SObjectToDoubleFunction` that gets a value for
     * the specified `fieldName` as Double. Cross-reference fields and safe navigation are supported.
     * @example
     * SObjectToDoubleFunction.get('BillingLatitude');
     * SObjectToDoubleFunction.get('Parent.BillingLatitude');
     * SObjectToDoubleFunction.get('Parent?.BillingLatitude');
     * @param fieldName the field to get a Double value
     * @return the `SObjectToDoubleFunction`
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObject.get
     */
    public static SObjectToDoubleFunction get(final String fieldName) {
        return downcast(SObjectFunction.get(fieldName));
    }

    /**
     * @description Returns a `SObjectToDoubleFunction` that gets a value for
     * the specified `field` as Double.
     * @example
     * SObjectToDoubleFunction.get(Account.BillingLatitude);
     * @param field the field to get a value
     * @return the `SObjectToDoubleFunction`
     * @throws NullPointerException if `field` is null
     * @see SObject.get
     */
    public static SObjectToDoubleFunction get(final SObjectField field) {
        return downcast(SObjectFunction.get(field));
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
