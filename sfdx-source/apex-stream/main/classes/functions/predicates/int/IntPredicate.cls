/**
 * @description Inherits {@link IIntPredicate} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 *
 * @see IIntIterable.filter
 * @see IIntIterable.take
 * @see IIntIterable.drop
 * @see IIntIterable.find
 * @see IIntIterable.some
 * @see IIntIterable.every
 * @see IIntIterable.none
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class IntPredicate implements IIntPredicate {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Boolean test(Integer i);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `IntPredicate` that applies short-circuiting logical
     * `OR` operator to `this` `IIntPredicate` and `other`
     * in that order.
     *
     * @param other the other `IIntPredicate`
     *
     * @return the composed `IntPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someIntPredicate1.orElse(someIntPredicate2);
     */
    public virtual IntPredicate orElse(final IIntPredicate other) {
        return some(new List<IIntPredicate>{ this, other });
    }

    /**
     * @description Returns a composed `IntPredicate` that applies short-circuiting logical
     * `AND` operator to `this` `IIntPredicate` and `other`
     * in that order.
     *
     * @param other the other `IIntPredicate`
     *
     * @return the composed `IIntPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someIntPredicate1.andAlso(someIntPredicate2);
     */
    public virtual IntPredicate andAlso(final IIntPredicate other) {
        return every(new List<IIntPredicate>{ this, other });
    }

    /**
     * @description Returns a `IntPredicate` that applies logical `NOT` operator
     * to `this` `IIntPredicate`.
     *
     * @return the negated `IntPredicate`
     *
     * @example
     * someIntPredicate.negate();
     */
    public virtual IntPredicate negate() {
        return negate(this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `IntPredicate` that applies sequentially short-circuiting
     * logical `OR` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`IIntPredicates`
     *
     * @return the composed `IntPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * IntPredicate.some(someIntPredicates);
     */
    public static IntPredicate some(final List<IIntPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new OrPredicates(predicates);
    }

    /**
     * @description Returns a composed `IntPredicate` that applies sequentially short-circuiting
     * logical `AND` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`IIntPredicates`
     *
     * @return the composed `IntPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * IntPredicate.every(someIntPredicates);
     */
    public static IntPredicate every(final List<IIntPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new AndPredicates(predicates);
    }

    /**
     * @description Returns a `IntPredicate` that applies logical `NOT` operator
     * to `predicate`.
     *
     * @param predicate the `IIntPredicate`
     *
     * @return the negated `IntPredicate`
     *
     * @example
     * IntPredicate.negate(someIntPredicate);
     */
    public static IntPredicate negate(final IIntPredicate predicate) {
        Validate.notNull(predicate);
        return new NegatePredicate(predicate);
    }

    /**
     * @description Returns a `IntPredicate` that always evaluates to the Boolean `value`
     * (`true` or `false`).
     *
     * @param value the evaluated value
     *
     * @return predicate the `IntPredicate`
     *
     * @throws NullPointerException if `value` is null
     *
     * @example
     * IntPredicate.always(true);
     */
    public static IntPredicate always(final Boolean value) {
        Validate.notNull(value);
        return new Always(value);
    }
    // @end-group
    //</editor-fold>

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
     * @see Comparator.compareNullSafeInts
     *
     * @example
     * IntPredicate.isGreater(100);
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
     * @see Comparator.compareNullSafeInts
     *
     * @example
     * IntPredicate.isGreaterOrEqual(100);
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
     * @see Comparator.compareNullSafeInts
     *
     * @example
     * IntPredicate.isLess(100);
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
     * @see Comparator.compareNullSafeInts
     *
     * @example
     * IntPredicate.isLessOrEqual(100);
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
     * @see Comparator.compareNullSafeInts
     *
     * @example
     * IntPredicate.isEqual(100);
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
     * @see Comparator.compareNullSafeInts
     *
     * @example
     * IntPredicate.isNotEqual(100);
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
     * IntPredicate.isIn(new List<Integer>{ 1, 5, -7 });
     * IntPredicate.isIn((Iterable<Integer>) new Set<Integer>{ 1, 5, -7 });
     * IntPredicate.isIn(intStream);
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
     * IntPredicate.isNotIn(new List<Integer>{ 1, 5, -7 });
     * IntPredicate.isNotIn((Iterable<Integer>) new Set<Integer>{ 1, 5, -7 });
     * IntPredicate.isNotIn(intStream);
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
     * IntPredicate.isNull();
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
     * IntPredicate.isNotNull();
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
     * IntPredicate.isEven();
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
     * IntPredicate.isFactorOf(5);
     */
    public static IntPredicate isFactorOf(final Integer i) {
        Validate.notNull(i);
        return new IsFactor(i);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is negative.
     *
     * @return the `IntPredicate`
     *
     * @example
     * IntPredicate.isNegative();
     */
    public static IntPredicate isNegative() {
        return isLess(0);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is negative or zero.
     *
     * @return the `IntPredicate`
     *
     * @example
     * IntPredicate.isNegativeOrZero();
     */
    public static IntPredicate isNegativeOrZero() {
        return isLessOrEqual(0);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is odd.
     *
     * @return the `IntPredicate`
     *
     * @example
     * IntPredicate.isEven();
     */
    public static IntPredicate isOdd() {
        return new IsOdd();
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is positive.
     *
     * @return the `IntPredicate`
     *
     * @example
     * IntPredicate.isPositive();
     */
    public static IntPredicate isPositive() {
        return isGreater(0);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is positive or zero.
     *
     * @return the `IntPredicate`
     *
     * @example
     * IntPredicate.isPositiveOrZero();
     */
    public static IntPredicate isPositiveOrZero() {
        return isGreaterOrEqual(0);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is prime.
     *
     * @return the `IntPredicate`
     *
     * @throws NullPointerException if the input argument is null
     *
     * @example
     * IntPredicate.isPrime();
     */
    public static IntPredicate isPrime() {
        return new IsPrime();
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is zero.
     *
     * @return the `IntPredicate`
     *
     * @example
     * IntPredicate.isZero();
     */
    public static IntPredicate isZero() {
        return isEqual(0);
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
    private class AndPredicates extends IntPredicate {
        private final List<IIntPredicate> predicates;
        public AndPredicates(List<IIntPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Integer j) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (!predicates[i].test(j)) { return false; }
            }
            return true;
        }
    }

    private class OrPredicates extends IntPredicate {
        private final List<IIntPredicate> predicates;
        public OrPredicates(List<IIntPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Integer j) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (predicates[i].test(j)) { return true; }
            }
            return false;
        }
    }

    private class NegatePredicate extends IntPredicate {
        private final IIntPredicate predicate;
        public NegatePredicate(IIntPredicate predicate) { this.predicate = predicate; }
        public override Boolean test(Integer i) { return !predicate.test(i); }
    }

    private class Always extends IntPredicate {
        private final Boolean value;
        private Always(Boolean value) { this.value = value; }
        public override Boolean test(Integer i) { return value; }
    }

    private class ComparePredicate extends IntPredicate {
        private final Integer value;
        private final Integer comparisonResult;
        private ComparePredicate(Integer value, Integer comparisonResult) {
            this.value = value;
            this.comparisonResult = comparisonResult;
        }
        public override Boolean test(Integer i) {
            return Comparator.compareNullSafeInts(i, value) == comparisonResult;
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

    private class IsPrime extends IntPredicate {
        public override Boolean test(Integer i) {
            if (i == null) { throw new NullPointerException(); }
            if (i <= 1) { return false; }
            if (i == 2) { return true; }
            if (Math.mod(i, 2) == 0) { return false; }
            Integer lim = (Integer) Math.sqrt(i);
            for (Integer j = 3; j <= lim; j += 2) {
                if (Math.mod(i, j) == 0) { return false; }
            }
            return true;
        }
    }
    // @end-group
    //</editor-fold>
}
