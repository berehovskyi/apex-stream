/**
 * @description Provides common implementations of {@link SObjectBiPredicate}
 * and related utilities.
 *
 * @see SObjectBiPredicate
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class SObjectBiPredicates {

    @TestVisible
    private SObjectBiPredicates(){}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `SObjectBiPredicate` that tests if the result of comparing
     * the values returned by the applied `left` and `right` functions
     * applied to the first and the second input arguments respectively
     * by the `comparator` is equal to the expected `result`.
     *
     * @param left the function applied to the first input argument the result of which is passed to
     * the `comparator` as the first argument
     * @param right the function applied to the second input argument the result of which is passed to
     * the `comparator` as the second argument
     * @param comparator the function that compares two arguments
     * @param result the expected result of comparison (1, -1, or 0)
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `left`, or `right`,
     * or `comparator`, or `result` is null
     *
     * @example
     * SObjectBiPredicates.isCompared(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunctions.get('OtherIntField__c'),
     *     Comparator.defaultOrder(),
     *     1
     * );
     */
    public static SObjectBiPredicate isCompared(
            final ISObjectFunction left,
            final ISObjectFunction right,
            final IComparator comparator,
            final Integer result
    ) {
        Validate.notNull(left);
        Validate.notNull(right);
        Validate.notNull(comparator);
        Validate.notNull(result);
        return new Compared(left, right, comparator, result);
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
     * the first input argument is equal to the second input argument.
     *
     * @return the `SObjectBiPredicate`
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.areEqual();
     */
    public static SObjectBiPredicate areEqual() {
        return areEqual(SObjectFunction.identity());
    }

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
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.areEqual(Account.NumberOfEmployees);
     */
    public static SObjectBiPredicate areEqual(final SObjectField field) {
        return areEqual(SObjectFunctions.get(field));
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
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.areEqual('NumberOfEmployees');
     * SObjectBiPredicates.areEqual('Parent?.NumberOfEmployees');
     */
    public static SObjectBiPredicate areEqual(final String fieldName) {
        return areEqual(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
     * the `function` function applied to the first input argument is equal to the result
     * returned by the same `function` applied to the second input argument, comparing
     * object value equality not reference equality.
     *
     * @param function the function applied to the first and the second input arguments
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `function` is null
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.areEqual(SObjectFunctions.get('NumberOfEmployees'));
     */
    public static SObjectBiPredicate areEqual(final ISObjectFunction function) {
        return areEqual(function, function);
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
     * the `left` function applied to the first input argument is equal to the result
     * returned by the `right` function applied to the second input argument, comparing object value
     * equality not reference equality.
     *
     * @param left the function applied to the first input argument, whose application result is considered
     * as the left argument of comparison
     * @param right the function applied to the second input argument, whose application result is considered
     * as the right argument of comparison
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.areEqual(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectBiPredicates.areEqual(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectBiPredicate areEqual(final ISObjectFunction left, final ISObjectFunction right) {
        return isCompared(left, right, Comparator.defaultOrder(), 0);
    }
    
    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
     * the first input argument is not equal to the second input argument.
     *
     * @return the `SObjectBiPredicate`
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.areNotEqual();
     */
    public static SObjectBiPredicate areNotEqual() {
        return areEqual().negate();
    }

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
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.areNotEqual(Account.NumberOfEmployees);
     */
    public static SObjectBiPredicate areNotEqual(final SObjectField field) {
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
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.areNotEqual('NumberOfEmployees');
     * SObjectBiPredicates.areNotEqual('Parent?.NumberOfEmployees');
     */
    public static SObjectBiPredicate areNotEqual(final String fieldName) {
        return areEqual(fieldName).negate();
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
     * the `function` function applied to the first input argument is not equal to the result
     * returned by the same `function` applied to the second input argument, comparing
     * object value equality not reference equality.
     *
     * @param function the function applied to the first and the second input arguments
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `function` is null
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.areNotEqual(SObjectFunctions.get('NumberOfEmployees'));
     */
    public static SObjectBiPredicate areNotEqual(final ISObjectFunction function) {
        return areEqual(function).negate();
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
     * the `left` function applied to the first input argument is not equal to the result
     * returned by the `right` function applied to the second input argument, comparing object value
     * equality not reference equality.
     *
     * @param left the function applied to the first input argument, whose application result is considered
     * as the left argument of comparison
     * @param right the function applied to the second input argument, whose application result is considered
     * as the right argument of comparison
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.areNotEqual(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectBiPredicates.areNotEqual(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectBiPredicate areNotEqual(final ISObjectFunction left, final ISObjectFunction right) {
        return areEqual(left, right).negate();
    }

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
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isGreater(Account.NumberOfEmployees);
     */
    public static SObjectBiPredicate isGreater(final SObjectField field) {
        return isGreater(SObjectFunctions.get(field));
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
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isGreater('NumberOfEmployees');
     * SObjectBiPredicates.isGreater('Parent?.NumberOfEmployees');
     */
    public static SObjectBiPredicate isGreater(final String fieldName) {
        return isGreater(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
     * the `function` function applied to the first input argument is greater than the result
     * returned by the same `function` applied to the second input argument.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param function the function applied to the first and the second input arguments
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `function` is null
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isGreater(SObjectFunctions.get('NumberOfEmployees'));
     */
    public static SObjectBiPredicate isGreater(final ISObjectFunction function) {
        return isGreater(function, function);
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
     * the `left` function applied to the first input argument is greater than the result
     * returned by the `right` function applied to the second input argument.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param left the function applied to the first input argument, whose application result is considered
     * as the left argument of comparison
     * @param right the function applied to the second input argument, whose application result is considered
     * as the right argument of comparison
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isGreater(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectBiPredicates.isGreater(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectBiPredicate isGreater(final ISObjectFunction left, final ISObjectFunction right) {
        return isCompared(left, right, Comparator.defaultOrder(), 1);
    }

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
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isGreaterOrEqual(Account.NumberOfEmployees);
     */
    public static SObjectBiPredicate isGreaterOrEqual(final SObjectField field) {
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
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isGreaterOrEqual('NumberOfEmployees');
     * SObjectBiPredicates.isGreaterOrEqual('Parent?.NumberOfEmployees');
     */
    public static SObjectBiPredicate isGreaterOrEqual(final String fieldName) {
        return isGreater(fieldName).orElse(areEqual(fieldName));
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
     * the `function` function applied to the first input argument is greater than or equal to the result
     * returned by the same `function` applied to the second input argument.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param function the function applied to the first and the second input arguments
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `function` is null
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isGreaterOrEqual(SObjectFunctions.get('NumberOfEmployees'));
     */
    public static SObjectBiPredicate isGreaterOrEqual(final ISObjectFunction function) {
        return isGreater(function).orElse(areEqual(function));
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
     * the `left` function applied to the first input argument is greater than or equal to the result
     * returned by the `right` function applied to the second input argument.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param left the function applied to the first input argument, whose application result is considered
     * as the left argument of comparison
     * @param right the function applied to the second input argument, whose application result is considered
     * as the right argument of comparison
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isGreaterOrEqual(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectBiPredicates.isGreaterOrEqual(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectBiPredicate isGreaterOrEqual(final ISObjectFunction left, final ISObjectFunction right) {
        return isGreater(left, right).orElse(areEqual(left, right));
    }

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
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isLess(Account.NumberOfEmployees);
     */
    public static SObjectBiPredicate isLess(final SObjectField field) {
        return isLess(SObjectFunctions.get(field));
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
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isLess('NumberOfEmployees');
     * SObjectBiPredicates.isLess('Parent?.NumberOfEmployees');
     */
    public static SObjectBiPredicate isLess(final String fieldName) {
        return isLess(SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
     * the `function` function applied to the first input argument is less than the result
     * returned by the same `function` applied to the second input argument.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param function the function applied to the first and the second input arguments
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if the `function` is null
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isLess(SObjectFunctions.get('NumberOfEmployees'));
     */
    public static SObjectBiPredicate isLess(final ISObjectFunction function) {
        return isLess(function, function);
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
     * the `left` function applied to the first input argument is less than the result
     * returned by the `right` function applied to the second input argument.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param left the function applied to the first input argument, whose application result is considered
     * as the left argument of comparison
     * @param right the function applied to the second input argument, whose application result is considered
     * as the right argument of comparison
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isLess(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectBiPredicates.isLess(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectBiPredicate isLess(final ISObjectFunction left, final ISObjectFunction right) {
        return isCompared(left, right, Comparator.defaultOrder(), -1);
    }

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
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isLessOrEqual(Account.NumberOfEmployees);
     */
    public static SObjectBiPredicate isLessOrEqual(final SObjectField field) {
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
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isLessOrEqual('NumberOfEmployees');
     * SObjectBiPredicates.isLessOrEqual('Parent?.NumberOfEmployees');
     */
    public static SObjectBiPredicate isLessOrEqual(final String fieldName) {
        return isLess(fieldName).orElse(areEqual(fieldName));
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
     * the `function` function applied to the first input argument is less than or equal to the result
     * returned by the same `function` applied to the second input argument.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param function the function applied to the first and the second input arguments
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `function` is null
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isLessOrEqual(SObjectFunctions.get('NumberOfEmployees'));
     */
    public static SObjectBiPredicate isLessOrEqual(final ISObjectFunction function) {
        return isLess(function).orElse(areEqual(function));
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by
     * the `left` function applied to the first input argument is less than or equal to the result
     * returned by the `right` function applied to the second input argument.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @param left the function applied to the first input argument, whose application result is considered
     * as the left argument of comparison
     * @param right the function applied to the second input argument, whose application result is considered
     * as the right argument of comparison
     *
     * @return the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicates.isLessOrEqual(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunctions.get('OtherIntField__c')
     * );
     * SObjectBiPredicates.isLessOrEqual(
     *     SObjectFunctions.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectBiPredicate isLessOrEqual(final ISObjectFunction left, final ISObjectFunction right) {
        return isLess(left, right).orElse(areEqual(left, right));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Compared extends SObjectBiPredicate {
        private final ISObjectFunction left;
        private final ISObjectFunction right;
        private final IComparator comparator;
        private final Integer comparisonResult;
        private Compared(
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
        public override Boolean test(SObject sObj1, SObject sObj2) {
            return comparator.compare(left.apply(sObj1), right.apply(sObj2)) == comparisonResult;
        }
    }
    // @end-group
    //</editor-fold>

}
