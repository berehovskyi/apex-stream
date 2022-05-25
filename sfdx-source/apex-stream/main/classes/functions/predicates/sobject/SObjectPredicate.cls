/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link ISObjectPredicate} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see ISObjectIterable.filter
 * @see ISObjectIterable.take
 * @see ISObjectIterable.drop
 * @see ISObjectIterable.find
 * @see ISObjectIterable.some
 * @see ISObjectIterable.every
 * @see ISObjectIterable.none
 */
public abstract inherited sharing class SObjectPredicate implements ISObjectPredicate {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Boolean test(SObject sObj);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `SObjectPredicate` that applies short-circuiting logical
     * `OR` operator to `this` `ISObjectPredicate` and `other`
     * in that order.
     * @example
     * someSObjectPredicate1.orElse(someSObjectPredicate2);
     * @param other the other `ISObjectPredicate`
     * @return the composed `SObjectPredicate`
     * @throws NullPointerException if `other` is null
     */
    public virtual SObjectPredicate orElse(final ISObjectPredicate other) {
        return some(this, other);
    }

    /**
     * @description Returns a composed `SObjectPredicate` that applies short-circuiting logical
     * `AND` operator to `this` `ISObjectPredicate` and `other`
     * in that order.
     * @example
     * someSObjectPredicate1.andAlso(someSObjectPredicate2);
     * @param other the other `ISObjectPredicate`
     * @return the composed `SObjectPredicate`
     * @throws NullPointerException if `other` is null
     */
    public virtual SObjectPredicate andAlso(final ISObjectPredicate other) {
        return every(this, other);
    }

    /**
     * @description Returns a `SObjectPredicate` that applies logical `NOT` operator
     * to `this` `ISObjectPredicate`.
     * @example
     * someSObjectPredicate.negate();
     * @return the negated `SObjectPredicate`
     */
    public virtual SObjectPredicate negate() {
        return negate(this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `SObjectPredicate` that applies sequentially short-circuiting
     * logical `OR` operator to `predicates` in the same order as the order of the input list.
     * @example
     * SObjectPredicate.some(someSObjectPredicates);
     * @param predicates the list of`ISObjectPredicates`
     * @return the composed `SObjectPredicate`
     * @throws NullPointerException if `other` is null or some of the list element is null
     */
    public static SObjectPredicate some(final List<ISObjectPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new Some(predicates);
    }

    /**
     * @description Returns a composed `SObjectPredicate` that applies short-circuiting logical
     * `OR` operator to `predicate1` `ISObjectPredicate` and `predicate2`
     * in that order.
     * @example
     * SObjectPredicate.some(someSObjectPredicate1, someSObjectPredicate2);
     * @param predicate1 the first `ISObjectPredicate`
     * @param predicate2 the second `ISObjectPredicate`
     * @return the composed `SObjectPredicate`
     * @throws NullPointerException if `predicate1` or `predicate2` is null
     */
    public static SObjectPredicate some(final ISObjectPredicate predicate1, final ISObjectPredicate predicate2) {
        return some(new List<ISObjectPredicate>{ predicate1, predicate2 });
    }

    /**
     * @description Returns a composed `SObjectPredicate` that applies sequentially short-circuiting
     * logical `AND` operator to `predicates` in the same order as the order of the input list.
     * @example
     * SObjectPredicate.every(someSObjectPredicates);
     * @param predicates the list of`ISObjectPredicates`
     * @return the composed `SObjectPredicate`
     * @throws NullPointerException if `other` is null or some of the list element is null
     */
    public static SObjectPredicate every(final List<ISObjectPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new Every(predicates);
    }

    /**
     * @description Returns a composed `SObjectPredicate` that applies short-circuiting logical
     * `AND` operator to `predicate1` `ISObjectPredicate` and `predicate2`
     * in that order.
     * @example
     * SObjectPredicate.every(someSObjectPredicate1, someSObjectPredicate2);
     * @param predicate1 the first `ISObjectPredicate`
     * @param predicate2 the second `ISObjectPredicate`
     * @return the composed `SObjectPredicate`
     * @throws NullPointerException if `predicate1` or `predicate2` is null
     */
    public static SObjectPredicate every(final ISObjectPredicate predicate1, final ISObjectPredicate predicate2) {
        return every(new List<ISObjectPredicate>{ predicate1, predicate2 });
    }

    /**
     * @description Returns a `SObjectPredicate` that applies logical `NOT` operator
     * to `predicate`.
     * @example
     * SObjectPredicate.negate(someSObjectPredicate);
     * @param predicate the `ISObjectPredicate`
     * @return the negated `SObjectPredicate`
     */
    public static SObjectPredicate negate(final ISObjectPredicate predicate) {
        Validate.notNull(predicate);
        return new Negate(predicate);
    }

    /**
     * @description Returns a `SObjectPredicate` that always evaluates to the Boolean `value`
     * (`true` or `false`).
     * @example
     * SObjectPredicate.always(true);
     * @param value the evaluated value
     * @return predicate the `SObjectPredicate`
     * @throws NullPointerException if `value` is null
     */
    public static SObjectPredicate always(final Boolean value) {
        Validate.notNull(value);
        return new Always(value);
    }

    /**
     * @description Returns a composed `SObjectPredicate` of the `ISObjectFunction` and
     * the `IPredicate`.
     * @example
     * SObjectPredicate.compose(someSObjectFunction, somePredicate);
     * SObjectPredicate.compose(SObjectFunction.get('Name'), StringPredicate.startsWith('A'));
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     * @return the composed `SObjectPredicate`
     * @throws NullPointerException if `mapper` or `predicate` is null
     */
    public static SObjectPredicate compose(final ISObjectFunction mapper, final IPredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new OfPredicate(mapper, predicate);
    }

    /**
     * @description Returns a composed `SObjectPredicate` of the `ISObjectToIntFunction` and
     * the `IIntPredicate`.
     * @example
     * SObjectPredicate.compose(someSObjectToIntFunction, someIntPredicate);
     * SObjectPredicate.compose(
     *     SObjectToIntFunction.get('NumberOfEmployees'),
     *     IntPredicate.isEven()
     * );
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     * @return the composed `SObjectPredicate`
     * @throws NullPointerException if `mapper` or `predicate` is null
     */
    public static SObjectPredicate compose(final ISObjectToIntFunction mapper, final IIntPredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new OfIntPredicate(mapper, predicate);
    }

    /**
     * @description Returns a composed `SObjectPredicate` of the `ISObjectToLongFunction` and
     * the `ILongPredicate`.
     * @example
     * SObjectPredicate.compose(someSObjectToLongFunction, someLongPredicate);
     * SObjectPredicate.compose(
     *     SObjectToLongFunction.get('NumberOfEmployees'),
     *     LongPredicate.isEven()
     * );
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     * @return the composed `SObjectPredicate`
     * @throws NullPointerException if `mapper` or `predicate` is null
     */
    public static SObjectPredicate compose(final ISObjectToLongFunction mapper, final ILongPredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new OfLongPredicate(mapper, predicate);
    }

    /**
     * @description Returns a composed `SObjectPredicate` of the `ISObjectToDoubleFunction` and
     * the `IDoublePredicate`.
     * @example
     * SObjectPredicate.compose(someSObjectToDoubleFunction, someDoublePredicate);
     * SObjectPredicate.compose(
     *     SObjectToDoubleFunction.get('ShippingLatitude'),
     *     DoublePredicate.isPositive()
     * );
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     * @return the composed `SObjectPredicate`
     * @throws NullPointerException if `mapper` or `predicate` is null
     */
    public static SObjectPredicate compose(final ISObjectToDoubleFunction mapper, final IDoublePredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new OfDoublePredicate(mapper, predicate);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins

    //<editor-fold desc="Comparison Predicates">

    //<editor-fold desc="?">
    /**
     * @description Returns a `SObjectPredicate` that tests if the result of comparing
     * the values returned by the applied `left` and `right` functions
     * by the `comparator` is equal to the expected `result`.
     * @example
     * SObjectPredicate.isCompared(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.get('OtherIntField__c'),
     *     Comparator.defaultOrder(),
     *     1
     * );
     * @param left the function applied to the input argument the result of which is passed to
     * the `comparator` as the first argument
     * @param right the function applied to the input argument the result of which is passed to
     * the `comparator` as the second argument
     * @param comparator the function that compares two arguments
     * @param result the expected result of comparison (1, -1, or 0)
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `left`, or the `right`,
     * or `comparator`, or `result` is null
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
     * @example
     * SObjectPredicate.isGreater(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectPredicate.isGreater(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `left`, or the `right` is null
     * @see Comparator.compareNullSafeUntyped
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
     * @example
     * SObjectPredicate.isGreater('NumberOfEmployees', SObjectFunction.get('OtherIntField__c'));
     * SObjectPredicate.isGreater(
     *     'Parent?.NumberOfEmployees',
     *     SObjectFunction.constant(100)
     * );
     * @param fieldName the value of which is considered the left argument of comparison
     * @param function the function whose application result is considered as the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank, or the `function` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isGreater(final String fieldName, final ISObjectFunction function) {
        return isGreater(SObjectFunction.get(fieldName), function);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `field` is greater than the result returned by the `function`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     * @example
     * <pre>
     * SObjectPredicate.isGreater(
     *         Account.NumberOfEmployees,
     *         SObjectFunction.get('OtherIntField__c')
     *     );
     * SObjectPredicate.isGreater(
     *         Account.NumberOfEmployees,
     *         SObjectFunction.constant(100)
     *     );
     * </pre>
     *
     * @param field the value of which is considered the left argument of comparison
     * @param function the function whose application result is considered as the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank, or the `function` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isGreater(final SObjectField field, final ISObjectFunction function) {
        return isGreater(SObjectFunction.get(field), function);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `fieldName` is greater than the `value`.
     * Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     * @example
     * SObjectPredicate.isGreater('NumberOfEmployees', 100);
     * SObjectPredicate.isGreater('Parent?.NumberOfEmployees', 100);
     * @param fieldName the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isGreater(final String fieldName, final Object value) {
        return isGreater(SObjectFunction.get(fieldName), SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `field` is greater than the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     * @example
     * SObjectPredicate.isGreater(Account.NumberOfEmployees, 100);
     * @param field the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `field` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isGreater(final SObjectField field, final Object value) {
        return isGreater(SObjectFunction.get(field), SObjectFunction.constant(value));
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
     * @example
     * SObjectPredicate.isGreaterOrEqual(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectPredicate.isGreaterOrEqual(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `left`, or the `right` is null
     * @see Comparator.compareNullSafeUntyped
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
     * @example
     * SObjectPredicate.isGreaterOrEqual(
     *     'NumberOfEmployees',
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectPredicate.isGreaterOrEqual(
     *     'Parent?.NumberOfEmployees',
     *     SObjectFunction.constant(100)
     * );
     * @param fieldName the value of which is considered the left argument of comparison
     * @param function the function whose application result is considered as the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank, or the `function` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see Comparator.compareNullSafeUntyped
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
     * @example
     * SObjectPredicate.isGreaterOrEqual(
     *     Account.NumberOfEmployees,
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectPredicate.isGreaterOrEqual(
     *     Account.NumberOfEmployees,
     *     SObjectFunction.constant(100)
     * );
     * @param field the value of which is considered the left argument of comparison
     * @param function the function whose application result is considered as the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank, or the `function` is null
     * @see Comparator.compareNullSafeUntyped
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
     * @example
     * SObjectPredicate.isGreaterOrEqual('NumberOfEmployees', 100);
     * SObjectPredicate.isGreaterOrEqual('Parent?.NumberOfEmployees', 100);
     * @param fieldName the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see Comparator.compareNullSafeUntyped
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
     * @example
     * SObjectPredicate.isGreaterOrEqual(Account.NumberOfEmployees, 100);
     * @param field the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `field` is null
     * @see Comparator.compareNullSafeUntyped
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
     * @example
     * SObjectPredicate.isLess(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectPredicate.isLess(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     * @param left the function whose application result is considered as the left argument of comparison.
     * @param right the function whose application result is considered as the right argument of comparison.
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `left`, or the `right` is null
     * @see Comparator.compareNullSafeUntyped
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
     * @example
     * SObjectPredicate.isLess('NumberOfEmployees', SObjectFunction.get('OtherIntField__c'));
     * SObjectPredicate.isLess(
     *     'Parent?.NumberOfEmployees',
     *     SObjectFunction.constant(100)
     * );
     * @param fieldName the value of which is considered the left argument of comparison.
     * @param function the function whose application result is considered as the right argument of comparison.
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank, or the `function` is null
     * @throws SObjectException if provided invalid `fieldName`
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isLess(final String fieldName, final ISObjectFunction function) {
        return isLess(SObjectFunction.get(fieldName), function);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests if the value of
     * the `field` is less than the result returned by the `function`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     * @example
     * <pre>
     * SObjectPredicate.isLess(
     *     Account.NumberOfEmployees,
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectPredicate.isLess(
     *     Account.NumberOfEmployees,
     *     SObjectFunction.constant(100)
     * );
     * @param field the value of which is considered the left argument of comparison.
     * @param function the function whose application result is considered as the right argument of comparison.
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank, or the `function` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isLess(final SObjectField field, final ISObjectFunction function) {
        return isLess(SObjectFunction.get(field), function);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests if the value of
     * the `fieldName` is less than the `value`.
     * Cross-reference fields and safe navigation are supported.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     * @example
     * SObjectPredicate.isLess('NumberOfEmployees', 100);
     * SObjectPredicate.isLess('Parent?.NumberOfEmployees', 100);
     * @param fieldName the value of which is considered the left argument of comparison.
     * @param value the right argument of comparison.
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isLess(final String fieldName, final Object value) {
        return isLess(SObjectFunction.get(fieldName), SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests if the value of
     * the `field` is less than the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     * @example
     * SObjectPredicate.isLess(Account.NumberOfEmployees, 100);
     * @param field the value of which is considered the left argument of comparison.
     * @param value the right argument of comparison.
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `field` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isLess(final SObjectField field, final Object value) {
        return isLess(SObjectFunction.get(field), SObjectFunction.constant(value));
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
     * @example
     * SObjectPredicate.isLessOrEqual(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectPredicate.isLessOrEqual(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     * @param left the function whose application result is considered as the left argument of comparison.
     * @param right the function whose application result is considered as the right argument of comparison.
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `left`, or the `right` is null
     * @see Comparator.compareNullSafeUntyped
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
     * @example
     * SObjectPredicate.isLessOrEqual(
     *     'NumberOfEmployees',
     *      SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectPredicate.isLessOrEqual(
     *     'Parent?.NumberOfEmployees',
     *     SObjectFunction.constant(100)
     * );
     * @param fieldName the value of which is considered the left argument of comparison.
     * @param function the function whose application result is considered as the right argument of comparison.
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank, or the `function` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see Comparator.compareNullSafeUntyped
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
     * @example
     * SObjectPredicate.isLessOrEqual(
     *     Account.NumberOfEmployees,
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectPredicate.isLessOrEqual(
     *     Account.NumberOfEmployees,
     *     SObjectFunction.constant(100)
     * );
     * @param field the value of which is considered the left argument of comparison.
     * @param function the function whose application result is considered as the right argument of comparison.
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank, or the `function` is null
     * @see Comparator.compareNullSafeUntyped
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
     * @example
     * SObjectPredicate.isLessOrEqual('NumberOfEmployees', 100);
     * SObjectPredicate.isLessOrEqual('Parent?.NumberOfEmployees', 100);
     * @param fieldName the value of which is considered the left argument of comparison.
     * @param value the right argument of comparison.
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see Comparator.compareNullSafeUntyped
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
     * @example
     * SObjectPredicate.isLessOrEqual(Account.NumberOfEmployees, 100);
     * @param field the value of which is considered the left argument of comparison.
     * @param value the right argument of comparison.
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `field` is null
     * @see Comparator.compareNullSafeUntyped
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
     * @example
     * SObjectPredicate.isEqual(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectPredicate.isEqual(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `left`, or the `right` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isEqual(final ISObjectFunction left, final ISObjectFunction right) {
        return isCompared(left, right, Comparator.defaultOrder(), 0);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `fieldName` is equal to the result returned by the `function`,
     * comparing object value equality not reference equality.
     * Cross-reference fields and safe navigation are supported.
     * @example
     * SObjectPredicate.isEqual(
     *     'NumberOfEmployees',
     *      SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectPredicate.isEqual(
     *     'Parent?.NumberOfEmployees',
     *     SObjectFunction.constant(100)
     * );
     * @param fieldName the value of which is considered the left argument of comparison
     * @param function the function whose application result is considered as the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank, or the `function` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isEqual(final String fieldName, final ISObjectFunction function) {
        return isEqual(SObjectFunction.get(fieldName), function);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `field` is equal to the result returned by the `function`,
     * comparing object value equality not reference equality.
     * @example
     * SObjectPredicate.isEqual(
     *     Account.NumberOfEmployees,
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectPredicate.isEqual(
     *     Account.NumberOfEmployees,
     *     SObjectFunction.constant(100)
     * );
     * @param field the value of which is considered the left argument of comparison
     * @param function the function whose application result is considered as the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank, or the `function` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isEqual(final SObjectField field, final ISObjectFunction function) {
        return isEqual(SObjectFunction.get(field), function);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `fieldName` is equal to the `value`, comparing object value equality
     * not reference equality. Cross-reference fields and safe navigation are supported.
     * @example
     * SObjectPredicate.isEqual('NumberOfEmployees', 100);
     * SObjectPredicate.isEqual('Parent?.NumberOfEmployees', 100);
     * @param fieldName the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isEqual(final String fieldName, final Object value) {
        return isEqual(SObjectFunction.get(fieldName), SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `field` is equal to the `value`, comparing object value equality
     * not reference equality.
     * @example
     * SObjectPredicate.isEqual(Account.NumberOfEmployees, 100);
     * @param field the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `field` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isEqual(final SObjectField field, final Object value) {
        return isEqual(SObjectFunction.get(field), SObjectFunction.constant(value));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `left` operator is equal to the result returned by the `right`
     * operator, comparing SObject value equality not reference equality.
     * @example
     * SObjectPredicate.isEqual(
     *     SObjectUnaryOperator.getSObject('ParentId'),
     *     SObjectUnaryOperator.getSObject('AnotherParentId')
     * );
     * @param left the operator whose application result is considered as the left argument of comparison
     * @param right the operator whose application result is considered as the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `left` or the `right` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isEqual(final ISObjectUnaryOperator left, final ISObjectUnaryOperator right) {
        return isEqual(SObjectFunction.forOperator(left), SObjectFunction.forOperator(right));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `identity` function is equal to the result returned by the `operator`,
     * comparing SObject value equality not reference equality.
     * @example
     * SObjectPredicate.isEqual(SObjectUnaryOperator.getSObject('ParentId'));
     * @param operator the function whose application result is considered as the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `operator` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isEqual(final ISObjectUnaryOperator operator) {
        return isEqual(SObjectFunction.identity(), SObjectFunction.forOperator(operator));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `identity` function is equal to the `value`, comparing SObject value
     * equality not reference equality.
     * @example
     * SObjectPredicate.isEqual(someAccount);
     * @param value the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `operator` is null
     * @see Comparator.compareNullSafeUntyped
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
     * @example
     * SObjectPredicate.isEqual(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectPredicate.isEqual(
     *     SObjectFunction.get('NumberOfEmployees'),
     *     SObjectFunction.constant(100)
     * );
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `left`, or the `right` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isNotEqual(final ISObjectFunction left, final ISObjectFunction right) {
        return isEqual(left, right).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `fieldName` is not equal to the result returned by the `function`,
     * comparing object value equality not reference equality.
     * Cross-reference fields and safe navigation are supported.
     * @example
     * SObjectPredicate.isEqual(
     *     'NumberOfEmployees',
     *      SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectPredicate.isEqual(
     *     'Parent?.NumberOfEmployees',
     *     SObjectFunction.constant(100)
     * );
     * @param fieldName the value of which is considered the left argument of comparison
     * @param function the function whose application result is considered as the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank, or the `function` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isNotEqual(final String fieldName, final ISObjectFunction function) {
        return isEqual(fieldName, function).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `field` is not equal to the result returned by the `function`,
     * comparing object value equality not reference equality.
     * @example
     * SObjectPredicate.isEqual(
     *     Account.NumberOfEmployees,
     *     SObjectFunction.get('OtherIntField__c')
     * );
     * SObjectPredicate.isEqual(
     *     Account.NumberOfEmployees,
     *     SObjectFunction.constant(100)
     * );
     * @param field the value of which is considered the left argument of comparison
     * @param function the function whose application result is considered as the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank, or the `function` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isNotEqual(final SObjectField field, final ISObjectFunction function) {
        return isEqual(field, function).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `fieldName` is not equal to the `value`, comparing object value equality
     * not reference equality. Cross-reference fields and safe navigation are supported.
     * @example
     * SObjectPredicate.isEqual('NumberOfEmployees', 100);
     * SObjectPredicate.isEqual('Parent?.NumberOfEmployees', 100);
     * @param fieldName the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isNotEqual(final String fieldName, final Object value) {
        return isEqual(fieldName, value).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value of
     * the `field` is not equal to the `value`, comparing object value equality
     * not reference equality.
     * @example
     * SObjectPredicate.isEqual(Account.NumberOfEmployees, 100);
     * @param field the value of which is considered the left argument of comparison
     * @param value the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `field` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isNotEqual(final SObjectField field, final Object value) {
        return isEqual(field, value).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `left` operator is not equal to the result returned by the `right`
     * operator, comparing SObject value equality not reference equality.
     * @example
     * SObjectPredicate.isNotEqual(
     *     SObjectUnaryOperator.getSObject('ParentId'),
     *     SObjectUnaryOperator.getSObject('AnotherParentId')
     * );
     * @param left the operator whose application result is considered as the left argument of comparison
     * @param right the operator whose application result is considered as the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `left` or the `right` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isNotEqual(final ISObjectUnaryOperator left, final ISObjectUnaryOperator right) {
        return isEqual(SObjectFunction.forOperator(left), SObjectFunction.forOperator(right)).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `identity` function is not equal to the result returned by the `operator`,
     * comparing SObject value equality not reference equality.
     * @example
     * SObjectPredicate.isEqual(SObjectUnaryOperator.getSObject('ParentId'));
     * @param operator the function whose application result is considered as the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `operator` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isNotEqual(final ISObjectUnaryOperator operator) {
        return isEqual(operator).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `identity` function is not equal to the `value`, comparing SObject value
     * equality not reference equality.
     * @example
     * SObjectPredicate.isEqual(someAccount);
     * @param value the right argument of comparison
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `operator` is null
     * @see Comparator.compareNullSafeUntyped
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
     * @example
     * SObjectPredicate.isLike(SObjectFunction.get('Name'), '%a_e');
     * SObjectPredicate.isLike(SObjectFunction.get(Account.Name), '%a_e');
     * @param function the function whose application result string is tested
     * @param likeString the pattern that is tested to match the string returned by the `function`
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `function`, or the `likeString` is null
     * @see Comparator.compareNullSafeUntyped
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
     * @example
     * SObjectPredicate.isLike('Name', '%a_e');
     * SObjectPredicate.isLike('Parent?.Name', '%a_e');
     * @param fieldName the value of which is tested
     * @param likeString the pattern that is tested to match the string value of the `fieldName`
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank, or the `likeString` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isLike(final String fieldName, final String likeString) {
        return isLike(SObjectFunction.get(fieldName), likeString);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the string value of
     * the `field` matches the `likeString` pattern. Supports the `%` and
     * the `_` wildcards and is case-insensitive. Cross-reference fields and safe navigation are supported.
     * @example
     * SObjectPredicate.isLike(Account.Name, '%a_e');
     * @param field the value of which is tested
     * @param likeString the pattern that is tested to match the string value of the `field`
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `field`, or the `likeString` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static SObjectPredicate isLike(final SObjectField field, final String likeString) {
        return isLike(SObjectFunction.get(field), likeString);
    }
    //</editor-fold>

    //<editor-fold desc="IN">
    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `function` is contained in the `container`.
     * @example
     * SObjectPredicate.isIn(SObjectFunction.get('Name'), new List<Object>{ 'John', 'Jim' });
     * SObjectPredicate.isIn(SObjectFunction.get('Name'), (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
     * SObjectPredicate.isIn(SObjectFunction.get('Name'), nameStream);
     * @param function the function whose application result is tested
     * @param container the iterable that checks for the presence of an element
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `function`, or the `container` is null
     * @see List.contains
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
     * @example
     * SObjectPredicate.isIn('Name', new List<Object>{ 'John', 'Jim' });
     * SObjectPredicate.isIn('Parent?.Name', (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
     * SObjectPredicate.isIn('Parent.Name', nameStream);
     * @param fieldName the value of which is tested
     * @param container the iterable that checks for the presence of an element
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank, or the `container` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see List.contains
     */
    public static SObjectPredicate isIn(final String fieldName, final Iterable<Object> container) {
        return isIn(SObjectFunction.get(fieldName), container);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the the value of
     * the `field` is contained in the `container`.
     * @example
     * SObjectPredicate.isIn(Account.Name, new List<Object>{ 'John', 'Jim' });
     * SObjectPredicate.isIn(Account.Name, (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
     * SObjectPredicate.isIn(Account.Name, nameStream);
     * @param field the value of which is tested
     * @param container the iterable that checks for the presence of an element
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `field`, or the `container` is null
     * @see List.contains
     */
    public static SObjectPredicate isIn(final SObjectField field, final Iterable<Object> container) {
        return isIn(SObjectFunction.get(field), container);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input sobject
     * is contained in the `container`.
     * @example
     * SObjectPredicate.isIn(accounts);
     * SObjectPredicate.isIn(accStream);
     * SObjectPredicate.isIn((Iterable<Account>) accountSet);
     * @param container the iterable that checks for the presence of an element
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `container` is null
     * @see List.contains
     */
    public static SObjectPredicate isIn(final Iterable<SObject> container) {
        return isIn(SObjectFunction.identity(), (Iterable<Object>) container);
    }
    //</editor-fold>

    //<editor-fold desc="NOT IN">
    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `function` is not contained in the `container`.
     * @example
     * SObjectPredicate.isNotIn(SObjectFunction.get('Name'), new List<Object>{ 'John', 'Jim' });
     * SObjectPredicate.isNotIn(SObjectFunction.get('Name'), (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
     * SObjectPredicate.isNotIn(SObjectFunction.get('Name'), nameStream);
     * @param function the function whose application result is tested
     * @param container the iterable that checks for the presence of an element
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `function`, or the `container` is null
     * @see List.contains
     */
    public static SObjectPredicate isNotIn(final ISObjectFunction function, final Iterable<Object> container) {
        return isIn(function, container).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the the value of
     * the `fieldName` is not contained in the `container`. Cross-reference fields and safe
     * navigation are supported.
     * @example
     * SObjectPredicate.isNotIn('Name', new List<Object>{ 'John', 'Jim' });
     * SObjectPredicate.isNotIn('Parent?.Name', (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
     * SObjectPredicate.isNotIn('Parent.Name', nameStream);
     * @param fieldName the value of which is tested
     * @param container the iterable that checks for the presence of an element
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank, or the `container` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see List.contains
     */
    public static SObjectPredicate isNotIn(final String fieldName, final Iterable<Object> container) {
        return isIn(fieldName, container).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the the value of
     * the `field` is not contained in the `container`.
     * @example
     * SObjectPredicate.isNotIn(Account.Name, new List<Object>{ 'John', 'Jim' });
     * SObjectPredicate.isNotIn(Account.Name, (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
     * SObjectPredicate.isNotIn(Account.Name, nameStream);
     * @param field the value of which is tested
     * @param container the iterable that checks for the presence of an element
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `field`, or the `container` is null
     * @see List.contains
     */
    public static SObjectPredicate isNotIn(final SObjectField field, final Iterable<Object> container) {
        return isIn(field, container).negate();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if it is not contained
     * in the `container`.
     * @example
     * SObjectPredicate.isNotIn(accounts);
     * SObjectPredicate.isNotIn(accStream);
     * SObjectPredicate.isNotIn((Iterable<Account>) accountSet);
     * @param container the iterable that checks for the presence of an element
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `container` is null
     * @see List.contains
     */
    public static SObjectPredicate isNotIn(final Iterable<SObject> container) {
        return isIn(container).negate();
    }
    //</editor-fold>

    //</editor-fold>

    //<editor-fold desc="Null Comparison Predicates">
    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if it is null.
     * @example
     * SObjectPredicate.isNull();
     * @return the `SObjectPredicate`
     */
    public static SObjectPredicate isNull() {
        return isEqual((SObject) null);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if it is not null.
     * @example
     * SObjectPredicate.isNotNull();
     * @return the `SObjectPredicate`
     */
    public static SObjectPredicate isNotNull() {
        return isEqual((SObject) null).negate();
    }
    //</editor-fold>

    //<editor-fold desc="Possessive Predicates">
    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `function` is not null.
     * @example
     * SObjectPredicate.has(SObjectFunction.get('Name'));
     * SObjectPredicate.has(SObjectFunction.get(Account.Name));
     * @param function the function whose application result is tested
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `function` is null
     * @see SObjectPredicate.isNotEqual
     */
    public static SObjectPredicate has(final ISObjectFunction function) {
        return isNotEqual(function, SObjectFunction.constant(null));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value
     * the `fieldName` is not null. Cross-reference fields and safe
     * navigation are supported.
     * @example
     * SObjectPredicate.has('Name');
     * SObjectPredicate.has('Parent?.Name');
     * @param fieldName the value of which is tested
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObjectPredicate.isNotEqual
     * @see SObjectFunction.get
     */
    public static SObjectPredicate has(final String fieldName) {
        return has(SObjectFunction.get(fieldName));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the value
     * the `field` is not null.
     * @example
     * SObjectPredicate.has(Account.Name);
     * @param field the value of which is tested
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `field` is null
     * @see SObjectPredicate.isNotEqual
     * @see SObjectFunction.get
     */
    public static SObjectPredicate has(final SObjectField field) {
        return has(SObjectFunction.get(field));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the result returned by
     * the `operator` is not null.
     * @example
     * SObjectPredicate.hasSObject(SObjectFunction.getSObject('Parent'));
     * SObjectPredicate.hasSObject(SObjectFunction.getSObject(Account.ParentId));
     * @param operator the operator whose application result is tested
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `operator` is null
     * @see SObjectPredicate.isNotEqual
     */
    public static SObjectPredicate hasSObject(final ISObjectUnaryOperator operator) {
        return isNotEqual(operator, SObjectUnaryOperator.constant(null));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the parent SObject by
     * the `fieldName` is not null. Cross-reference fields and safe
     * navigation are supported.
     * @example
     * SObjectPredicate.hasSObject('Parent');
     * SObjectPredicate.hasSObject('Parent?.Parent');
     * @param fieldName the value of which is tested
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObjectPredicate.isNotEqual
     * @see SObjectUnaryOperator.getSObject
     */
    public static SObjectPredicate hasSObject(final String fieldName) {
        return hasSObject(SObjectUnaryOperator.getSObject(fieldName));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the parent SObject by
     * the `fieldName` is not null.
     * @example
     * SObjectPredicate.hasSObject(Account.ParentId);
     * @param field the value of which is tested
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `field` is null
     * @see SObjectPredicate.isNotEqual
     * @see SObjectUnaryOperator.getSObject
     */
    public static SObjectPredicate hasSObject(final SObjectField field) {
        return hasSObject(SObjectUnaryOperator.getSObject(field));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the children sobjects by
     * the `fieldName` is not null. Cross-reference fields and safe navigation are supported.
     * @example
     * SObjectPredicate.hasSObjects('Parent');
     * SObjectPredicate.hasSObjects('Parent?.Parent');
     * @param fieldName the value of which is tested
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObjectPredicate.isNotEqual
     * @see SObjectFunction.getSObjects
     */
    public static SObjectPredicate hasSObjects(final String fieldName) {
        return has(SObjectFunction.getSObjects(fieldName));
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if the children sobjects by
     * the `field` is not null.
     * @example
     * SObjectPredicate.hasSObjects(Contact.AccountId);
     * @param field the value of which is tested
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `field` is null
     * @see SObjectPredicate.isNotEqual
     */
    public static SObjectPredicate hasSObjects(final SObjectField field) {
        return has(SObjectFunction.getSObjects(field));
    }
    //</editor-fold>

    //<editor-fold desc="SObject Predicates">
    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if it has errors
     * @return the `SObjectPredicate`
     * @see SObject.hasErrors
     */
    public static SObjectPredicate hasErrors() {
        return new HasErrors();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if it is a clone
     * @return the `SObjectPredicate`
     * @see SObject.isClone
     */
    public static SObjectPredicate isClone() {
        return new IsClone();
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if
     * its `fieldName` is populated, either by direct assignment or by inclusion in a SOQL query.
     * Cross-reference fields and safe navigation are supported.
     * @example
     * SObjectPredicate.isSet('Name');
     * SObjectPredicate.isSet('ParentId');
     * SObjectPredicate.isSet('Parent?.ParentId');
     * @param fieldName the value of which is tested
     * @return the `SObjectPredicate`
     * @throws NullPointerException if the `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     * @see SObject.isSet
     */
    public static SObjectPredicate isSet(final String fieldName) {
        Validate.notNull(fieldName);
        if (!fieldName.contains('.')) { return new IsSetFieldName(fieldName); }
        if (fieldName.substringBeforeLast('.').endsWith('?')) { return new IsSetFieldPathSafe(fieldName); }
        return new IsSetFieldPath(fieldName);
    }

    /**
     * @description Returns a `SObjectPredicate` that tests the input SObject if
     * its `field` is populated, either by direct assignment or by inclusion in a SOQL query.
     * @example
     * SObjectPredicate.isSet(Account.Name);
     * SObjectPredicate.isSet(Account.ParentId);
     * @param field the value of which is tested
     * @return the `SObjectPredicate`
     * @see SObject.isSet
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
    private class Every extends SObjectPredicate {
        private final List<ISObjectPredicate> predicates;
        public Every(List<ISObjectPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(SObject sObj) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (!predicates[i].test(sObj)) { return false; }
            }
            return true;
        }
    }

    private class Some extends SObjectPredicate {
        private final List<ISObjectPredicate> predicates;
        public Some(List<ISObjectPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(SObject sObj) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (predicates[i].test(sObj)) { return true; }
            }
            return false;
        }
    }

    private class Negate extends SObjectPredicate {
        private final ISObjectPredicate predicate;
        public Negate(ISObjectPredicate predicate) { this.predicate = predicate; }
        public override Boolean test(SObject sObj) { return !predicate.test(sObj); }
    }

    private class Always extends SObjectPredicate {
        private final Boolean value;
        private Always(Boolean value) { this.value = value; }
        public override Boolean test(SObject sObj) { return value; }
    }

    private class OfPredicate extends SObjectPredicate {
        private final ISObjectFunction mapper;
        private final IPredicate predicate;
        private OfPredicate(ISObjectFunction mapper, IPredicate predicate) {
            this.mapper = mapper;
            this.predicate = predicate;
        }
        public override Boolean test(SObject sObj) {
            return predicate.test(mapper.apply(sObj));
        }
    }

    private class OfIntPredicate extends SObjectPredicate {
        private final ISObjectToIntFunction mapper;
        private final IIntPredicate predicate;
        private OfIntPredicate(ISObjectToIntFunction mapper, IIntPredicate predicate) {
            this.mapper = mapper;
            this.predicate = predicate;
        }
        public override Boolean test(SObject sObj) {
            return predicate.test(mapper.apply(sObj));
        }
    }

    private class OfLongPredicate extends SObjectPredicate {
        private final ISObjectToLongFunction mapper;
        private final ILongPredicate predicate;
        private OfLongPredicate(ISObjectToLongFunction mapper, ILongPredicate predicate) {
            this.mapper = mapper;
            this.predicate = predicate;
        }
        public override Boolean test(SObject sObj) {
            return predicate.test(mapper.apply(sObj));
        }
    }

    private class OfDoublePredicate extends SObjectPredicate {
        private final ISObjectToDoubleFunction mapper;
        private final IDoublePredicate predicate;
        private OfDoublePredicate(ISObjectToDoubleFunction mapper, IDoublePredicate predicate) {
            this.mapper = mapper;
            this.predicate = predicate;
        }
        public override Boolean test(SObject sObj) {
            return predicate.test(mapper.apply(sObj));
        }
    }

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
            operator = SObjectUnaryOperator.getSObject(fieldName.substringBeforeLast('.'));
        }
        public override Boolean test(SObject sObj) { return operator.apply(sObj).isSet(fieldName); }
    }

    private class IsSetFieldPathSafe extends SObjectPredicate {
        private final String fieldName;
        private final ISObjectUnaryOperator operator;
        private IsSetFieldPathSafe(String fieldName) {
            this.fieldName = fieldName.substringAfterLast('.');
            operator = SObjectUnaryOperator.getSObject(fieldName.substringBeforeLast('.'));
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
