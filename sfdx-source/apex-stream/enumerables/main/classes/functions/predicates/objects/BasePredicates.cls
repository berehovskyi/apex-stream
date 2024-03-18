/**
 * @description Provides base implementations of {@link Predicate}
 * and related utilities that are used by {@link IEnumerable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class BasePredicates {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected BasePredicates() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Predicate` that tests if the result of comparing
     * the values returned by the applied `left` and `right` functions
     * by the `comparer` is equal to the expected `result`.
     *
     * @param left the function applied to the input argument the result of which is passed to
     * the `comparer` as the first argument
     * @param right the function applied to the input argument the result of which is passed to
     * the `comparer` as the second argument
     * @param comparer the function that compares two arguments
     * @param result the expected result of comparison (1, -1, or 0)
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `left` or  `right`,
     * or `comparer`, or `result` is null
     *
     * @example
     * BasePredicates.isCompared(
     *     func1,
     *     func2,
     *     Comparer.defaultOrder(),
     *     1
     * );
     */
    public static Predicate isCompared(
        final IFunction left,
        final IFunction right,
        final IComparer comparer,
        final Integer result
    ) {
        return new ComparerPredicate(left, right, comparer, result);
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
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * BasePredicates.isEqual(func1, func2);
     * BasePredicates.isEqual(func1, Function.constant(100));
     */
    public static Predicate isEqual(final IFunction left, final IFunction right) {
        return isCompared(left, right, Comparer.defaultOrder(), 0);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is equal to
     * the `value`, comparing object value equality not reference equality.
     *
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * BasePredicates.isEqual(100).test(100); // true
     * BasePredicates.isEqual(100).test(50); // false
     */
    public static Predicate isEqual(final Object value) {
        return isEqual(Function.identity(), Function.constant(value));
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
     * @throws NullPointerException if `function` or `container` is null
     *
     * @see List.contains
     *
     * @example
     * BasePredicates.isIn(getNameFunc, new List<Object>{ 'John', 'Jim' });
     * BasePredicates.isIn(getNameFunc, new Set<String>{ 'John', 'Jim' });
     * BasePredicates.isIn(getNameFunc, nameEnumerable);
     */
    public static Predicate isIn(final IFunction function, final Iterable<Object> container) {
        return new IsInPredicate(function, container);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is contained in
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
     * BasePredicates.isIn(new List<Object>{ 'John', 'Jim' });
     * BasePredicates.isIn(new Set<String>{ 'John', 'Jim' });
     * BasePredicates.isIn(nameEnumerable);
     */
    public static Predicate isIn(final Iterable<Object> container) {
        return isIn(Function.identity(), container);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is not null.
     *
     * @return the `Predicate`
     *
     * @example
     * BasePredicates.isNull().test(null); // true;
     * BasePredicates.isNull().test(1); // false;
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
     * BasePredicates.isNotNull().test(null); // false
     * BasePredicates.isNotNull().test(1); // true
     */
    public static Predicate isNotNull() {
        return isNull().negate();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    private class ComparerPredicate extends Predicate {
        private final IFunction left;
        private final IFunction right;
        private final IComparer comparer;
        private final Integer comparisonResult;
        private ComparerPredicate(
            IFunction left,
            IFunction right,
            IComparer comparer,
            Integer comparisonResult
        ) {
            Validate.notNull(left);
            Validate.notNull(right);
            Validate.notNull(comparer);
            Validate.notNull(comparisonResult);
            this.left = left;
            this.right = right;
            this.comparer = comparer;
            this.comparisonResult = comparisonResult;
        }
        public override Boolean test(Object obj) {
            return comparer.compare(left.apply(obj), right.apply(obj)) == comparisonResult;
        }
    }

    private class IsInPredicate extends Predicate {
        private final IFunction function;
        private final Set<Object> container;
        private IsInPredicate(IFunction function, Iterable<Object> container) {
            Validate.notNull(function);
            Validate.notNull(container);
            this.function = function;
            this.container = toSet(container);
        }
        public override Boolean test(Object o) { return container.contains(function.apply(o)); }
        private Set<Object> toSet(Iterable<Object> container) {
            Iterator<Object> iterator = container.iterator();
            Validate.notNull(iterator);
            final Set<Object> objects = new Set<Object>();
            while (iterator.hasNext()) {
                objects.add(iterator.next());
            }
            return objects;
        }
    }
    //</editor-fold>

}
