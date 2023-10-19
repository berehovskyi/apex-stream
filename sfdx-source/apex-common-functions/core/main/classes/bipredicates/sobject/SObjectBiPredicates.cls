/**
 * @description Provides common implementations of {@link BiPredicate}
 * and related utilities.
 *
 * @see BiPredicate
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class SObjectBiPredicates extends BiPredicates {

    @TestVisible
    protected SObjectBiPredicates() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
//    /**
//     * @description Returns a `SObjectBiPredicate` that tests if the result of comparing
//     * the values returned by the applied `left` and `right` functions
//     * applied to the first and the second input arguments respectively
//     * by the `comparer` is equal to the expected `result`.
//     *
//     * @param left the function applied to the first input argument the result of which is passed to
//     * the `comparer` as the first argument
//     * @param right the function applied to the second input argument the result of which is passed to
//     * the `comparer` as the second argument
//     * @param comparer the function that compares two arguments
//     * @param result the expected result of comparison (1, -1, or 0)
//     *
//     * @return the `SObjectBiPredicate`
//     *
//     * @throws NullPointerException if `left`, or `right`,
//     * or `comparer`, or `result` is null
//     *
//     * @example
//     * SObjectBiPredicates.isCompared(
//     *     SObjectFunctions.get('NumberOfEmployees'),
//     *     SObjectFunctions.get('OtherIntField__c'),
//     *     Comparer.defaultOrder(),
//     *     1
//     * );
//     */
//    public static BiPredicate isCompared(
//            final IFunction left,
//            final IFunction right,
//            final IComparer comparer,
//            final Integer result
//    ) {
//        Validate.notNull(left);
//        Validate.notNull(right);
//        Validate.notNull(comparer);
//        Validate.notNull(result);
//        return new Compared(left, right, comparer, result);
//    }
//
//    /**
//     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
//     * the first input argument is equal to the second input argument.
//     *
//     * @return the `SObjectBiPredicate`
//     *
//     * @see Comparers.compareNullSafeUntyped
//     *
//     * @example
//     * SObjectBiPredicates.areEqual();
//     */
//    public static BiPredicate areEqual() {
//        return areEqual(Function.identity());
//    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
     * the `field` of the first input argument is equal to the `field` of
     * the second input argument, comparing object value equality not reference equality.
     *
     * @param field of the first and the second input arguments the value of which are considered as
     * comparison arguments
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.areEqual(Account.NumberOfEmployees);
     */
    public static BiPredicate areEqual(final SObjectField field) {
        return areEqual(SObjectFunctions.get(field), SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
     * the `fieldName` of the first input argument is equal to the `fieldName` of
     * the second input argument, comparing object value equality not reference equality.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName of the first and the second input arguments the value of which are considered as
     * arguments of comparison
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.areEqual('NumberOfEmployees');
     * SObjectBiPredicates.areEqual('Parent?.NumberOfEmployees');
     */
    public static BiPredicate areEqual(final String fieldName) {
        return areEqual(SObjectFunctions.get(fieldName), SObjectFunctions.get(fieldName));
    }
//
//    /**
//     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
//     * the `function` function applied to the first input argument is equal to the result
//     * returned by the same `function` applied to the second input argument, comparing
//     * object value equality not reference equality.
//     *
//     * @param function the function applied to the first and the second input arguments
//     *
//     * @return the `SObjectBiPredicate`
//     *
//     * @throws NullPointerException if `function` is null
//     *
//     * @see Comparers.compareNullSafeUntyped
//     *
//     * @example
//     * SObjectBiPredicates.areEqual(SObjectFunctions.get('NumberOfEmployees'));
//     */
//    public static BiPredicate areEqual(final IFunction function) {
//        return areEqual(function, function);
//    }
//
//    /**
//     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
//     * the `left` function applied to the first input argument is equal to the result
//     * returned by the `right` function applied to the second input argument, comparing object value
//     * equality not reference equality.
//     *
//     * @param left the function applied to the first input argument, whose application result is considered
//     * as the left argument of comparison
//     * @param right the function applied to the second input argument, whose application result is considered
//     * as the right argument of comparison
//     *
//     * @return the `SObjectBiPredicate`
//     *
//     * @throws NullPointerException if `left` or `right` is null
//     *
//     * @see Comparers.compareNullSafeUntyped
//     *
//     * @example
//     * SObjectBiPredicates.areEqual(
//     *     SObjectFunctions.get('NumberOfEmployees'),
//     *     SObjectFunctions.get('OtherIntField__c')
//     * );
//     * SObjectBiPredicates.areEqual(
//     *     SObjectFunctions.get('NumberOfEmployees'),
//     *     SObjectFunction.constant(100)
//     * );
//     */
//    public static BiPredicate areEqual(final IFunction left, final IFunction right) {
//        return isCompared(left, right, Comparer.defaultOrder(), 0);
//    }
//
//    /**
//     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
//     * the first input argument is not equal to the second input argument.
//     *
//     * @return the `SObjectBiPredicate`
//     *
//     * @see Comparers.compareNullSafeUntyped
//     *
//     * @example
//     * SObjectBiPredicates.areNotEqual();
//     */
//    public static BiPredicate areNotEqual() {
//        return areEqual().negate();
//    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
     * the `field` of the first input argument is not equal to the `field` of
     * the second input argument, comparing object value equality not reference equality.
     *
     * @param field of the first and the second input arguments the value of which are considered as
     * comparison arguments
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.areNotEqual(Account.NumberOfEmployees);
     */
    public static BiPredicate areNotEqual(final SObjectField field) {
        return areEqual(field).negate();
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
     * the `fieldName` of the first input argument is not equal to the `fieldName` of
     * the second input argument, comparing object value equality not reference equality.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName of the first and the second input arguments the value of which are considered as
     * arguments of comparison
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.areNotEqual('NumberOfEmployees');
     * SObjectBiPredicates.areNotEqual('Parent?.NumberOfEmployees');
     */
    public static BiPredicate areNotEqual(final String fieldName) {
        return areEqual(fieldName).negate();
    }

//    /**
//     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
//     * the `function` function applied to the first input argument is not equal to the result
//     * returned by the same `function` applied to the second input argument, comparing
//     * object value equality not reference equality.
//     *
//     * @param function the function applied to the first and the second input arguments
//     *
//     * @return the `SObjectBiPredicate`
//     *
//     * @throws NullPointerException if `function` is null
//     *
//     * @see Comparers.compareNullSafeUntyped
//     *
//     * @example
//     * SObjectBiPredicates.areNotEqual(SObjectFunctions.get('NumberOfEmployees'));
//     */
//    public static BiPredicate areNotEqual(final IFunction function) {
//        return areEqual(function).negate();
//    }
//
//    /**
//     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
//     * the `left` function applied to the first input argument is not equal to the result
//     * returned by the `right` function applied to the second input argument, comparing object value
//     * equality not reference equality.
//     *
//     * @param left the function applied to the first input argument, whose application result is considered
//     * as the left argument of comparison
//     * @param right the function applied to the second input argument, whose application result is considered
//     * as the right argument of comparison
//     *
//     * @return the `SObjectBiPredicate`
//     *
//     * @throws NullPointerException if `left` or `right` is null
//     *
//     * @see Comparers.compareNullSafeUntyped
//     *
//     * @example
//     * SObjectBiPredicates.areNotEqual(
//     *     SObjectFunctions.get('NumberOfEmployees'),
//     *     SObjectFunctions.get('OtherIntField__c')
//     * );
//     * SObjectBiPredicates.areNotEqual(
//     *     SObjectFunctions.get('NumberOfEmployees'),
//     *     SObjectFunction.constant(100)
//     * );
//     */
//    public static BiPredicate areNotEqual(final IFunction left, final IFunction right) {
//        return areEqual(left, right).negate();
//    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
     * the `field` of the first input argument is greater than the `field` of
     * the second input argument.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param field of the first and the second input arguments the value of which are considered as
     * comparison arguments
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isGreater(Account.NumberOfEmployees);
     */
    public static BiPredicate isGreater(final SObjectField field) {
        return isGreater(SObjectFunctions.get(field), SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
     * the `fieldName` of the first input argument is greater than the `fieldName` of
     * the second input argument. Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param fieldName of the first and the second input arguments the value of which are considered as
     * arguments of comparison
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isGreater('NumberOfEmployees');
     * SObjectBiPredicates.isGreater('Parent?.NumberOfEmployees');
     */
    public static BiPredicate isGreater(final String fieldName) {
        return isGreater(SObjectFunctions.get(fieldName), SObjectFunctions.get(fieldName));
    }

//    /**
//     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
//     * the `function` function applied to the first input argument is greater than the result
//     * returned by the same `function` applied to the second input argument.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param function the function applied to the first and the second input arguments
//     *
//     * @return the `SObjectBiPredicate`
//     *
//     * @throws NullPointerException if `function` is null
//     *
//     * @see Comparers.compareNullSafeUntyped
//     *
//     * @example
//     * SObjectBiPredicates.isGreater(SObjectFunctions.get('NumberOfEmployees'));
//     */
//    public static BiPredicate isGreater(final IFunction function) {
//        return isGreater(function, function);
//    }
//
//    /**
//     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
//     * the `left` function applied to the first input argument is greater than the result
//     * returned by the `right` function applied to the second input argument.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param left the function applied to the first input argument, whose application result is considered
//     * as the left argument of comparison
//     * @param right the function applied to the second input argument, whose application result is considered
//     * as the right argument of comparison
//     *
//     * @return the `SObjectBiPredicate`
//     *
//     * @throws NullPointerException if `left` or `right` is null
//     *
//     * @see Comparers.compareNullSafeUntyped
//     *
//     * @example
//     * SObjectBiPredicates.isGreater(
//     *     SObjectFunctions.get('NumberOfEmployees'),
//     *     SObjectFunctions.get('OtherIntField__c')
//     * );
//     * SObjectBiPredicates.isGreater(
//     *     SObjectFunctions.get('NumberOfEmployees'),
//     *     SObjectFunction.constant(100)
//     * );
//     */
//    public static BiPredicate isGreater(final IFunction left, final IFunction right) {
//        return isCompared(left, right, Comparer.defaultOrder(), 1);
//    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
     * the `field` of the first input argument is greater than or equal to the `field` of
     * the second input argument.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param field of the first and the second input arguments the value of which are considered as
     * comparison arguments
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isGreaterOrEqual(Account.NumberOfEmployees);
     */
    public static BiPredicate isGreaterOrEqual(final SObjectField field) {
        return isGreater(field).orElse(areEqual(field));
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
     * the `fieldName` of the first input argument is greater than or equal to the `fieldName` of
     * the second input argument. Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param fieldName of the first and the second input arguments the value of which are considered as
     * arguments of comparison
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isGreaterOrEqual('NumberOfEmployees');
     * SObjectBiPredicates.isGreaterOrEqual('Parent?.NumberOfEmployees');
     */
    public static BiPredicate isGreaterOrEqual(final String fieldName) {
        return isGreater(fieldName).orElse(areEqual(fieldName));
    }

//    /**
//     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
//     * the `function` function applied to the first input argument is greater than or equal to the result
//     * returned by the same `function` applied to the second input argument.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param function the function applied to the first and the second input arguments
//     *
//     * @return the `SObjectBiPredicate`
//     *
//     * @throws NullPointerException if `function` is null
//     *
//     * @see Comparers.compareNullSafeUntyped
//     *
//     * @example
//     * SObjectBiPredicates.isGreaterOrEqual(SObjectFunctions.get('NumberOfEmployees'));
//     */
//    public static BiPredicate isGreaterOrEqual(final IFunction function) {
//        return isGreater(function).orElse(areEqual(function));
//    }
//
//    /**
//     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
//     * the `left` function applied to the first input argument is greater than or equal to the result
//     * returned by the `right` function applied to the second input argument.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param left the function applied to the first input argument, whose application result is considered
//     * as the left argument of comparison
//     * @param right the function applied to the second input argument, whose application result is considered
//     * as the right argument of comparison
//     *
//     * @return the `SObjectBiPredicate`
//     *
//     * @throws NullPointerException if `left` or `right` is null
//     *
//     * @see Comparers.compareNullSafeUntyped
//     *
//     * @example
//     * SObjectBiPredicates.isGreaterOrEqual(
//     *     SObjectFunctions.get('NumberOfEmployees'),
//     *     SObjectFunctions.get('OtherIntField__c')
//     * );
//     * SObjectBiPredicates.isGreaterOrEqual(
//     *     SObjectFunctions.get('NumberOfEmployees'),
//     *     SObjectFunction.constant(100)
//     * );
//     */
//    public static BiPredicate isGreaterOrEqual(final IFunction left, final IFunction right) {
//        return isGreater(left, right).orElse(areEqual(left, right));
//    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
     * the `field` of the first input argument is less than the `field` of
     * the second input argument.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param field of the first and the second input arguments the value of which are considered as
     * comparison arguments
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isLess(Account.NumberOfEmployees);
     */
    public static BiPredicate isLess(final SObjectField field) {
        return isLess(SObjectFunctions.get(field), SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
     * the `fieldName` of the first input argument is less than the `fieldName` of
     * the second input argument. Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param fieldName of the first and the second input arguments the value of which are considered as
     * arguments of comparison
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isLess('NumberOfEmployees');
     * SObjectBiPredicates.isLess('Parent?.NumberOfEmployees');
     */
    public static BiPredicate isLess(final String fieldName) {
        return isLess(SObjectFunctions.get(fieldName), SObjectFunctions.get(fieldName));
    }

//    /**
//     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
//     * the `function` function applied to the first input argument is less than the result
//     * returned by the same `function` applied to the second input argument.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param function the function applied to the first and the second input arguments
//     *
//     * @return the `SObjectBiPredicate`
//     *
//     * @throws NullPointerException if `function` is null
//     *
//     * @see Comparers.compareNullSafeUntyped
//     *
//     * @example
//     * SObjectBiPredicates.isLess(SObjectFunctions.get('NumberOfEmployees'));
//     */
//    public static BiPredicate isLess(final IFunction function) {
//        return isLess(function, function);
//    }
//
//    /**
//     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
//     * the `left` function applied to the first input argument is less than the result
//     * returned by the `right` function applied to the second input argument.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param left the function applied to the first input argument, whose application result is considered
//     * as the left argument of comparison
//     * @param right the function applied to the second input argument, whose application result is considered
//     * as the right argument of comparison
//     *
//     * @return the `SObjectBiPredicate`
//     *
//     * @throws NullPointerException if `left` or `right` is null
//     *
//     * @see Comparers.compareNullSafeUntyped
//     *
//     * @example
//     * SObjectBiPredicates.isLess(
//     *     SObjectFunctions.get('NumberOfEmployees'),
//     *     SObjectFunctions.get('OtherIntField__c')
//     * );
//     * SObjectBiPredicates.isLess(
//     *     SObjectFunctions.get('NumberOfEmployees'),
//     *     SObjectFunction.constant(100)
//     * );
//     */
//    public static BiPredicate isLess(final IFunction left, final IFunction right) {
//        return isCompared(left, right, Comparer.defaultOrder(), -1);
//    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
     * the `field` of the first input argument is less than or equal to the `field` of
     * the second input argument.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `&lt;=` "less than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param field of the first and the second input arguments the value of which are considered as
     * comparison arguments
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isLessOrEqual(Account.NumberOfEmployees);
     */
    public static BiPredicate isLessOrEqual(final SObjectField field) {
        return isLess(field).orElse(areEqual(field));
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
     * the `fieldName` of the first input argument is less than or equal to the `fieldName` of
     * the second input argument. Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param fieldName of the first and the second input arguments the value of which are considered as
     * arguments of comparison
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isLessOrEqual('NumberOfEmployees');
     * SObjectBiPredicates.isLessOrEqual('Parent?.NumberOfEmployees');
     */
    public static BiPredicate isLessOrEqual(final String fieldName) {
        return isLess(fieldName).orElse(areEqual(fieldName));
    }

//    /**
//     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
//     * the `function` function applied to the first input argument is less than or equal to the result
//     * returned by the same `function` applied to the second input argument.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param function the function applied to the first and the second input arguments
//     *
//     * @return the `SObjectBiPredicate`
//     *
//     * @throws NullPointerException if `function` is null
//     *
//     * @see Comparers.compareNullSafeUntyped
//     *
//     * @example
//     * SObjectBiPredicates.isLessOrEqual(SObjectFunctions.get('NumberOfEmployees'));
//     */
//    public static BiPredicate isLessOrEqual(final IFunction function) {
//        return isLess(function).orElse(areEqual(function));
//    }
//
//    /**
//     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
//     * the `left` function applied to the first input argument is less than or equal to the result
//     * returned by the `right` function applied to the second input argument.
//     * <p><strong>Note: </strong></p>
//     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
//     * comparison of all primitive types and considers a non-null value as always greater than
//     * a null value.</p>
//     *
//     * @param left the function applied to the first input argument, whose application result is considered
//     * as the left argument of comparison
//     * @param right the function applied to the second input argument, whose application result is considered
//     * as the right argument of comparison
//     *
//     * @return the `SObjectBiPredicate`
//     *
//     * @throws NullPointerException if `left` or `right` is null
//     *
//     * @see Comparers.compareNullSafeUntyped
//     *
//     * @example
//     * SObjectBiPredicates.isLessOrEqual(
//     *     SObjectFunctions.get('NumberOfEmployees'),
//     *     SObjectFunctions.get('OtherIntField__c')
//     * );
//     * SObjectBiPredicates.isLessOrEqual(
//     *     SObjectFunctions.get('NumberOfEmployees'),
//     *     SObjectFunction.constant(100)
//     * );
//     */
//    public static BiPredicate isLessOrEqual(final IFunction left, final IFunction right) {
//        return isLess(left, right).orElse(areEqual(left, right));
//    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
//    private class Compared extends BiPredicate {
//        private final IFunction left;
//        private final IFunction right;
//        private final IComparer comparer;
//        private final Integer comparisonResult;
//        private Compared(
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
//        public override Boolean test(Object o1, Object o2) {
//            return comparer.compare(left.apply(o1), right.apply(o2)) == comparisonResult;
//        }
//    }
    // @end-group
    //</editor-fold>

}
