/**
 * @description Provides a skeletal implementation of {@link ILongEnumerable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 */
@SuppressWarnings('PMD.ExcessivePublicCount')
public abstract inherited sharing class LongEnumerable implements ILongEnumerable {

    //<editor-fold desc="Iterator">
    /**
     * @description Returns an instance of an iterator for this enumerable.
     * <p>Terminal Operation.</p>
     *
     * @return the iterator
     */
    public abstract Iterator<Long> iterator();
    //</editor-fold>

    //<editor-fold desc="Sources">
    /**
     * @description Returns a new `LongEnumerable` from the current
     * to which another `iterable` is appended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
     * List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
     * List<Long> append = [LongEnumerable].of(longs1)
     *     .append(longs2)
     *     .toList();
     * // [5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L, 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L]
     */
    public abstract LongEnumerable append(final Iterable<Long> iterable);

    /**
     * @description Returns a new `LongEnumerable` from the current
     * to which another `iterable` is prepended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
     * List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
     * List<Long> append = [LongEnumerable].of(longs1)
     *     .prepend(longs2)
     *     .toList();
     * // [8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L, 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L]
     */
    public abstract LongEnumerable prepend(final Iterable<Long> iterable);
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `LongEnumerable` as a set union
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
     * List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
     * List<Long> union = [LongEnumerable].of(longs1)
     *     .union(longs2)
     *     .toList(); // [5L, 3L, 9L, 7L, 8L, 6L, 4L, 1L, 0L]
     */
    public virtual LongEnumerable union(final Iterable<Long> iterable) {
        return (LongEnumerable) append(iterable).distinct();
    }

    /**
     * @description Returns a new `LongEnumerable` as a set intersection
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
     * List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
     * List<Long> intersection = [LongEnumerable].of(longs1)
     *     .intersect(longs2)
     *     .toList(); // [3L, 9L]
     */
    public virtual LongEnumerable intersect(final Iterable<Long> iterable) {
        return (LongEnumerable) distinct().filter(EnumerableSupport.isIn(iterable));
    }

    /**
     * @description Returns a new `LongEnumerable` as a set difference
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
     * List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
     * List<Long> diff = [LongEnumerable].of(longs1)
     *     .except(longs2)
     *     .toList(); // [5L, 7L]
     */
    public virtual LongEnumerable except(final Iterable<Long> iterable) {
        return (LongEnumerable) distinct().filter(EnumerableSupport.isIn(iterable).negate());
    }

    /**
     * @description Returns a `LongEnumerable` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `LongEnumerable`
     *
     * @example
     * List<Long> distinct = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L, 0L, 5L })
     *     .distinct()
     *     .toList(); // [0L, 5L, 1L, -10L]
     */
    public abstract LongEnumerable distinct();

    /**
     * @description Returns a `LongEnumerable` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `LongEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Long> filtered = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, 1L, 5L })
     *     .filter(Predicates.isEqual(5L))
     *     .toList(); // [5L, 5L]
     */
    public abstract LongEnumerable filter(final IPredicate predicate);

    /**
     * @description Returns a `LongEnumerable` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `LongEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Long> firstFiltered = [LongEnumerable].of(new List<Long>{ 0L, 0L, 1L, 1L, 5L })
     *     .take(Predicates.isEqual(0L))
     *     .toList(); // [0L, 0L]
     */
    public abstract LongEnumerable take(final IPredicate predicate);

    /**
     * @description Returns a `LongEnumerable` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `LongEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Long> rest = [LongEnumerable].of(new List<Long>{ 0L, 0L, 1L, 1L, 5L })
     *     .drop(Predicates.isEqual(0L))
     *     .toList(); // [1L, 1L, 5L]
     */
    public abstract LongEnumerable drop(final IPredicate predicate);

    /**
     * @description Returns a new `LongEnumerable` without null elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `LongEnumerable`
     *
     * @example
     * List<Long> withoutNulls = [LongEnumerable].of(new List<Long>{ 0L, 0L, null, 1L, 1L, null, 5L })
     *     .withoutNulls()
     *     .toList(); // [0L, 0L, 1L, 1L, 5L]
     */
    public virtual LongEnumerable withoutNulls() {
        return filter(EnumerableSupport.isNotNull());
    }

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
     * public class MultiplyLongOperator extends Operator {
     *     private final Long l;
     *     public MultiplyLongOperator(Long l) { this.l = l; }
     *     public override Object apply(Object j) { return (Long) j * l; }
     * }
     * List<Long> doubledLongs = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .mapTo(new MultiplyLongOperator(2))
     *     .toList(); // [0L, 10L, 2L, -20L]
     */
    public abstract LongEnumerable mapTo(final IOperator mapper);

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
     * public class MultiplyIntFunction extends Function {
     *     private final Integer i;
     *     public MultiplyIntFunction(Integer i) { this.i = i; }
     *     public override Object apply(Object j) { return (Long) j * i; }
     * }
     * List<Integer> doubledInts = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .mapToLong(new MultiplyIntFunction(2))
     *     .toList(); // [0, 10, 2, -20]
     */
    public abstract IntEnumerable mapToInt(final IFunction mapper);

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
     * public class MultiplyDoubleFunction extends Function {
     *     private final Double d;
     *     public MultiplyDoubleFunction(Double d) { this.d = d; }
     *     public override Object apply(Object j) { return (Long) j * d; }
     * }
     * List<Double> doubledDoubles = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .mapToDouble(new MultiplyDoubleFunction(2))
     *     .toList(); // [0.0, 10.0, 2.0, -20.0]
     */
    public abstract DoubleEnumerable mapToDouble(final IFunction mapper);

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
     *     public override Object apply(Object i) { return new Account(AnnualRevenue = (Long) i); }
     * }
     * List<Account> accounts = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .mapToSObject(new CreateAccountFunction())
     *     .toList(); //
     * [
     *   { AnnualRevenue: 0 },
     *   { AnnualRevenue: 5 },
     *   { AnnualRevenue: 1 },
     *   { AnnualRevenue: 10 }
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
     *     public override Object apply(Object i) { return String.valueOf(i); }
     * }
     * List<String> strings = (List<String>) [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .mapToObject(new ToStringFunction())
     *     .toList(String.class); // ['0', '5', '1', '10']
     */
    public abstract ObjectEnumerable mapToObject(final IFunction mapper);

    /**
     * @description Returns a new `LongEnumerable` with `Long` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Long>`
     *
     * @return the new `LongEnumerable`
     *
     *  @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class MultiplyLongFunction extends Function {
     *     private final Long l;
     *     public MultiplyLongFunction(Long l) { this.l = l; }
     *     public override Object apply(Object o) { return new List<Long>{ ((Long) o) * l }; }
     * }
     * List<Long> longs = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .flatMapTo(new MultiplyLongFunction(2L))
     *     .toList(); // [0L, 10L, 2L, -20L]
     */
    public abstract LongEnumerable flatMapTo(final IFunction mapper);

    /**
     * @description Returns a `LongEnumerable` after performing `consumer` action on each element.
     * <p>Intermediate Operation.</p>
     *
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     *
     * @return this `LongEnumerable`
     *
     * @throws NullPointerException if `consumer` is null
     *
     * @example
     * public class DebugConsumer extends Consumer {
     *     public override void accept(Object o) { System.debug(o); }
     * }
     * List<Long> longs = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .forEach(new DebugConsumer()) // prints 0, 5, 1, -10
     *     .toList(); // [0L, 5L, 1L, -10L ]
     */
    public abstract LongEnumerable forEach(final IConsumer consumer);

    /**
     * @description Returns a `LongEnumerable` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `LongEnumerable`
     *
     * @example
     * List<Long> sorted = [LongEnumerable].of(new List<Long>{ 0L, 5L, null, 1L, -10L })
     *     .sort()
     *     .toList(); // [null, -10L, 0L, 1L, 5L]
     */
    public abstract LongEnumerable sort();

    /**
     * @description Returns a `LongEnumerable` with sorted elements considering `order`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param order the sort order
     *
     * @return the `LongEnumerable`
     *
     * @throws NullPointerException if `order` is null
     *
     * @example
     * List<Long> sorted = [LongEnumerable].of(new List<Long>{ 0L, 5L, null, 1L, -10L })
     *     .sort(SortOrder.DESCENDING)
     *     .toList(); // [5L, 1L, 0L, -10L, null]
     */
    public abstract LongEnumerable sort(final SortOrder order);

    /**
     * @description Returns a `LongEnumerable` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the `LongEnumerable`
     *
     * @throws IllegalStateException if `lim` is less than 0
     * @throws NullPointerException if `lim` is null
     *
     * @example
     * List<Long> first3Longs = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .lim(3)
     *     .toList(); // [0L, 5L, 1L]
     */
    public abstract LongEnumerable lim(final Integer lim);

    /**
     * @description Returns a new `LongEnumerable` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the `LongEnumerable`
     *
     * @throws IllegalStateException if `n` is less than 0
     * @throws NullPointerException if `n` is null
     *
     * @example
     * List<Long> restLongs = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .skip(1)
     *     .toList(); // [5L, 1L, -10L]
     */
    public abstract LongEnumerable skip(final Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    /**
     * @description Performs a reduction on `Long` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Long` result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * public class SumBiOperator extends BiOperator {
     *     public override Object apply(Object o1, Object o2) { return (Long) o1 + (Long) o2; }
     * }
     * Long sum = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .reduce(0L, new SumBiOperator()); // -4L
     */
    public abstract Long reduce(final Long identity, final IBiOperator accumulator);

    /**
     * @description Performs a reduction on `Long` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `Optional` Long describing the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param operator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Long` Long result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * public class SumBiOperator extends BiOperator {
     *     public override Object apply(Object o1, Object o2) { return (Long) o1 + (Long) o2; }
     * }
     * Long sum = (Long) [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .reduce(new SumBiOperator())
     *     .get(); // -4L
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
     * public class AddToLongSetBiConsumer extends BiConsumer {
     *     public override void accept(Object container, Object o) { ((Set<Long>) container).add((Long) o); }
     * }
     * Set<Long> longs = (Set<Long>)
     *     [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L, 5L, 0L })
     *     .collect(Collector.of(Supplier.of(Set<Long>.class), new AddToLongSetBiConsumer()));
     * // [0L, 5L, 1L, -10L]
     */
    public abstract Object collect(final ICollector collector);

    /**
     * @description Returns an `Optional` Long describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `Optional` Long
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class IsEvenPredicate extends Predicate {
     *     public override Boolean test(Object o) { return Math.mod((Long) o, 2) == 0; }
     * }
     * Long firstEvenLong = (Long) [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .find(new IsEvenPredicate())
     *     .get(); // 0L
     */
    public abstract Optional find(final IPredicate predicate);

    /**
     * @description Returns whether all elements match `predicate`.
     * If `LongEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class IsEvenPredicate extends Predicate {
     *     public override Boolean test(Object o) { return Math.mod((Long) o, 2) == 0; }
     * }
     * Boolean isEveryLongEven = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .every(new IsEvenPredicate()); // false
     */
    public abstract Boolean every(final IPredicate predicate);

    /**
     * @description Returns whether some element matches `predicate`.
     * If `LongEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class IsEvenPredicate extends Predicate {
     *     public override Boolean test(Object o) { return Math.mod((Long) o, 2) == 0; }
     * }
     * Boolean isSomeLongEven = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .some(new IsEvenPredicate()); // true
     */
    public abstract Boolean some(final IPredicate predicate);

    /**
     * @description Returns whether no elements match `predicate`.
     * If `LongEnumerable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class IsEvenPredicate extends Predicate {
     *     public override Boolean test(Object o) { return Math.mod((Long) o, 2) == 0; }
     * }
     * Boolean isNoneLongEven = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .none(new IsEvenPredicate()); // false
     */
    public virtual Boolean none(final IPredicate predicate) {
        return !some(predicate);
    }

    /**
     * @description Returns an `Optional` Long describing the maximum element.
     * <p>Terminal Operation.</p>
     *
     * @return the `Optional` Long
     *
     * @example
     * Long max = (Long) [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .max()
     *     .get(); // 5L
     */
    public virtual Optional max() {
        return reduce(EnumerableSupport.max());
    }

    /**
     * @description Returns an `Optional` Long describing the minimum element.
     * <p>Terminal Operation.</p>
     *
     * @return the `Optional` Long
     *
     * @example
     * Long min = (Long) [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .min()
     *     .get(); // -10L
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
     * Long sum = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .sum(); // -4L
     */
    public abstract Long sum();

    /**
     * @description Returns the arithmetic mean of of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the `Optional` Double describing the result
     *
     * @example
     * Double avg = (Double) [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .avg()
     *     .get(); // 1.0
     */
    public abstract Optional avg();

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the count of elements
     *
     * @example
     * Integer count = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .count(); // 4
     */
    public abstract Integer count();

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
     *
     * @example
     * [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .isEmpty(); // false
     * [LongEnumerable].of(new List<Long>())
     *     .isEmpty(); // true
     */
    public abstract Boolean isEmpty();

    /**
     * @description Accumulates elements into a `List<Long>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<Long>` containing the enumerable elements
     *
     * @example
     * List<Long> longs = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .skip(1)
     *     .toList(); // [5L, 1L, -10L]
     */
    public abstract List<Long> toList();

    /**
     * @description Accumulates elements into a `Set<Long>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<Long>` containing the enumerable elements
     *
     * @example
     * Set<Long> longs = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
     *     .skip(1)
     *     .toSet(); // [5L, 1L, -10L, 0L]
     */
    public abstract Set<Long> toSet();
    //</editor-fold>

}
