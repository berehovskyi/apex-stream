/**
 * @description Provides common implementations of {@link LongPredicate}
 * and related utilities.
 *
 * @see LongPredicate
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class LongPredicates {

    @TestVisible
    private LongPredicates() {}

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
     * @see Comparators.compareNullSafeLongs
     *
     * @example
     * LongPredicates.isGreater(100);
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
     * @see Comparators.compareNullSafeLongs
     *
     * @example
     * LongPredicates.isGreaterOrEqual(100);
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
     * @see Comparators.compareNullSafeLongs
     *
     * @example
     * LongPredicates.isLess(100);
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
     * @see Comparators.compareNullSafeLongs
     *
     * @example
     * LongPredicates.isLessOrEqual(100);
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
     * @see Comparators.compareNullSafeLongs
     *
     * @example
     * LongPredicates.isEqual(100);
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
     * @see Comparators.compareNullSafeLongs
     *
     * @example
     * LongPredicates.isNotEqual(100);
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
     * @throws NullPointerException if `container` is null
     *
     * @see List.contains
     *
     * @example
     * LongPredicates.isIn(new List<Long>{ 1, 5, -7 });
     * LongPredicates.isIn((Iterable<Long>) new Set<Long>{ 1, 5, -7 });
     * LongPredicates.isIn(longStream);
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
     * @throws NullPointerException if `container` is null
     *
     * @see List.contains
     *
     * @example
     * LongPredicates.isNotIn(new List<Long>{ 1, 5, -7 });
     * LongPredicates.isNotIn((Iterable<Long>) new Set<Long>{ 1, 5, -7 });
     * LongPredicates.isNotIn(longStream);
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
     * LongPredicates.isNull();
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
     * LongPredicates.isNotNull();
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
     * LongPredicates.isEven();
     */
    public static LongPredicate isEven() {
        return new IsEven();
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is a factor of
     * `l`.
     *
     * @param l number
     *
     * @return the `LongPredicate`
     *
     * @throws NullPointerException if `l` is null
     *
     * @example
     * LongPredicates.isFactorOf(5);
     */
    public static LongPredicate isFactorOf(final Long l) {
        return new IsFactor(l);
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is odd.
     *
     * @return the `LongPredicate`
     *
     * @example
     * LongPredicates.isEven();
     */
    public static LongPredicate isOdd() {
        return new IsOdd();
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long if it is prime.
     *
     * @return the `LongPredicate`
     *
     * @throws NullPointerException if the input argument is null
     *
     * @example
     * LongPredicates.isPrime();
     */
    public static LongPredicate isPrime() {
        return new IsPrime();
    }

    /**
     * @description Returns a `LongPredicate` that tests the input Long has the `divisor`.
     *
     * @param divisor divisor
     *
     * @return the `LongPredicate`
     *
     * @throws NullPointerException if `divisor` is null
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
    private class ComparePredicate extends LongPredicate {
        private final Long value;
        private final Integer comparisonResult;
        private ComparePredicate(Long value, Integer comparisonResult) {
            this.value = value;
            this.comparisonResult = comparisonResult;
        }
        public override Boolean test(Long l) {
            return Comparators.compareNullSafeLongs(l, value) == comparisonResult;
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
