/**
 * @description Provides common implementations of {@link Predicate}
 * and related utilities.
 *
 * @see Predicate
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
@SuppressWarnings('PMD.CognitiveComplexity, PMD.ExcessivePublicCount')
public virtual inherited sharing class SObjectPredicates extends Predicates {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected SObjectPredicates() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins

    //<editor-fold desc=">">
    /**
     * @description Returns a `Predicate` that tests the input SObject if the value of
     * the `fieldName` is greater than the result returned by the `function`.
     * Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
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
     * SObjectPredicates.isGreater('NumberOfEmployees', Functions.get('OtherIntField__c'));
     * SObjectPredicates.isGreater(
     *     'Parent?.NumberOfEmployees',
     *     Function.constant(100)
     * );
     */
    public static Predicate isGreater(final String fieldName, final IFunction function) {
        return isGreater(BaseSObjectFunctions.get(fieldName), function);
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the value of
     * the `field` is greater than the result returned by the `function`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
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
     * SObjectPredicates.isGreater(
     *         Account.NumberOfEmployees,
     *         Functions.get('OtherIntField__c')
     *     );
     * SObjectPredicates.isGreater(
     *         Account.NumberOfEmployees,
     *         Function.constant(100)
     *     );
     */
    public static Predicate isGreater(final SObjectField field, final IFunction function) {
        return isGreater(BaseSObjectFunctions.get(field), function);
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the value of
     * the `fieldName` is greater than the `value`.
     * Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
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
     * SObjectPredicates.isGreater('NumberOfEmployees', 100);
     * SObjectPredicates.isGreater('Parent?.NumberOfEmployees', 100);
     */
    public static Predicate isGreater(final String fieldName, final Object value) {
        return isGreater(BaseSObjectFunctions.get(fieldName), Function.constant(value));
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the value of
     * the `field` is greater than the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
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
     * SObjectPredicates.isGreater(Account.NumberOfEmployees, 100);
     */
    public static Predicate isGreater(final SObjectField field, final Object value) {
        return isGreater(BaseSObjectFunctions.get(field), Function.constant(value));
    }
    //</editor-fold>

    //<editor-fold desc=">=">
    /**
     * @description Returns a `Predicate` that tests the input SObject if the value of
     * the `fieldName` is greater than or equal to the result returned by the `function`.
     * Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
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
     * SObjectPredicates.isGreaterOrEqual(
     *     'NumberOfEmployees',
     *     Functions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isGreaterOrEqual(
     *     'Parent?.NumberOfEmployees',
     *     Function.constant(100)
     * );
     */
    public static Predicate isGreaterOrEqual(final String fieldName, final IFunction function) {
        return isGreater(fieldName, function).orElse(isEqual(fieldName, function));
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject  if the value of
     * the `field` is greater than or equal to the result returned by the `function`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param field the value of which is considered the left argument of comparison
     * @param function the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `function` is null
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * SObjectPredicates.isGreaterOrEqual(
     *     Account.NumberOfEmployees,
     *     Functions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isGreaterOrEqual(
     *     Account.NumberOfEmployees,
     *     Function.constant(100)
     * );
     */
    public static Predicate isGreaterOrEqual(final SObjectField field, final IFunction function) {
        return isGreater(field, function).orElse(isEqual(field, function));
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the value of
     * the `fieldName` is greater than or equal to the `value`.
     * Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
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
     * SObjectPredicates.isGreaterOrEqual('NumberOfEmployees', 100);
     * SObjectPredicates.isGreaterOrEqual('Parent?.NumberOfEmployees', 100);
     */
    public static Predicate isGreaterOrEqual(final String fieldName, final Object value) {
        return isGreater(fieldName, value).orElse(isEqual(fieldName, value));
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the value of
     * the `field` is greater than or equal to the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
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
     * SObjectPredicates.isGreaterOrEqual(Account.NumberOfEmployees, 100);
     */
    public static Predicate isGreaterOrEqual(final SObjectField field, final Object value) {
        return isGreater(field, value).orElse(isEqual(field, value));
    }
    //</editor-fold>

    //<editor-fold desc="<">
    /**
     * @description Returns a `SObjectPredicate` that tests if the value of
     * the `fieldName` is less than the result returned by the `function`.
     * Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param fieldName the value of which is considered the left argument of comparison.
     * @param function the function whose application result is considered as the right argument of comparison.
     *
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `function` is null
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * SObjectPredicates.isLess('NumberOfEmployees', SObjectFunctions.get('OtherIntField__c'));
     * SObjectPredicates.isLess(
     *     'Parent?.NumberOfEmployees',
     *     SObjectFunction.constant(100)
     * );
     */
    public static Predicate isLess(final String fieldName, final IFunction function) {
        return isLess(BaseSObjectFunctions.get(fieldName), function);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests if the value of
     * the `field` is less than the result returned by the `function`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param field the value of which is considered the left argument of comparison.
     * @param function the function whose application result is considered as the right argument of comparison.
     *
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `function` is null
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * SObjectPredicates.isLess(
     *     Account.NumberOfEmployees,
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isLess(
     *     Account.NumberOfEmployees,
     *     SObjectFunction.constant(100)
     * );
     */
    public static Predicate isLess(final SObjectField field, final IFunction function) {
        return isLess(BaseSObjectFunctions.get(field), function);
    }

    /**
     * @description Returns a `Predicate` that tests if the value of
     * the `fieldName` is less than the `value`.
     * Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param fieldName the value of which is considered the left argument of comparison.
     * @param value the right argument of comparison.
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
     * SObjectPredicates.isLess('NumberOfEmployees', 100);
     * SObjectPredicates.isLess('Parent?.NumberOfEmployees', 100);
     */
    public static Predicate isLess(final String fieldName, final Object value) {
        return isLess(BaseSObjectFunctions.get(fieldName), Function.constant(value));
    }

    /**
     * @description Returns a `Predicate` that tests if the value of
     * the `field` is less than the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param field the value of which is considered the left argument of comparison.
     * @param value the right argument of comparison.
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * SObjectPredicates.isLess(Account.NumberOfEmployees, 100);
     */
    public static Predicate isLess(final SObjectField field, final Object value) {
        return isLess(BaseSObjectFunctions.get(field), Function.constant(value));
    }
    //</editor-fold>

    //<editor-fold desc="<=">
    /**
     * @description Returns a `Predicate` that tests if the value of
     * the `fieldName` is less than or equal to the result returned by the `function`.
     * Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param fieldName the value of which is considered the left argument of comparison.
     * @param function the function whose application result is considered as the right argument of comparison.
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
     * SObjectPredicates.isLessOrEqual(
     *     'NumberOfEmployees',
     *      Functions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isLessOrEqual(
     *     'Parent?.NumberOfEmployees',
     *     Function.constant(100)
     * );
     */
    public static Predicate isLessOrEqual(final String fieldName, final IFunction function) {
        return isLess(fieldName, function).orElse(isEqual(fieldName, function));
    }

    /**
     * @description Returns a `Predicate` that tests if the value of
     * the `field` is less than or equal to the result returned by the `function`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param field the value of which is considered the left argument of comparison.
     * @param function the function whose application result is considered as the right argument of comparison.
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `field` or `function` is null
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * SObjectPredicates.isLessOrEqual(
     *     Account.NumberOfEmployees,
     *     Functions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isLessOrEqual(
     *     Account.NumberOfEmployees,
     *     Function.constant(100)
     * );
     */
    public static Predicate isLessOrEqual(final SObjectField field, final IFunction function) {
        return isLess(field, function).orElse(isEqual(field, function));
    }

    /**
     * @description Returns a `Predicate` that tests if the value of
     * the `fieldName` is less than or equal to the `value`.
     * Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param fieldName the value of which is considered the left argument of comparison.
     * @param value the right argument of comparison.
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
     * SObjectPredicates.isLessOrEqual('NumberOfEmployees', 100);
     * SObjectPredicates.isLessOrEqual('Parent?.NumberOfEmployees', 100);
     */
    public static Predicate isLessOrEqual(final String fieldName, final Object value) {
        return isLess(fieldName, value).orElse(isEqual(fieldName, value));
    }

    /**
     * @description Returns a `Predicate` that tests if the value of
     * the `field` is less than or equal to the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param field the value of which is considered the left argument of comparison.
     * @param value the right argument of comparison.
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * SObjectPredicates.isLessOrEqual(Account.NumberOfEmployees, 100);
     */
    public static Predicate isLessOrEqual(final SObjectField field, final Object value) {
        return isLess(field, value).orElse(isEqual(field, value));
    }
    //</editor-fold>

    //<editor-fold desc="==">
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
     * SObjectPredicates.isEqual(
     *     'NumberOfEmployees',
     *      Functions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isEqual(
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
     * SObjectPredicates.isEqual(
     *     Account.NumberOfEmployees,
     *     Functions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isEqual(
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
     * SObjectPredicates.isEqual('NumberOfEmployees', 100);
     * SObjectPredicates.isEqual('Parent?.NumberOfEmployees', 100);
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
     * SObjectPredicates.isEqual(Account.NumberOfEmployees, 100);
     */
    public static Predicate isEqual(final SObjectField field, final Object value) {
        return isEqual(BaseSObjectFunctions.get(field), Function.constant(value));
    }
    //</editor-fold>

    //<editor-fold desc="!=">
    /**
     * @description Returns a `Predicate` that tests the input SObject if the value of
     * the `fieldName` is not equal to the result returned by the `function`,
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
     * SObjectPredicates.isEqual(
     *     'NumberOfEmployees',
     *      Functions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isEqual(
     *     'Parent?.NumberOfEmployees',
     *     Function.constant(100)
     * );
     */
    public static Predicate isNotEqual(final String fieldName, final IFunction function) {
        return isEqual(fieldName, function).negate();
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the value of
     * the `field` is not equal to the result returned by the `function`,
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
     * SObjectPredicates.isEqual(
     *     Account.NumberOfEmployees,
     *     Functions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isEqual(
     *     Account.NumberOfEmployees,
     *     Function.constant(100)
     * );
     */
    public static Predicate isNotEqual(final SObjectField field, final IFunction function) {
        return isEqual(field, function).negate();
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the value of
     * the `fieldName` is not equal to the `value`, comparing object value equality
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
     * SObjectPredicates.isEqual('NumberOfEmployees', 100);
     * SObjectPredicates.isEqual('Parent?.NumberOfEmployees', 100);
     */
    public static Predicate isNotEqual(final String fieldName, final Object value) {
        return isEqual(fieldName, value).negate();
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the value of
     * the `field` is not equal to the `value`, comparing object value equality
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
     * SObjectPredicates.isEqual(Account.NumberOfEmployees, 100);
     */
    public static Predicate isNotEqual(final SObjectField field, final Object value) {
        return isEqual(field, value).negate();
    }
    //</editor-fold>

    //<editor-fold desc="LIKE">
    /**
     * @description Returns a `Predicate` that tests the input SObject if the string value of
     * the `fieldName` matches the `likeString` pattern. Supports the `%` and
     * the `_` wildcards and is case-insensitive. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the value of which is tested
     * @param likeString the pattern that is tested to match the string value of the `fieldName`
     *
     * @return the `Predicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `likeString` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * SObjectPredicates.isLike('Name', '%a_e');
     * SObjectPredicates.isLike('Parent?.Name', '%a_e');
     */
    public static Predicate isLike(final String fieldName, final String likeString) {
        return isLike(BaseSObjectFunctions.get(fieldName), likeString);
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the string value of
     * the `field` matches the `likeString` pattern. Supports the `%` and
     * the `_` wildcards and is case-insensitive. Cross-reference fields and safe navigation are supported.
     *
     * @param field the value of which is tested
     * @param likeString the pattern that is tested to match the string value of the `field`
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `field` or `likeString` is null
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * SObjectPredicates.isLike(Account.Name, '%a_e');
     */
    public static Predicate isLike(final SObjectField field, final String likeString) {
        return isLike(BaseSObjectFunctions.get(field), likeString);
    }
    //</editor-fold>

    //<editor-fold desc="IN">
    /**
     * @description Returns a `Predicate` that tests the input SObject if the the value of
     * the `fieldName` is contained in the `container`. Cross-reference fields and safe
     * navigation are supported.
     *
     * @param fieldName the value of which is tested
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `Predicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `container` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see List.contains
     *
     * @example
     * SObjectPredicates.isIn('Name', new List<Object>{ 'John', 'Jim' });
     * SObjectPredicates.isIn('Parent?.Name', new Set<String>{ 'John', 'Jim' });
     * SObjectPredicates.isIn('Parent.Name', nameStream);
     */
    public static Predicate isIn(final String fieldName, final Iterable<Object> container) {
        return isIn(BaseSObjectFunctions.get(fieldName), container);
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the the value of
     * the `field` is contained in the `container`.
     *
     * @param field the value of which is tested
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `field` or `container` is null
     *
     * @see List.contains
     *
     * @example
     * SObjectPredicates.isIn(Account.Name, new List<Object>{ 'John', 'Jim' });
     * SObjectPredicates.isIn(Account.Name, new Set<String>{ 'John', 'Jim' });
     * SObjectPredicates.isIn(Account.Name, nameStream);
     */
    public static Predicate isIn(final SObjectField field, final Iterable<Object> container) {
        return isIn(BaseSObjectFunctions.get(field), container);
    }
    //</editor-fold>

    //<editor-fold desc="NOT IN">
    /**
     * @description Returns a `Predicate` that tests the input SObject if the the value of
     * the `fieldName` is not contained in the `container`. Cross-reference fields and safe
     * navigation are supported.
     *
     * @param fieldName the value of which is tested
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `Predicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `container` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see List.contains
     *
     * @example
     * SObjectPredicates.isNotIn('Name', new List<Object>{ 'John', 'Jim' });
     * SObjectPredicates.isNotIn('Parent?.Name', new Set<String>{ 'John', 'Jim' });
     * SObjectPredicates.isNotIn('Parent.Name', nameStream);
     */
    public static Predicate isNotIn(final String fieldName, final Iterable<Object> container) {
        return isIn(fieldName, container).negate();
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the the value of
     * the `field` is not contained in the `container`.
     *
     * @param field the value of which is tested
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `field` or `container` is null
     *
     * @see List.contains
     *
     * @example
     * SObjectPredicates.isNotIn(Account.Name, new List<Object>{ 'John', 'Jim' });
     * SObjectPredicates.isNotIn(Account.Name, new Set<String>{ 'John', 'Jim' });
     * SObjectPredicates.isNotIn(Account.Name, nameStream);
     */
    public static Predicate isNotIn(final SObjectField field, final Iterable<Object> container) {
        return isIn(field, container).negate();
    }
    //</editor-fold>

    //<editor-fold desc="INCLUDES">
    /**
     * @description Returns a `Predicate` that tests the input SObject if the string value of
     * the `fieldName` fully matches any element of the `container`.
     * Each element of the `container` should be represented as a subset and the subset elements
     * should be separated by `;`. Cross-reference fields and safe
     * navigation are supported.
     *
     * @param fieldName the value of which is tested
     * @param container the iterable against which the value is tested
     *
     * @return the `Predicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `container` is null or `container` contains null element
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * Account acc = new Account(Name = 'AAA;BBB');
     * SObjectPredicates.includes('Name', new List<String>{ 'AAA' }).test(person); // false
     * SObjectPredicates.includes('Name', new Set<String>{ 'AAA;BBB' }).test(person); // true
     * SObjectPredicates.includes('Name', new Set<String>{ 'BBB;CCC' }).test(person); // false
     * SObjectPredicates.includes('Name', new Set<String>{ 'AAA;CCC', 'BBB' }).test(person); // true
     * SObjectPredicates.includes('Name', new List<String>{ 'AAA;BBB;CCC' }).test(person); // false
     * // it is also possible
     * SObjectPredicates.includes('Parent?.Name', new List<String>{ 'AAA' });
     */
    public static Predicate includes(final String fieldName, final Iterable<String> container) {
        return includes(BaseSObjectFunctions.get(fieldName), container);
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the string value of
     * the `field` fully matches any element of the `container`.
     * Each element of the `container` should be represented as a subset and the subset elements
     * should be separated by `;`.
     *
     * @param field the value of which is tested
     * @param container the iterable against which the value is tested
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `field`, `container` is null, or `container` contains null element
     *
     * @see List.contains
     *
     * @example
     * Account acc = new Account(Name = 'AAA;BBB');
     * SObjectPredicates.includes(Account.Name, new List<String>{ 'AAA' }).test(person); // false
     * SObjectPredicates.includes(Account.Name, new Set<String>{ 'AAA;BBB' }).test(person); // true
     * SObjectPredicates.includes(Account.Name, new Set<String>{ 'BBB;CCC' }).test(person); // false
     * SObjectPredicates.includes(Account.Name, new Set<String>{ 'AAA;CCC', 'BBB' }).test(person); // true
     * SObjectPredicates.includes(Account.Name, new List<String>{ 'AAA;BBB;CCC' }).test(person); // false
     */
    public static Predicate includes(final SObjectField field, final Iterable<String> container) {
        return includes(BaseSObjectFunctions.get(field), container);
    }
    //</editor-fold>

    //<editor-fold desc="EXCLUDES">
    /**
     * @description Returns a `Predicate` that tests the input SObject if the string value of
     * the `fieldName` does not match every element of the `container`.
     * Each element of the `container` should be represented as a subset and the subset elements
     * should be separated by `;`. Cross-reference fields and safe
     * navigation are supported.
     *
     * @param fieldName the value of which is tested
     * @param container the iterable against which the value is tested
     *
     * @return the `Predicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `container` is null or `container` contains null element
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * Account acc = new Account(Name = 'AAA;BBB');
     * SObjectPredicates.excludes('Name', new List<String>{ 'AAA' }).test(person); // true
     * SObjectPredicates.excludes('Name', new Set<String>{ 'AAA;BBB' }).test(person); // false
     * SObjectPredicates.excludes('Name', new Set<String>{ 'BBB;CCC' }).test(person); // true
     * SObjectPredicates.excludes('Name', new Set<String>{ 'AAA;CCC', 'BBB' }).test(person); // false
     * SObjectPredicates.excludes('Name', new List<String>{ 'AAA;BBB;CCC' }).test(person); // true
     * // it is also possible
     * SObjectPredicates.excludes('Parent?.Name', new List<String>{ 'AAA' });
     */
    public static Predicate excludes(final String fieldName, final Iterable<String> container) {
        return excludes(BaseSObjectFunctions.get(fieldName), container);
    }

    /**
     * @description Returns a `Predicate` that tests the input SObject if the string value of
     * the `field` does not match every element of the `container`.
     * Each element of the `container` should be represented as a subset and the subset elements
     * should be separated by `;`.
     *
     * @param field the value of which is tested
     * @param container the iterable against which the value is tested
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `field`, `container` is null, or `container` contains null element
     *
     * @see List.contains
     *
     * @example
     * Account acc = new Account(Name = 'AAA;BBB');
     * SObjectPredicates.excludes(Account.Name, new List<String>{ 'AAA' }).test(person); // true
     * SObjectPredicates.excludes(Account.Name, new Set<String>{ 'AAA;BBB' }).test(person); // false
     * SObjectPredicates.excludes(Account.Name, new Set<String>{ 'BBB;CCC' }).test(person); // true
     * SObjectPredicates.excludes(Account.Name, new Set<String>{ 'AAA;CCC', 'BBB' }).test(person); // false
     * SObjectPredicates.excludes(Account.Name, new List<String>{ 'AAA;BBB;CCC' }).test(person); // true
     */
    public static Predicate excludes(final SObjectField field, final Iterable<String> container) {
        return excludes(BaseSObjectFunctions.get(field), container);
    }
    //</editor-fold>

    // @end-group
    //</editor-fold>

}
