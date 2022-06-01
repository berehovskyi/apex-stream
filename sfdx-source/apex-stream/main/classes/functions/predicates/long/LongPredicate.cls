/**
 * @description Inherits {@link ILongPredicate} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 *
 * @see ILongIterable.filter
 * @see ILongIterable.take
 * @see ILongIterable.drop
 * @see ILongIterable.find
 * @see ILongIterable.some
 * @see ILongIterable.every
 * @see ILongIterable.none
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
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
     *
     * @param other the other `ILongPredicate`
     *
     * @return the composed `LongPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someLongPredicate1.orElse(someLongPredicate2);
     */
    public virtual LongPredicate orElse(final ILongPredicate other) {
        return some(new List<ILongPredicate>{ this, other });
    }

    /**
     * @description Returns a composed `LongPredicate` that applies short-circuiting logical
     * `AND` operator to `this` `ILongPredicate` and `other`
     * in that order.
     *
     * @param other the other `ILongPredicate`
     *
     * @return the composed `LongPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someLongPredicate1.andAlso(someLongPredicate2);
     */
    public virtual LongPredicate andAlso(final ILongPredicate other) {
        return every(new List<ILongPredicate>{ this, other });
    }

    /**
     * @description Returns a `LongPredicate` that applies logical `NOT` operator
     * to `this` `ILongPredicate`.
     *
     * @return the negated `LongPredicate`
     *
     * @example
     * someLongPredicate.negate();
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
     *
     * @param predicates the list of`ILongPredicate`
     *
     * @return the composed `LongPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * LongPredicate.some(someLongPredicates);
     */
    public static LongPredicate some(final List<ILongPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new OrPredicates(predicates);
    }

    /**
     * @description Returns a composed `LongPredicate` that applies sequentially short-circuiting
     * logical `AND` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`ILongPredicates`
     *
     * @return the composed `LongPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * LongPredicate.every(someLongPredicates);
     */
    public static LongPredicate every(final List<ILongPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new AndPredicates(predicates);
    }

    /**
     * @description Returns a `LongPredicate` that applies logical `NOT` operator
     * to `predicate`.
     *
     * @param predicate the `ILongPredicate`
     *
     * @return the negated `LongPredicate`
     *
     * @example
     * LongPredicate.negate(someLongPredicate);
     */
    public static LongPredicate negate(final ILongPredicate predicate) {
        Validate.notNull(predicate);
        return new NegatePredicate(predicate);
    }

    /**
     * @description Returns a `LongPredicate` that always evaluates to the Boolean `value`
     * (`true` or `false`).
     *
     * @param value the evaluated value
     *
     * @return predicate the `LongPredicate`
     *
     * @throws NullPointerException if `value` is null
     *
     * @example
     * LongPredicate.always(true);
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
     *
     * @param value the right argument of comparison
     *
     * @return the `LongPredicate`
     *
     * @see Comparator.compareNullSafeLongs
     *
     * @example
     * LongPredicate.isGreater(100);
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
     *
     * @param value the right argument of comparison
     *
     * @return the `LongPredicate`
     *
     * @see Comparator.compareNullSafeLongs
     *
     * @example
     * LongPredicate.isGreaterOrEqual(100);
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
     *
     * @param value the right argument of comparison
     *
     * @return the `LongPredicate`
     *
     * @see Comparator.compareNullSafeLongs
     *
     * @example
     * LongPredicate.isLess(100);
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
     *
     * @param value the right argument of comparison
     *
     * @return the `LongPredicate`
     *
     * @see Comparator.compareNullSafeLongs
     *
     * @example
     * LongPredicate.isLessOrEqual(100);
     */
    public static LongPredicate isLessOrEqual(final Long value) {
        return isLess(value).orElse(isEqual(value));
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is equal to
     * the `value`.
     *
     * @param value the right argument of comparison
     *
     * @return the `LongPredicate`
     *
     * @see Comparator.compareNullSafeLongs
     *
     * @example
     * LongPredicate.isEqual(100);
     */
    public static LongPredicate isEqual(final Long value) {
        return new ComparePredicate(value, 0);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is not equal to
     * the `value`.
     *
     * @param value the right argument of comparison
     *
     * @return the `LongPredicate`
     *
     * @see Comparator.compareNullSafeLongs
     *
     * @example
     * LongPredicate.isNotEqual(100);
     */
    public static LongPredicate isNotEqual(final Long value) {
        return isEqual(value).negate();
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is contained in
     * the `container`.
     *
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `LongPredicate`
     *
     * @throws NullPointerException if the `container` is null
     *
     * @see List.contains
     *
     * @example
     * LongPredicate.isIn(new List<Long>{ 1, 5, -7 });
     * LongPredicate.isIn((Iterable<Long>) new Set<Long>{ 1, 5, -7 });
     * LongPredicate.isIn(longStream);
     */
    public static LongPredicate isIn(final Iterable<Long> container) {
        Validate.notNull(container);
        return new IsIn(container);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is not contained in
     * the `container`.
     *
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `LongPredicate`
     *
     * @throws NullPointerException if the `container` is null
     *
     * @see List.contains
     *
     * @example
     * LongPredicate.isNotIn(new List<Long>{ 1, 5, -7 });
     * LongPredicate.isNotIn((Iterable<Long>) new Set<Long>{ 1, 5, -7 });
     * LongPredicate.isNotIn(longStream);
     */
    public static LongPredicate isNotIn(final Iterable<Long> container) {
        return isIn(container).negate();
    }
    //</editor-fold>

    //<editor-fold desc="Long Predicates">
    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is null.
     *
     * @return the `LongPredicate`
     *
     * @example
     * LongPredicate.isNull();
     */
    public static LongPredicate isNull() {
        return isEqual(null);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is not null.
     *
     * @return the `LongPredicate`
     *
     * @example
     * LongPredicate.isNotNull();
     */
    public static LongPredicate isNotNull() {
        return isEqual(null).negate();
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is even.
     *
     * @return the `LongPredicate`
     *
     * @example
     * LongPredicate.isEven();
     */
    public static LongPredicate isEven() {
        return new IsEven();
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is a factor of
     * `i`.
     *
     * @param i 
     *
     * @return the `LongPredicate`
     *
     * @throws NullPointerException if the `i` is null
     *
     * @example
     * LongPredicate.isFactorOf(5);
     */
    public static LongPredicate isFactorOf(final Long i) {
        return new IsFactor(i);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is negative.
     *
     * @return the `LongPredicate`
     *
     * @example
     * LongPredicate.isNegative();
     */
    public static LongPredicate isNegative() {
        return isLess(0);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is negative or zero.
     *
     * @return the `LongPredicate`
     *
     * @example
     * LongPredicate.isNegativeOrZero();
     */
    public static LongPredicate isNegativeOrZero() {
        return isLessOrEqual(0);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is odd.
     *
     * @return the `LongPredicate`
     *
     * @example
     * LongPredicate.isEven();
     */
    public static LongPredicate isOdd() {
        return new IsOdd();
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is positive.
     *
     * @return the `LongPredicate`
     *
     * @example
     * LongPredicate.isPositive();
     */
    public static LongPredicate isPositive() {
        return isGreater(0);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is positive or zero.
     *
     * @return the `LongPredicate`
     *
     * @example
     * LongPredicate.isPositiveOrZero();
     */
    public static LongPredicate isPositiveOrZero() {
        return isGreaterOrEqual(0);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is prime.
     *
     * @return the `LongPredicate`
     *
     * @throws NullPointerException if the input argument is null
     *
     * @example
     * LongPredicate.isPrime();
     */
    public static LongPredicate isPrime() {
        return new IsPrime();
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is zero.
     *
     * @return the `LongPredicate`
     *
     * @example
     * LongPredicate.isZero();
     */
    public static LongPredicate isZero() {
        return isEqual(0);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long has the `divisor`.
     *
     * @param divisor 
     *
     * @return the `LongPredicate`
     *
     * @throws NullPointerException if the `divisor` is null
     *
     * @example
     * LongPredicate.hasDivisor(10);
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
        private final Set<Long> longs;
        public IsIn(Iterable<Long> longs) { this.longs = Iterators.toLongSet(longs.iterator()); }
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
