/**
 * @description Inherits {@link ISObjectToLongFunction} functional interface and provides
 * common class level implementations, and related utilities.
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
    public static SObjectToLongFunction downcast(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new ForSObjectFunction(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `SObjectToLongFunction` that gets a value for
     * the specified `fieldName` as Long. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field to get a Long value
     *
     * @return the `SObjectToLongFunction`
     *
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.get
     *
     * @example
     * SObjectToLongFunction.get('NumberOfEmployees');
     * SObjectToLongFunction.get('Parent.NumberOfEmployees');
     * SObjectToLongFunction.get('Parent?.NumberOfEmployees');
     */
    public static SObjectToLongFunction get(final String fieldName) {
        return downcast(SObjectFunction.get(fieldName));
    }

    /**
     * @description Returns a `SObjectToLongFunction` that gets a value for
     * the specified `field` as Long.
     *
     * @param field the field to get a value
     *
     * @return the `SObjectToLongFunction`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObject.get
     *
     * @example
     * SObjectToLongFunction.get(Account.NumberOfEmployees);
     */
    public static SObjectToLongFunction get(final SObjectField field) {
        return downcast(SObjectFunction.get(field));
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
