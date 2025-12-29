/**
 * @description A sequence of `Long` elements supporting aggregate operations.
 *
 * @see IObjectEnumerable
 * @see ISObjectEnumerable
 * @see IIntEnumerable
 * @see IDoubleEnumerable
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 */
public interface ILongEnumerable extends Iterable<Long> {
    //<editor-fold desc="Iterator">
    /**
     * @description Returns an instance of an iterator for this enumerable.
     * <p>Terminal Operation.</p>
     *
     * @return the iterator
     */
    Iterator<Long> iterator();
    //</editor-fold>

    //<editor-fold desc="Sources">
    /**
     * @description Returns a new `ILongEnumerable` from the current
     * to which another `iterable` is appended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable append(Iterable<Long> iterable);

    /**
     * @description Returns a new `ILongEnumerable` from the current
     * to which another `iterable` is prepended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable prepend(Iterable<Long> iterable);
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `ILongEnumerable` as a set union
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable union(Iterable<Long> iterable);

    /**
     * @description Returns a new `ILongEnumerable` as a set intersection
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable intersect(Iterable<Long> iterable);

    /**
     * @description Returns a new `ILongEnumerable` as a set difference
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable except(Iterable<Long> iterable);

    /**
     * @description Returns a new `ILongEnumerable` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable distinct();

    /**
     * @description Returns a new `ILongEnumerable` with elements
     * that match `predicate`.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable filter(IPredicate predicate);

    /**
     * @description Returns a new `ILongEnumerable` that takes elements
     * while `predicate` returns `true`.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable take(IPredicate predicate);

    /**
     * @description Returns a new `ILongEnumerable` that drops elements
     * while `predicate` returns `true`, then takes the rest.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable drop(IPredicate predicate);

    /**
     * @description Returns a new `ILongEnumerable` without null elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable withoutNulls();

    /**
     * @description Returns a new `ILongEnumerable` with elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable mapTo(IOperator mapper);

    /**
     * @description Returns a new `IIntIterable` with elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IIntIterable`
     */
    IIntEnumerable mapToInt(IFunction mapper);

    /**
     * @description Returns a new `IDoubleIterable` with `Double` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IDoubleIterable`
     */
    IDoubleEnumerable mapToDouble(IFunction mapper);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping operator
     *
     * @return the new `ISObjectIterable`
     */
    ISObjectEnumerable mapToSObject(IFunction mapper);

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IObjectIterable`
     */
    IObjectEnumerable mapToObject(IFunction mapper);

    /**
     * @description Returns a new `ILongEnumerable` with elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Long>`
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable flatMapTo(IFunction mapper);

    /**
     * @description Returns an `ILongEnumerable` after performing the `consumer` action
     * on each element.
     * <p>Intermediate Operation.</p>
     *
     * @param consumer the action
     *
     * @return the `ILongEnumerable`
     */
    ILongEnumerable forEach(IConsumer consumer);

    /**
     * @description Returns a new `ILongEnumerable` with sorted elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable sort();

    /**
     * @description Returns a new `ILongEnumerable` with sorted elements
     * considering `order`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param order the sort order
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable sort(SortOrder order);

    /**
     * @description Returns a new `ILongEnumerable` with the first `lim` elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable lim(Integer lim);

    /**
     * @description Returns a new `ILongEnumerable` that skips the first `n` elements
     * and returns the remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable skip(Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    /**
     * @description Performs a reduction on `Long` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param identity the initial value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Long` result of the reduction
     */
    Long fold(Long identity, IBiOperator accumulator);

    /**
     * @description Performs a reduction on `Long` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @deprecated Use {@link #fold()} instead
     *
     * @param identity the initial value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Long` result of the reduction
     */
    Long reduce(Long identity, IBiOperator accumulator);

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
     * If `ILongEnumerable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean every(IPredicate predicate);

    /**
     * @description Returns whether some element matches `predicate`.
     * If `ILongEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean some(IPredicate predicate);

    /**
     * @description Returns whether no elements match `predicate`.
     * If `ILongEnumerable` is empty then `true` is returned.
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
    Long sum();

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
     * @description Accumulates elements into a `List<Long>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<Long>` containing the collected elements
     */
    List<Long> toList();

    /**
     * @description Accumulates elements into a `Set<Long>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<Long>` containing the collected elements
     */
    Set<Long> toSet();
    //</editor-fold>
}
