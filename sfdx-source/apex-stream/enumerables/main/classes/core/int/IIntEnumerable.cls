/**
 * @description A sequence of `Integer` elements supporting aggregate operations.
 *
 * @see IObjectEnumerable
 * @see ISObjectEnumerable
 * @see ILongEnumerable
 * @see IDoubleEnumerable
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 */
public interface IIntEnumerable extends Iterable<Integer> {
    //<editor-fold desc="Iterator">
    /**
     * @description Returns an instance of an iterator for this enumerable.
     * <p>Terminal Operation.</p>
     *
     * @return the iterator
     */
    Iterator<Integer> iterator();
    //</editor-fold>

    //<editor-fold desc="Sources">
    /**
     * @description Returns a new `IIntEnumerable` from the current
     * to which another `iterable` is appended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable append(Iterable<Integer> iterable);

    /**
     * @description Returns a new `IIntEnumerable` from the current
     * to which another `iterable` is prepended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable prepend(Iterable<Integer> iterable);
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `IIntEnumerable` as a set union
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable union(Iterable<Integer> iterable);

    /**
     * @description Returns a new `IIntEnumerable` as a set intersection
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable intersect(Iterable<Integer> iterable);

    /**
     * @description Returns a new `IIntEnumerable` as a set difference
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable except(Iterable<Integer> iterable);

    /**
     * @description Returns a new `IIntEnumerable` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable distinct();

    /**
     * @description Returns a new `IIntEnumerable` with elements
     * that match `predicate`.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable filter(IPredicate predicate);

    /**
     * @description Returns a new `IIntEnumerable` that takes elements
     * while `predicate` returns `true`.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable take(IPredicate predicate);

    /**
     * @description Returns a new `IIntEnumerable` that drops elements
     * while `predicate` returns `true`, then takes the rest.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable drop(IPredicate predicate);

    /**
     * @description Returns a new `IIntEnumerable` without null elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable withoutNulls();

    /**
     * @description Returns a new `IIntEnumerable` with elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable mapTo(IOperator mapper);

    /**
     * @description Returns a new `ILongEnumerable` with `Long` elements
     * returned by the `mapper` function.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable mapToLong(IFunction mapper);

    /**
     * @description Returns a new `IDoubleEnumerable` with `Double` elements
     * returned by the `mapper` function.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable mapToDouble(IFunction mapper);

    /**
     * @description Returns a new `ISObjectEnumerable` with `SObject` elements
     * returned by the `mapper` function.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable mapToSObject(IFunction mapper);

    /**
     * @description Returns a new `IObjectEnumerable` with `Object` elements
     * returned by the `mapper` function.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable mapToObject(IFunction mapper);

    /**
     * @description Returns a new `IIntEnumerable` with elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Integer>`
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable flatMapTo(IFunction mapper);

    /**
     * @description Returns an `IIntEnumerable` after performing the `consumer` action
     * on each element.
     * <p>Intermediate Operation.</p>
     *
     * @param consumer the action
     *
     * @return the `IIntEnumerable`
     */
    IIntEnumerable forEach(IConsumer consumer);

    /**
     * @description Returns a new `IIntEnumerable` with sorted elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable sort();

    /**
     * @description Returns a new `IIntEnumerable` with sorted elements
     * considering `order`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param order the sort order
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable sort(SortOrder order);

    /**
     * @description Returns a new `IIntEnumerable` with the first `lim` elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable lim(Integer lim);

    /**
     * @description Returns a new `IIntEnumerable` that skips the first `n` elements
     * and returns the remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable skip(Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    /**
     * @description Performs a reduction on elements,
     * using the `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param identity the identity value for the `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Integer` result of the reduction
     */
    Integer reduce(Integer identity, IBiOperator accumulator);

    /**
     * @description Performs a reduction on elements,
     * using an associative `accumulator` function, and returns
     * an `IOptional` describing the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `IOptional` containing the result
     */
    IOptional reduce(IBiOperator accumulator);

    /**
     * @description Performs a mutable reduction operation on elements, collecting elements
     * to a container using `collector`.
     * <p>Terminal Operation.</p>
     *
     * @param collector the collector
     *
     * @return the `Object` result of the collection
     */
    Object collect(ICollector collector);

    /**
     * @description Returns an `IOptional` describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `IOptional` containing the result
     */
    IOptional find(IPredicate predicate);

    /**
     * @description Returns whether all elements match `predicate`.
     * If `IIntEnumerable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean every(IPredicate predicate);

    /**
     * @description Returns whether some element matches `predicate`.
     * If `IIntEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean some(IPredicate predicate);

    /**
     * @description Returns whether no elements match `predicate`.
     * If `IIntEnumerable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean none(IPredicate predicate);

    /**
     * @description Returns an `IOptional` describing the maximum element.
     * <p>Terminal Operation.</p>
     *
     * @return the `IOptional` containing the result
     */
    IOptional max();

    /**
     * @description Returns an `IOptional` describing the minimum element.
     * <p>Terminal Operation.</p>
     *
     * @return the `IOptional` containing the result
     */
    IOptional min();

    /**
     * @description Returns the arithmetic sum of values.
     * <p>Terminal Operation.</p>
     *
     * @return the sum of values
     */
    Integer sum();

    /**
     * @description Returns the arithmetic mean of values.
     * <p>Terminal Operation.</p>
     *
     * @return the `IOptional` containing the result
     */
    IOptional avg();

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the count of elements
     */
    Integer count();

    /**
     * @description Returns whether the count of elements is `0`.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
     */
    Boolean isEmpty();

    /**
     * @description Accumulates elements into a `List<Integer>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<Integer>` containing the collected elements
     */
    List<Integer> toList();

    /**
     * @description Accumulates elements into a `Set<Integer>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<Integer>` containing the collected elements
     */
    Set<Integer> toSet();
    //</editor-fold>
}
