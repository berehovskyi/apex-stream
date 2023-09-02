/**
 * @description
 * @author Oleh Berehovskyi
 */
public virtual inherited sharing class BaseSObjectPredicates extends BasePredicates {

    @TestVisible
    private BaseSObjectPredicates() {}

    /**
     * @description Returns a `Predicate` that tests the input SObject if the value of
     * the `fieldName` is equal to the result returned by the `function`,
     * comparing object value equality not reference equality.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the value of which is considered the left argument of comparison
     * @param function the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `function` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * Predicates.isEqual(
     *     'NumberOfEmployees',
     *      Functions.get('OtherIntField__c')
     * );
     * Predicates.isEqual(
     *     'Parent?.NumberOfEmployees',
     *     Function.constant(100)
     * );
     */
    public static Predicate isEqual(final String fieldName, final IFunction function) {
        return isEqual(BaseSObjectFunctions.get(fieldName), function);
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the value of
     * the `field` is equal to the result returned by the `function`,
     * comparing object value equality not reference equality.
     *
     * @param field the value of which is considered the left argument of comparison
     * @param function the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `field` or `function` is null
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * Predicates.isEqual(
     *     Account.NumberOfEmployees,
     *     Functions.get('OtherIntField__c')
     * );
     * Predicates.isEqual(
     *     Account.NumberOfEmployees,
     *     Function.constant(100)
     * );
     */
    public static Predicate isEqual(final SObjectField field, final IFunction function) {
        return isEqual(BaseSObjectFunctions.get(field), function);
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the value of
     * the `fieldName` is equal to the `value`, comparing object value equality
     * not reference equality. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * Predicates.isEqual('NumberOfEmployees', 100);
     * Predicates.isEqual('Parent?.NumberOfEmployees', 100);
     */
    public static Predicate isEqual(final String fieldName, final Object value) {
        return isEqual(BaseSObjectFunctions.get(fieldName), Function.constant(value));
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the value of
     * the `field` is equal to the `value`, comparing object value equality
     * not reference equality.
     *
     * @param field the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * Predicates.isEqual(Account.NumberOfEmployees, 100);
     */
    public static Predicate isEqual(final SObjectField field, final Object value) {
        return isEqual(BaseSObjectFunctions.get(field), Function.constant(value));
    }

}