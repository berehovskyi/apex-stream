/**
 * @description Provides common implementations of {@link SObjectToDoubleFunction}
 * and related utilities.
 *
 * @see SObjectToDoubleFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class SObjectToDoubleFunctions {

    @TestVisible
    private SObjectToDoubleFunctions() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `SObjectToDoubleFunction` that gets a value for
     * the specified `fieldName` as Double. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field to get a Double value
     *
     * @return the `SObjectToDoubleFunction`
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
     * SObjectToDoubleFunctions.get('BillingLatitude');
     * SObjectToDoubleFunctions.get('Parent.BillingLatitude');
     * SObjectToDoubleFunctions.get('Parent?.BillingLatitude');
     */
    public static SObjectToDoubleFunction get(final String fieldName) {
        return SObjectToDoubleFunction.compose(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectToDoubleFunction` that gets a value for
     * the specified `field` as Double.
     *
     * @param field the field to get a value
     *
     * @return the `SObjectToDoubleFunction`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObject.get
     *
     * @example
     * SObjectToDoubleFunctions.get(Account.BillingLatitude);
     */
    public static SObjectToDoubleFunction get(final SObjectField field) {
        return SObjectToDoubleFunction.compose(SObjectFunctions.get(field));
    }
    // @end-group
    //</editor-fold>

}
