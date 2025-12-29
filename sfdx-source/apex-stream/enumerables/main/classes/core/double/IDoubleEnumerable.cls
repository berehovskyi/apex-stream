/**
 * @description A sequence of `Double` elements supporting aggregate operations.
 *
 * @see IObjectEnumerable
 * @see ISObjectEnumerable
 * @see IIntEnumerable
 * @see ILongEnumerable
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 */
public interface IDoubleEnumerable extends Iterable<Double> {
    //<editor-fold desc="Iterator">
    /**
     * @description Returns an instance of an iterator for this enumerable.
     * <p>Terminal Operation.</p>
     *
     * @return the iterator
     */
    Iterator<Double> iterator();
    //</editor-fold>

    //<editor-fold desc="Sources">
    /**
     * @description Returns a new `IDoubleEnumerable` from the current
     * to which another `iterable` is appended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable append(Iterable<Double> iterable);

    /**
     * @description Returns a new `IDoubleEnumerable` from the current
     * to which another `iterable` is prepended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable prepend(Iterable<Double> iterable);
    //</editor-fold>

    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `IDoubleEnumerable` as a set union
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable union(Iterable<Double> iterable);

    /**
     * @description Returns a new `IDoubleEnumerable` as a set intersection
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable intersect(Iterable<Double> iterable);

    /**
     * @description Returns a new `IDoubleEnumerable` as a set difference
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable except(Iterable<Double> iterable);

    /**
     * @description Returns a new `IDoubleEnumerable` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable distinct();

    /**
     * @description Returns a new `IDoubleEnumerable` with elements
     * that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable filter(IPredicate predicate);

    /**
     * @description Returns a new `IDoubleEnumerable` that takes elements
     * while `predicate` returns `true`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable take(IPredicate predicate);

    /**
     * @description Returns a new `IDoubleEnumerable` that drops elements
     * while `predicate` returns `true`, then takes the rest.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable drop(IPredicate predicate);

    /**
     * @description Returns a new `IDoubleEnumerable` without null elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable withoutNulls();

    /**
     * @description Returns a new `IDoubleEnumerable` with elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable mapTo(IOperator mapper);

    /**
     * @description Returns a new `IIntEnumerable` with elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable mapToInt(IFunction mapper);

    /**
     * @description Returns a new `ILongEnumerable` with elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable mapToLong(IFunction mapper);

    /**
     * @description Returns a new `ISObjectEnumerable` with elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping operator
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable mapToSObject(IFunction mapper);

    /**
     * @description Returns a new `IObjectEnumerable` with elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable mapToObject(IFunction mapper);

    /**
     * @description Returns a new `IDoubleEnumerable` with elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Double>`
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable flatMapTo(IFunction mapper);

    /**
     * @description Returns an `IDoubleEnumerable` after performing the `consumer` action
     * on each element.
     * <p>Intermediate Operation.</p>
     *
     * @param consumer the action
     *
     * @return the `IDoubleEnumerable`
     */
    IDoubleEnumerable forEach(IConsumer consumer);

    /**
     * @description Returns a new `IDoubleEnumerable` with sorted elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable sort();

    /**
     * @description Returns a new `IDoubleEnumerable` with sorted elements
     * considering `order`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param order the sort order
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable sort(SortOrder order);

    /**
     * @description Returns a new `IDoubleEnumerable` with the first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable lim(Integer lim);

    /**
     * @description Returns a new `IDoubleEnumerable` that skips the first `n` elements
     * and returns the remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable skip(Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    /**
     * @description Performs a reduction on elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param identity the initial value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Double` result of the reduction
     */
    Double fold(Double identity, IBiOperator accumulator);

    /**
     * @description Performs a reduction on elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @deprecated Use {@link #fold()} instead
     *
     * @param identity the initial value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Double` result of the reduction
     */
    Double reduce(Double identity, IBiOperator accumulator);

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
     * If `IDoubleEnumerable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean every(IPredicate predicate);

    /**
     * @description Returns whether some element matches `predicate`.
     * If `IDoubleEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean some(IPredicate predicate);

    /**
     * @description Returns whether no elements match `predicate`.
     * If `IDoubleEnumerable` is empty then `true` is returned.
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
    Double sum();

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
     * @description Accumulates elements into a `List<Double>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<Double>` containing the collected elements
     */
    List<Double> toList();

    /**
     * @description Accumulates elements into a `Set<Double>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<Double>` containing the collected elements
     */
    Set<Double> toSet();
    //</editor-fold>
}
