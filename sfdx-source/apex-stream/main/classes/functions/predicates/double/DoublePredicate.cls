/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link IDoublePredicate} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see IDoubleIterable.filter
 * @see IDoubleIterable.take
 * @see IDoubleIterable.drop
 * @see IDoubleIterable.find
 * @see IDoubleIterable.some
 * @see IDoubleIterable.every
 * @see IDoubleIterable.none
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
     * @example
     * someDoublePredicate1.orElse(someDoublePredicate2);
     * @param other the other `IDoublePredicate`
     * @return the composed `DoublePredicate`
     * @throws NullPointerException if `other` is null
     */
    public virtual DoublePredicate orElse(final IDoublePredicate other) {
        return some(this, other);
    }

    /**
     * @description Returns a composed `DoublePredicate` that applies short-circuiting logical
     * `AND` operator to `this` `IDoublePredicate` and `other`
     * in that order.
     * @example
     * someDoublePredicate1.andAlso(someDoublePredicate2);
     * @param other the other `IDoublePredicate`
     * @return the composed `IDoublePredicate`
     * @throws NullPointerException if `other` is null
     */
    public virtual DoublePredicate andAlso(final IDoublePredicate other) {
        return every(this, other);
    }

    /**
     * @description Returns a `DoublePredicate` that applies logical `NOT` operator
     * to `this` `IDoublePredicate`.
     * @example
     * someDoublePredicate.negate();
     * @return the negated `DoublePredicate`
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
     * @example
     * DoublePredicate.some(someDoublePredicates);
     * @param predicates the list of`IDoublePredicates`
     * @return the composed `DoublePredicate`
     * @throws NullPointerException if `other` is null or some of the list element is null
     */
    public static DoublePredicate some(final List<IDoublePredicate> predicates) {
        Validate.noNullElements(predicates);
        return new OrPredicates(predicates);
    }

    /**
     * @description Returns a composed `DoublePredicate` that applies short-circuiting logical
     * `OR` operator to `predicate1` `IDoublePredicate` and `predicate2`
     * in that order.
     * @example
     * DoublePredicate.some(someDoublePredicate1, someDoublePredicate2);
     * @param predicate1 the first `IDoublePredicate`
     * @param predicate2 the second `IDoublePredicate`
     * @return the composed `DoublePredicate`
     * @throws NullPointerException if `predicate1` or `predicate2` is null
     */
    public static DoublePredicate some(final IDoublePredicate predicate1, final IDoublePredicate predicate2) {
        return some(new List<IDoublePredicate>{ predicate1, predicate2 });
    }

    /**
     * @description Returns a composed `DoublePredicate` that applies sequentially short-circuiting
     * logical `AND` operator to `predicates` in the same order as the order of the input list.
     * @example
     * DoublePredicate.every(someDoublePredicates);
     * @param predicates the list of`IDoublePredicates`
     * @return the composed `DoublePredicate`
     * @throws NullPointerException if `other` is null or some of the list element is null
     */
    public static DoublePredicate every(final List<IDoublePredicate> predicates) {
        Validate.noNullElements(predicates);
        return new AndPredicates(predicates);
    }

    /**
     * @description Returns a composed `DoublePredicate` that applies short-circuiting logical
     * `AND` operator to `predicate1` `IDoublePredicate` and `predicate2`
     * in that order.
     * @example
     * DoublePredicate.every(someDoublePredicate1, someDoublePredicate2);
     * @param predicate1 the first `IDoublePredicate`
     * @param predicate2 the second `IDoublePredicate`
     * @return the composed `DoublePredicate`
     * @throws NullPointerException if `predicate1` or `predicate2` is null
     */
    public static DoublePredicate every(final IDoublePredicate predicate1, final IDoublePredicate predicate2) {
        return every(new List<IDoublePredicate>{ predicate1, predicate2 });
    }

    /**
     * @description Returns a `DoublePredicate` that applies logical `NOT` operator
     * to `predicate`.
     * @example
     * DoublePredicate.negate(someDoublePredicate);
     * @param predicate the `IDoublePredicate`
     * @return the negated `DoublePredicate`
     */
    public static DoublePredicate negate(final IDoublePredicate predicate) {
        Validate.notNull(predicate);
        return new NegatePredicate(predicate);
    }

    /**
     * @description Returns a `DoublePredicate` that always evaluates to the Boolean `value`
     * (`true` or `false`).
     * @example
     * DoublePredicate.always(true);
     * @param value the evaluated value
     * @return predicate the `DoublePredicate`
     * @throws NullPointerException if `value` is null
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
     * @example
     * DoublePredicate.isGreater(100);
     * @param value the right argument of comparison
     * @return the `DoublePredicate`
     * @see Comparator.compareNullSafeDoubles
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
     * @example
     * DoublePredicate.isGreaterOrEqual(100);
     * @param value the right argument of comparison
     * @return the `DoublePredicate`
     * @see Comparator.compareNullSafeDoubles
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
     * @example
     * DoublePredicate.isLess(100);
     * @param value the right argument of comparison
     * @return the `DoublePredicate`
     * @see Comparator.compareNullSafeDoubles
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
     * @example
     * DoublePredicate.isLessOrEqual(100);
     * @param value the right argument of comparison
     * @return the `DoublePredicate`
     * @see Comparator.compareNullSafeDoubles
     */
    public static DoublePredicate isLessOrEqual(final Double value) {
        return isLess(value).orElse(isEqual(value));
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is equal to
     * the `value`.
     * @example
     * DoublePredicate.isEqual(100);
     * @param value the right argument of comparison
     * @return the `DoublePredicate`
     * @see Comparator.compareNullSafeDoubles
     */
    public static DoublePredicate isEqual(final Double value) {
        return new ComparePredicate(value, 0);
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is not equal to
     * the `value`.
     * @example
     * DoublePredicate.isNotEqual(100);
     * @param value the right argument of comparison
     * @return the `DoublePredicate`
     * @see Comparator.compareNullSafeDoubles
     */
    public static DoublePredicate isNotEqual(final Double value) {
        return isEqual(value).negate();
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is contained in
     * the `container`.
     * @example
     * DoublePredicate.isIn(container);
     * @param container the list that checks for the presence of an element
     * @return the `DoublePredicate`
     * @throws NullPointerException if the `container` is null
     * @see List.contains
     */
    public static DoublePredicate isIn(final List<Double> container) {
        return new IsIn(container);
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is not contained in
     * the `container`.
     * @example
     * DoublePredicate.isNotIn(container);
     * @param container the list that checks for the presence of an element
     * @return the `DoublePredicate`
     * @throws NullPointerException if the `container` is null
     * @see List.contains
     */
    public static DoublePredicate isNotIn(final List<Double> container) {
        return isIn(container).negate();
    }
    //</editor-fold>

    //<editor-fold desc="Double Predicates">
    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is null.
     * @example
     * DoublePredicate.isNull();
     * @return the `DoublePredicate`
     */
    public static DoublePredicate isNull() {
        return isEqual(null);
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is not null.
     * @example
     * DoublePredicate.isNotNull();
     * @return the `DoublePredicate`
     */
    public static DoublePredicate isNotNull() {
        return isEqual(null).negate();
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is negative.
     * @example
     * DoublePredicate.isNegative();
     * @return the `DoublePredicate`
     */
    public static DoublePredicate isNegative() {
        return isLess(0);
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is negative or zero.
     * @example
     * DoublePredicate.isNegativeOrZero();
     * @return the `DoublePredicate`
     */
    public static DoublePredicate isNegativeOrZero() {
        return isLessOrEqual(0);
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is positive.
     * @example
     * DoublePredicate.isPositive();
     * @return the `DoublePredicate`
     */
    public static DoublePredicate isPositive() {
        return isGreater(0);
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is positive or zero.
     * @example
     * DoublePredicate.isPositiveOrZero();
     * @return the `DoublePredicate`
     */
    public static DoublePredicate isPositiveOrZero() {
        return isGreaterOrEqual(0);
    }

    /**
     * @description Returns a `DoublePredicate` that tests the input Double if it is prime.
     * @example
     * DoublePredicate.isPrime();
     * @return the `DoublePredicate`
     * @throws NullPointerException if the input argument is null
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
        private final List<Double> doubles;
        public IsIn(List<Double> doubles) { this.doubles = doubles; }
        public override Boolean test(Double d) { return doubles.contains(d); }
    }
    // @end-group
    //</editor-fold>

}
