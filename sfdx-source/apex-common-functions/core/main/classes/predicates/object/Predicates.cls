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
public virtual inherited sharing class Predicates extends BasePredicates {

    @TestVisible
    protected Predicates() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins

    //<editor-fold desc="Comparison Predicates">

    //<editor-fold desc="?">
//    /**
//     * @description Returns a `Predicate` that tests if the result of comparing
//     * the values returned by the applied `left` and `right` functions
//     * by the `comparer` is equal to the expected `result`.
//     *
//     * @param left the function applied to the input argument the result of which is passed to
//     * the `comparer` as the first argument
//     * @param right the function applied to the input argument the result of which is passed to
//     * the `comparer` as the second argument
//     * @param comparer the function that compares two arguments
//     * @param result the expected result of comparison (1, -1, or 0)
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `left` or  `right`,
//     * or `comparer`, or `result` is null
//     *
//     * @example
//     * Predicates.isCompared(
//     *     func1,
//     *     func2,
//     *     Comparer.defaultOrder(),
//     *     1
//     * );
//     */
//    public static Predicate isCompared(
//            final IFunction left,
//            final IFunction right,
//            final IComparer comparer,
//            final Integer result
//    ) {
//        Validate.notNull(left);
//        Validate.notNull(right);
//        Validate.notNull(comparer);
//        Validate.notNull(result);
//        return new ComparerPredicate(left, right, comparer, result);
//    }
    //</editor-fold>

    //<editor-fold desc=">">
    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is greater than the result returned by the `right`
     * function.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * Predicates.isGreater(func1, func2);
     * Predicates.isGreater(func1, Function.constant(100));
     */
    public static Predicate isGreater(final IFunction left, final IFunction right) {
        return isCompared(left, right, Comparer.defaultOrder(), 1);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is greater than
     * the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     *
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * Predicates.isGreater(100);
     */
    public static Predicate isGreater(final Object value) {
        return isGreater(Function.identity(), Function.constant(value));
    }

//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the value of
//     * the `fieldName` is greater than the result returned by the `function`.
//     * Cross-reference fields and safe navigation are supported.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param fieldName the value of which is considered the left argument of comparison
//     * @param function the function whose application result is considered as the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `function` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isGreater('NumberOfEmployees', Functions.get('OtherIntField__c'));
//     * Predicates.isGreater(
//     *     'Parent?.NumberOfEmployees',
//     *     Function.constant(100)
//     * );
//     */
//    public static Predicate isGreater(final String fieldName, final IFunction function) {
//        return isGreater(Functions.get(fieldName), function);
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the value of
//     * the `field` is greater than the result returned by the `function`.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param field the value of which is considered the left argument of comparison
//     * @param function the function whose application result is considered as the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `field` or `function` is null
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isGreater(
//     *         Account.NumberOfEmployees,
//     *         Functions.get('OtherIntField__c')
//     *     );
//     * Predicates.isGreater(
//     *         Account.NumberOfEmployees,
//     *         Function.constant(100)
//     *     );
//     */
//    public static Predicate isGreater(final SObjectField field, final IFunction function) {
//        return isGreater(Functions.get(field), function);
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the value of
//     * the `fieldName` is greater than the `value`.
//     * Cross-reference fields and safe navigation are supported.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param fieldName the value of which is considered the left argument of comparison
//     * @param value the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isGreater('NumberOfEmployees', 100);
//     * Predicates.isGreater('Parent?.NumberOfEmployees', 100);
//     */
//    public static Predicate isGreater(final String fieldName, final Object value) {
//        return isGreater(Functions.get(fieldName), Function.constant(value));
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the value of
//     * the `field` is greater than the `value`.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param field the value of which is considered the left argument of comparison
//     * @param value the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `field` is null
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isGreater(Account.NumberOfEmployees, 100);
//     */
//    public static Predicate isGreater(final SObjectField field, final Object value) {
//        return isGreater(Functions.get(field), Function.constant(value));
//    }
    //</editor-fold>

    //<editor-fold desc=">=">
    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is greater than or equal to the result returned by the `right`
     * function.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>=` "greater than or equal to " operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * Predicates.isGreaterOrEqual(func1, func2);
     * Predicates.isGreaterOrEqual(func1, Function.constant(100));
     */
    public static Predicate isGreaterOrEqual(final IFunction left, final IFunction right) {
        return isGreater(left, right).orElse(isEqual(left, right));
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is greater than or equal to
     * the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     *
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * Predicates.isGreaterOrEqual(100);
     */
    public static Predicate isGreaterOrEqual(final Object value) {
        return isGreater(value).orElse(isEqual(value));
    }

//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the value of
//     * the `fieldName` is greater than or equal to the result returned by the `function`.
//     * Cross-reference fields and safe navigation are supported.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param fieldName the value of which is considered the left argument of comparison
//     * @param function the function whose application result is considered as the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `function` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isGreaterOrEqual(
//     *     'NumberOfEmployees',
//     *     Functions.get('OtherIntField__c')
//     * );
//     * Predicates.isGreaterOrEqual(
//     *     'Parent?.NumberOfEmployees',
//     *     Function.constant(100)
//     * );
//     */
//    public static Predicate isGreaterOrEqual(final String fieldName, final IFunction function) {
//        return isGreater(fieldName, function).orElse(isEqual(fieldName, function));
//    }
//
//    /**
//     * @description Returns a `Predicate` that teststhe input SObject  if the value of
//     * the `field` is greater than or equal to the result returned by the `function`.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param field the value of which is considered the left argument of comparison
//     * @param function the function whose application result is considered as the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `function` is null
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isGreaterOrEqual(
//     *     Account.NumberOfEmployees,
//     *     Functions.get('OtherIntField__c')
//     * );
//     * Predicates.isGreaterOrEqual(
//     *     Account.NumberOfEmployees,
//     *     Function.constant(100)
//     * );
//     */
//    public static Predicate isGreaterOrEqual(final SObjectField field, final IFunction function) {
//        return isGreater(field, function).orElse(isEqual(field, function));
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the value of
//     * the `fieldName` is greater than or equal to the `value`.
//     * Cross-reference fields and safe navigation are supported.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param fieldName the value of which is considered the left argument of comparison
//     * @param value the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isGreaterOrEqual('NumberOfEmployees', 100);
//     * Predicates.isGreaterOrEqual('Parent?.NumberOfEmployees', 100);
//     */
//    public static Predicate isGreaterOrEqual(final String fieldName, final Object value) {
//        return isGreater(fieldName, value).orElse(isEqual(fieldName, value));
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the value of
//     * the `field` is greater than or equal to the `value`.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param field the value of which is considered the left argument of comparison
//     * @param value the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `field` is null
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isGreaterOrEqual(Account.NumberOfEmployees, 100);
//     */
//    public static Predicate isGreaterOrEqual(final SObjectField field, final Object value) {
//        return isGreater(field, value).orElse(isEqual(field, value));
//    }
    //</editor-fold>

    //<editor-fold desc="<">
    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is less than the result returned by the `right`
     * function.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * Predicates.isLess(func1, func2);
     * Predicates.isLess(func1, Function.constant(100));
     */
    public static Predicate isLess(final IFunction left, final IFunction right) {
        return isCompared(left, right, Comparer.defaultOrder(), -1);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is less than
     * the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     *
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * Predicates.isLess(100);
     */
    public static Predicate isLess(final Object value) {
        return isLess(Function.identity(), Function.constant(value));
    }

//    /**
//     * @description Returns a `Predicate` that tests if the value of
//     * the `fieldName` is less than the `value`.
//     * Cross-reference fields and safe navigation are supported.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param fieldName the value of which is considered the left argument of comparison.
//     * @param value the right argument of comparison.
//     *
//     * @return the `Predicate`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isLess('NumberOfEmployees', 100);
//     * Predicates.isLess('Parent?.NumberOfEmployees', 100);
//     */
//    public static Predicate isLess(final String fieldName, final Object value) {
//        return isLess(Functions.get(fieldName), Function.constant(value));
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests if the value of
//     * the `field` is less than the `value`.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param field the value of which is considered the left argument of comparison.
//     * @param value the right argument of comparison.
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `field` is null
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isLess(Account.NumberOfEmployees, 100);
//     */
//    public static Predicate isLess(final SObjectField field, final Object value) {
//        return isLess(Functions.get(field), Function.constant(value));
//    }
    //</editor-fold>

    //<editor-fold desc="<=">
    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is less than or equal to the result returned by the `right`
     * function.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * Predicates.isLessOrEqual(func1, func2);
     * Predicates.isLessOrEqual(func1, Function.constant(100));
     */
    public static Predicate isLessOrEqual(final IFunction left, final IFunction right) {
        return isLess(left, right).orElse(isEqual(left, right));
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is less than or equal to
     * the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     *
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * Predicates.isLess(100);
     */
    public static Predicate isLessOrEqual(final Object value) {
        return isLess(value).orElse(isEqual(value));
    }

//    /**
//    * @description Returns a `Predicate` that tests if the value of
//    * the `fieldName` is less than or equal to the result returned by the `function`.
//    * Cross-reference fields and safe navigation are supported.
//    * <p><strong>Note: </strong></p>
//    * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
//    * comparison of all primitive types and considers a non-null value as always greater than
//    * a null value.</p>
//    *
//    * @param fieldName the value of which is considered the left argument of comparison.
//    * @param function the function whose application result is considered as the right argument of comparison.
//    *
//    * @return the `Predicate`
//    *
//    * @throws IllegalArgumentException if `fieldName` is blank
//    * @throws NullPointerException if `fieldName` is null
//    * @throws NullPointerException if `function` is null
//    * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//    * reference navigation
//    * @throws SObjectException if provided invalid `fieldName`
//    *
//    * @see Comparer.defaultOrder
//    *
//    * @example
//    * Predicates.isLessOrEqual(
//    *     'NumberOfEmployees',
//    *      Functions.get('OtherIntField__c')
//    * );
//    * Predicates.isLessOrEqual(
//    *     'Parent?.NumberOfEmployees',
//    *     Function.constant(100)
//    * );
//    */
//    public static Predicate isLessOrEqual(final String fieldName, final IFunction function) {
//        return isLess(fieldName, function).orElse(isEqual(fieldName, function));
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests if the value of
//     * the `field` is less than or equal to the result returned by the `function`.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param field the value of which is considered the left argument of comparison.
//     * @param function the function whose application result is considered as the right argument of comparison.
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `field` or `function` is null
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isLessOrEqual(
//     *     Account.NumberOfEmployees,
//     *     Functions.get('OtherIntField__c')
//     * );
//     * Predicates.isLessOrEqual(
//     *     Account.NumberOfEmployees,
//     *     Function.constant(100)
//     * );
//     */
//    public static Predicate isLessOrEqual(final SObjectField field, final IFunction function) {
//        return isLess(field, function).orElse(isEqual(field, function));
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests if the value of
//     * the `fieldName` is less than or equal to the `value`.
//     * Cross-reference fields and safe navigation are supported.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param fieldName the value of which is considered the left argument of comparison.
//     * @param value the right argument of comparison.
//     *
//     * @return the `Predicate`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isLessOrEqual('NumberOfEmployees', 100);
//     * Predicates.isLessOrEqual('Parent?.NumberOfEmployees', 100);
//     */
//    public static Predicate isLessOrEqual(final String fieldName, final Object value) {
//        return isLess(fieldName, value).orElse(isEqual(fieldName, value));
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests if the value of
//     * the `field` is less than or equal to the `value`.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param field the value of which is considered the left argument of comparison.
//     * @param value the right argument of comparison.
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `field` is null
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isLessOrEqual(Account.NumberOfEmployees, 100);
//     */
//    public static Predicate isLessOrEqual(final SObjectField field, final Object value) {
//        return isLess(field, value).orElse(isEqual(field, value));
//    }
    //</editor-fold>

    //<editor-fold desc="==">
//    /**
//     * @description Returns a `Predicate` that tests the input object if the result returned by
//     * the `left` function is equal to the result returned by the `right`
//     * function, comparing object value equality not reference equality.
//     *
//     * @param left the function whose application result is considered as the left argument of comparison
//     * @param right the function whose application result is considered as the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `left` or `right` is null
//     *
//     * @see Comparers.compareNullSafeUntyped
//     *
//     * @example
//     * Predicates.isEqual(func1, func2);
//     * Predicates.isEqual(func1, Function.constant(100));
//     */
//    public static Predicate isEqual(final IFunction left, final IFunction right) {
//        return isCompared(left, right, Comparer.defaultOrder(), 0);
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input object if it is equal to
//     * the `value`, comparing object value equality not reference equality.
//     *
//     * @param value the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @see Comparers.compareNullSafeUntyped
//     *
//     * @example
//     * Predicates.isEqual(100);
//     */
//    public static Predicate isEqual(final Object value) {
//        return isEqual(Function.identity(), Function.constant(value));
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the value of
//     * the `fieldName` is equal to the result returned by the `function`,
//     * comparing object value equality not reference equality.
//     * Cross-reference fields and safe navigation are supported.
//     *
//     * @param fieldName the value of which is considered the left argument of comparison
//     * @param function the function whose application result is considered as the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `function` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isEqual(
//     *     'NumberOfEmployees',
//     *      Functions.get('OtherIntField__c')
//     * );
//     * Predicates.isEqual(
//     *     'Parent?.NumberOfEmployees',
//     *     Function.constant(100)
//     * );
//     */
//    public static Predicate isEqual(final String fieldName, final IFunction function) {
//        return isEqual(Functions.get(fieldName), function);
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the value of
//     * the `field` is equal to the result returned by the `function`,
//     * comparing object value equality not reference equality.
//     *
//     * @param field the value of which is considered the left argument of comparison
//     * @param function the function whose application result is considered as the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `field` or `function` is null
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isEqual(
//     *     Account.NumberOfEmployees,
//     *     Functions.get('OtherIntField__c')
//     * );
//     * Predicates.isEqual(
//     *     Account.NumberOfEmployees,
//     *     Function.constant(100)
//     * );
//     */
//    public static Predicate isEqual(final SObjectField field, final IFunction function) {
//        return isEqual(Functions.get(field), function);
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the value of
//     * the `fieldName` is equal to the `value`, comparing object value equality
//     * not reference equality. Cross-reference fields and safe navigation are supported.
//     *
//     * @param fieldName the value of which is considered the left argument of comparison
//     * @param value the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isEqual('NumberOfEmployees', 100);
//     * Predicates.isEqual('Parent?.NumberOfEmployees', 100);
//     */
//    public static Predicate isEqual(final String fieldName, final Object value) {
//        return isEqual(Functions.get(fieldName), Function.constant(value));
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the value of
//     * the `field` is equal to the `value`, comparing object value equality
//     * not reference equality.
//     *
//     * @param field the value of which is considered the left argument of comparison
//     * @param value the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `field` is null
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isEqual(Account.NumberOfEmployees, 100);
//     */
//    public static Predicate isEqual(final SObjectField field, final Object value) {
//        return isEqual(Functions.get(field), Function.constant(value));
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the result returned by
//     * the `left` operator is equal to the result returned by the `right`
//     * operator, comparing SObject value equality not reference equality.
//     *
//     * @param left the operator whose application result is considered as the left argument of comparison
//     * @param right the operator whose application result is considered as the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `left` or `right` is null
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isEqual(
//     *     Operators.getSObject('ParentId'),
//     *     Operators.getSObject('AnotherParentId')
//     * );
//     */
//    public static Predicate isEqual(final IOperator left, final IOperator right) {
//        return isEqual(Function.compose(left), Function.compose(right));
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the result returned by
//     * the `identity` function is equal to the result returned by the `operator`,
//     * comparing SObject value equality not reference equality.
//     *
//     * @param operator the function whose application result is considered as the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `operator` is null
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isEqual(Operators.getSObject('ParentId'));
//     */
//    public static Predicate isEqual(final IOperator operator) {
//        return isEqual(Function.identity(), Function.compose(operator));
//    }
    //</editor-fold>

    //<editor-fold desc="!=">
    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is not equal to the result returned by the `right`
     * function, comparing object value equality not reference equality.
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * Predicates.isNotEqual(func1, func2);
     * Predicates.isNotEqual(func1, Function.constant(100));
     */
    public static Predicate isNotEqual(final IFunction left, final IFunction right) {
        return isEqual(left, right).negate();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is not equal to
     * the `value`, comparing object value equality not reference equality.
     *
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * Predicates.isEqual(100);
     */
    public static Predicate isNotEqual(final Object value) {
        return isEqual(value).negate();
    }

//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the value of
//     * the `fieldName` is not equal to the result returned by the `function`,
//     * comparing object value equality not reference equality.
//     * Cross-reference fields and safe navigation are supported.
//     *
//     * @param fieldName the value of which is considered the left argument of comparison
//     * @param function the function whose application result is considered as the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `function` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isEqual(
//     *     'NumberOfEmployees',
//     *      Functions.get('OtherIntField__c')
//     * );
//     * Predicates.isEqual(
//     *     'Parent?.NumberOfEmployees',
//     *     Function.constant(100)
//     * );
//     */
//    public static Predicate isNotEqual(final String fieldName, final IFunction function) {
//        return isEqual(fieldName, function).negate();
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the value of
//     * the `field` is not equal to the result returned by the `function`,
//     * comparing object value equality not reference equality.
//     *
//     * @param field the value of which is considered the left argument of comparison
//     * @param function the function whose application result is considered as the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `field` or `function` is null
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isEqual(
//     *     Account.NumberOfEmployees,
//     *     Functions.get('OtherIntField__c')
//     * );
//     * Predicates.isEqual(
//     *     Account.NumberOfEmployees,
//     *     Function.constant(100)
//     * );
//     */
//    public static Predicate isNotEqual(final SObjectField field, final IFunction function) {
//        return isEqual(field, function).negate();
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the value of
//     * the `fieldName` is not equal to the `value`, comparing object value equality
//     * not reference equality. Cross-reference fields and safe navigation are supported.
//     *
//     * @param fieldName the value of which is considered the left argument of comparison
//     * @param value the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isEqual('NumberOfEmployees', 100);
//     * Predicates.isEqual('Parent?.NumberOfEmployees', 100);
//     */
//    public static Predicate isNotEqual(final String fieldName, final Object value) {
//        return isEqual(fieldName, value).negate();
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the value of
//     * the `field` is not equal to the `value`, comparing object value equality
//     * not reference equality.
//     *
//     * @param field the value of which is considered the left argument of comparison
//     * @param value the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `field` is null
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isEqual(Account.NumberOfEmployees, 100);
//     */
//    public static Predicate isNotEqual(final SObjectField field, final Object value) {
//        return isEqual(field, value).negate();
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the result returned by
//     * the `left` operator is not equal to the result returned by the `right`
//     * operator, comparing SObject value equality not reference equality.
//     *
//     * @param left the operator whose application result is considered as the left argument of comparison
//     * @param right the operator whose application result is considered as the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `left` or `right` is null
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isNotEqual(
//     *     Operators.getSObject('ParentId'),
//     *     Operators.getSObject('AnotherParentId')
//     * );
//     */
//    public static Predicate isNotEqual(final IOperator left, final IOperator right) {
//        return isEqual(Function.compose(left), Function.compose(right)).negate();
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the result returned by
//     * the `identity` function is not equal to the result returned by the `operator`,
//     * comparing SObject value equality not reference equality.
//     *
//     * @param operator the function whose application result is considered as the right argument of comparison
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `operator` is null
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isEqual(Operators.getSObject('ParentId'));
//     */
//    public static Predicate isNotEqual(final IOperator operator) {
//        return isEqual(operator).negate();
//    }
    //</editor-fold>

    //<editor-fold desc="LIKE">
    /**
     * @description Returns a `Predicate` that tests the input SObject if the string returned by
     * the `function` matches the `likeString` pattern. Supports the `%` and
     * the `_` wildcards and is case-insensitive.
     *
     * @param function the function whose application result string is tested
     * @param likeString the pattern that is tested to match the string returned by the `function`
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `function` or `likeString` is null
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * Predicates.isLike(Functions.get('Name'), '%a_e');
     * Predicates.isLike(Functions.get(Account.Name), '%a_e');
     */
    public static Predicate isLike(final IFunction function, final String likeString) {
        Validate.notNull(function);
        Validate.notNull(likeString);
        return new IsLike(function, likeString);
    }

//    /**
//     * @description Returns a `Predicate` that tests the input string if it is
//     * like the `likeString`. Supports `%` and
//     * `_` wildcards and is case-insensitive.
//     *
//     * @param likeString string
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `likeString` is null
//     */
//    public static Predicate isLike(final String likeString) {
//        return isLike(Function.identity(), likeString);
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the string value of
//     * the `fieldName` matches the `likeString` pattern. Supports the `%` and
//     * the `_` wildcards and is case-insensitive. Cross-reference fields and safe navigation are supported.
//     *
//     * @param fieldName the value of which is tested
//     * @param likeString the pattern that is tested to match the string value of the `fieldName`
//     *
//     * @return the `Predicate`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `likeString` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isLike('Name', '%a_e');
//     * Predicates.isLike('Parent?.Name', '%a_e');
//     */
//    public static Predicate isLike(final String fieldName, final String likeString) {
//        return isLike(Functions.get(fieldName), likeString);
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the string value of
//     * the `field` matches the `likeString` pattern. Supports the `%` and
//     * the `_` wildcards and is case-insensitive. Cross-reference fields and safe navigation are supported.
//     *
//     * @param field the value of which is tested
//     * @param likeString the pattern that is tested to match the string value of the `field`
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `field` or `likeString` is null
//     *
//     * @see Comparer.defaultOrder
//     *
//     * @example
//     * Predicates.isLike(Account.Name, '%a_e');
//     */
//    public static Predicate isLike(final SObjectField field, final String likeString) {
//        return isLike(Functions.get(field), likeString);
//    }
    //</editor-fold>

    //<editor-fold desc="IN">
//    /**
//     * @description Returns a `Predicate` that tests the input object if the result returned by
//     * the `function` is contained in the `container`.
//     *
//     * @param function the function whose application result is tested
//     * @param container the iterable that checks for the presence of an element
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `function` or `container` is null
//     *
//     * @see List.contains
//     *
//     * @example
//     * Predicates.isIn(getNameFunc, new List<Object>{ 'John', 'Jim' });
//     * Predicates.isIn(getNameFunc, (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
//     * Predicates.isIn(getNameFunc, nameStream);
//     */
//    public static Predicate isIn(final IFunction function, final Iterable<Object> container) {
//        Validate.notNull(function);
//        Validate.notNull(container);
//        return new IsIn(function, container);
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input object if it is contained in
//     * the `container`.
//     *
//     * @param container the iterable that checks for the presence of an element
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `container` is null
//     *
//     * @see List.contains
//     *
//     * @example
//     * Predicates.isIn(new List<Object>{ 'John', 'Jim' });
//     * Predicates.isIn((Iterable<Object>) new Set<String>{ 'John', 'Jim' });
//     * Predicates.isIn(nameStream);
//     */
//    public static Predicate isIn(final Iterable<Object> container) {
//        return isIn(Function.identity(), container);
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the the value of
//     * the `fieldName` is contained in the `container`. Cross-reference fields and safe
//     * navigation are supported.
//     *
//     * @param fieldName the value of which is tested
//     * @param container the iterable that checks for the presence of an element
//     *
//     * @return the `Predicate`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `container` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see List.contains
//     *
//     * @example
//     * Predicates.isIn('Name', new List<Object>{ 'John', 'Jim' });
//     * Predicates.isIn('Parent?.Name', (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
//     * Predicates.isIn('Parent.Name', nameStream);
//     */
//    public static Predicate isIn(final String fieldName, final Iterable<Object> container) {
//        return isIn(Functions.get(fieldName), container);
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the the value of
//     * the `field` is contained in the `container`.
//     *
//     * @param field the value of which is tested
//     * @param container the iterable that checks for the presence of an element
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `field` or `container` is null
//     *
//     * @see List.contains
//     *
//     * @example
//     * Predicates.isIn(Account.Name, new List<Object>{ 'John', 'Jim' });
//     * Predicates.isIn(Account.Name, (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
//     * Predicates.isIn(Account.Name, nameStream);
//     */
//    public static Predicate isIn(final SObjectField field, final Iterable<Object> container) {
//        return isIn(Functions.get(field), container);
//    }
    //</editor-fold>

    //<editor-fold desc="NOT IN">
    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `function` is not contained in the `container`.
     *
     * @param function the function whose application result is tested
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `function` or `container` is null
     *
     * @see List.contains
     *
     * @example
     * Predicates.isNotIn(getNameFunc, new List<Object>{ 'John', 'Jim' });
     * Predicates.isNotIn(getNameFunc, (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
     * Predicates.isNotIn(getNameFunc, nameStream);
     */
    public static Predicate isNotIn(final IFunction function, final Iterable<Object> container) {
        return isIn(function, container).negate();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is not contained in
     * the `container`.
     *
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `container` is null
     *
     * @see List.contains
     *
     * @example
     * Predicates.isNotIn(new List<Object>{ 'John', 'Jim' });
     * Predicates.isNotIn((Iterable<Object>) new Set<String>{ 'John', 'Jim' });
     * Predicates.isNotIn(nameStream);
     */
    public static Predicate isNotIn(final Iterable<Object> container) {
        return isIn(container).negate();
    }

//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the the value of
//     * the `fieldName` is not contained in the `container`. Cross-reference fields and safe
//     * navigation are supported.
//     *
//     * @param fieldName the value of which is tested
//     * @param container the iterable that checks for the presence of an element
//     *
//     * @return the `Predicate`
//     *
//     * @throws IllegalArgumentException if `fieldName` is blank
//     * @throws NullPointerException if `fieldName` is null
//     * @throws NullPointerException if `container` is null
//     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
//     * reference navigation
//     * @throws SObjectException if provided invalid `fieldName`
//     *
//     * @see List.contains
//     *
//     * @example
//     * Predicates.isNotIn('Name', new List<Object>{ 'John', 'Jim' });
//     * Predicates.isNotIn('Parent?.Name', (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
//     * Predicates.isNotIn('Parent.Name', nameStream);
//     */
//    public static Predicate isNotIn(final String fieldName, final Iterable<Object> container) {
//        return isIn(fieldName, container).negate();
//    }
//
//    /**
//     * @description Returns a `Predicate` that tests the input SObject if the the value of
//     * the `field` is not contained in the `container`.
//     *
//     * @param field the value of which is tested
//     * @param container the iterable that checks for the presence of an element
//     *
//     * @return the `Predicate`
//     *
//     * @throws NullPointerException if `field` or `container` is null
//     *
//     * @see List.contains
//     *
//     * @example
//     * Predicates.isNotIn(Account.Name, new List<Object>{ 'John', 'Jim' });
//     * Predicates.isNotIn(Account.Name, (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
//     * Predicates.isNotIn(Account.Name, nameStream);
//     */
//    public static Predicate isNotIn(final SObjectField field, final Iterable<Object> container) {
//        return isIn(field, container).negate();
//    }
//    //</editor-fold>
//
//    //<editor-fold desc="NULL">
//    /**
//     * @description Returns a `Predicate` that tests the input object if it is null.
//     *
//     * @return the `Predicate`
//     *
//     * @example
//     * Predicates.isNull();
//     */
//    public static Predicate isNull() {
//        return isEqual((Object) null);
//    }
//    //</editor-fold>
//
//    //<editor-fold desc="NOT NULL">
//    /**
//     * @description Returns a `Predicate` that tests the input object if it is not null.
//     *
//     * @return the `Predicate`
//     *
//     * @example
//     * Predicates.isNotNull();
//     */
//    public static Predicate isNotNull() {
//        return isEqual((Object) null).negate();
//    }
    //</editor-fold>
    
    //</editor-fold>

    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
//    private class ComparerPredicate extends Predicate {
//        private final IFunction left;
//        private final IFunction right;
//        private final IComparer comparer;
//        private final Integer comparisonResult;
//        private ComparerPredicate(
//                IFunction left,
//                IFunction right,
//                IComparer comparer,
//                Integer comparisonResult
//        ) {
//            this.left = left;
//            this.right = right;
//            this.comparer = comparer;
//            this.comparisonResult = comparisonResult;
//        }
//        public override Boolean test(Object obj) {
//            return comparer.compare(left.apply(obj), right.apply(obj)) == comparisonResult;
//        }
//    }

    private class IsLike extends Predicate {
        private final IFunction function;
        private final String regex;
        private IsLike(IFunction function, String likeString) {
            this.function = function;
            regex = '(?i)^' + likeString.replaceAll('([^\\w%_ ])', '\\\\$1')
                .replace('%', '.*?')
                .replace('_', '.{1}?') + '$';
        }
        public override Boolean test(Object obj) {
            return Pattern.matches(regex, (String) function.apply(obj));
        }
    }
//
//    private class IsIn extends Predicate {
//        private final IFunction function;
//        private final Set<Object> container;
//        private IsIn(IFunction function, Iterable<Object> container) {
//            this.function = function;
//            this.container = Iterators.toObjectSet(container.iterator());
//        }
//        public override Boolean test(Object obj) { return container.contains(function.apply(obj)); }
//    }
    // @end-group
    //</editor-fold>

}
