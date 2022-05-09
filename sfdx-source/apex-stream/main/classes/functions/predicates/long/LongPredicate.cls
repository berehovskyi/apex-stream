/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link ILongPredicate} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see ILongIterable.filter
 * @see ILongIterable.take
 * @see ILongIterable.drop
 * @see ILongIterable.find
 * @see ILongIterable.some
 * @see ILongIterable.every
 * @see ILongIterable.none
 */
public abstract inherited sharing class LongPredicate implements ILongPredicate {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Boolean test(Long l);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `LongPredicate` that applies short-circuiting logical
     * `OR` operator to `this` `ILongPredicate` and `other`
     * in that order.
     * @example
     * someLongPredicate1.orElse(someLongPredicate2);
     * @param other the other `ILongPredicate`
     * @return the composed `LongPredicate`
     * @throws NullPointerException if `other` is null
     */
    public virtual LongPredicate orElse(final ILongPredicate other) {
        return some(this, other);
    }

    /**
     * @description Returns a composed `LongPredicate` that applies short-circuiting logical
     * `AND` operator to `this` `ILongPredicate` and `other`
     * in that order.
     * @example
     * someLongPredicate1.andAlso(someLongPredicate2);
     * @param other the other `ILongPredicate`
     * @return the composed `LongPredicate`
     * @throws NullPointerException if `other` is null
     */
    public virtual LongPredicate andAlso(final ILongPredicate other) {
        return every(this, other);
    }

    /**
     * @description Returns a `LongPredicate` that applies logical `NOT` operator
     * to `this` `ILongPredicate`.
     * @example
     * someLongPredicate.negate();
     * @return the negated `LongPredicate`
     */
    public virtual LongPredicate negate() {
        return negate(this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `LongPredicate` that applies sequentially short-circuiting
     * logical `OR` operator to `predicates` in the same order as the order of the input list.
     * @example
     * LongPredicate.some(someLongPredicates);
     * @param predicates the list of`ILongPredicate`
     * @return the composed `LongPredicate`
     * @throws NullPointerException if `other` is null or some of the list element is null
     */
    public static LongPredicate some(final List<ILongPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new OrPredicates(predicates);
    }

    /**
     * @description Returns a composed `LongPredicate` that applies short-circuiting logical
     * `OR` operator to `predicate1` `ILongPredicate` and `predicate2`
     * in that order.
     * @example
     * LongPredicate.some(someLongPredicate1, someLongPredicate2);
     * @param predicate1 the first `ILongPredicate`
     * @param predicate2 the second `ILongPredicate`
     * @return the composed `LongPredicate`
     * @throws NullPointerException if `predicate1` or `predicate2` is null
     */
    public static LongPredicate some(final ILongPredicate predicate1, final ILongPredicate predicate2) {
        return some(new List<ILongPredicate>{ predicate1, predicate2 });
    }

    /**
     * @description Returns a composed `LongPredicate` that applies sequentially short-circuiting
     * logical `AND` operator to `predicates` in the same order as the order of the input list.
     * @example
     * LongPredicate.every(someLongPredicates);
     * @param predicates the list of`ILongPredicates`
     * @return the composed `LongPredicate`
     * @throws NullPointerException if `other` is null or some of the list element is null
     */
    public static LongPredicate every(final List<ILongPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new AndPredicates(predicates);
    }

    /**
     * @description Returns a composed `LongPredicate` that applies short-circuiting logical
     * `AND` operator to `predicate1` `ILongPredicate` and `predicate2`
     * in that order.
     * @example
     * LongPredicate.every(someLongPredicate1, someLongPredicate2);
     * @param predicate1 the first `ILongPredicate`
     * @param predicate2 the second `ILongPredicate`
     * @return the composed `LongPredicate`
     * @throws NullPointerException if `predicate1` or `predicate2` is null
     */
    public static LongPredicate every(final ILongPredicate predicate1, final ILongPredicate predicate2) {
        return every(new List<ILongPredicate>{ predicate1, predicate2 });
    }

    /**
     * @description Returns a `LongPredicate` that applies logical `NOT` operator
     * to `predicate`.
     * @example
     * LongPredicate.negate(someLongPredicate);
     * @param predicate the `ILongPredicate`
     * @return the negated `LongPredicate`
     */
    public static LongPredicate negate(final ILongPredicate predicate) {
        Validate.notNull(predicate);
        return new NegatePredicate(predicate);
    }

    /**
     * @description Returns a `LongPredicate` that always evaluates to the Boolean `value`
     * (`true` or `false`).
     * @example
     * LongPredicate.always(true);
     * @param value the evaluated value
     * @return predicate the `LongPredicate`
     * @throws NullPointerException if `value` is null
     */
    public static LongPredicate always(final Boolean value) {
        Validate.notNull(value);
        return new Always(value);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins

    //<editor-fold desc="Comparison Predicates">
    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is greater than
     * the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function
     * considers a non-null value as always greater than a null value.</p>
     * @example
     * LongPredicate.isGreater(100);
     * @param value the right argument of comparison
     * @return the `LongPredicate`
     * @see Comparator.compareNullSafeLongs
     */
    public static LongPredicate isGreater(final Long value) {
        return new ComparePredicate(value, 1);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is greater than
     * or equal to the `value`.
     * <p><strong>Note: </strong></p>
     * <<p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function
     * considers a non-null value as always greater than a null value.</p>
     * @example
     * LongPredicate.isGreaterOrEqual(100);
     * @param value the right argument of comparison
     * @return the `LongPredicate`
     * @see Comparator.compareNullSafeLongs
     */
    public static LongPredicate isGreaterOrEqual(final Long value) {
        return isGreater(value).orElse(isEqual(value));
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is less than
     * the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function
     * considers a non-null value as always greater than a null value.</p>
     * @example
     * LongPredicate.isLess(100);
     * @param value the right argument of comparison
     * @return the `LongPredicate`
     * @see Comparator.compareNullSafeLongs
     */
    public static LongPredicate isLess(final Long value) {
        return new ComparePredicate(value, -1);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is less than
     * or equal to the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function
     * considers a non-null value as always greater than a null value.</p>
     * @example
     * LongPredicate.isLessOrEqual(100);
     * @param value the right argument of comparison
     * @return the `LongPredicate`
     * @see Comparator.compareNullSafeLongs
     */
    public static LongPredicate isLessOrEqual(final Long value) {
        return isLess(value).orElse(isEqual(value));
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is equal to
     * the `value`.
     * @example
     * LongPredicate.isEqual(100);
     * @param value the right argument of comparison
     * @return the `LongPredicate`
     * @see Comparator.compareNullSafeLongs
     */
    public static LongPredicate isEqual(final Long value) {
        return new ComparePredicate(value, 0);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is not equal to
     * the `value`.
     * @example
     * LongPredicate.isNotEqual(100);
     * @param value the right argument of comparison
     * @return the `LongPredicate`
     * @see Comparator.compareNullSafeLongs
     */
    public static LongPredicate isNotEqual(final Long value) {
        return isEqual(value).negate();
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is contained in
     * the `container`.
     * @example
     * LongPredicate.isIn(container);
     * @param container the list that checks for the presence of an element
     * @return the `LongPredicate`
     * @throws NullPointerException if the `container` is null
     * @see List.contains
     */
    public static LongPredicate isIn(final List<Long> container) {
        Validate.notNull(container);
        return new IsIn(container);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is not contained in
     * the `container`.
     * @example
     * LongPredicate.isNotIn(container);
     * @param container the list that checks for the presence of an element
     * @return the `LongPredicate`
     * @throws NullPointerException if the `container` is null
     * @see List.contains
     */
    public static LongPredicate isNotIn(final List<Long> container) {
        return isIn(container).negate();
    }
    //</editor-fold>

    //<editor-fold desc="Long Predicates">
    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is null.
     * @example
     * LongPredicate.isNull();
     * @return the `LongPredicate`
     */
    public static LongPredicate isNull() {
        return isEqual(null);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is not null.
     * @example
     * LongPredicate.isNotNull();
     * @return the `LongPredicate`
     */
    public static LongPredicate isNotNull() {
        return isEqual(null).negate();
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is even.
     * @example
     * LongPredicate.isEven();
     * @return the `LongPredicate`
     */
    public static LongPredicate isEven() {
        return new IsEven();
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is a factor of
     * `i`.
     * @example
     * LongPredicate.isFactorOf(5);
     * @return the `LongPredicate`
     * @throws NullPointerException if the `i` is null
     */
    public static LongPredicate isFactorOf(final Long i) {
        return new IsFactor(i);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is negative.
     * @example
     * LongPredicate.isNegative();
     * @return the `LongPredicate`
     */
    public static LongPredicate isNegative() {
        return isLess(0);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is negative or zero.
     * @example
     * LongPredicate.isNegativeOrZero();
     * @return the `LongPredicate`
     */
    public static LongPredicate isNegativeOrZero() {
        return isLessOrEqual(0);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is odd.
     * @example
     * LongPredicate.isEven();
     * @return the `LongPredicate`
     */
    public static LongPredicate isOdd() {
        return new IsOdd();
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is positive.
     * @example
     * LongPredicate.isPositive();
     * @return the `LongPredicate`
     */
    public static LongPredicate isPositive() {
        return isGreater(0);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is positive or zero.
     * @example
     * LongPredicate.isPositiveOrZero();
     * @return the `LongPredicate`
     */
    public static LongPredicate isPositiveOrZero() {
        return isGreaterOrEqual(0);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is prime.
     * @example
     * LongPredicate.isPrime();
     * @return the `LongPredicate`
     * @throws NullPointerException if the input argument is null
     */
    public static LongPredicate isPrime() {
        return new IsPrime();
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is zero.
     * @example
     * LongPredicate.isZero();
     * @return the `LongPredicate`
     */
    public static LongPredicate isZero() {
        return isEqual(0);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long has the `divisor`.
     * @example
     * LongPredicate.hasDivisor(10);
     * @return the `LongPredicate`
     * @throws NullPointerException if the `divisor` is null
     */
    public static LongPredicate hasDivisor(final Long divisor) {
        return new HasDivisor(divisor);
    }
    //</editor-fold>

    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AndPredicates extends LongPredicate {
        private final List<ILongPredicate> predicates;
        public AndPredicates(List<ILongPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Long l) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (!predicates[i].test(l)) { return false; }
            }
            return true;
        }
    }

    private class OrPredicates extends LongPredicate {
        private final List<ILongPredicate> predicates;
        public OrPredicates(List<ILongPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Long l) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (predicates[i].test(l)) { return true; }
            }
            return false;
        }
    }

    private class NegatePredicate extends LongPredicate {
        private final ILongPredicate predicate;
        public NegatePredicate(ILongPredicate predicate) { this.predicate = predicate; }
        public override Boolean test(Long l) { return !predicate.test(l); }
    }

    private class Always extends LongPredicate {
        private final Boolean value;
        private Always(Boolean value) { this.value = value; }
        public override Boolean test(Long l) { return value; }
    }

    private class ComparePredicate extends LongPredicate {
        private final Long value;
        private final Integer comparisonResult;
        private ComparePredicate(Long value, Integer comparisonResult) {
            this.value = value;
            this.comparisonResult = comparisonResult;
        }
        public override Boolean test(Long l) {
            return Comparator.compareNullSafeLongs(l, value) == comparisonResult;
        }
    }

    private class IsIn extends LongPredicate {
        private final List<Long> longs;
        public IsIn(List<Long> longs) { this.longs = longs; }
        public override Boolean test(Long l) { return longs.contains(l); }
    }

    private class IsEven extends LongPredicate {
        public override Boolean test(Long l) { return Math.mod(l, 2) == 0; }
    }

    private class HasDivisor extends LongPredicate {
        private final Long value;
        public HasDivisor(Long value) { this.value = value; }
        public override Boolean test(Long l) { return Math.mod(l, value) == 0; }
    }

    private class IsFactor extends LongPredicate {
        private final Long value;
        public IsFactor(Long value) { this.value = value; }
        public override Boolean test(Long l) { return Math.mod(value, l) == 0; }
    }

    private class IsOdd extends LongPredicate {
        public override Boolean test(Long l) { return Math.mod(l, 2) != 0; }
    }

    private class IsPrime extends LongPredicate {
        public override Boolean test(Long l) {
            if (l == null) { throw new IllegalArgumentException(); }
            if (l <= 1) { return false; }
            if (l == 2) { return true; }
            if (Math.mod(l, 2) == 0) { return false; }
            Long lim = (Long) Math.sqrt(l);
            for (Long j = 3; j <= lim; j += 2) {
                if (Math.mod(l, j) == 0) { return false; }
            }
            return true;
        }
    }
    // @end-group
    //</editor-fold>
}
