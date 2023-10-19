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
public virtual inherited sharing class BiPredicates {

    @TestVisible
    protected BiPredicates() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `BiPredicate` that tests if the result of comparing
     * the values returned by the applied `left` and `right` functions
     * applied to the first and the second input arguments respectively
     * by the `comparer` is equal to the expected `result`.
     *
     * @param left the function applied to the first input argument the result of which is passed to
     * the `comparer` as the first argument
     * @param right the function applied to the second input argument the result of which is passed to
     * the `comparer` as the second argument
     * @param comparer the function that compares two arguments
     * @param result the expected result of comparison (1, -1, or 0)
     *
     * @return the `BiPredicate`
     *
     * @throws NullPointerException if `left` or `right`,
     * or `comparer`, or `result` is null
     *
     * @example
     * BiPredicates.isCompared(func1, func2, Comparer.defaultOrder(), 1);
     */
    public static BiPredicate isCompared(
            final IFunction left,
            final IFunction right,
            final IComparer comparer,
            final Integer result
    ) {
        Validate.notNull(left);
        Validate.notNull(right);
        Validate.notNull(comparer);
        Validate.notNull(result);
        return new Compared(left, right, comparer, result);
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
     * the first input argument is equal to the second input argument.
     *
     * @return the `BiPredicate`
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * BiPredicates.areEqual();
     */
    public static BiPredicate areEqual() {
        return areEqual(Function.identity(), Function.identity());
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
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * BiPredicates.areEqual(func1, func2);
     * BiPredicates.areEqual(func1, Function.constant(100));
     */
    public static BiPredicate areEqual(final IFunction left, final IFunction right) {
        return isCompared(left, right, Comparer.defaultOrder(), 0);
    }

    /**
     * @description Returns a `BiPredicate` that tests the input sobjects if the value of
     * the first input argument is not equal to the second input argument.
     *
     * @return the `BiPredicate`
     *
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * BiPredicates.areNotEqual();
     */
    public static BiPredicate areNotEqual() {
        return areEqual().negate();
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
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * BiPredicates.areNotEqual(func1, func2);
     * BiPredicates.areNotEqual(func1, Function.constant(100));
     */
    public static BiPredicate areNotEqual(final IFunction left, final IFunction right) {
        return areEqual(left, right).negate();
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
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * BiPredicates.isGreater();
     */
    public static BiPredicate isGreater() {
        return isGreater(Function.identity(), Function.identity());
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
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * BiPredicates.isGreater(func1, func2);
     * BiPredicates.isGreater(func1, Function.constant(100));
     */
    public static BiPredicate isGreater(final IFunction left, final IFunction right) {
        return isCompared(left, right, Comparer.defaultOrder(), 1);
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
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * BiPredicates.isGreaterOrEqual();
     */
    public static BiPredicate isGreaterOrEqual() {
        return isGreaterOrEqual(Function.identity(), Function.identity());
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
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * BiPredicates.isGreaterOrEqual(func1, func2);
     */
    public static BiPredicate isGreaterOrEqual(final IFunction left, final IFunction right) {
        return isGreater(left, right).orElse(areEqual(left, right));
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
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * BiPredicates.isLess();
     */
    public static BiPredicate isLess() {
        return isLess(Function.identity(), Function.identity());
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
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * BiPredicates.isLess(func1, func2);
     */
    public static BiPredicate isLess(final IFunction left, final IFunction right) {
        return isCompared(left, right, Comparer.defaultOrder(), -1);
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
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * BiPredicates.isLessOrEqual();
     */
    public static BiPredicate isLessOrEqual() {
        return isLessOrEqual(Function.identity(), Function.identity());
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
     * @see Comparers.compareNullSafeUntyped
     *
     * @example
     * BiPredicates.isLessOrEqual(func1, func2);
     */
    public static BiPredicate isLessOrEqual(final IFunction left, final IFunction right) {
        return isLess(left, right).orElse(areEqual(left, right));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Compared extends BiPredicate {
        private final IFunction left;
        private final IFunction right;
        private final IComparer comparer;
        private final Integer comparisonResult;
        private Compared(
                IFunction left,
                IFunction right,
                IComparer comparer,
                Integer comparisonResult
        ) {
            this.left = left;
            this.right = right;
            this.comparer = comparer;
            this.comparisonResult = comparisonResult;
        }
        public override Boolean test(Object o1, Object o2) {
            return comparer.compare(left.apply(o1), right.apply(o2)) == comparisonResult;
        }
    }
    // @end-group
    //</editor-fold>

}
