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
public inherited sharing class Predicates {

    @TestVisible
    private Predicates(){}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins

    //<editor-fold desc="Comparison Predicates">
    /**
     * @description Returns a `Predicate` that tests if the result of comparing
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
     * @return the `Predicate`
     *
     * @throws NullPointerException if the `left`, or the `right`,
     * or `comparator`, or `result` is null
     *
     * @example
     * Predicates.isCompared(
     *     func1,
     *     func2,
     *     Comparator.defaultOrder(),
     *     1
     * );
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
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if the `left`, or the `right` is null
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * Predicates.isGreater(func1, func2);
     * Predicates.isGreater(func1, Function.constant(100));
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
     *
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * Predicates.isGreater(100);
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
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if the `left`, or the `right` is null
     *
     * @see Comparators.compareNullSafeUntyped
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
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * Predicates.isGreaterOrEqual(100);
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
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if the `left`, or the `right` is null
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * Predicates.isLess(func1, func2);
     * Predicates.isLess(func1, Function.constant(100));
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
     *
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * Predicates.isLess(100);
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
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if the `left`, or the `right` is null
     *
     * @see Comparators.compareNullSafeUntyped
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
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * Predicates.isLess(100);
     */
    public static Predicate isLessOrEqual(final Object value) {
        return isLess(value).orElse(isEqual(value));
    }

    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is equal to the result returned by the `right`
     * function, comparing object value equality not reference equality.
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if the `left`, or the `right` is null
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * Predicates.isEqual(func1, func2);
     * Predicates.isEqual(func1, Function.constant(100));
     */
    public static Predicate isEqual(final IFunction left, final IFunction right) {
        return isCompared(left, right, Comparator.defaultOrder(), 0);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is equal to
     * the `value`, comparing object value equality not reference equality.
     *
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * Predicates.isEqual(100);
     */
    public static Predicate isEqual(final Object value) {
        return isEqual(Function.identity(), Function.constant(value));
    }

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
     * @throws NullPointerException if the `left`, or the `right` is null
     *
     * @see Comparators.compareNullSafeUntyped
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
     * @see Comparators.compareNullSafeUntyped
     *
     * @example
     * Predicates.isEqual(100);
     */
    public static Predicate isNotEqual(final Object value) {
        return isEqual(value).negate();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `function` is contained in the `container`.
     *
     * @param function the function whose application result is tested
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if the `function`, or the `container` is null
     *
     * @see List.contains
     *
     * @example
     * Predicates.isIn(getNameFunc, new List<Object>{ 'John', 'Jim' });
     * Predicates.isIn(getNameFunc, (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
     * Predicates.isIn(getNameFunc, nameStream);
     */
    public static Predicate isIn(final IFunction function, final Iterable<Object> container) {
        Validate.notNull(function);
        Validate.notNull(container);
        return new IsIn(function, container);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is contained in
     * the `container`.
     *
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if the `container` is null
     *
     * @see List.contains
     *
     * @example
     * Predicates.isIn(new List<Object>{ 'John', 'Jim' });
     * Predicates.isIn((Iterable<Object>) new Set<String>{ 'John', 'Jim' });
     * Predicates.isIn(nameStream);
     */
    public static Predicate isIn(final Iterable<Object> container) {
        return isIn(Function.identity(), container);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `function` is not contained in the `container`.
     *
     * @param function the function whose application result is tested
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if the `function`, or the `container` is null
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
     * @throws NullPointerException if the `container` is null
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
    //</editor-fold>

    //<editor-fold desc="Object Predicates">
    /**
     * @description Returns a `Predicate` that tests the input object if it is null.
     *
     * @return the `Predicate`
     *
     * @example
     * Predicates.isNull();
     */
    public static Predicate isNull() {
        return isEqual(null);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is not null.
     *
     * @return the `Predicate`
     *
     * @example
     * Predicates.isNotNull();
     */
    public static Predicate isNotNull() {
        return isEqual(null).negate();
    }
    //</editor-fold>

    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
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
        private final Set<Object> container;
        private IsIn(IFunction function, Iterable<Object> container) {
            this.function = function;
            this.container = Iterators.toObjectSet(container.iterator());
        }
        public override Boolean test(Object o) { return container.contains(function.apply(o)); }
    }
    // @end-group
    //</editor-fold>

}
