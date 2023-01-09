/**
 * @description Provides common implementations of {@link SObjectToIntFunction}
 * and related utilities.
 *
 * @see SObjectToIntFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class SObjectToIntFunctions {

    @TestVisible
    private SObjectToIntFunctions() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `SObjectToIntFunction` that gets a value for
     * the specified `fieldName` as Integer. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the field to get a Integer value
     *
     * @return the `SObjectToIntFunction`
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
     * SObjectToIntFunctions.get('NumberOfEmployees');
     * SObjectToIntFunctions.get('Parent.NumberOfEmployees');
     * SObjectToIntFunctions.get('Parent?.NumberOfEmployees');
     */
    public static SObjectToIntFunction get(final String fieldName) {
        return SObjectToIntFunction.compose(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectToIntFunction` that gets a value for
     * the specified `field` as Integer.
     *
     * @param field the field to get a value
     *
     * @return the `SObjectToIntFunction`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObject.get
     *
     * @example
     * SObjectToIntFunctions.get(Account.NumberOfEmployees);
     */
    public static SObjectToIntFunction get(final SObjectField field) {
        return SObjectToIntFunction.compose(SObjectFunctions.get(field));
    }
    // @end-group
    //</editor-fold>

}
