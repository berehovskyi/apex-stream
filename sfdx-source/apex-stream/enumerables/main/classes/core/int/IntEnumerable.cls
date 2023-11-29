/**
 * @description Provides a skeletal implementation of {@link IIntEnumerable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 */
@SuppressWarnings('PMD.ExcessivePublicCount')
public abstract inherited sharing class IntEnumerable implements IIntEnumerable {

    //<editor-fold desc="Iterator">
    /**
     * @description Returns an instance of an iterator for this enumerable.
     * <p>Terminal Operation.</p>
     *
     * @return the iterator
     */
    public abstract Iterator<Integer> iterator();
    //</editor-fold>

    //<editor-fold desc="Sources">
    /**
     * @description Returns a new `IntEnumerable` from the current
     * to which another `iterable` is appended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IntEnumerable`
     * 
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
     * List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
     * List<Integer> append = [IntEnumerable].of(ints1)
     *     .append(ints2)
     *     .toList();
     * // [5, 3, 9, 7, 5, 9, 3, 7, 8, 3, 6, 4, 4, 9, 1, 0]
     */
    public abstract IntEnumerable append(final Iterable<Integer> iterable);

    /**
     * @description Returns a new `IntEnumerable` from the current
     * to which another `iterable` is prepended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IntEnumerable`
     * 
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
     * List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
     * List<Integer> prepend = [IntEnumerable].of(ints1)
     *     .prepend(ints2)
     *     .toList();
     * // [8, 3, 6, 4, 4, 9, 1, 0, 5, 3, 9, 7, 5, 9, 3, 7]
     */
    public abstract IntEnumerable prepend(final Iterable<Integer> iterable);
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `IntEnumerable` as a set union
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IntEnumerable`
     * 
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
     * List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
     * List<Integer> union = [IntEnumerable].of(ints1)
     *     .union(ints2)
     *     .toList(); // [5, 3, 9, 7, 8, 6, 4, 1, 0]
     */
    public virtual IntEnumerable union(final Iterable<Integer> iterable) {
        return (IntEnumerable) append(iterable).distinct();
    }

    /**
     * @description Returns a new `IntIterable` as a set intersection
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IntIterable`
     * 
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
     * List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
     * List<Integer> intersection = [IntEnumerable].of(ints1)
     *     .intersect(ints2)
     *     .toList(); // [3, 9]
     */
    public virtual IntEnumerable intersect(final Iterable<Integer> iterable) {
        return (IntEnumerable) distinct().filter(BasePredicates.isIn(iterable));
    }

    /**
     * @description Returns a new `IntIterable` as a set difference
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IntIterable`
     * 
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
     * List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
     * List<Integer> diff = [IntEnumerable].of(ints1)
     *     .except(ints2)
     *     .toList(); // [5, 7]
     */
    public virtual IntEnumerable except(final Iterable<Integer> iterable) {
        return (IntEnumerable) distinct().filter(BasePredicates.isIn(iterable).negate());
    }

    /**
     * @description Returns a `IntEnumerable` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `IntEnumerable`
     *
     * @example
     * List<Integer> distinct = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10, 0, 5 })
     *     .distinct()
     *     .toList(); // [0, 5, 1, -10]
     */
    public abstract IntEnumerable distinct();

    /**
     * @description Returns a `IntEnumerable` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `IntEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Integer> filtered = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, 1, 5 })
     *     .filter(BasePredicates.isEqual(5))
     *     .toList(); // [5, 5]
     */
    public abstract IntEnumerable filter(final IPredicate predicate);

    /**
     * @description Returns a `IntEnumerable` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `IntEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Integer> firstFiltered = [IntEnumerable].of(new List<Integer>{ 0, 0, 1, 1, 5 })
     *     .take(BasePredicates.isEqual(0))
     *     .toList(); // [0, 0]
     */
    public abstract IntEnumerable take(final IPredicate predicate);

    /**
     * @description Returns a `IntEnumerable` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `IntEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * List<Integer> rest = [IntEnumerable].of(new List<Integer>{ 0, 0, 1, 1, 5 })
     *     .drop(BasePredicates.isEqual(0))
     *     .toList(); // [1, 1, 5]
     */
    public abstract IntEnumerable drop(final IPredicate predicate);

    /**
     * @description Returns a new `IntEnumerable` without null elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `IntEnumerable`
     *
     * @example
     * List<Integer> withoutNulls = [IntEnumerable].of(new List<Integer>{ 0, 0, null, 1, 1, null, 5 })
     *     .withoutNulls()
     *     .toList(); // [0, 0, 1, 1, 5]
     */
    public virtual IntEnumerable withoutNulls() {
        return filter(BasePredicates.isNotNull());
    }

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
     * public class MultiplyIntOperator extends Operator {
     *     private final Integer i;
     *     public MultiplyIntOperator(Integer i) { this.i = i; }
     *     public override Object apply(Object j) { return (Integer) j * i; }
     * }
     * List<Integer> doubledInts = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .mapTo(new MultiplyIntOperator(2))
     *     .toList(); // [0, 10, 2, -20]
     */
    public abstract IntEnumerable mapTo(final IOperator mapper);

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
     * public class MultiplyLongFunction extends Function {
     *     private final Long l;
     *     public MultiplyLongFunction(Long l) { this.l = l; }
     *     public override Object apply(Object j) { return (Integer) j * l; }
     * }
     * List<Long> doubledLongs = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .mapToLong(new MultiplyLongFunction(2))
     *     .toList(); // [0L, 10L, 2L, -20L]
     */
    public abstract LongEnumerable mapToLong(final IFunction mapper);

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
     *     public override Object apply(Object j) { return (Integer) j * d; }
     * }
     * List<Double> doubledDoubles = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
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
     *     public override Object apply(Object i) { return new Account(AnnualRevenue = (Integer) i); }
     * }
     * List<Account> accounts = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, 10 })
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
     * List<String> strings = (List<String>) [IntEnumerable].of(new List<Integer>{ 0, 5, 1, 10 })
     *     .mapToObject(new ToStringFunction())
     *     .toList(String.class); // ['0', '5', '1', '10']
     */
    public abstract ObjectEnumerable mapToObject(final IFunction mapper);

    /**
     * @description Returns a new `IntEnumerable` with `Integer` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Integer>`
     *
     * @return the new `IntEnumerable`
     * 
     *  @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class MultiplyIntFunction extends Function {
     *     private final Integer i;
     *     public MultiplyIntFunction(Integer i) { this.i = i; }
     *     public override Object apply(Object o) { return new List<Integer>{ ((Integer) o) * i }; }
     * }
     * List<Integer> ints = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .flatMapTo(new MultiplyIntFunction(2))
     *     .toList(); // [0, 10, 2, -20]
     */
    public abstract IntEnumerable flatMapTo(final IFunction mapper);

    /**
     * @description Returns a `IntEnumerable` after performing `consumer` action on each element.
     * <p>Intermediate Operation.</p>
     *
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     *
     * @return this `IntEnumerable`
     *
     * @throws NullPointerException if `consumer` is null
     *
     * @example
     * public class DebugConsumer extends Consumer {
     *     public override void accept(Object o) { System.debug(o); }
     * }
     * List<Integer> ints = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .forEach(new DebugConsumer()) // prints 0, 5, 1, -10 
     *     .toList(); // [0, 5, 1, -10 ]
     */
    public abstract IntEnumerable forEach(final IConsumer consumer);

    /**
     * @description Returns a `IntEnumerable` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `IntEnumerable`
     *
     * @example
     * List<Integer> sorted = [IntEnumerable].of(new List<Integer>{ 0, 5, null, 1, -10 })
     *     .sort()
     *     .toList(); // [null, -10, 0, 1, 5]
     */
    public abstract IntEnumerable sort();

    /**
     * @description Returns a `IntEnumerable` with sorted elements considering `order`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param order the sort order
     *
     * @return the `IntEnumerable`
     * 
     * @throws NullPointerException if `order` is null
     *
     * @example
     * List<Integer> sorted = [IntEnumerable].of(new List<Integer>{ 0, 5, null, 1, -10 })
     *     .sort(SortOrder.DESCENDING)
     *     .toList(); // [5, 1, 0, -10, null]
     */
    public abstract IntEnumerable sort(final SortOrder order);

    /**
     * @description Returns a `IntEnumerable` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the `IntEnumerable`
     *
     * @throws IllegalStateException if `lim` is less than 0
     * @throws NullPointerException if `lim` is null
     *
     * @example
     * List<Integer> first3Ints = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .lim(3)
     *     .toList(); // [0, 5, 1]
     */
    public abstract IntEnumerable lim(final Integer lim);

    /**
     * @description Returns a new `IntEnumerable` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the `IntEnumerable`
     *
     * @throws IllegalStateException if `n` is less than 0
     * @throws NullPointerException if `n` is null
     *
     * @example
     * List<Integer> restInts = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .skip(1)
     *     .toList(); // [5, 1, -10]
     */
    public abstract IntEnumerable skip(final Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    /**
     * @description Performs a reduction on `Integer` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Integer` result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * public class SumBiOperator extends BiOperator {
     *     public override Object apply(Object o1, Object o2) { return (Integer) o1 + (Integer) o2; }
     * }
     * Integer sum = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .reduce(0, new SumBiOperator()); // -4
     */
    public abstract Integer reduce(final Integer identity, final IBiOperator accumulator);

    /**
     * @description Performs a reduction on `Integer` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `Optional` Integer describing the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param operator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Optional` Integer result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * public class SumBiOperator extends BiOperator {
     *     public override Object apply(Object o1, Object o2) { return (Integer) o1 + (Integer) o2; }
     * }
     * Integer sum = (Integer) [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .reduce(new SumBiOperator())
     *     .get(); // -4
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
     * public class AddToIntSetBiConsumer extends BiConsumer {
     *     public override void accept(Object container, Object o) { ((Set<Integer>) container).add((Integer) o); }
     * }
     * Set<Integer> ints = (Set<Integer>)
     *     [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10, 5, 0 })
     *     .collect(Collector.of(Supplier.of(Set<Integer>.class), new AddToIntSetBiConsumer()));
     * // [0, 5, 1, -10]
     */
    public abstract Object collect(final ICollector collector);

    /**
     * @description Returns an `Optional` Integer describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `Optional` Integer
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class IsEvenPredicate extends Predicate {
     *     public override Boolean test(Object o) { return Math.mod((Integer) o, 2) == 0; }
     * }
     * Integer firstEvenInt = (Integer) [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .find(new IsEvenPredicate())
     *     .get(); // 0
     */
    public abstract Optional find(final IPredicate predicate);

    /**
     * @description Returns whether all elements match `predicate`.
     * If `IntEnumerable` is empty then `false` is returned.
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
     *     public override Boolean test(Object o) { return Math.mod((Integer) o, 2) == 0; }
     * }
     * Boolean isEveryIntEven = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .every(new IsEvenPredicate()); // false
     */
    public abstract Boolean every(final IPredicate predicate);

    /**
     * @description Returns whether some element matches `predicate`.
     * If `IntEnumerable` is empty then `false` is returned.
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
     *     public override Boolean test(Object o) { return Math.mod((Integer) o, 2) == 0; }
     * }
     * Boolean isSomeIntEven = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .some(new IsEvenPredicate()); // true
     */
    public abstract Boolean some(final IPredicate predicate);

    /**
     * @description Returns whether no elements match `predicate`.
     * If `IntEnumerable` is empty then `true` is returned.
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
     *     public override Boolean test(Object o) { return Math.mod((Integer) o, 2) == 0; }
     * }
     * Boolean isNoneIntEven = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .none(new IsEvenPredicate()); // false
     */
    public virtual Boolean none(final IPredicate predicate) {
        return !some(predicate);
    }

    /**
     * @description Returns an `Optional` Integer describing the maximum element.
     * <p>Terminal Operation.</p>
     *
     * @return the `Optional` Integer
     *
     * @example
     * Integer max = (Integer) [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .max()
     *     .get(); // 5
     */
    public virtual Optional max() {
        return reduce(BaseBiOperators.max());
    }

    /**
     * @description Returns an `Optional` Integer describing the minimum element.
     * <p>Terminal Operation.</p>
     *
     * @return the `Optional` Integer
     *
     * @example
     * Integer min = (Integer) [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .min()
     *     .get(); // -10
     */
    public virtual Optional min() {
        return reduce(BaseBiOperators.min());
    }

    /**
     * @description Returns the arithmetic sum of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the sum of elements
     *
     * @example
     * Integer sum = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .sum(); // -4
     */
    public abstract Integer sum();

    /**
     * @description Returns the arithmetic mean of of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the `Optional` Double describing the result
     *
     * @example
     * Double avg = (Double) [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .avg()
     *     .get(); // -1.0
     */
    public abstract Optional avg();

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the count of elements
     * 
     * @example
     * Integer count = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
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
     * [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .isEmpty(); // false
     * [IntEnumerable].of(new List<Integer>())
     *     .isEmpty(); // true
     */
    public abstract Boolean isEmpty();

    /**
     * @description Accumulates elements into a `List<Integer>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<Integer>` containing the enumerable elements
     *
     * @example
     * List<Integer> ints = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
     *     .skip(1)
     *     .toList(); // [5, 1, -10]
     */
    public abstract List<Integer> toList();

    /**
     * @description Accumulates elements into a `Set<Integer>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<Integer>` containing the enumerable elements
     *
     * @example
     * Set<Integer> ints = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10, 0, 5 })
     *     .skip(1)
     *     .toSet(); // [5, 1, -10, 0]
     */
    public abstract Set<Integer> toSet();
    //</editor-fold>

}
