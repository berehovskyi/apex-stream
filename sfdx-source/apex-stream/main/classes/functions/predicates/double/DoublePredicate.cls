/**
 * @description Inherits {@link IDoublePredicate} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 *
 * @see IDoubleIterable.filter
 * @see IDoubleIterable.take
 * @see IDoubleIterable.drop
 * @see IDoubleIterable.find
 * @see IDoubleIterable.some
 * @see IDoubleIterable.every
 * @see IDoubleIterable.none
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class DoublePredicate implements IDoublePredicate {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Boolean test(Double d);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `DoublePredicate` that applies short-circuiting logical
     * `OR` operator to `this` `IDoublePredicate` and `other`
     * in that order.
     *
     * @param other the other `IDoublePredicate`
     *
     * @return the composed `DoublePredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someDoublePredicate1.orElse(someDoublePredicate2);
     */
    public virtual DoublePredicate orElse(final IDoublePredicate other) {
        return some(new List<IDoublePredicate>{ this, other });
    }

    /**
     * @description Returns a composed `DoublePredicate` that applies short-circuiting logical
     * `AND` operator to `this` `IDoublePredicate` and `other`
     * in that order.
     *
     * @param other the other `IDoublePredicate`
     *
     * @return the composed `IDoublePredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someDoublePredicate1.andAlso(someDoublePredicate2);
     */
    public virtual DoublePredicate andAlso(final IDoublePredicate other) {
        return every(new List<IDoublePredicate>{ this, other });
    }

    /**
     * @description Returns a `DoublePredicate` that applies logical `NOT` operator
     * to `this` `IDoublePredicate`.
     *
     * @return the negated `DoublePredicate`
     *
     * @example
     * someDoublePredicate.negate();
     */
    public virtual DoublePredicate negate() {
        return negate(this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `DoublePredicate` that applies sequentially short-circuiting
     * logical `OR` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`IDoublePredicates`
     *
     * @return the composed `DoublePredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * DoublePredicate.some(someDoublePredicates);
     */
    public static DoublePredicate some(final List<IDoublePredicate> predicates) {
        Validate.noNullElements(predicates);
        return new OrPredicates(predicates);
    }

    /**
     * @description Returns a composed `DoublePredicate` that applies sequentially short-circuiting
     * logical `AND` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`IDoublePredicates`
     *
     * @return the composed `DoublePredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * DoublePredicate.every(someDoublePredicates);
     */
    public static DoublePredicate every(final List<IDoublePredicate> predicates) {
        Validate.noNullElements(predicates);
        return new AndPredicates(predicates);
    }

    /**
     * @description Returns a `DoublePredicate` that applies logical `NOT` operator
     * to `predicate`.
     *
     * @param predicate the `IDoublePredicate`
     *
     * @return the negated `DoublePredicate`
     *
     * @example
     * DoublePredicate.negate(someDoublePredicate);
     */
    public static DoublePredicate negate(final IDoublePredicate predicate) {
        Validate.notNull(predicate);
        return new NegatePredicate(predicate);
    }

    /**
     * @description Returns a `DoublePredicate` that always evaluates to the Boolean `value`
     * (`true` or `false`).
     *
     * @param value the evaluated value
     *
     * @return predicate the `DoublePredicate`
     *
     * @throws NullPointerException if `value` is null
     *
     * @example
     * DoublePredicate.always(true);
     */
    public static DoublePredicate always(final Boolean value) {
        Validate.notNull(value);
        return new Always(value);
    }
    // @end-group
    //</editor-fold>

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
     * @see Comparator.compareNullSafeDoubles
     *
     * @example
     * DoublePredicate.isGreater(100);
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
     * @see Comparator.compareNullSafeDoubles
     *
     * @example
     * DoublePredicate.isGreaterOrEqual(100);
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
     * @see Comparator.compareNullSafeDoubles
     *
     * @example
     * DoublePredicate.isLess(100);
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
     * @see Comparator.compareNullSafeDoubles
     *
     * @example
     * DoublePredicate.isLessOrEqual(100);
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
     * @see Comparator.compareNullSafeDoubles
     *
     * @example
     * DoublePredicate.isEqual(100);
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
     * @see Comparator.compareNullSafeDoubles
     *
     * @example
     * DoublePredicate.isNotEqual(100);
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
     * DoublePredicate.isIn(new List<Double>{ 1.5, 5.1, Math.PI });
     * DoublePredicate.isIn((Iterable<Double>) new Set<Double>{ 1.5, 5.1, Math.PI });
     * DoublePredicate.isIn(doubleStream);
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
     * DoublePredicate.isNotIn(new List<Double>{ 1.5, 5.1, Math.PI });
     * DoublePredicate.isNotIn((Iterable<Double>) new Set<Double>{ 1.5, 5.1, Math.PI });
     * DoublePredicate.isNotIn(doubleStream);
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
     * DoublePredicate.isNull();
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
     * DoublePredicate.isNotNull();
     */
    public static DoublePredicate isNotNull() {
        return isEqual(null).negate();
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is negative.
     *
     * @return the `DoublePredicate`
     *
     * @example
     * DoublePredicate.isNegative();
     */
    public static DoublePredicate isNegative() {
        return isLess(0);
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is negative or zero.
     *
     * @return the `DoublePredicate`
     *
     * @example
     * DoublePredicate.isNegativeOrZero();
     */
    public static DoublePredicate isNegativeOrZero() {
        return isLessOrEqual(0);
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is positive.
     *
     * @return the `DoublePredicate`
     *
     * @example
     * DoublePredicate.isPositive();
     */
    public static DoublePredicate isPositive() {
        return isGreater(0);
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is positive or zero.
     *
     * @return the `DoublePredicate`
     *
     * @example
     * DoublePredicate.isPositiveOrZero();
     */
    public static DoublePredicate isPositiveOrZero() {
        return isGreaterOrEqual(0);
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is prime.
     *
     * @return the `DoublePredicate`
     *
     * @throws NullPointerException if the input argument is null
     *
     * @example
     * DoublePredicate.isPrime();
     */
    public static DoublePredicate isZero() {
        return isEqual(0);
    }
    //</editor-fold>

    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AndPredicates extends DoublePredicate {
        private final List<IDoublePredicate> predicates;
        public AndPredicates(List<IDoublePredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Double d) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (!predicates[i].test(d)) { return false; }
            }
            return true;
        }
    }

    private class OrPredicates extends DoublePredicate {
        private final List<IDoublePredicate> predicates;
        public OrPredicates(List<IDoublePredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Double d) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (predicates[i].test(d)) { return true; }
            }
            return false;
        }
    }

    private class NegatePredicate extends DoublePredicate {
        private final IDoublePredicate predicate;
        public NegatePredicate(IDoublePredicate predicate) { this.predicate = predicate; }
        public override Boolean test(Double d) { return !predicate.test(d); }
    }

    private class Always extends DoublePredicate {
        private final Boolean value;
        private Always(Boolean value) { this.value = value; }
        public override Boolean test(Double d) { return value; }
    }

    private class ComparePredicate extends DoublePredicate {
        private final Double value;
        private final Double comparisonResult;
        private ComparePredicate(Double value, Integer comparisonResult) {
            this.value = value;
            this.comparisonResult = comparisonResult;
        }
        public override Boolean test(Double d) {
            return Comparator.compareNullSafeDoubles(d, value) == comparisonResult;
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
