/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link IIntPredicate} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see IIntIterable.filter
 * @see IIntIterable.take
 * @see IIntIterable.drop
 * @see IIntIterable.find
 * @see IIntIterable.some
 * @see IIntIterable.every
 * @see IIntIterable.none
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
     * @example
     * someIntPredicate1.orElse(someIntPredicate2);
     * @param other the other `IIntPredicate`
     * @return the composed `IntPredicate`
     * @throws NullPointerException if `other` is null
     */
    public virtual IntPredicate orElse(final IIntPredicate other) {
        return some(this, other);
    }

    /**
     * @description Returns a composed `IntPredicate` that applies short-circuiting logical
     * `AND` operator to `this` `IIntPredicate` and `other`
     * in that order.
     * @example
     * someIntPredicate1.andAlso(someIntPredicate2);
     * @param other the other `IIntPredicate`
     * @return the composed `IIntPredicate`
     * @throws NullPointerException if `other` is null
     */
    public virtual IntPredicate andAlso(final IIntPredicate other) {
        return every(this, other);
    }

    /**
     * @description Returns a `IntPredicate` that applies logical `NOT` operator
     * to `this` `IIntPredicate`.
     * @example
     * someIntPredicate.negate();
     * @return the negated `IntPredicate`
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
     * @example
     * IntPredicate.some(someIntPredicates);
     * @param predicates the list of`IIntPredicates`
     * @return the composed `IntPredicate`
     * @throws NullPointerException if `other` is null or some of the list element is null
     */
    public static IntPredicate some(final List<IIntPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new OrPredicates(predicates);
    }

    /**
     * @description Returns a composed `IntPredicate` that applies short-circuiting logical
     * `OR` operator to `predicate1` `IIntPredicate` and `predicate2`
     * in that order.
     * @example
     * IntPredicate.some(someIntPredicate1, someIntPredicate2);
     * @param predicate1 the first `IIntPredicate`
     * @param predicate2 the second `IIntPredicate`
     * @return the composed `IntPredicate`
     * @throws NullPointerException if `predicate1` or `predicate2` is null
     */
    public static IntPredicate some(final IIntPredicate predicate1, final IIntPredicate predicate2) {
        return some(new List<IIntPredicate>{ predicate1, predicate2 });
    }

    /**
     * @description Returns a composed `IntPredicate` that applies sequentially short-circuiting
     * logical `AND` operator to `predicates` in the same order as the order of the input list.
     * @example
     * IntPredicate.every(someIntPredicates);
     * @param predicates the list of`IIntPredicates`
     * @return the composed `IntPredicate`
     * @throws NullPointerException if `other` is null or some of the list element is null
     */
    public static IntPredicate every(final List<IIntPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new AndPredicates(predicates);
    }

    /**
     * @description Returns a composed `IntPredicate` that applies short-circuiting logical
     * `AND` operator to `predicate1` `IIntPredicate` and `predicate2`
     * in that order.
     * @example
     * IntPredicate.every(someIntPredicate1, someIntPredicate2);
     * @param predicate1 the first `IIntPredicate`
     * @param predicate2 the second `IIntPredicate`
     * @return the composed `IntPredicate`
     * @throws NullPointerException if `predicate1` or `predicate2` is null
     */
    public static IntPredicate every(final IIntPredicate predicate1, final IIntPredicate predicate2) {
        return every(new List<IIntPredicate>{ predicate1, predicate2 });
    }

    /**
     * @description Returns a `IntPredicate` that applies logical `NOT` operator
     * to `predicate`.
     * @example
     * IntPredicate.negate(someIntPredicate);
     * @param predicate the `IIntPredicate`
     * @return the negated `IntPredicate`
     */
    public static IntPredicate negate(final IIntPredicate predicate) {
        Validate.notNull(predicate);
        return new NegatePredicate(predicate);
    }

    /**
     * @description Returns a `IntPredicate` that always evaluates to the Boolean `value`
     * (`true` or `false`).
     * @example
     * IntPredicate.always(true);
     * @param value the evaluated value
     * @return predicate the `IntPredicate`
     * @throws NullPointerException if `value` is null
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
     * @example
     * IntPredicate.isGreater(100);
     * @param value the right argument of comparison
     * @return the `IntPredicate`
     * @see Comparator.compareNullSafeInts
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
     * @example
     * IntPredicate.isGreaterOrEqual(100);
     * @param value the right argument of comparison
     * @return the `IntPredicate`
     * @see Comparator.compareNullSafeInts
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
     * @example
     * IntPredicate.isLess(100);
     * @param value the right argument of comparison
     * @return the `IntPredicate`
     * @see Comparator.compareNullSafeInts
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
     * @example
     * IntPredicate.isLessOrEqual(100);
     * @param value the right argument of comparison
     * @return the `IntPredicate`
     * @see Comparator.compareNullSafeInts
     */
    public static IntPredicate isLessOrEqual(final Integer value) {
        return isLess(value).orElse(isEqual(value));
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is equal to
     * the `value`.
     * @example
     * IntPredicate.isEqual(100);
     * @param value the right argument of comparison
     * @return the `IntPredicate`
     * @see Comparator.compareNullSafeInts
     */
    public static IntPredicate isEqual(final Integer value) {
        return new ComparePredicate(value, 0);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is not equal to
     * the `value`.
     * @example
     * IntPredicate.isNotEqual(100);
     * @param value the right argument of comparison
     * @return the `IntPredicate`
     * @see Comparator.compareNullSafeInts
     */
    public static IntPredicate isNotEqual(final Integer value) {
        return isEqual(value).negate();
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is contained in
     * the `container`.
     * @example
     * IntPredicate.isIn(container);
     * @param container the list that checks for the presence of an element
     * @return the `IntPredicate`
     * @throws NullPointerException if the `container` is null
     * @see List.contains
     */
    public static IntPredicate isIn(final List<Integer> container) {
        Validate.notNull(container);
        return new IsIn(container);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is not contained in
     * the `container`.
     * @example
     * IntPredicate.isNotIn(container);
     * @param container the list that checks for the presence of an element
     * @return the `IntPredicate`
     * @throws NullPointerException if the `container` is null
     * @see List.contains
     */
    public static IntPredicate isNotIn(final List<Integer> container) {
        return isIn(container).negate();
    }
    //</editor-fold>

    //<editor-fold desc="Integer Predicates">
    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is null.
     * @example
     * IntPredicate.isNull();
     * @return the `IntPredicate`
     */
    public static IntPredicate isNull() {
        return isEqual(null);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is not null.
     * @example
     * IntPredicate.isNotNull();
     * @return the `IntPredicate`
     */
    public static IntPredicate isNotNull() {
        return isEqual(null).negate();
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is even.
     * @example
     * IntPredicate.isEven();
     * @return the `IntPredicate`
     */
    public static IntPredicate isEven() {
        return new IsEven();
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is a factor of
     * `i`.
     * @example
     * IntPredicate.isFactorOf(5);
     * @return the `IntPredicate`
     * @throws NullPointerException if the `i` is null
     */
    public static IntPredicate isFactorOf(Integer i) {
        Validate.notNull(i);
        return new IsFactor(i);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is negative.
     * @example
     * IntPredicate.isNegative();
     * @return the `IntPredicate`
     */
    public static IntPredicate isNegative() {
        return isLess(0);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is negative or zero.
     * @example
     * IntPredicate.isNegativeOrZero();
     * @return the `IntPredicate`
     */
    public static IntPredicate isNegativeOrZero() {
        return isLessOrEqual(0);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is odd.
     * @example
     * IntPredicate.isEven();
     * @return the `IntPredicate`
     */
    public static IntPredicate isOdd() {
        return new IsOdd();
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is positive.
     * @example
     * IntPredicate.isPositive();
     * @return the `IntPredicate`
     */
    public static IntPredicate isPositive() {
        return isGreater(0);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is positive or zero.
     * @example
     * IntPredicate.isPositiveOrZero();
     * @return the `IntPredicate`
     */
    public static IntPredicate isPositiveOrZero() {
        return isGreaterOrEqual(0);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is prime.
     * @example
     * IntPredicate.isPrime();
     * @return the `IntPredicate`
     * @throws NullPointerException if the input argument is null
     */
    public static IntPredicate isPrime() {
        return new IsPrime();
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer if it is zero.
     * @example
     * IntPredicate.isZero();
     * @return the `IntPredicate`
     */
    public static IntPredicate isZero() {
        return isEqual(0);
    }

    /**
     * @description Returns a `IntPredicate` that tests the input Integer has the `divisor`.
     * @example
     * IntPredicate.hasDivisor(10);
     * @return the `IntPredicate`
     * @throws NullPointerException if the `divisor` is null
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
        private final List<Integer> integers;
        public IsIn(List<Integer> integers) { this.integers = integers; }
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
