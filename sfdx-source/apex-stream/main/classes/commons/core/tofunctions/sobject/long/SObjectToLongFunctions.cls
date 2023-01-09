/**
 * @description Provides common implementations of {@link SObjectToLongFunction}
 * and related utilities.
 *
 * @see SObjectToLongFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class SObjectToLongFunctions {

    @TestVisible
    private SObjectToLongFunctions() {}

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
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.get
     *
     * @example
     * SObjectToLongFunctions.get('NumberOfEmployees');
     * SObjectToLongFunctions.get('Parent.NumberOfEmployees');
     * SObjectToLongFunctions.get('Parent?.NumberOfEmployees');
     */
    public static SObjectToLongFunction get(final String fieldName) {
        return SObjectToLongFunction.compose(SObjectFunctions.get(fieldName));
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
     * SObjectToLongFunctions.get(Account.NumberOfEmployees);
     */
    public static SObjectToLongFunction get(final SObjectField field) {
        return SObjectToLongFunction.compose(SObjectFunctions.get(field));
    }
    // @end-group
    //</editor-fold>

}
