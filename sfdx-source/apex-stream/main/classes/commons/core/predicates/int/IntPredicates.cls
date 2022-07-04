/**
 * @description Provides common implementations of {@link IntPredicate}
 * and related utilities.
 *
 * @see IntPredicate
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class IntPredicates {

    @TestVisible
    private IntPredicates(){}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins

    //<editor-fold desc="Comparison Predicates">
    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is greater than
     * the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function
     * considers a non-null value as always greater than a null value.</p>
     *
     * @param value the right argument of comparison
     *
     * @return the `IntPredicate`
     *
     * @see Comparators.compareNullSafeInts
     *
     * @example
     * IntPredicates.isGreater(100);
     */
    public static IntPredicate isGreater(final Integer value) {
        return new ComparePredicate(value, 1);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is greater than
     * or equal to the `value`.
     * <p><strong>Note: </strong></p>
     * <<p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function
     * considers a non-null value as always greater than a null value.</p>
     *
     * @param value the right argument of comparison
     *
     * @return the `IntPredicate`
     *
     * @see Comparators.compareNullSafeInts
     *
     * @example
     * IntPredicates.isGreaterOrEqual(100);
     */
    public static IntPredicate isGreaterOrEqual(final Integer value) {
        return isGreater(value).orElse(isEqual(value));
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is less than
     * the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function
     * considers a non-null value as always greater than a null value.</p>
     *
     * @param value the right argument of comparison
     *
     * @return the `IntPredicate`
     *
     * @see Comparators.compareNullSafeInts
     *
     * @example
     * IntPredicates.isLess(100);
     */
    public static IntPredicate isLess(final Integer value) {
        return new ComparePredicate(value, -1);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is less than
     * or equal to the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function
     * considers a non-null value as always greater than a null value.</p>
     *
     * @param value the right argument of comparison
     *
     * @return the `IntPredicate`
     *
     * @see Comparators.compareNullSafeInts
     *
     * @example
     * IntPredicates.isLessOrEqual(100);
     */
    public static IntPredicate isLessOrEqual(final Integer value) {
        return isLess(value).orElse(isEqual(value));
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is equal to
     * the `value`.
     *
     * @param value the right argument of comparison
     *
     * @return the `IntPredicate`
     *
     * @see Comparators.compareNullSafeInts
     *
     * @example
     * IntPredicates.isEqual(100);
     */
    public static IntPredicate isEqual(final Integer value) {
        return new ComparePredicate(value, 0);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is not equal to
     * the `value`.
     *
     * @param value the right argument of comparison
     *
     * @return the `IntPredicate`
     *
     * @see Comparators.compareNullSafeInts
     *
     * @example
     * IntPredicates.isNotEqual(100);
     */
    public static IntPredicate isNotEqual(final Integer value) {
        return isEqual(value).negate();
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is contained in
     * the `container`.
     *
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `IntPredicate`
     *
     * @throws NullPointerException if the `container` is null
     *
     * @see List.contains
     *
     * @example
     * IntPredicates.isIn(new List<Integer>{ 1, 5, -7 });
     * IntPredicates.isIn((Iterable<Integer>) new Set<Integer>{ 1, 5, -7 });
     * IntPredicates.isIn(intStream);
     */
    public static IntPredicate isIn(final Iterable<Integer> container) {
        Validate.notNull(container);
        return new IsIn(container);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is not contained in
     * the `container`.
     *
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `IntPredicate`
     *
     * @throws NullPointerException if the `container` is null
     *
     * @see List.contains
     *
     * @example
     * IntPredicates.isNotIn(new List<Integer>{ 1, 5, -7 });
     * IntPredicates.isNotIn((Iterable<Integer>) new Set<Integer>{ 1, 5, -7 });
     * IntPredicates.isNotIn(intStream);
     */
    public static IntPredicate isNotIn(final Iterable<Integer> container) {
        return isIn(container).negate();
    }
    //</editor-fold>

    //<editor-fold desc="Integer Predicates">
    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is null.
     *
     * @return the `IntPredicate`
     *
     * @example
     * IntPredicates.isNull();
     */
    public static IntPredicate isNull() {
        return isEqual(null);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is not null.
     *
     * @return the `IntPredicate`
     *
     * @example
     * IntPredicates.isNotNull();
     */
    public static IntPredicate isNotNull() {
        return isEqual(null).negate();
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is even.
     *
     * @return the `IntPredicate`
     *
     * @example
     * IntPredicates.isEven();
     */
    public static IntPredicate isEven() {
        return new IsEven();
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is a factor of
     * `i`.
     *
     * @param i the tested value
     *
     * @return the `IntPredicate`
     *
     * @throws NullPointerException if the `i` is null
     *
     * @example
     * IntPredicates.isFactorOf(5);
     */
    public static IntPredicate isFactorOf(final Integer i) {
        Validate.notNull(i);
        return new IsFactor(i);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is odd.
     *
     * @return the `IntPredicate`
     *
     * @example
     * IntPredicates.isEven();
     */
    public static IntPredicate isOdd() {
        return new IsOdd();
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is prime.
     *
     * @return the `IntPredicate`
     *
     * @throws NullPointerException if the input argument is null
     *
     * @example
     * IntPredicates.isPrime();
     */
    public static IntPredicate isPrime() {
        return new IsPrimeInt();
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer has the `divisor`.
     *
     * @param divisor the tested value
     *
     * @return the `IntPredicate`
     *
     * @throws NullPointerException if the `divisor` is null
     *
     * @example
     * IntPredicate.hasDivisor(10);
     */
    public static IntPredicate hasDivisor(final Integer divisor) {
        Validate.notNull(divisor);
        return new HasDivisor(divisor);
    }
    //</editor-fold>

    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class ComparePredicate extends IntPredicate {
        private final Integer value;
        private final Integer comparisonResult;
        private ComparePredicate(Integer value, Integer comparisonResult) {
            this.value = value;
            this.comparisonResult = comparisonResult;
        }
        public override Boolean test(Integer i) {
            return Comparators.compareNullSafeInts(i, value) == comparisonResult;
        }
    }

    private class IsIn extends IntPredicate {
        private final Set<Integer> integers;
        public IsIn(Iterable<Integer> integers) { this.integers = Iterators.toIntSet(integers.iterator()); }
        public override Boolean test(Integer i) { return integers.contains(i); }
    }

    private class IsEven extends IntPredicate {
        public override Boolean test(Integer i) { return Math.mod(i, 2) == 0; }
    }

    private class HasDivisor extends IntPredicate {
        private final Integer value;
        public HasDivisor(Integer value) { this.value = value; }
        public override Boolean test(Integer i) { return Math.mod(i, value) == 0; }
    }

    private class IsFactor extends IntPredicate {
        private final Integer value;
        public IsFactor(Integer value) { this.value = value; }
        public override Boolean test(Integer i) { return Math.mod(value, i) == 0; }
    }

    private class IsOdd extends IntPredicate {
        public override Boolean test(Integer i) { return Math.mod(i, 2) != 0; }
    }

    private class IsPrimeInt extends IntPredicate {
        public override Boolean test(Integer i) {
            if (i == null) { throw new NullPointerException(); }
            if (i <= 1) { return false; }
            if (i == 2) { return true; }
            if (Math.mod(i, 2) == 0) { return false; }
            for (Integer j = 3, lim = (Integer) Math.sqrt(i); j <= lim; j += 2) {
                if (Math.mod(i, j) == 0) { return false; }
            }
            return true;
        }
    }
    // @end-group
    //</editor-fold>

}
