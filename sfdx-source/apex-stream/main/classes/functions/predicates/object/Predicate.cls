/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Inherits {@link IPredicate} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see IObjectIterable.filter
 * @see IObjectIterable.take
 * @see IObjectIterable.drop
 * @see IObjectIterable.find
 * @see IObjectIterable.some
 * @see IObjectIterable.every
 * @see IObjectIterable.none
 */
public abstract inherited sharing class Predicate implements IPredicate {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Boolean test(Object o);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `Predicate` that applies short-circuiting logical
     * OR} operator to `this` `IPredicate` and `other`
     * in that order.
     * @example
     * somePredicate1.orElse(somePredicate2);
     * @param other the other `Predicate`
     * @return the composed `Predicate`
     * @throws NullPointerException if `other` is null
     */
    public virtual Predicate orElse(final IPredicate other) {
        return some(this, other);
    }

    /**
     * @description Returns a composed `Predicate` that applies short-circuiting logical
     * AND} operator to `this` `IPredicate` and `other`
     * in that order.
     * @example
     * somePredicate1.andAlso(somePredicate2);
     * @param other the other `Predicate`
     * @return the composed `Predicate`
     * @throws NullPointerException if `other` is null
     */
    public virtual Predicate andAlso(final IPredicate other) {
        return every(this, other);
    }

    /**
     * @description Returns a `Predicate` that applies logical `NOT` operator
     * to `this` `IPredicate`.
     * @example
     * somePredicate1.negate();
     * @return the negated `Predicate`
     */
    public virtual Predicate negate() {
        return negate(this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `Predicate` that applies sequentially short-circuiting
     * logical `OR` operator to `predicates` in the same order as the order of the input list.
     * @example
     * Predicate.some(somePredicates);
     * @param predicates the list of`IPredicates`
     * @return the composed `Predicate`
     * @throws NullPointerException if `other` is null or some of the list element is null
     */
    public static Predicate some(final List<IPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new OrPredicates(predicates);
    }

    /**
     * @description Returns a composed `Predicate` that applies short-circuiting logical
     * OR} operator to `predicate1` `IPredicate` and `predicate2`
     * in that order.
     * @example
     * Predicate.some(somePredicate1, somePredicate2);
     * @param predicate1 the first `IPredicate`
     * @param predicate2 the second `IPredicate`
     * @return the composed `Predicate`
     * @throws NullPointerException if `predicate1` or `predicate2` is null
     */
    public static Predicate some(final IPredicate predicate1, final IPredicate predicate2) {
        return some(new List<IPredicate>{ predicate1, predicate2 });
    }

    /**
     * @description Returns a composed `Predicate` that applies sequentially short-circuiting
     * logical `AND` operator to `predicates` in the same order as the order of the input list.
     * @example
     * Predicate.every(somePredicates);
     * @param predicates the list of`IPredicates`
     * @return the composed `Predicate`
     * @throws NullPointerException if `other` is null or some of the list element is null
     */
    public static Predicate every(final List<IPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new AndPredicates(predicates);
    }

    /**
     * @description Returns a composed `Predicate` that applies short-circuiting logical
     * AND} operator to `predicate1` `IPredicate` and `predicate2`
     * in that order.
     * @example
     * Predicate.every(somePredicate1, somePredicate2);
     * @param predicate1 the first `IPredicate`
     * @param predicate2 the second `IPredicate`
     * @return the composed `Predicate`
     * @throws NullPointerException if `predicate1` or `predicate2` is null
     */
    public static Predicate every(final IPredicate predicate1, final IPredicate predicate2) {
        return every(new List<IPredicate>{ predicate1, predicate2 });
    }

    /**
     * @description Returns a `Predicate` that applies logical `NOT` operator
     * to `predicate`.
     * @example
     * Predicate.negate(somePredicate);
     * @param predicate the `IPredicate`
     * @return the negated `Predicate`
     */
    public static Predicate negate(final IPredicate predicate) {
        Validate.notNull(predicate);
        return new NegatePredicate(predicate);
    }

    /**
     * @description Returns a `Predicate` that always evaluates to the Boolean `value`
     * (`true` or `false`).
     * @example
     * Predicate.always(true);
     * @param value the evaluated value
     * @return predicate the `Predicate`
     * @throws NullPointerException if `value` is null
     */
    public static Predicate always(final Boolean value) {
        Validate.notNull(value);
        return new Always(value);
    }

    /**
     * @description Returns a composed `Predicate` of the `IFunction` and
     * the `IPredicate`.
     * @example
     * Predicate.compose(someFunction, somePredicate);
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     * @return the composed `Predicate`
     * @throws NullPointerException if `mapper` or `predicate` is null
     */
    public static Predicate compose(final IFunction mapper, final IPredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new OfFunctionPredicate(mapper, predicate);
    }

    /**
     * @description Returns a composed `Predicate` of the `IToIntFunction` and
     * the `IIntPredicate`.
     * @example
     * Predicate.compose(someToIntFunction, someIntPredicate);
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     * @return the composed `Predicate`
     * @throws NullPointerException if `mapper` or `predicate` is null
     */
    public static Predicate compose(final IToIntFunction mapper, final IIntPredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new OfIntFunctionPredicate(mapper, predicate);
    }

    /**
     * @description Returns a composed `Predicate` of the `IToLongFunction` and
     * the `ILongPredicate`.
     * @example
     * Predicate.compose(someToLongFunction, someLongPredicate);
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     * @return the composed `Predicate`
     * @throws NullPointerException if `mapper` or `predicate` is null
     */
    public static Predicate compose(final IToLongFunction mapper, final ILongPredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new OfLongFunctionPredicate(mapper, predicate);
    }

    /**
     * @description Returns a composed `Predicate` of the `IToDoubleFunction` and
     * the `IDoublePredicate`.
     * @example
     * Predicate.compose(someToDoubleFunction, someDoublePredicate);
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     * @return the composed `Predicate`
     * @throws NullPointerException if `mapper` or `predicate` is null
     */
    public static Predicate compose(final IToDoubleFunction mapper, final IDoublePredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new OfDoubleFunctionPredicate(mapper, predicate);
    }

    /**
     * @description Returns a composed `Predicate` of the `IToSObjectFunction` and
     * the `ISObjectPredicate`.
     * @example
     * Predicate.compose(someToSObjectFunction, someSObjectPredicate);
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     * @return the composed `Predicate`
     * @throws NullPointerException if `mapper` or `predicate` is null
     */
    public static Predicate compose(final IToSObjectFunction mapper, final ISObjectPredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new OfSObjectFunctionPredicate(mapper, predicate);
    }

    /**
     * @description Returns a composed `Predicate` of the `IIntPredicate`.
     * @example
     * Predicate.upcast(someIntPredicate);
     * @param predicate the predicate
     * @return the composed `Predicate`
     * @throws NullPointerException if `predicate` is null
     */
    public static Predicate upcast(final IIntPredicate predicate) {
        Validate.notNull(predicate);
        return new OfIntPredicate(predicate);
    }

    /**
     * @description Returns a composed `Predicate` of the `ILongPredicate`.
     * @example
     * Predicate.upcast(someLongPredicate);
     * @param predicate the predicate
     * @return the composed `Predicate`
     * @throws NullPointerException if `predicate` is null
     */
    public static Predicate upcast(final ILongPredicate predicate) {
        Validate.notNull(predicate);
        return new OfLongPredicate(predicate);
    }

    /**
     * @description Returns a composed `Predicate` of the `IDoublePredicate`.
     * @example
     * Predicate.upcast(someDoublePredicate);
     * @param predicate the predicate
     * @return the composed `Predicate`
     * @throws NullPointerException if `predicate` is null
     */
    public static Predicate upcast(final IDoublePredicate predicate) {
        Validate.notNull(predicate);
        return new OfDoublePredicate(predicate);
    }

    /**
     * @description Returns a composed `Predicate` of the `ISObjectPredicate`.
     * @example
     * Predicate.upcast(someSObjectPredicate);
     * @param predicate the predicate
     * @return the composed `Predicate`
     * @throws NullPointerException if `predicate` is null
     */
    public static Predicate upcast(final ISObjectPredicate predicate) {
        Validate.notNull(predicate);
        return new OfSObjectPredicate(predicate);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins

    //<editor-fold desc="Comparison Predicates">
    /**
     * @description Returns a `Predicate` that tests if the result of comparing
     * the values returned by the applied `left` and `right` functions
     * by the `comparator` is equal to the expected `result`.
     * @example
     * Predicate.isCompared(
     *     func1,
     *     func2,
     *     Comparator.defaultOrder(),
     *     1
     * );
     * @param left the function applied to the input argument the result of which is passed to
     * the `comparator` as the first argument
     * @param right the function applied to the input argument the result of which is passed to
     * the `comparator` as the second argument
     * @param comparator the function that compares two arguments
     * @param result the expected result of comparison (1, -1, or 0)
     * @return the `Predicate`
     * @throws NullPointerException if the `left`, or the `right`,
     * or `comparator`, or `result` is null
     */
    public static Predicate isCompared(
            final IFunction left,
            final IFunction right,
            final IComparator comparator,
            final Integer result
    ) {
        Validate.notNull(left);
        Validate.notNull(right);
        Validate.notNull(comparator);
        Validate.notNull(result);
        return new ComparatorPredicate(left, right, comparator, result);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is greater than the result returned by the `right`
     * function.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     * @example
     * Predicate.isGreater(func1, func2);
     * Predicate.isGreater(func1, Function.constant(100));
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     * @return the `Predicate`
     * @throws NullPointerException if the `left`, or the `right` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static Predicate isGreater(final IFunction left, final IFunction right) {
        return isCompared(left, right, Comparator.defaultOrder(), 1);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is greater than
     * the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     * @example
     * Predicate.isGreater(100);
     * @param value the right argument of comparison
     * @return the `Predicate`
     * @see Comparator.compareNullSafeUntyped
     */
    public static Predicate isGreater(final Object value) {
        return isGreater(Function.identity(), Function.constant(value));
    }

    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is greater than or equal to the result returned by the `right`
     * function.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>=` "greater than or equal to " operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     * @example
     * Predicate.isGreaterOrEqual(func1, func2);
     * Predicate.isGreaterOrEqual(func1, Function.constant(100));
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     * @return the `Predicate`
     * @throws NullPointerException if the `left`, or the `right` is null
     * @see Comparator.compareNullSafeUntyped
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
     * @example
     * Predicate.isGreaterOrEqual(100);
     * @param value the right argument of comparison
     * @return the `Predicate`
     * @see Comparator.compareNullSafeUntyped
     */
    public static Predicate isGreaterOrEqual(final Object value) {
        return isGreater(value).orElse(isEqual(value));
    }

    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is less than the result returned by the `right`
     * function.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     * @example
     * Predicate.isLess(func1, func2);
     * Predicate.isLess(func1, Function.constant(100));
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     * @return the `Predicate`
     * @throws NullPointerException if the `left`, or the `right` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static Predicate isLess(final IFunction left, final IFunction right) {
        return isCompared(left, right, Comparator.defaultOrder(), -1);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is less than
     * the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     * @example
     * Predicate.isLess(100);
     * @param value the right argument of comparison
     * @return the `Predicate`
     * @see Comparator.compareNullSafeUntyped
     */
    public static Predicate isLess(final Object value) {
        return isLess(Function.identity(), Function.constant(value));
    }

    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is less than or equal to the result returned by the `right`
     * function.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     * @example
     * Predicate.isLessOrEqual(func1, func2);
     * Predicate.isLessOrEqual(func1, Function.constant(100));
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     * @return the `Predicate`
     * @throws NullPointerException if the `left`, or the `right` is null
     * @see Comparator.compareNullSafeUntyped
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
     * @example
     * Predicate.isLess(100);
     * @param value the right argument of comparison
     * @return the `Predicate`
     * @see Comparator.compareNullSafeUntyped
     */
    public static Predicate isLessOrEqual(final Object value) {
        return isLess(value).orElse(isEqual(value));
    }

    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is equal to the result returned by the `right`
     * function, comparing object value equality not reference equality.
     * @example
     * Predicate.isEqual(func1, func2);
     * Predicate.isEqual(func1, Function.constant(100));
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     * @return the `Predicate`
     * @throws NullPointerException if the `left`, or the `right` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static Predicate isEqual(final IFunction left, final IFunction right) {
        return isCompared(left, right, Comparator.defaultOrder(), 0);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is equal to
     * the `value`, comparing object value equality not reference equality.
     * @example
     * Predicate.isEqual(100);
     * @param value the right argument of comparison
     * @return the `Predicate`
     * @see Comparator.compareNullSafeUntyped
     */
    public static Predicate isEqual(final Object value) {
        return isEqual(Function.identity(), Function.constant(value));
    }

    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is not equal to the result returned by the `right`
     * function, comparing object value equality not reference equality.
     * @example
     * Predicate.isNotEqual(func1, func2);
     * Predicate.isNotEqual(func1, Function.constant(100));
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     * @return the `Predicate`
     * @throws NullPointerException if the `left`, or the `right` is null
     * @see Comparator.compareNullSafeUntyped
     */
    public static Predicate isNotEqual(final IFunction left, final IFunction right) {
        return isEqual(left, right).negate();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is not equal to
     * the `value`, comparing object value equality not reference equality.
     * @example
     * Predicate.isEqual(100);
     * @param value the right argument of comparison
     * @return the `Predicate`
     * @see Comparator.compareNullSafeUntyped
     */
    public static Predicate isNotEqual(final Object value) {
        return isEqual(value).negate();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `function` is contained in the `container`.
     * @example
     * Predicate.isIn(func, container);
     * @param function the function whose application result is tested
     * @param container the list that checks for the presence of an element
     * @return the `Predicate`
     * @throws NullPointerException if the `function`, or the `container` is null
     * @see List.contains
     */
    public static Predicate isIn(final IFunction function, final List<Object> container) {
        Validate.notNull(function);
        Validate.notNull(container);
        return new IsIn(function, container);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is contained in
     * the `container`.
     * @example
     * Predicate.isIn(container);
     * @param container the list that checks for the presence of an element
     * @return the `Predicate`
     * @throws NullPointerException if the `container` is null
     * @see List.contains
     */
    public static Predicate isIn(final List<Object> container) {
        return isIn(Function.identity(), container);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `function` is not contained in the `container`.
     * @example
     * Predicate.isNotIn(func, container);
     * @param function the function whose application result is tested
     * @param container the list that checks for the presence of an element
     * @return the `Predicate`
     * @throws NullPointerException if the `function`, or the `container` is null
     * @see List.contains
     */
    public static Predicate isNotIn(final IFunction function, final List<Object> container) {
        return isIn(function, container).negate();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is not contained in
     * the `container`.
     * @example
     * Predicate.isNotIn(container);
     * @param container the list that checks for the presence of an element
     * @return the `Predicate`
     * @throws NullPointerException if the `container` is null
     * @see List.contains
     */
    public static Predicate isNotIn(final List<Object> container) {
        return isIn(container).negate();
    }
    //</editor-fold>

    //<editor-fold desc="Object Predicates">
    /**
     * @description Returns a `Predicate` that tests the input object if it is null.
     * @example
     * Predicate.isNull();
     * @return the `Predicate`
     */
    public static Predicate isNull() {
        return isEqual(null);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is not null.
     * @example
     * Predicate.isNotNull();
     * @return the `Predicate`
     */
    public static Predicate isNotNull() {
        return isEqual(null).negate();
    }
    //</editor-fold>

    //<editor-fold desc="Type Predicates">
    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Boolean} type.
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfBool() {
        return new IsInstanceOfBoolean();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Id} type.
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfId() {
        return new IsInstanceOfId();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * String} type.
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfString() {
        return new IsInstanceOfString();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Blob} type.
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfBlob() {
        return new IsInstanceOfBlob();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Date} type.
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfDate() {
        return new IsInstanceOfDate();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Datetime} type.
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfDatetime() {
        return new IsInstanceOfDatetime();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Time} type.
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfTime() {
        return new IsInstanceOfTime();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Integer} type.
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfInt() {
        return new IsInstanceOfInt();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Long} type.
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfLong() {
        return new IsInstanceOfLong();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Double} type.
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfDouble() {
        return new IsInstanceOfDouble();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * SObject} type.
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfSObject() {
        return new IsInstanceOfSObject();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Comparable} type.
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfComparable() {
        return new IsInstanceOfComparable();
    }
    //</editor-fold>

    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AndPredicates extends Predicate {
        private final List<IPredicate> predicates;
        private AndPredicates(List<IPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Object o) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (!predicates[i].test(o)) { return false; }
            }
            return true;
        }
    }

    private class OrPredicates extends Predicate {
        private final List<IPredicate> predicates;
        private OrPredicates(List<IPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Object o) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (predicates[i].test(o)) { return true; }
            }
            return false;
        }
    }

    private class NegatePredicate extends Predicate {
        private final IPredicate predicate;
        private NegatePredicate(IPredicate predicate) { this.predicate = predicate; }
        public override Boolean test(Object o) { return !predicate.test(o); }
    }

    private class Always extends Predicate {
        private final Boolean value;
        private Always(Boolean value) { this.value = value; }
        public override Boolean test(Object o) { return value; }
    }

    private class OfFunctionPredicate extends Predicate {
        private final IFunction function;
        private final IPredicate predicate;
        private OfFunctionPredicate(IFunction function, IPredicate predicate) {
            this.function = function;
            this.predicate = predicate;
        }
        public override Boolean test(Object o) { return predicate.test(function.apply(o)); }
    }

    private class OfIntFunctionPredicate extends Predicate {
        private final IToIntFunction function;
        private final IIntPredicate predicate;
        private OfIntFunctionPredicate(IToIntFunction function, IIntPredicate predicate) {
            this.function = function;
            this.predicate = predicate;
        }
        public override Boolean test(Object o) { return predicate.test(function.apply(o)); }
    }

    private class OfLongFunctionPredicate extends Predicate {
        private final IToLongFunction function;
        private final ILongPredicate predicate;
        private OfLongFunctionPredicate(IToLongFunction function, ILongPredicate predicate) {
            this.function = function;
            this.predicate = predicate;
        }
        public override Boolean test(Object o) { return predicate.test(function.apply(o)); }
    }

    private class OfDoubleFunctionPredicate extends Predicate {
        private final IToDoubleFunction function;
        private final IDoublePredicate predicate;
        private OfDoubleFunctionPredicate(IToDoubleFunction function, IDoublePredicate predicate) {
            this.function = function;
            this.predicate = predicate;
        }
        public override Boolean test(Object o) { return predicate.test(function.apply(o)); }
    }

    private class OfSObjectFunctionPredicate extends Predicate {
        private final IToSObjectFunction function;
        private final ISObjectPredicate predicate;
        private OfSObjectFunctionPredicate(IToSObjectFunction function, ISObjectPredicate predicate) {
            this.function = function;
            this.predicate = predicate;
        }
        public override Boolean test(Object o) { return predicate.test(function.apply(o)); }
    }

    private class OfIntPredicate extends Predicate {
        private final IIntPredicate predicate;
        private OfIntPredicate(IIntPredicate predicate) { this.predicate = predicate; }
        public override Boolean test(Object o) { return predicate.test((Integer) o); }
    }

    private class OfLongPredicate extends Predicate {
        private final ILongPredicate predicate;
        private OfLongPredicate(ILongPredicate predicate) { this.predicate = predicate; }
        public override Boolean test(Object o) { return predicate.test((Long) o); }
    }

    private class OfDoublePredicate extends Predicate {
        private final IDoublePredicate predicate;
        private OfDoublePredicate(IDoublePredicate predicate) { this.predicate = predicate; }
        public override Boolean test(Object o) { return predicate.test((Double) o); }
    }

    private class OfSObjectPredicate extends Predicate {
        private final ISObjectPredicate predicate;
        private OfSObjectPredicate(ISObjectPredicate predicate) { this.predicate = predicate; }
        public override Boolean test(Object o) { return predicate.test((SObject) o); }
    }

    private class ComparatorPredicate extends Predicate {
        private final IFunction left;
        private final IFunction right;
        private final IComparator comparator;
        private final Integer comparisonResult;
        private ComparatorPredicate(
                IFunction left,
                IFunction right,
                IComparator comparator,
                Integer comparisonResult
        ) {
            this.left = left;
            this.right = right;
            this.comparator = comparator;
            this.comparisonResult = comparisonResult;
        }
        public override Boolean test(Object o) {
            return comparator.compare(left.apply(o), right.apply(o)) == comparisonResult;
        }
    }

    private class IsIn extends Predicate {
        private final IFunction function;
        private final Object container;
        private IsIn(IFunction function, Object container) {
            this.function = function;
            this.container = container;
        }
        public override Boolean test(Object o) {
            return ((List<Object>) container).contains(function.apply(o));
        }
    }

    private class IsInstanceOfBoolean extends Predicate {
        public override Boolean test(Object o) { return o instanceof Boolean; }
    }

    private class IsInstanceOfBlob extends Predicate {
        public override Boolean test(Object o) { return o instanceof Blob; }
    }

    private class IsInstanceOfId extends Predicate {
        public override Boolean test(Object o) { return o instanceof Id; }
    }

    private class IsInstanceOfString extends Predicate {
        public override Boolean test(Object o) { return o instanceof String; }
    }

    private class IsInstanceOfDate extends Predicate {
        public override Boolean test(Object o) { return o instanceof Date; }
    }

    private class IsInstanceOfDatetime extends Predicate {
        public override Boolean test(Object o) { return o instanceof Datetime; }
    }

    private class IsInstanceOfTime extends Predicate {
        public override Boolean test(Object o) { return o instanceof Time; }
    }

    private class IsInstanceOfInt extends Predicate {
        public override Boolean test(Object o) { return o instanceof Integer; }
    }

    private class IsInstanceOfLong extends Predicate {
        public override Boolean test(Object o) { return o instanceof Long; }
    }

    private class IsInstanceOfDouble extends Predicate {
        public override Boolean test(Object o) { return o instanceof Double; }
    }

    private class IsInstanceOfSObject extends Predicate {
        public override Boolean test(Object o) { return o instanceof SObject && !(o instanceof List<SObject>); }
    }

    private class IsInstanceOfComparable extends Predicate {
        public override Boolean test(Object o) { return o instanceof Comparable; }
    }
    // @end-group
    //</editor-fold>

}
