/**
 * @description Provides a skeletal implementation of {@link IDoubleEnumerable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 */
@SuppressWarnings('PMD.ExcessivePublicCount')
public abstract inherited sharing class DoubleEnumerable implements IDoubleEnumerable {

    //<editor-fold desc="Iterator">
    /**
     * @description Returns an instance of an iterator for this enumerable.
     * <p>Terminal Operation.</p>
     *
     * @return the iterator
     */
    public abstract Iterator<Double> iterator();
    //</editor-fold>

    //<editor-fold desc="Sources">
    /**
     * @description Returns a new `DoubleEnumerable` from the current
     * to which another `iterable` is appended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
     * List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
     * List<Double> append = [DoubleEnumerable].of(doubles1)
     *     .append(doubles2)
     *     .toList();
     * // [5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0, 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0]
     */
    public abstract DoubleEnumerable append(final Iterable<Double> iterable);

    /**
     * @description Returns a new `DoubleEnumerable` from the current
     * to which another `iterable` is prepended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
     * List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
     * List<Double> prepend = [DoubleEnumerable].of(doubles1)
     *     .prepend(doubles2)
     *     .toList();
     * // [8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0, 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0]
     */
    public abstract DoubleEnumerable prepend(final Iterable<Double> iterable);
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `DoubleIterable` as a set union
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `DoubleIterable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
     * List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
     * List<Double> union = [DoubleEnumerable].of(doubles1)
     *     .union(doubles2)
     *     .toList();
     * // [5.0, 3.0, 9.0, 7.0, 8.0, 6.0, 4.0, 1.0, 0.0]
     */
    public virtual DoubleEnumerable union(final Iterable<Double> iterable) {
        return append(iterable).distinct();
    }

    /**
     * @description Returns a new `DoubleIterable` as a set intersection
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `DoubleIterable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
     * List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
     * List<Double> intersection = [DoubleEnumerable].of(doubles1)
     *     .intersect(doubles2)
     *     .toList(); // [3.0, 9.0]
     */
    public virtual DoubleEnumerable intersect(final Iterable<Double> iterable) {
        return distinct().filter(EnumerableSupport.isIn(iterable));
    }

    /**
     * @description Returns a new `DoubleEnumerable` as a set difference
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
     * List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
     * // doublesIterable1 = instance from
     * List<Double> diff = [DoubleEnumerable].of(doubles1)
     *     .except(doubles2)
     *     .toList(); // [5.0, 7.0]
     */
    public virtual DoubleEnumerable except(final Iterable<Double> iterable) {
        return distinct().filter(EnumerableSupport.isIn(iterable).negate());
    }

    /**
     * @description Returns a `DoubleEnumerable` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `DoubleEnumerable`
     *
     * @example
     * List<Double> distinct = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI, 1.5, 5 })
     *     .distinct()
     *     .toList(); // [0.1, 5, 1.5, Math.PI]
     */
    public abstract DoubleEnumerable distinct();

    /**
     * @description Returns a `DoubleEnumerable` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `DoubleEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Double> filtered = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI, 1.5, 5 })
     *     .filter(Predicates.isEqual(5))
     *     .toList(); // [5, 5]
     */
    public abstract DoubleEnumerable filter(final IPredicate predicate);

    /**
     * @description Returns a `DoubleEnumerable` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `DoubleEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Double> firstFiltered = [DoubleEnumerable].of(new List<Double>{ 0.1, 0.1, 5, 1.5, Math.PI })
     *     .filter(Predicates.isEqual(0.1))
     *     .toList(); // [0.1, 0.1]
     */
    public abstract DoubleEnumerable take(final IPredicate predicate);

    /**
     * @description Returns a `DoubleEnumerable` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `DoubleEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Double> rest = [DoubleEnumerable].of(new List<Double>{ 0.1, 0.1, 5, 1.5, Math.PI })
     *     .drop(Predicates.isEqual(0.1))
     *     .toList(); // [5, 1.5, Math.PI]
     */
    public abstract DoubleEnumerable drop(final IPredicate predicate);

    /**
     * @description Returns a new DoubleEnumerable` without null elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `DoubleEnumerable`
     *
     * @example
     * List<Double> withoutNulls = [DoubleEnumerable].of(new List<Double>{ 0.1, null, 5, 1.5, null, 5 })
     *     .withoutNulls()
     *     .toList(); // [0.1, 5, 1.5, 5]
     */
    public virtual DoubleEnumerable withoutNulls() {
        return filter(EnumerableSupport.isNotNull());
    }

    /**
     * @description Returns a `DoubleEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this enumerable.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `DoubleEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class MultiplyDoubleOperator extends Operator {
     *     private final Double d;
     *     public MultiplyDoubleOperator(Double d) { this.d = d; }
     *     public override Object apply(Object j) { return (Double) j * d; }
     * }
     * List<Double> doubledDoubles = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
     *     .mapTo(new MultiplyDoubleOperator(2))
     *     .toList(); // [11, 0.02, 2.0, 6.0]
     */
    public abstract DoubleEnumerable mapTo(final IOperator mapper);

    /**
     * @description Returns a `IntEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this enumerable.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `IntEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class RoundToIntFunction extends Function {
     *     public override Object apply(Object x) { return Math.round((Double) x); }
     * }
     * List<Integer> ints = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
     *     .mapToInt(new RoundToIntFunction())
     *     .toList(); // [6, 0, 1, 3, -9, -6, 4, 4]
     */
    public abstract IntEnumerable mapToInt(final IFunction mapper);

    /**
     * @description Returns a `LongEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this enumerable.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `LongEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class RoundToLongFunction extends Function {
     *     public override Object apply(Object x) { return Math.roundToLong((Double) x); }
     * }
     * List<Long> longs = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
     *     .mapToLong(new RoundToLongFunction())
     *     .toList(); // [6L, 0L, 1L, 3L, -9L, -6L, 4L, 4L]
     */
    public abstract LongEnumerable mapToLong(final IFunction mapper);

    /**
     * @description Returns a `SObjectEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this enumerable.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `SObjectEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class CreateAccountFunction extends Function {
     *     public override Object apply(Object d) { return new Account(AnnualRevenue = (Double) d); }
     * }
     * List<Account> accounts = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
     *     .mapToSObject(new CreateAccountFunction())
     *     .toList(); //
     * [
     *   { AnnualRevenue: 5.5 },
     *   { AnnualRevenue: 0.01 },
     *   { AnnualRevenue: 1.0 },
     *   { AnnualRevenue: 3 }
     * ]
     */
    public abstract SObjectEnumerable mapToSObject(final IFunction mapper);

    /**
     * @description Returns a `ObjectEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this enumerable.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `ObjectEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class ToStringFunction extends Function {
     *     public override Object apply(Object d) { return String.valueOf(d); }
     * }
     * List<String> strings = (List<String>) [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
     *     .mapToObject(new ToStringFunction())
     *     .toList(String.class); // ['5.5', '0.01', '1.0', '3']
     */
    public abstract ObjectEnumerable mapToObject(final IFunction mapper);

    /**
     * @description Returns a new `DoubleEnumerable` with `Double` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Double>`
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class MultiplyDoubleFunction extends Function {
     *     private final Double d;
     *     public MultiplyDoubleFunction(Double d) { this.d = d; }
     *     public override Object apply(Object o) { return new List<Double>{ ((Double) o) * d }; }
     * }
     * List<Double> doubles = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
     *     .flatMapTo(new MultiplyDoubleFunction(2))
     *     .toList(); // [11, 0.02, 2.0, 6.0]
     */
    public abstract DoubleEnumerable flatMapTo(final IFunction mapper);

    /**
     * @description Returns a `DoubleEnumerable` after performing `consumer` action on each element.
     * <p>Intermediate Operation.</p>
     *
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     *
     * @return this `DoubleEnumerable`
     *
     * @throws NullPointerException if `consumer` is null
     *
     * @example
     * public class DebugConsumer extends Consumer {
     *     public override void accept(Object o) { System.debug(o); }
     * }
     * List<Double> doubles = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
     *     .forEach(new DebugConsumer()) // prints 5.5, 0.01, 1.0, 3
     *     .toList(); // [5.5, 0.01, 1.0, 3]
     */
    public abstract DoubleEnumerable forEach(final IConsumer consumer);

    /**
     * @description Returns a `DoubleEnumerable` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `DoubleEnumerable`
     *
     * @example
     * List<Double> sorted = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 })
     *     .sort()
     *     .toList(); // [null, -8.99, -6, 0.01, 1.0, 3, 4.01, 4.01, 5.5]
     */
    public abstract DoubleEnumerable sort();

    /**
     * @description Returns a new `DoubleEnumerable` with sorted elements considering `order`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param order the sort order
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `order` is null
     *
     * @example
     * List<Double> sorted = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 })
     *     .sort(SortOrder.DESCENDING)
     *     .toList(); // [5.5, 4.01, 4.01, 3, 1.0, 0.01, -6, -8.99, null]
     */
    public abstract DoubleEnumerable sort(final SortOrder order);

    /**
     * @description Returns a `DoubleEnumerable` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the `DoubleEnumerable`
     *
     * @throws IllegalStateException if `lim` is less than 0
     * @throws NullPointerException if `lim` is null
     *
     * @example
     * List<Double> first3Doubles = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .lim(3)
     *     .toList(); // [0.1, 5, 1.5]
     */
    public abstract DoubleEnumerable lim(final Integer lim);

    /**
     * @description Returns a new `DoubleEnumerable` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the `DoubleEnumerable`
     *
     * @throws IllegalStateException if `n` is less than 0
     * @throws NullPointerException if `n` is null
     *
     * @example
     * List<Double> restDoubles = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .skip(1)
     *     .toList(); // [5, 1.5, Math.PI]
     */
    public abstract DoubleEnumerable skip(final Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    /**
     * @description Performs a reduction on `Double` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Double` result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * Double max = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
     *     .reduce((Double) 0.0, BiOperators.max()); // 5.5
     */
    public abstract Double reduce(final Double identity, final IBiOperator accumulator);

    /**
     * @description Performs a reduction on `Double` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `Optional` Double describing the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param operator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Optional` Double result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * Double max = (Double) [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
     *     .reduce(BiOperators.max())
     *     .get(); // 5.5
     */
    public abstract Optional reduce(final IBiOperator operator);

    /**
     * @description Performs a mutable reduction operation on elements, collecting elements
     * to a container using `collector`.
     * <p>Terminal Operation.</p>
     *
     * @param collector the function that returns a mutable result container
     *
     * @return the `Object` result of the collection
     *
     * @throws NullPointerException if `collector` is null
     *
     * @example
     * public class AddToDoubleSetBiConsumer extends BiConsumer {
     *     public override void accept(Object container, Object o) { ((Set<Double>) container).add((Double) o); }
     * }
     * Set<Double> doubles = (Set<Double>)
     *     [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
     *     .collect(Collector.of(Supplier.of(Set<Double>.class), new AddToDoubleSetBiConsumer()));
     * // [5.5, 0.01, 1.0, 3, -8.99, -6, 4.01]
     */
    public abstract Object collect(final ICollector collector);

    /**
     * @description Returns an `Optional` Double describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `Optional` Double
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class IsGreaterPredicate extends Predicate {
     *     private final Double d;
     *     public IsGreaterPredicate(Double d) { this.d = d; }
     *     public override Boolean test(Object o) { return (Double) o > d; }
     * }
     * Double firstGreaterThan4Double = [DoubleEnumerable].of(new List<Double>{ 0.01, 1.0, 3, 5.5 -8.99, -6, 4.01 })
     *     .find(new IsGreaterPredicate(4))
     *     .get(); // 5.5
     */
    public abstract Optional find(final IPredicate predicate);

    /**
     * @description Returns whether all elements match `predicate`.
     * If `DoubleEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class IsGreaterPredicate extends Predicate {
     *     private final Double d;
     *     public IsGreaterPredicate(Double d) { this.d = d; }
     *     public override Boolean test(Object o) { return (Double) o > d; }
     * }
     * Boolean isEveryDoublePositive = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .every(new IsGreaterPredicate(0)); // true
     */
    public abstract Boolean every(final IPredicate predicate);

    /**
     * @description Returns whether some element matches `predicate`.
     * If `DoubleEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class IsGreaterPredicate extends Predicate {
     *     private final Double d;
     *     public IsGreaterPredicate(Double d) { this.d = d; }
     *     public override Boolean test(Object o) { return (Double) o > d; }
     * }
     * Boolean isSomeDoubleGreaterThan6 = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .some(new IsGreaterPredicate(6)); // false
     */
    public abstract Boolean some(final IPredicate predicate);

    /**
     * @description Returns whether no elements match `predicate`.
     * If `DoubleEnumerable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class IsGreaterPredicate extends Predicate {
     *     private final Double d;
     *     public IsGreaterPredicate(Double d) { this.d = d; }
     *     public override Boolean test(Object o) { return (Double) o > d; }
     * }
     * Boolean isNoneDoubleGreaterThan6 = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .none(new IsGreaterPredicate(6)); // false
     */
    public virtual Boolean none(final IPredicate predicate) {
        return !some(predicate);
    }

    /**
     * @description Returns an `Optional` Double describing the maximum element.
     * <p>Terminal Operation.</p>
     *
     * @return the `Optional` Double
     *
     * @example
     * Double max = (Double) [DoubleEnumerable].of(new List<Double>{ 0.01, 1.0, 3, 5.5 -8.99, -6, 4.01 })
     *     .max()
     *     .get(); // 5.5
     */
    public virtual Optional max() {
        return reduce(EnumerableSupport.max());
    }

    /**
     * @description Returns an `Optional` Double describing the minimum element.
     * <p>Terminal Operation.</p>
     *
     * @return the `Optional` Double
     *
     * @example
     * Double min = (Double) [DoubleEnumerable].of(new List<Double>{ 0.01, 1.0, 3, 5.5 -8.99, -6, 4.01 })
     *     .min()
     *     .get(); // -8.99
     */
    public virtual Optional min() {
        return reduce(EnumerableSupport.min());
    }

    /**
     * @description Returns the arithmetic sum of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the sum of elements
     *
     * @example
     * Double sum = [DoubleEnumerable].of(new List<Double>{ 0.1, 0.2, 0.3, -0.4, 0.5, 0.6, 0.7, 0.8, 0.9 })
     *     .sum(); // 3.7
     */
    public virtual Double sum() {
        return (Double) collect(EnumerableSupport.summingDouble(Function.identity()));
    }

    /**
     * @description Returns the arithmetic mean of of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the `Optional` Double describing the result
     *
     * @example
     * Double avg = (Double)
     *     [DoubleEnumerable].of(new List<Double>{ 0.1, 0.2, 0.3, -0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.3 })
     *     .avg()
     *     .get(); // 0.4
     */
    public virtual Optional avg() {
        return Optional.ofNullable(collect(EnumerableSupport.averagingDouble(Function.identity())));
    }

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the count of elements
     *
     * @example
     * Integer count = [DoubleEnumerable].of(new List<Double>{ 0.1, 0.2, 0.3, -0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.3 })
     *     .count(); // 10
     */
    public abstract Integer count();

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
     *
     * @example
     * [DoubleEnumerable].of(new List<Double>{ 0.1, 0.2, 0.3 })
     *     .isEmpty(); // false
     * [DoubleEnumerable].of(new List<Double>())
     *     .isEmpty(); // true
     */
    public abstract Boolean isEmpty();

    /**
     * @description Accumulates elements into a `List<Double>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<Double>` containing the enumerable elements
     *
     * @example
     * List<Double> doubles = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     *     .skip(1)
     *     .toList(); // [5, 1.5, Math.PI]
     */
    public abstract List<Double> toList();

    /**
     * @description Accumulates elements into a `Set<Double>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<Double>` containing the enumerable elements
     *
     * @example
     * Set<Double> doubles = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI, 5 })
     *     .skip(1)
     *     .toSet(); // [5, 1.5, Math.PI]
     */
    public abstract Set<Double> toSet();
    //</editor-fold>

}
