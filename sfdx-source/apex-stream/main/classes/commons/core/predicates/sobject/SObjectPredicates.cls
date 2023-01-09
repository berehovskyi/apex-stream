/**
 * @description Provides common implementations of {@link SObjectPredicate}
 * and related utilities.
 *
 * @see SObjectPredicate
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class SObjectPredicates {

    @TestVisible
    private SObjectPredicates() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins

    //<editor-fold desc="Comparison Predicates">

    //<editor-fold desc="?">
    /**
     * @description Returns a `SObjectPredicate` that tests if the result of comparing
     * the values returned by the applied `left` and `right` functions
     * by the `comparator` is equal to the expected `result`.
     *
     * @param left the function applied to the input argument the result of which is passed to
     * the `comparator` as the first argument
     * @param right the function applied to the input argument the result of which is passed to
     * the `comparator` as the second argument
     * @param comparator the function that compares two arguments
     * @param result the expected result of comparison (1, -1, or 0)
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `left` or `right`,
     * or `comparator`, or `result` is null
     *
     * @example
     * SObjectPredicates.isCompared(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunctions.get('OtherIntField__c'),
     *     Comparator.defaultOrder(),
     *     1
     * );
     */
    public static SObjectPredicate isCompared(
            final ISObjectFunction left,
            final ISObjectFunction right,
            final IComparator comparator,
            final Integer result
    ) {
        Validate.notNull(left);
        Validate.notNull(right);
        Validate.notNull(comparator);
        Validate.notNull(result);
        return new ComparatorPredicate(left, right, comparator, result);
    }
    //</editor-fold>

    //<editor-fold desc=">">
    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `left` function is greater than the result returned by the `right`
     * function.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isGreater(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isGreater(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectPredicate isGreater(final ISObjectFunction left, final ISObjectFunction right) {
        return isCompared(left, right, Comparator.defaultOrder(), 1);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
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
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `function` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isGreater('NumberOfEmployees', SObjectFunctions.get('OtherIntField__c'));
     * SObjectPredicates.isGreater(
     *     'Parent?.NumberOfEmployees',
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectPredicate isGreater(final String fieldName, final ISObjectFunction function) {
        return isGreater(SObjectFunctions.get(fieldName), function);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `field` is greater than the result returned by the `function`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param field the value of which is considered the left argument of comparison
     * @param function the function whose application result is considered as the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `field` or `function` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isGreater(
     *         Account.NumberOfEmployees,
     *         SObjectFunctions.get('OtherIntField__c')
     *     );
     * SObjectPredicates.isGreater(
     *         Account.NumberOfEmployees,
     *         SObjectFunction.constant(100)
     *     );
     */
    public static SObjectPredicate isGreater(final SObjectField field, final ISObjectFunction function) {
        return isGreater(SObjectFunctions.get(field), function);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
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
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isGreater('NumberOfEmployees', 100);
     * SObjectPredicates.isGreater('Parent?.NumberOfEmployees', 100);
     */
    public static SObjectPredicate isGreater(final String fieldName, final Object value) {
        return isGreater(SObjectFunctions.get(fieldName), SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `field` is greater than the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param field the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isGreater(Account.NumberOfEmployees, 100);
     */
    public static SObjectPredicate isGreater(final SObjectField field, final Object value) {
        return isGreater(SObjectFunctions.get(field), SObjectFunction.constant(value));
    }
    //</editor-fold>

    //<editor-fold desc=">=">
    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `left` function is greater than or equal to the result returned by the `right`
     * function.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isGreaterOrEqual(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isGreaterOrEqual(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectPredicate isGreaterOrEqual(final ISObjectFunction left, final ISObjectFunction right) {
        return isGreater(left, right).orElse(isEqual(left, right));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
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
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `function` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isGreaterOrEqual(
     *     'NumberOfEmployees',
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isGreaterOrEqual(
     *     'Parent?.NumberOfEmployees',
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectPredicate isGreaterOrEqual(final String fieldName, final ISObjectFunction function) {
        return isGreater(fieldName, function).orElse(isEqual(fieldName, function));
    }

    /**
     * @description Returns a `SObjectPredicate` that teststhe input SObject  if the value of
     * the `field` is greater than or equal to the result returned by the `function`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param field the value of which is considered the left argument of comparison
     * @param function the function whose application result is considered as the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `function` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isGreaterOrEqual(
     *     Account.NumberOfEmployees,
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isGreaterOrEqual(
     *     Account.NumberOfEmployees,
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectPredicate isGreaterOrEqual(final SObjectField field, final ISObjectFunction function) {
        return isGreater(field, function).orElse(isEqual(field, function));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
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
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isGreaterOrEqual('NumberOfEmployees', 100);
     * SObjectPredicates.isGreaterOrEqual('Parent?.NumberOfEmployees', 100);
     */
    public static SObjectPredicate isGreaterOrEqual(final String fieldName, final Object value) {
        return isGreater(fieldName, value).orElse(isEqual(fieldName, value));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `field` is greater than or equal to the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param field the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isGreaterOrEqual(Account.NumberOfEmployees, 100);
     */
    public static SObjectPredicate isGreaterOrEqual(final SObjectField field, final Object value) {
        return isGreater(field, value).orElse(isEqual(field, value));
    }
    //</editor-fold>

    //<editor-fold desc="<">
    /**
     * @description Returns a `SObjectPredicate` that tests if the result returned by
     * the `left` function is less than the result returned by the `right`
     * function.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param left the function whose application result is considered as the left argument of comparison.
     * @param right the function whose application result is considered as the right argument of comparison.
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `left` the `right` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isLess(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isLess(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectPredicate isLess(final ISObjectFunction left, final ISObjectFunction right) {
        return isCompared(left, right, Comparator.defaultOrder(), -1);
    }

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
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isLess('NumberOfEmployees', SObjectFunctions.get('OtherIntField__c'));
     * SObjectPredicates.isLess(
     *     'Parent?.NumberOfEmployees',
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectPredicate isLess(final String fieldName, final ISObjectFunction function) {
        return isLess(SObjectFunctions.get(fieldName), function);
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
     * @see Comparator.defaultOrder
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
    public static SObjectPredicate isLess(final SObjectField field, final ISObjectFunction function) {
        return isLess(SObjectFunctions.get(field), function);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests if the value of
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
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isLess('NumberOfEmployees', 100);
     * SObjectPredicates.isLess('Parent?.NumberOfEmployees', 100);
     */
    public static SObjectPredicate isLess(final String fieldName, final Object value) {
        return isLess(SObjectFunctions.get(fieldName), SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests if the value of
     * the `field` is less than the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param field the value of which is considered the left argument of comparison.
     * @param value the right argument of comparison.
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isLess(Account.NumberOfEmployees, 100);
     */
    public static SObjectPredicate isLess(final SObjectField field, final Object value) {
        return isLess(SObjectFunctions.get(field), SObjectFunction.constant(value));
    }
    //</editor-fold>

    //<editor-fold desc="<=">
    /**
     * @description Returns a `SObjectPredicate` that tests if the result returned by
     * the `left` function is less than or equal to the result returned by the `right`
     * function.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param left the function whose application result is considered as the left argument of comparison.
     * @param right the function whose application result is considered as the right argument of comparison.
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isLessOrEqual(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isLessOrEqual(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectPredicate isLessOrEqual(final ISObjectFunction left, final ISObjectFunction right) {
        return isLess(left, right).orElse(isEqual(left, right));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests if the value of
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
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `function` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isLessOrEqual(
     *     'NumberOfEmployees',
     *      SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isLessOrEqual(
     *     'Parent?.NumberOfEmployees',
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectPredicate isLessOrEqual(final String fieldName, final ISObjectFunction function) {
        return isLess(fieldName, function).orElse(isEqual(fieldName, function));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests if the value of
     * the `field` is less than or equal to the result returned by the `function`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param field the value of which is considered the left argument of comparison.
     * @param function the function whose application result is considered as the right argument of comparison.
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `field` or `function` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isLessOrEqual(
     *     Account.NumberOfEmployees,
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isLessOrEqual(
     *     Account.NumberOfEmployees,
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectPredicate isLessOrEqual(final SObjectField field, final ISObjectFunction function) {
        return isLess(field, function).orElse(isEqual(field, function));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests if the value of
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
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isLessOrEqual('NumberOfEmployees', 100);
     * SObjectPredicates.isLessOrEqual('Parent?.NumberOfEmployees', 100);
     */
    public static SObjectPredicate isLessOrEqual(final String fieldName, final Object value) {
        return isLess(fieldName, value).orElse(isEqual(fieldName, value));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests if the value of
     * the `field` is less than or equal to the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param field the value of which is considered the left argument of comparison.
     * @param value the right argument of comparison.
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isLessOrEqual(Account.NumberOfEmployees, 100);
     */
    public static SObjectPredicate isLessOrEqual(final SObjectField field, final Object value) {
        return isLess(field, value).orElse(isEqual(field, value));
    }
    //</editor-fold>

    //<editor-fold desc="==">
    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `left` function is equal to the result returned by the `right`
     * function, comparing object value equality not reference equality.
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isEqual(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isEqual(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectPredicate isEqual(final ISObjectFunction left, final ISObjectFunction right) {
        return isCompared(left, right, Comparator.defaultOrder(), 0);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `fieldName` is equal to the result returned by the `function`,
     * comparing object value equality not reference equality.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the value of which is considered the left argument of comparison
     * @param function the function whose application result is considered as the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `function` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isEqual(
     *     'NumberOfEmployees',
     *      SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isEqual(
     *     'Parent?.NumberOfEmployees',
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectPredicate isEqual(final String fieldName, final ISObjectFunction function) {
        return isEqual(SObjectFunctions.get(fieldName), function);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `field` is equal to the result returned by the `function`,
     * comparing object value equality not reference equality.
     *
     * @param field the value of which is considered the left argument of comparison
     * @param function the function whose application result is considered as the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `field` or `function` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isEqual(
     *     Account.NumberOfEmployees,
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isEqual(
     *     Account.NumberOfEmployees,
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectPredicate isEqual(final SObjectField field, final ISObjectFunction function) {
        return isEqual(SObjectFunctions.get(field), function);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `fieldName` is equal to the `value`, comparing object value equality
     * not reference equality. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isEqual('NumberOfEmployees', 100);
     * SObjectPredicates.isEqual('Parent?.NumberOfEmployees', 100);
     */
    public static SObjectPredicate isEqual(final String fieldName, final Object value) {
        return isEqual(SObjectFunctions.get(fieldName), SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `field` is equal to the `value`, comparing object value equality
     * not reference equality.
     *
     * @param field the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isEqual(Account.NumberOfEmployees, 100);
     */
    public static SObjectPredicate isEqual(final SObjectField field, final Object value) {
        return isEqual(SObjectFunctions.get(field), SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `left` operator is equal to the result returned by the `right`
     * operator, comparing SObject value equality not reference equality.
     *
     * @param left the operator whose application result is considered as the left argument of comparison
     * @param right the operator whose application result is considered as the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isEqual(
     *     SObjectUnaryOperators.getSObject('ParentId'),
     *     SObjectUnaryOperators.getSObject('AnotherParentId')
     * );
     */
    public static SObjectPredicate isEqual(final ISObjectUnaryOperator left, final ISObjectUnaryOperator right) {
        return isEqual(SObjectFunction.compose(left), SObjectFunction.compose(right));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `identity` function is equal to the result returned by the `operator`,
     * comparing SObject value equality not reference equality.
     *
     * @param operator the function whose application result is considered as the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `operator` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isEqual(SObjectUnaryOperators.getSObject('ParentId'));
     */
    public static SObjectPredicate isEqual(final ISObjectUnaryOperator operator) {
        return isEqual(SObjectFunction.identity(), SObjectFunction.compose(operator));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `identity` function is equal to the `value`, comparing SObject value
     * equality not reference equality.
     *
     * @param value the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `operator` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isEqual(someAccount);
     */
    public static SObjectPredicate isEqual(final SObject value) {
        return isEqual(SObjectFunction.identity(), SObjectFunction.constant(value));
    }
    //</editor-fold>

    //<editor-fold desc="!=">
    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `left` function is not equal to the result returned by the `right`
     * function, comparing object value equality not reference equality.
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isEqual(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isEqual(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectPredicate isNotEqual(final ISObjectFunction left, final ISObjectFunction right) {
        return isEqual(left, right).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `fieldName` is not equal to the result returned by the `function`,
     * comparing object value equality not reference equality.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the value of which is considered the left argument of comparison
     * @param function the function whose application result is considered as the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `function` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isEqual(
     *     'NumberOfEmployees',
     *      SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isEqual(
     *     'Parent?.NumberOfEmployees',
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectPredicate isNotEqual(final String fieldName, final ISObjectFunction function) {
        return isEqual(fieldName, function).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `field` is not equal to the result returned by the `function`,
     * comparing object value equality not reference equality.
     *
     * @param field the value of which is considered the left argument of comparison
     * @param function the function whose application result is considered as the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `field` or `function` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isEqual(
     *     Account.NumberOfEmployees,
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectPredicates.isEqual(
     *     Account.NumberOfEmployees,
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectPredicate isNotEqual(final SObjectField field, final ISObjectFunction function) {
        return isEqual(field, function).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `fieldName` is not equal to the `value`, comparing object value equality
     * not reference equality. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isEqual('NumberOfEmployees', 100);
     * SObjectPredicates.isEqual('Parent?.NumberOfEmployees', 100);
     */
    public static SObjectPredicate isNotEqual(final String fieldName, final Object value) {
        return isEqual(fieldName, value).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `field` is not equal to the `value`, comparing object value equality
     * not reference equality.
     *
     * @param field the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isEqual(Account.NumberOfEmployees, 100);
     */
    public static SObjectPredicate isNotEqual(final SObjectField field, final Object value) {
        return isEqual(field, value).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `left` operator is not equal to the result returned by the `right`
     * operator, comparing SObject value equality not reference equality.
     *
     * @param left the operator whose application result is considered as the left argument of comparison
     * @param right the operator whose application result is considered as the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isNotEqual(
     *     SObjectUnaryOperators.getSObject('ParentId'),
     *     SObjectUnaryOperators.getSObject('AnotherParentId')
     * );
     */
    public static SObjectPredicate isNotEqual(final ISObjectUnaryOperator left, final ISObjectUnaryOperator right) {
        return isEqual(SObjectFunction.compose(left), SObjectFunction.compose(right)).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `identity` function is not equal to the result returned by the `operator`,
     * comparing SObject value equality not reference equality.
     *
     * @param operator the function whose application result is considered as the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `operator` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isEqual(SObjectUnaryOperators.getSObject('ParentId'));
     */
    public static SObjectPredicate isNotEqual(final ISObjectUnaryOperator operator) {
        return isEqual(operator).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `identity` function is not equal to the `value`, comparing SObject value
     * equality not reference equality.
     *
     * @param value the right argument of comparison
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `operator` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isEqual(someAccount);
     */
    public static SObjectPredicate isNotEqual(final SObject value) {
        return isEqual(value).negate();
    }
    //</editor-fold>

    //<editor-fold desc="LIKE">
    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the string returned by
     * the `function` matches the `likeString` pattern. Supports the `%` and
     * the `_` wildcards and is case-insensitive.
     *
     * @param function the function whose application result string is tested
     * @param likeString the pattern that is tested to match the string returned by the `function`
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `function` or `likeString` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isLike(SObjectFunctions.get('Name'), '%a_e');
     * SObjectPredicates.isLike(SObjectFunctions.get(Account.Name), '%a_e');
     */
    public static SObjectPredicate isLike(final ISObjectFunction function, final String likeString) {
        Validate.notNull(function);
        Validate.notNull(likeString);
        return new IsLike(function, likeString);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the string value of
     * the `fieldName` matches the `likeString` pattern. Supports the `%` and
     * the `_` wildcards and is case-insensitive. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the value of which is tested
     * @param likeString the pattern that is tested to match the string value of the `fieldName`
     *
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `likeString` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isLike('Name', '%a_e');
     * SObjectPredicates.isLike('Parent?.Name', '%a_e');
     */
    public static SObjectPredicate isLike(final String fieldName, final String likeString) {
        return isLike(SObjectFunctions.get(fieldName), likeString);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the string value of
     * the `field` matches the `likeString` pattern. Supports the `%` and
     * the `_` wildcards and is case-insensitive. Cross-reference fields and safe navigation are supported.
     *
     * @param field the value of which is tested
     * @param likeString the pattern that is tested to match the string value of the `field`
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `field` or `likeString` is null
     *
     * @see Comparator.defaultOrder
     *
     * @example
     * SObjectPredicates.isLike(Account.Name, '%a_e');
     */
    public static SObjectPredicate isLike(final SObjectField field, final String likeString) {
        return isLike(SObjectFunctions.get(field), likeString);
    }
    //</editor-fold>

    //<editor-fold desc="IN">
    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `function` is contained in the `container`.
     *
     * @param function the function whose application result is tested
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `function` or `container` is null
     *
     * @see List.contains
     *
     * @example
     * SObjectPredicates.isIn(SObjectFunctions.get('Name'), new List<Object>{ 'John', 'Jim' });
     * SObjectPredicates.isIn(SObjectFunctions.get('Name'), (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
     * SObjectPredicates.isIn(SObjectFunctions.get('Name'), nameStream);
     */
    public static SObjectPredicate isIn(final ISObjectFunction function, final Iterable<Object> container) {
        Validate.notNull(function);
        Validate.notNull(container);
        return new IsIn(function, container);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the the value of
     * the `fieldName` is contained in the `container`. Cross-reference fields and safe
     * navigation are supported.
     *
     * @param fieldName the value of which is tested
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `SObjectPredicate`
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
     * SObjectPredicates.isIn('Parent?.Name', (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
     * SObjectPredicates.isIn('Parent.Name', nameStream);
     */
    public static SObjectPredicate isIn(final String fieldName, final Iterable<Object> container) {
        return isIn(SObjectFunctions.get(fieldName), container);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the the value of
     * the `field` is contained in the `container`.
     *
     * @param field the value of which is tested
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `field` or `container` is null
     *
     * @see List.contains
     *
     * @example
     * SObjectPredicates.isIn(Account.Name, new List<Object>{ 'John', 'Jim' });
     * SObjectPredicates.isIn(Account.Name, (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
     * SObjectPredicates.isIn(Account.Name, nameStream);
     */
    public static SObjectPredicate isIn(final SObjectField field, final Iterable<Object> container) {
        return isIn(SObjectFunctions.get(field), container);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input sobject
     * is contained in the `container`.
     *
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `container` is null
     *
     * @see List.contains
     *
     * @example
     * SObjectPredicates.isIn(accounts);
     * SObjectPredicates.isIn(accStream);
     * SObjectPredicates.isIn((Iterable<Account>) accountSet);
     */
    public static SObjectPredicate isIn(final Iterable<SObject> container) {
        return isIn(SObjectFunction.identity(), (Iterable<Object>) container);
    }
    //</editor-fold>

    //<editor-fold desc="NOT IN">
    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `function` is not contained in the `container`.
     *
     * @param function the function whose application result is tested
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `function` or `container` is null
     *
     * @see List.contains
     *
     * @example
     * SObjectPredicates.isNotIn(SObjectFunctions.get('Name'), new List<Object>{ 'John', 'Jim' });
     * SObjectPredicates.isNotIn(SObjectFunctions.get('Name'), (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
     * SObjectPredicates.isNotIn(SObjectFunctions.get('Name'), nameStream);
     */
    public static SObjectPredicate isNotIn(final ISObjectFunction function, final Iterable<Object> container) {
        return isIn(function, container).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the the value of
     * the `fieldName` is not contained in the `container`. Cross-reference fields and safe
     * navigation are supported.
     *
     * @param fieldName the value of which is tested
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `SObjectPredicate`
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
     * SObjectPredicates.isNotIn('Parent?.Name', (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
     * SObjectPredicates.isNotIn('Parent.Name', nameStream);
     */
    public static SObjectPredicate isNotIn(final String fieldName, final Iterable<Object> container) {
        return isIn(fieldName, container).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the the value of
     * the `field` is not contained in the `container`.
     *
     * @param field the value of which is tested
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `field` or `container` is null
     *
     * @see List.contains
     *
     * @example
     * SObjectPredicates.isNotIn(Account.Name, new List<Object>{ 'John', 'Jim' });
     * SObjectPredicates.isNotIn(Account.Name, (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
     * SObjectPredicates.isNotIn(Account.Name, nameStream);
     */
    public static SObjectPredicate isNotIn(final SObjectField field, final Iterable<Object> container) {
        return isIn(field, container).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if it is not contained
     * in the `container`.
     *
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `container` is null
     *
     * @see List.contains
     *
     * @example
     * SObjectPredicates.isNotIn(accounts);
     * SObjectPredicates.isNotIn(accStream);
     * SObjectPredicates.isNotIn((Iterable<Account>) accountSet);
     */
    public static SObjectPredicate isNotIn(final Iterable<SObject> container) {
        return isIn(container).negate();
    }
    //</editor-fold>

    //</editor-fold>

    //<editor-fold desc="Null Comparison Predicates">
    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if it is null.
     *
     * @return the `SObjectPredicate`
     *
     * @example
     * SObjectPredicates.isNull();
     */
    public static SObjectPredicate isNull() {
        return isEqual((SObject) null);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if it is not null.
     *
     * @return the `SObjectPredicate`
     *
     * @example
     * SObjectPredicates.isNotNull();
     */
    public static SObjectPredicate isNotNull() {
        return isEqual((SObject) null).negate();
    }
    //</editor-fold>

    //<editor-fold desc="Possessive Predicates">
    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `function` is not null.
     *
     * @param function the function whose application result is tested
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `function` is null
     *
     * @see SObjectPredicates.isNotEqual
     *
     * @example
     * SObjectPredicates.has(SObjectFunctions.get('Name'));
     * SObjectPredicates.has(SObjectFunctions.get(Account.Name));
     */
    public static SObjectPredicate has(final ISObjectFunction function) {
        return isNotEqual(function, SObjectFunction.constant(null));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value
     * the `fieldName` is not null. Cross-reference fields and safe
     * navigation are supported.
     *
     * @param fieldName the value of which is tested
     *
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectPredicates.isNotEqual
     * @see SObjectFunctions.get
     *
     * @example
     * SObjectPredicates.has('Name');
     * SObjectPredicates.has('Parent?.Name');
     */
    public static SObjectPredicate has(final String fieldName) {
        return has(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value
     * the `field` is not null.
     *
     * @param field the value of which is tested
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObjectPredicates.isNotEqual
     * @see SObjectFunctions.get
     *
     * @example
     * SObjectPredicates.has(Account.Name);
     */
    public static SObjectPredicate has(final SObjectField field) {
        return has(SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `operator` is not null.
     *
     * @param operator the operator whose application result is tested
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `operator` is null
     *
     * @see SObjectPredicates.isNotEqual
     *
     * @example
     * SObjectPredicates.hasSObject(SObjectFunctions.getSObject('Parent'));
     * SObjectPredicates.hasSObject(SObjectFunctions.getSObject(Account.ParentId));
     */
    public static SObjectPredicate hasSObject(final ISObjectUnaryOperator operator) {
        return isNotEqual(operator, SObjectUnaryOperator.constant(null));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the parent SObject by
     * the `fieldName` is not null. Cross-reference fields and safe
     * navigation are supported.
     *
     * @param fieldName the value of which is tested
     *
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectPredicates.isNotEqual
     * @see SObjectUnaryOperators.getSObject
     *
     * @example
     * SObjectPredicates.hasSObject('Parent');
     * SObjectPredicates.hasSObject('Parent?.Parent');
     */
    public static SObjectPredicate hasSObject(final String fieldName) {
        return hasSObject(SObjectUnaryOperators.getSObject(fieldName));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the parent SObject by
     * the `fieldName` is not null.
     *
     * @param field the value of which is tested
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObjectPredicates.isNotEqual
     * @see SObjectUnaryOperators.getSObject
     *
     * @example
     * SObjectPredicates.hasSObject(Account.ParentId);
     */
    public static SObjectPredicate hasSObject(final SObjectField field) {
        return hasSObject(SObjectUnaryOperators.getSObject(field));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the children sobjects by
     * the `fieldName` is not null. Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the value of which is tested
     *
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObjectPredicates.isNotEqual
     * @see SObjectFunctions.getSObjects
     *
     * @example
     * SObjectPredicates.hasSObjects('Parent');
     * SObjectPredicates.hasSObjects('Parent?.Parent');
     */
    public static SObjectPredicate hasSObjects(final String fieldName) {
        return has(SObjectFunctions.getSObjects(fieldName));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the children sobjects by
     * the `field` is not null.
     *
     * @param field the value of which is tested
     *
     * @return the `SObjectPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see SObjectPredicates.isNotEqual
     *
     * @example
     * SObjectPredicates.hasSObjects(Contact.AccountId);
     */
    public static SObjectPredicate hasSObjects(final SObjectField field) {
        return has(SObjectFunctions.getSObjects(field));
    }
    //</editor-fold>

    //<editor-fold desc="SObject Predicates">
    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if it has errors
     *
     * @return the `SObjectPredicate`
     *
     * @see SObject.hasErrors
     */
    public static SObjectPredicate hasErrors() {
        return new HasErrors();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if it is a clone
     *
     * @return the `SObjectPredicate`
     *
     * @see SObject.isClone
     */
    public static SObjectPredicate isClone() {
        return new IsClone();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if
     * its `fieldName` is populated, either by direct assignment or by inclusion in a SOQL query.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName the value of which is tested
     *
     * @return the `SObjectPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see SObject.isSet
     *
     * @example
     * SObjectPredicates.isSet('Name');
     * SObjectPredicates.isSet('ParentId');
     * SObjectPredicates.isSet('Parent?.ParentId');
     */
    public static SObjectPredicate isSet(final String fieldName) {
        Validate.notNull(fieldName);
        if (!Schemas.isXRef(fieldName)) {
            return new IsSetFieldName(fieldName);
        }
        if (Schemas.isSaveNav(fieldName)) {
            return new IsSetFieldPathSafe(fieldName);
        }
        return new IsSetFieldPath(fieldName);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if
     * its `field` is populated, either by direct assignment or by inclusion in a SOQL query.
     *
     * @param field the value of which is tested
     *
     * @return the `SObjectPredicate`
     *
     * @see SObject.isSet
     *
     * @example
     * SObjectPredicates.isSet(Account.Name);
     * SObjectPredicates.isSet(Account.ParentId);
     */
    public static SObjectPredicate isSet(final SObjectField field) {
        Validate.notNull(field);
        return new IsSetField(field);
    }
    //</editor-fold>

    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class ComparatorPredicate extends SObjectPredicate {
        private final ISObjectFunction left;
        private final ISObjectFunction right;
        private final IComparator comparator;
        private final Integer comparisonResult;
        private ComparatorPredicate(
                ISObjectFunction left,
                ISObjectFunction right,
                IComparator comparator,
                Integer comparisonResult
        ) {
            this.left = left;
            this.right = right;
            this.comparator = comparator;
            this.comparisonResult = comparisonResult;
        }
        public override Boolean test(SObject sObj) {
            return comparator.compare(left.apply(sObj), right.apply(sObj)) == comparisonResult;
        }
    }

    private class IsLike extends SObjectPredicate {
        private final ISObjectFunction function;
        private final String likeString;
        private IsLike(ISObjectFunction function, String likeString) {
            this.function = function;
            this.likeString = likeString;
        }
        public override Boolean test(SObject sObj) {
            return Pattern.matches(
                    '(?i)^' + likeString.replaceAll('([^\\w%_ ])', '\\\\$1')
                            .replace('%', '.*?')
                            .replace('_', '.{1}?') + '$',
                    (String) function.apply(sObj)
            );
        }
    }

    private class IsIn extends SObjectPredicate {
        private final ISObjectFunction function;
        private final Set<Object> container;
        private IsIn(ISObjectFunction function, Iterable<Object> container) {
            this.function = function;
            this.container = Iterators.toObjectSet(container.iterator());
        }
        public override Boolean test(SObject sObj) { return container.contains(function.apply(sObj)); }
    }

    private class HasErrors extends SObjectPredicate {
        public override Boolean test(SObject sObj) { return sObj.hasErrors(); }
    }

    private class IsClone extends SObjectPredicate {
        public override Boolean test(SObject sObj) { return sObj.isClone(); }
    }

    private class IsSetFieldName extends SObjectPredicate {
        private final String fieldName;
        private IsSetFieldName(String fieldName) { this.fieldName = fieldName; }
        public override Boolean test(SObject sObj) { return sObj.isSet(fieldName); }
    }

    private class IsSetFieldPath extends SObjectPredicate {
        private final String fieldName;
        private final ISObjectUnaryOperator operator;
        private IsSetFieldPath(String fieldName) {
            this.fieldName = fieldName.substringAfterLast('.');
            operator = SObjectUnaryOperators.getSObject(fieldName.substringBeforeLast('.'));
        }
        public override Boolean test(SObject sObj) { return operator.apply(sObj).isSet(fieldName); }
    }

    private class IsSetFieldPathSafe extends SObjectPredicate {
        private final String fieldName;
        private final ISObjectUnaryOperator operator;
        private IsSetFieldPathSafe(String fieldName) {
            this.fieldName = fieldName.substringAfterLast('.');
            operator = SObjectUnaryOperators.getSObject(fieldName.substringBeforeLast('.'));
        }
        public override Boolean test(SObject sObj) { return operator.apply(sObj)?.isSet(fieldName); }
    }

    private class IsSetField extends SObjectPredicate {
        private final SObjectField field;
        private IsSetField(SObjectField field) { this.field = field; }
        public override Boolean test(SObject sObj) { return sObj.isSet(field); }
    }
    // @end-group
    //</editor-fold>

}
