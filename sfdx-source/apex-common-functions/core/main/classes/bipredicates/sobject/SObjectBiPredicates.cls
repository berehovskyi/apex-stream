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
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected SObjectBiPredicates() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
     * the `field` of the first input argument is equal to the `field` of
     * the second input argument, comparing object value equality not reference equality.
     *
     * @param field of the first and the second input arguments the value of which are considered as
     * comparison arguments
     *
     * @return the `BiPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * SObjectBiPredicates.areEqual(Account.NumberOfEmployees);
     */
    public static BiPredicate areEqual(final SObjectField field) {
        return areEqual(SObjectFunctions.get(field), SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
     * the `fieldName` of the first input argument is equal to the `fieldName` of
     * the second input argument, comparing object value equality not reference equality.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName of the first and the second input arguments the value of which are considered as
     * arguments of comparison
     *
     * @return the `BiPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectBiPredicates.areEqual('NumberOfEmployees');
     * SObjectBiPredicates.areEqual('Parent?.NumberOfEmployees');
     */
    public static BiPredicate areEqual(final String fieldName) {
        return areEqual(SObjectFunctions.get(fieldName), SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
     * the `field` of the first input argument is not equal to the `field` of
     * the second input argument, comparing object value equality not reference equality.
     *
     * @param field of the first and the second input arguments the value of which are considered as
     * comparison arguments
     *
     * @return the `BiPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * SObjectBiPredicates.areNotEqual(Account.NumberOfEmployees);
     */
    public static BiPredicate areNotEqual(final SObjectField field) {
        return areEqual(field).negate();
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
     * the `fieldName` of the first input argument is not equal to the `fieldName` of
     * the second input argument, comparing object value equality not reference equality.
     * Cross-reference fields and safe navigation are supported.
     *
     * @param fieldName of the first and the second input arguments the value of which are considered as
     * arguments of comparison
     *
     * @return the `BiPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectBiPredicates.areNotEqual('NumberOfEmployees');
     * SObjectBiPredicates.areNotEqual('Parent?.NumberOfEmployees');
     */
    public static BiPredicate areNotEqual(final String fieldName) {
        return areEqual(fieldName).negate();
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
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
     * @return the `BiPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * SObjectBiPredicates.isGreater(Account.NumberOfEmployees);
     */
    public static BiPredicate isGreater(final SObjectField field) {
        return isGreater(SObjectFunctions.get(field), SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
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
     * @return the `BiPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectBiPredicates.isGreater('NumberOfEmployees');
     * SObjectBiPredicates.isGreater('Parent?.NumberOfEmployees');
     */
    public static BiPredicate isGreater(final String fieldName) {
        return isGreater(SObjectFunctions.get(fieldName), SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
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
     * @return the `BiPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * SObjectBiPredicates.isGreaterOrEqual(Account.NumberOfEmployees);
     */
    public static BiPredicate isGreaterOrEqual(final SObjectField field) {
        return isGreater(field).orElse(areEqual(field));
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
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
     * @return the `BiPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectBiPredicates.isGreaterOrEqual('NumberOfEmployees');
     * SObjectBiPredicates.isGreaterOrEqual('Parent?.NumberOfEmployees');
     */
    public static BiPredicate isGreaterOrEqual(final String fieldName) {
        return isGreater(fieldName).orElse(areEqual(fieldName));
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
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
     * @return the `BiPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * SObjectBiPredicates.isLess(Account.NumberOfEmployees);
     */
    public static BiPredicate isLess(final SObjectField field) {
        return isLess(SObjectFunctions.get(field), SObjectFunctions.get(field));
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
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
     * @return the `BiPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectBiPredicates.isLess('NumberOfEmployees');
     * SObjectBiPredicates.isLess('Parent?.NumberOfEmployees');
     */
    public static BiPredicate isLess(final String fieldName) {
        return isLess(SObjectFunctions.get(fieldName), SObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
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
     * @return the `BiPredicate`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * SObjectBiPredicates.isLessOrEqual(Account.NumberOfEmployees);
     */
    public static BiPredicate isLessOrEqual(final SObjectField field) {
        return isLess(field).orElse(areEqual(field));
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
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
     * @return the `BiPredicate`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectBiPredicates.isLessOrEqual('NumberOfEmployees');
     * SObjectBiPredicates.isLessOrEqual('Parent?.NumberOfEmployees');
     */
    public static BiPredicate isLessOrEqual(final String fieldName) {
        return isLess(fieldName).orElse(areEqual(fieldName));
    }
    // @end-group
    //</editor-fold>

}
