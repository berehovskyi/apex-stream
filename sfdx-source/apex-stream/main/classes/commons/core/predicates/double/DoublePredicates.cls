/**
 * @description Provides common implementations of {@link DoublePredicate}
 * and related utilities.
 *
 * @see DoublePredicate
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class DoublePredicates {

    @TestVisible
    private DoublePredicates(){}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins

    //<editor-fold desc="Comparison Predicates">
    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is greater than
     * the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function
     * considers a non-null value as always greater than a null value.</p>
     *
     * @param value the right argument of comparison
     *
     * @return the `DoublePredicate`
     *
     * @see Comparators.compareNullSafeDoubles
     *
     * @example
     * DoublePredicates.isGreater(100);
     */
    public static DoublePredicate isGreater(final Double value) {
        return new ComparePredicate(value, 1);
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is greater than
     * or equal to the `value`.
     * <p><strong>Note: </strong></p>
     * <<p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function
     * considers a non-null value as always greater than a null value.</p>
     *
     * @param value the right argument of comparison
     *
     * @return the `DoublePredicate`
     *
     * @see Comparators.compareNullSafeDoubles
     *
     * @example
     * DoublePredicates.isGreaterOrEqual(100);
     */
    public static DoublePredicate isGreaterOrEqual(final Double value) {
        return isGreater(value).orElse(isEqual(value));
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is less than
     * the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function
     * considers a non-null value as always greater than a null value.</p>
     *
     * @param value the right argument of comparison
     *
     * @return the `DoublePredicate`
     *
     * @see Comparators.compareNullSafeDoubles
     *
     * @example
     * DoublePredicates.isLess(100);
     */
    public static DoublePredicate isLess(final Double value) {
        return new ComparePredicate(value, -1);
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is less than
     * or equal to the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function
     * considers a non-null value as always greater than a null value.</p>
     *
     * @param value the right argument of comparison
     *
     * @return the `DoublePredicate`
     *
     * @see Comparators.compareNullSafeDoubles
     *
     * @example
     * DoublePredicates.isLessOrEqual(100);
     */
    public static DoublePredicate isLessOrEqual(final Double value) {
        return isLess(value).orElse(isEqual(value));
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is equal to
     * the `value`.
     *
     * @param value the right argument of comparison
     *
     * @return the `DoublePredicate`
     *
     * @see Comparators.compareNullSafeDoubles
     *
     * @example
     * DoublePredicates.isEqual(100);
     */
    public static DoublePredicate isEqual(final Double value) {
        return new ComparePredicate(value, 0);
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is not equal to
     * the `value`.
     *
     * @param value the right argument of comparison
     *
     * @return the `DoublePredicate`
     *
     * @see Comparators.compareNullSafeDoubles
     *
     * @example
     * DoublePredicates.isNotEqual(100);
     */
    public static DoublePredicate isNotEqual(final Double value) {
        return isEqual(value).negate();
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is contained in
     * the `container`.
     *
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `DoublePredicate`
     *
     * @throws NullPointerException if the `container` is null
     *
     * @see List.contains
     *
     * @example
     * DoublePredicates.isIn(new List<Double>{ 1.5, 5.1, Math.PI });
     * DoublePredicates.isIn((Iterable<Double>) new Set<Double>{ 1.5, 5.1, Math.PI });
     * DoublePredicates.isIn(doubleStream);
     */
    public static DoublePredicate isIn(final Iterable<Double> container) {
        return new IsIn(container);
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is not contained in
     * the `container`.
     *
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `DoublePredicate`
     *
     * @throws NullPointerException if the `container` is null
     *
     * @see List.contains
     *
     * @example
     * DoublePredicates.isNotIn(new List<Double>{ 1.5, 5.1, Math.PI });
     * DoublePredicates.isNotIn((Iterable<Double>) new Set<Double>{ 1.5, 5.1, Math.PI });
     * DoublePredicates.isNotIn(doubleStream);
     */
    public static DoublePredicate isNotIn(final Iterable<Double> container) {
        return isIn(container).negate();
    }
    //</editor-fold>

    //<editor-fold desc="Double Predicates">
    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is null.
     *
     * @return the `DoublePredicate`
     *
     * @example
     * DoublePredicates.isNull();
     */
    public static DoublePredicate isNull() {
        return isEqual(null);
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is not null.
     *
     * @return the `DoublePredicate`
     *
     * @example
     * DoublePredicates.isNotNull();
     */
    public static DoublePredicate isNotNull() {
        return isEqual(null).negate();
    }
    //</editor-fold>

    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class ComparePredicate extends DoublePredicate {
        private final Double value;
        private final Double comparisonResult;
        private ComparePredicate(Double value, Integer comparisonResult) {
            this.value = value;
            this.comparisonResult = comparisonResult;
        }
        public override Boolean test(Double d) {
            return Comparators.compareNullSafeDoubles(d, value) == comparisonResult;
        }
    }

    private class IsIn extends DoublePredicate {
        private final Set<Double> doubles;
        public IsIn(Iterable<Double> doubles) { this.doubles = Iterators.toDoubleSet(doubles.iterator()); }
        public override Boolean test(Double d) { return doubles.contains(d); }
    }
    // @end-group
    //</editor-fold>

}
