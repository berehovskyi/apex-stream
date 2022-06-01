/**
 * @description Inherits {@link ISObjectBiPredicate} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 *
 * @see SObjectStream.zip
 * @see SObjectSequence.zip
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class SObjectBiPredicate implements ISObjectBiPredicate {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Boolean test(SObject sObj1, SObject sObj2);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `SObjectBiPredicate` that applies short-circuiting logical
     * `OR` operator to `this` `ISObjectBiPredicate` and `other`
     * in that order.
     *
     * @param other the other `ISObjectBiPredicate`
     *
     * @return the composed `SObjectBiPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someSObjectBiPredicate1.orElse(someSObjectBiPredicate2);
     */
    public virtual SObjectBiPredicate orElse(final ISObjectBiPredicate other) {
        return some(new List<ISObjectBiPredicate>{ this, other });
    }

    /**
     * @description Returns a composed `SObjectBiPredicate` that applies short-circuiting logical
     * `AND` operator to `this` `ISObjectPredicate` and `other`
     * in that order.
     *
     * @param other the other `ISObjectBiPredicate`
     *
     * @return the composed `SObjectBiPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someSObjectBiPredicate1.andAlso(someSObjectBiPredicate2);
     */
    public virtual SObjectBiPredicate andAlso(final ISObjectBiPredicate other) {
        return every(new List<ISObjectBiPredicate>{ this, other });
    }

    /**
     * @description Returns a `SObjectBiPredicate` that applies logical `NOT` operator
     * to `this` `ISObjectBiPredicate`.
     *
     * @return the negated `SObjectBiPredicate`
     *
     * @example
     * someSObjectBiPredicate.negate();
     */
    public virtual SObjectBiPredicate negate() {
        return new Negate(this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `SObjectBiPredicate` that applies sequentially short-circuiting
     * logical `OR` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`ISObjectBiPredicate`
     *
     * @return the composed `SObjectBiPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * SObjectBiPredicate.some(someSObjectBiPredicates);
     */
    public static SObjectBiPredicate some(final List<ISObjectBiPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new Some(predicates);
    }

    /**
     * @description Returns a composed `SObjectBiPredicate` that applies sequentially short-circuiting
     * logical `AND` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`ISObjectBiPredicate`
     *
     * @return the composed `SObjectBiPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * SObjectBiPredicate.every(someSObjectBiPredicates);
     */
    public static SObjectBiPredicate every(final List<ISObjectBiPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new Every(predicates);
    }

    /**
     * @description Returns a `SObjectBiPredicate` that applies logical `NOT` operator
     * to `predicate`.
     *
     * @param predicate the `ISObjectBiPredicate`
     *
     * @return the negated `SObjectBiPredicate`
     *
     * @example
     * SObjectBiPredicate.negate(someSObjectBiPredicate);
     */
    public static SObjectBiPredicate negate(final ISObjectBiPredicate predicate) {
        Validate.notNull(predicate);
        return new Negate(predicate);
    }

    /**
     * @description Returns a composed `SObjectBiPredicate` that applies short-circuiting logical
     * `OR` operator to `predicate1` `ISObjectPredicate` and `predicate2`
     * in that order applied to the first and the second input arguments respectively.
     *
     * @param left the predicate applied to the first input argument
     * @param right the predicate applied to the second input argument
     *
     * @return the composed `SObjectBiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @example
     * SObjectBiPredicate.somePredicate(someSObjectPredicate1, someSObjectPredicate2);
     */
    public static SObjectBiPredicate somePredicate(final ISObjectPredicate left, final ISObjectPredicate right) {
        Validate.notNull(left);
        Validate.notNull(right);
        return new SomePredicate(left, right);
    }

    /**
     * @description Returns a composed `SObjectBiPredicate` that applies short-circuiting logical
     * `AND` operator to `predicate1` `ISObjectPredicate` and `predicate2`
     * in that order applied to the first and the second input arguments respectively.
     *
     * @param left the predicate applied to the first input argument
     * @param right the predicate applied to the second input argument
     *
     * @return the composed `SObjectBiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @example
     * SObjectBiPredicate.everyPredicate(someSObjectPredicate1, someSObjectPredicate2);
     */
    public static SObjectBiPredicate everyPredicate(final ISObjectPredicate left, final ISObjectPredicate right) {
        Validate.notNull(left);
        Validate.notNull(right);
        return new EveryPredicate(left, right);
    }

    /**
     * @description Returns a `SObjectBiPredicate` that always evaluates to the Boolean `value`
     * (`true` or `false`).
     *
     * @param value the evaluated value
     *
     * @return predicate the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `value` is null
     *
     * @example
     * SObjectBiPredicate.always(true);
     */
    public static SObjectBiPredicate always(final Boolean value) {
        Validate.notNull(value);
        return new Always(value);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins

    //<editor-fold desc="Comparison BiPredicates">

    //<editor-fold desc="?">
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
     * SObjectBiPredicate.isCompared(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.get('OtherIntField__c'),
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
    //</editor-fold>

    //<editor-fold desc=">">
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.isGreater(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectBiPredicate.isGreater(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectBiPredicate isGreater(final ISObjectFunction left, final ISObjectFunction right) {
        return isCompared(left, right, Comparator.defaultOrder(), 1);
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.isGreater(SObjectFunction.get('NumberOfEmployees'));
     */
    public static SObjectBiPredicate isGreater(final ISObjectFunction function) {
        return isGreater(function, function);
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.isGreater('NumberOfEmployees');
     * SObjectBiPredicate.isGreater('Parent?.NumberOfEmployees');
     */
    public static SObjectBiPredicate isGreater(final String fieldName) {
        return isGreater(SObjectFunction.get(fieldName), SObjectFunction.get(fieldName));
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.isGreater(Account.NumberOfEmployees);
     */
    public static SObjectBiPredicate isGreater(final SObjectField field) {
        return isGreater(SObjectFunction.get(field), SObjectFunction.get(field));
    }
    //</editor-fold>

    //<editor-fold desc=">=">
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.isGreaterOrEqual(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectBiPredicate.isGreaterOrEqual(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectBiPredicate isGreaterOrEqual(final ISObjectFunction left, final ISObjectFunction right) {
        return isGreater(left, right).orElse(areEqual(left, right));
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.isGreaterOrEqual(SObjectFunction.get('NumberOfEmployees'));
     */
    public static SObjectBiPredicate isGreaterOrEqual(final ISObjectFunction function) {
        return isGreater(function).orElse(areEqual(function));
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.isGreaterOrEqual('NumberOfEmployees');
     * SObjectBiPredicate.isGreaterOrEqual('Parent?.NumberOfEmployees');
     */
    public static SObjectBiPredicate isGreaterOrEqual(final String fieldName) {
        return isGreater(fieldName).orElse(areEqual(fieldName));
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.isGreaterOrEqual(Account.NumberOfEmployees);
     */
    public static SObjectBiPredicate isGreaterOrEqual(final SObjectField field) {
        return isGreater(field).orElse(areEqual(field));
    }
    //</editor-fold>

    //<editor-fold desc="<">
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.isLess(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectBiPredicate.isLess(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectBiPredicate isLess(final ISObjectFunction left, final ISObjectFunction right) {
        return isCompared(left, right, Comparator.defaultOrder(), -1);
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.isLess(SObjectFunction.get('NumberOfEmployees'));
     */
    public static SObjectBiPredicate isLess(final ISObjectFunction function) {
        return isLess(function, function);
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.isLess('NumberOfEmployees');
     * SObjectBiPredicate.isLess('Parent?.NumberOfEmployees');
     */
    public static SObjectBiPredicate isLess(final String fieldName) {
        return isLess(SObjectFunction.get(fieldName), SObjectFunction.get(fieldName));
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.isLess(Account.NumberOfEmployees);
     */
    public static SObjectBiPredicate isLess(final SObjectField field) {
        return isLess(SObjectFunction.get(field), SObjectFunction.get(field));
    }
    //</editor-fold>

    //<editor-fold desc="<=">
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.isLessOrEqual(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectBiPredicate.isLessOrEqual(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectBiPredicate isLessOrEqual(final ISObjectFunction left, final ISObjectFunction right) {
        return isLess(left, right).orElse(areEqual(left, right));
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.isLessOrEqual(SObjectFunction.get('NumberOfEmployees'));
     */
    public static SObjectBiPredicate isLessOrEqual(final ISObjectFunction function) {
        return isLess(function).orElse(areEqual(function));
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.isLessOrEqual('NumberOfEmployees');
     * SObjectBiPredicate.isLessOrEqual('Parent?.NumberOfEmployees');
     */
    public static SObjectBiPredicate isLessOrEqual(final String fieldName) {
        return isLess(fieldName).orElse(areEqual(fieldName));
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.isLessOrEqual(Account.NumberOfEmployees);
     */
    public static SObjectBiPredicate isLessOrEqual(final SObjectField field) {
        return isLess(field).orElse(areEqual(field));
    }
    //</editor-fold>

    //<editor-fold desc="==">
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.areEqual(
     * SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectBiPredicate.areEqual(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectBiPredicate areEqual(final ISObjectFunction left, final ISObjectFunction right) {
        return isCompared(left, right, Comparator.defaultOrder(), 0);
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.areEqual(SObjectFunction.get('NumberOfEmployees'));
     */
    public static SObjectBiPredicate areEqual(final ISObjectFunction function) {
        return areEqual(function, function);
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.areEqual('NumberOfEmployees');
     * SObjectBiPredicate.areEqual('Parent?.NumberOfEmployees');
     */
    public static SObjectBiPredicate areEqual(final String fieldName) {
        return areEqual(SObjectFunction.get(fieldName), SObjectFunction.get(fieldName));
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.areEqual(Account.NumberOfEmployees);
     */
    public static SObjectBiPredicate areEqual(final SObjectField field) {
        return areEqual(SObjectFunction.get(field), SObjectFunction.get(field));
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
     * the first input argument is equal to the second input argument.
     *
     * @return the `SObjectBiPredicate`
     *
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.areEqual();
     */
    public static SObjectBiPredicate areEqual() {
        return areEqual(SObjectFunction.identity(), SObjectFunction.identity());
    }
    //</editor-fold>

    //<editor-fold desc="!=">
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.areNotEqual(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectBiPredicate.areNotEqual(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     */
    public static SObjectBiPredicate areNotEqual(final ISObjectFunction left, final ISObjectFunction right) {
        return areEqual(left, right).negate();
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.areNotEqual(SObjectFunction.get('NumberOfEmployees'));
     */
    public static SObjectBiPredicate areNotEqual(final ISObjectFunction function) {
        return areEqual(function).negate();
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.areNotEqual('NumberOfEmployees');
     * SObjectBiPredicate.areNotEqual('Parent?.NumberOfEmployees');
     */
    public static SObjectBiPredicate areNotEqual(final String fieldName) {
        return areEqual(fieldName).negate();
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
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.areNotEqual(Account.NumberOfEmployees);
     */
    public static SObjectBiPredicate areNotEqual(final SObjectField field) {
        return areEqual(field).negate();
    }

    /**
     * @description Returns a `SObjectBiPredicate` that tests the input sobjects if the value of
     * the first input argument is not equal to the second input argument.
     *
     * @return the `SObjectBiPredicate`
     *
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * SObjectBiPredicate.areNotEqual();
     */
    public static SObjectBiPredicate areNotEqual() {
        return areEqual().negate();
    }
    //</editor-fold>

    //</editor-fold>
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Some extends SObjectBiPredicate {
        private final List<ISObjectBiPredicate> predicates;
        public Some(List<ISObjectBiPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(SObject sObj1, SObject sObj2) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (predicates[i].test(sObj1, sObj2)) { return true; }
            }
            return false;
        }
    }

    private class SomePredicate extends SObjectBiPredicate {
        private final ISObjectPredicate leftPredicate;
        private final ISObjectPredicate rightPredicate;
        public SomePredicate(ISObjectPredicate leftPredicate, ISObjectPredicate rightPredicate) {
            this.leftPredicate = leftPredicate;
            this.rightPredicate = rightPredicate;
        }
        public override Boolean test(SObject sObj1, SObject sObj2) {
            return leftPredicate.test(sObj1) || rightPredicate.test(sObj2);
        }
    }

    private class Every extends SObjectBiPredicate {
        private final List<ISObjectBiPredicate> predicates;
        public Every(List<ISObjectBiPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(SObject sObj1, SObject sObj2) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (!predicates[i].test(sObj1, sObj2)) { return false; }
            }
            return true;
        }
    }

    private class EveryPredicate extends SObjectBiPredicate {
        private final ISObjectPredicate leftPredicate;
        private final ISObjectPredicate rightPredicate;
        public EveryPredicate(ISObjectPredicate leftPredicate, ISObjectPredicate rightPredicate) {
            this.leftPredicate = leftPredicate;
            this.rightPredicate = rightPredicate;
        }
        public override Boolean test(SObject sObj1, SObject sObj2) {
            return leftPredicate.test(sObj1) && rightPredicate.test(sObj2);
        }
    }

    private class Negate extends SObjectBiPredicate {
        private final ISObjectBiPredicate predicate;
        public Negate(ISObjectBiPredicate predicate) { this.predicate = predicate; }
        public override Boolean test(SObject sObj1, SObject sObj2) { return !predicate.test(sObj1, sObj2); }
    }

    private class Always extends SObjectBiPredicate {
        private final Boolean value;
        private Always(Boolean value) { this.value = value; }
        public override Boolean test(SObject sObj1, SObject sObj2) { return value; }
    }

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
