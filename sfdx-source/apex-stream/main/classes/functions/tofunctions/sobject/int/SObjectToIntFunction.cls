/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link ISObjectToIntFunction} functional interface and provides
 * common class level implementations, and related utilities.
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
     * @param mapper the function
     * @return the `SObjectToIntFunction`
     * @throws NullPointerException if `mapper` is null
     */
    public static SObjectToIntFunction downcast(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new ForSObjectFunction(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `SObjectToIntFunction` that gets a value for
     * the specified `fieldName` as Integer. Cross-reference fields and safe navigation are supported.
     * @example
     * SObjectToIntFunction.get('NumberOfEmployees');
     * SObjectToIntFunction.get('Parent.NumberOfEmployees');
     * SObjectToIntFunction.get('Parent?.NumberOfEmployees');
     * @param fieldName the field to get a Integer value
     * @return the `SObjectToIntFunction`
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObject.get
     */
    public static SObjectToIntFunction get(final String fieldName) {
        return downcast(SObjectFunction.get(fieldName));
    }

    /**
     * @description Returns a `SObjectToIntFunction` that gets a value for
     * the specified `field` as Integer.
     * @example
     * SObjectToIntFunction.get(Account.NumberOfEmployees);
     * @param field the field to get a value
     * @return the `SObjectToIntFunction`
     * @throws NullPointerException if `field` is null
     * @see SObject.get
     */
    public static SObjectToIntFunction get(final SObjectField field) {
        return downcast(SObjectFunction.get(field));
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
