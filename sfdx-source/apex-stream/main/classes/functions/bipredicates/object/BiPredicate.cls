/**
 * @description Inherits {@link IBiPredicate} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class BiPredicate implements IBiPredicate {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Boolean test(Object o1, Object o2);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `BiPredicate` that applies short-circuiting logical
     * `OR` operator to `this` `IBiPredicate` and `other`
     * in that order.
     *
     * @param other the other `IBiPredicate`
     *
     * @return the composed `BiPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someBiPredicate1.orElse(someBiPredicate2);
     */
    public virtual BiPredicate orElse(final IBiPredicate other) {
        return some(new List<IBiPredicate>{ this, other });
    }

    /**
     * @description Returns a composed `BiPredicate` that applies short-circuiting logical
     * `AND` operator to `this` `IPredicate` and `other`
     * in that order.
     *
     * @param other the other `IBiPredicate`
     *
     * @return the composed `BiPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someBiPredicate1.andAlso(someBiPredicate2);
     */
    public virtual BiPredicate andAlso(final IBiPredicate other) {
        return every(new List<IBiPredicate>{ this, other });
    }

    /**
     * @description Returns a `BiPredicate` that applies logical `NOT` operator
     * to `this` `IBiPredicate`.
     *
     * @return the negated `BiPredicate`
     *
     * @example
     * someBiPredicate.negate();
     */
    public virtual BiPredicate negate() {
        return new Negate(this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `BiPredicate` that applies sequentially short-circuiting
     * logical `OR` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`IBiPredicate`
     *
     * @return the composed `BiPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * BiPredicate.some(someBiPredicates);
     */
    public static BiPredicate some(final List<IBiPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new Some(predicates);
    }

    /**
     * @description Returns a composed `BiPredicate` that applies sequentially short-circuiting
     * logical `AND` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`IBiPredicate`
     *
     * @return the composed `BiPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * BiPredicate.every(someBiPredicates);
     */
    public static BiPredicate every(final List<IBiPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new Every(predicates);
    }

    /**
     * @description Returns a `BiPredicate` that applies logical `NOT` operator
     * to `predicate`.
     *
     * @param predicate the `IBiPredicate`
     *
     * @return the negated `BiPredicate`
     *
     * @example
     * BiPredicate.negate(someBiPredicate);
     */
    public static BiPredicate negate(final IBiPredicate predicate) {
        Validate.notNull(predicate);
        return new Negate(predicate);
    }

    /**
     * @description Returns a composed `BiPredicate` that applies short-circuiting logical
     * `OR` operator to `predicate1` `IPredicate` and `predicate2`
     * in that order applied to the first and the second input arguments respectively.
     *
     * @param left the predicate applied to the first input argument
     * @param right the predicate applied to the second input argument
     *
     * @return the composed `BiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @example
     * BiPredicate.somePredicate(somePredicate1, somePredicate2);
     */
    public static BiPredicate somePredicate(final IPredicate left, final IPredicate right) {
        Validate.notNull(left);
        Validate.notNull(right);
        return new SomePredicate(left, right);
    }

    /**
     * @description Returns a composed `BiPredicate` that applies short-circuiting logical
     * `AND` operator to `predicate1` `IPredicate` and `predicate2`
     * in that order applied to the first and the second input arguments respectively.
     *
     * @param left the predicate applied to the first input argument
     * @param right the predicate applied to the second input argument
     *
     * @return the composed `BiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @example
     * BiPredicate.everyPredicate(somePredicate1, somePredicate2);
     */
    public static BiPredicate everyPredicate(final IPredicate left, final IPredicate right) {
        Validate.notNull(left);
        Validate.notNull(right);
        return new EveryPredicate(left, right);
    }

    /**
     * @description Returns a `BiPredicate` that always evaluates to the Boolean `value`
     * (`true` or `false`).
     *
     * @param value the evaluated value
     *
     * @return predicate the `BiPredicate`
     *
     * @throws NullPointerException if `value` is null
     *
     * @example
     * BiPredicate.always(true);
     */
    public static BiPredicate always(final Boolean value) {
        Validate.notNull(value);
        return new Always(value);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `BiPredicate` that tests if the result of comparing
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
     * @return the `BiPredicate`
     *
     * @throws NullPointerException if `left` or `right`,
     * or `comparator`, or `result` is null
     *
     * @example
     * BiPredicate.isCompared(func1, func2, Comparator.defaultOrder(), 1);
     */
    public static BiPredicate isCompared(
            final IFunction left,
            final IFunction right,
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
     * @description Returns a `BiPredicate` that tests the input sobjects if the result returned by
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
     * @return the `BiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * BiPredicate.isGreater(func1, func2);
     * BiPredicate.isGreater(func1, Function.constant(100));
     */
    public static BiPredicate isGreater(final IFunction left, final IFunction right) {
        return isCompared(left, right, Comparator.defaultOrder(), 1);
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
     * the first input argument is greater than the second input argument.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @return the `BiPredicate`
     *
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * BiPredicate.isGreater();
     */
    public static BiPredicate isGreater() {
        return isGreater(Function.identity(), Function.identity());
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the result returned by
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
     * @return the `BiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * BiPredicate.isGreaterOrEqual(func1, func2);
     */
    public static BiPredicate isGreaterOrEqual(final IFunction left, final IFunction right) {
        return isGreater(left, right).orElse(areEqual(left, right));
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
     * the first input argument is greater than or equal to the second input argument.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @return the `BiPredicate`
     *
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * BiPredicate.isGreaterOrEqual();
     */
    public static BiPredicate isGreaterOrEqual() {
        return isGreaterOrEqual(Function.identity(), Function.identity());
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the result returned by
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
     * @return the `BiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * BiPredicate.isLess(func1, func2);
     */
    public static BiPredicate isLess(final IFunction left, final IFunction right) {
        return isCompared(left, right, Comparator.defaultOrder(), -1);
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
     * the first input argument is less than the second input argument.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @return the `BiPredicate`
     *
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * BiPredicate.isLess();
     */
    public static BiPredicate isLess() {
        return isLess(Function.identity(), Function.identity());
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the result returned by
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
     * @return the `BiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * BiPredicate.isLessOrEqual(func1, func2);
     */
    public static BiPredicate isLessOrEqual(final IFunction left, final IFunction right) {
        return isLess(left, right).orElse(areEqual(left, right));
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
     * the first input argument is less than or equal to the second input argument.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value.</p>
     *
     * @return the `BiPredicate`
     *
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * BiPredicate.isLessOrEqual();
     */
    public static BiPredicate isLessOrEqual() {
        return isLessOrEqual(Function.identity(), Function.identity());
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the result returned by
     * the `left` function applied to the first input argument is equal to the result
     * returned by the `right` function applied to the second input argument, comparing object value
     * equality not reference equality.
     *
     * @param left the function applied to the first input argument, whose application result is considered
     * as the left argument of comparison
     * @param right the function applied to the second input argument, whose application result is considered
     * as the right argument of comparison
     *
     * @return the `BiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * BiPredicate.areEqual(func1, func2);
     * BiPredicate.areEqual(func1, Function.constant(100));
     */
    public static BiPredicate areEqual(final IFunction left, final IFunction right) {
        return isCompared(left, right, Comparator.defaultOrder(), 0);
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
     * the first input argument is equal to the second input argument.
     *
     * @return the `BiPredicate`
     *
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * BiPredicate.areEqual();
     */
    public static BiPredicate areEqual() {
        return areEqual(Function.identity(), Function.identity());
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the result returned by
     * the `left` function applied to the first input argument is not equal to the result
     * returned by the `right` function applied to the second input argument, comparing object value
     * equality not reference equality.
     *
     * @param left the function applied to the first input argument, whose application result is considered
     * as the left argument of comparison
     * @param right the function applied to the second input argument, whose application result is considered
     * as the right argument of comparison
     *
     * @return the `BiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * BiPredicate.areNotEqual(func1, func2);
     * BiPredicate.areNotEqual(func1, Function.constant(100));
     */
    public static BiPredicate areNotEqual(final IFunction left, final IFunction right) {
        return areEqual(left, right).negate();
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
     * the first input argument is not equal to the second input argument.
     *
     * @return the `BiPredicate`
     *
     * @see Comparator.compareNullSafeUntyped
     *
     * @example
     * BiPredicate.areNotEqual();
     */
    public static BiPredicate areNotEqual() {
        return areEqual().negate();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Some extends BiPredicate {
        private final List<IBiPredicate> predicates;
        public Some(List<IBiPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Object o1, Object o2) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (predicates[i].test(o1, o2)) { return true; }
            }
            return false;
        }
    }

    private class SomePredicate extends BiPredicate {
        private final IPredicate left;
        private final IPredicate right;
        public SomePredicate(IPredicate left, IPredicate right) {
            this.left = left;
            this.right = right;
        }
        public override Boolean test(Object o1, Object o2) {
            return left.test(o1) || right.test(o2);
        }
    }

    private class Every extends BiPredicate {
        private final List<IBiPredicate> predicates;
        public Every(List<IBiPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Object o1, Object o2) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (!predicates[i].test(o1, o2)) { return false; }
            }
            return true;
        }
    }

    private class EveryPredicate extends BiPredicate {
        private final IPredicate left;
        private final IPredicate right;
        public EveryPredicate(IPredicate left, IPredicate right) {
            this.left = left;
            this.right = right;
        }
        public override Boolean test(Object o1, Object o2) {
            return left.test(o1) && right.test(o2);
        }
    }

    private class Negate extends BiPredicate {
        private final IBiPredicate predicate;
        public Negate(IBiPredicate predicate) { this.predicate = predicate; }
        public override Boolean test(Object o1, Object o2) { return !predicate.test(o1, o2); }
    }

    private class Always extends BiPredicate {
        private final Boolean value;
        private Always(Boolean value) { this.value = value; }
        public override Boolean test(Object o1, Object o2) { return value; }
    }

    private class Compared extends BiPredicate {
        private final IFunction left;
        private final IFunction right;
        private final IComparator comparator;
        private final Integer comparisonResult;
        private Compared(
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
        public override Boolean test(Object o1, Object o2) {
            return comparator.compare(left.apply(o1), right.apply(o2)) == comparisonResult;
        }
    }
    // @end-group
    //</editor-fold>

}
