/**
 * @description A sequence of raw `Object` elements supporting aggregate operations.
 *
 * @see ISObjectEnumerable
 * @see IIntEnumerable
 * @see ILongEnumerable
 * @see IDoubleEnumerable
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 */
public interface IObjectEnumerable extends Iterable<Object> {
    //<editor-fold desc="Iterator">
    /**
     * @description Returns an instance of an iterator for this enumerable.
     * <p>Terminal Operation.</p>
     *
     * @return the iterator
     */
    Iterator<Object> iterator();
    //</editor-fold>

    //<editor-fold desc="Sources">
    /**
     * @description Returns a new `IObjectEnumerable` from the current
     * to which another `iterable` is appended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable append(Iterable<Object> iterable);

    /**
     * @description Returns a new `IObjectEnumerable` from the current
     * to which another `iterable` is prepended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable prepend(Iterable<Object> iterable);
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `IObjectEnumerable` as a set union
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable union(Iterable<Object> iterable);

    /**
     * @description Returns a new `IObjectEnumerable` as a set union
     * of the current and another `iterable` according to `classifier`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable union(Iterable<Object> iterable, IFunction classifier);

    /**
     * @description Returns a new `IObjectEnumerable` as a set intersection
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable intersect(Iterable<Object> iterable);

    /**
     * @description Returns a new `IObjectEnumerable` as a set intersection
     * of the current and another `iterable` according to `classifier`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable intersect(Iterable<Object> iterable, IFunction classifier);

    /**
     * @description Returns a new `IObjectEnumerable` as a set difference
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable except(Iterable<Object> iterable);

    /**
     * @description Returns a new `IObjectEnumerable` as a set difference
     * of the current and another `iterable` according to `classifier`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable except(Iterable<Object> iterable, IFunction classifier);

    /**
     * @description Returns a new `IObjectEnumerable` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable distinct();

    /**
     * @description Returns a new `IObjectEnumerable` with distinct elements
     * according to the `classifier` function.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param classifier the classifier function
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable distinct(IFunction classifier);

    /**
     * @description Returns a new `IObjectEnumerable` with elements
     * that match `predicate`.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable filter(IPredicate predicate);

    /**
     * @description Returns a new `IObjectEnumerable` that takes elements
     * while `predicate` returns `true`.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable take(IPredicate predicate);

    /**
     * @description Returns a new `IObjectEnumerable` that drops elements
     * while `predicate` returns `true`, then takes the rest.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable drop(IPredicate predicate);

    /**
     * @description Returns a new `IObjectEnumerable` without null elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable withoutNulls();

    /**
     * @description Returns a new `IObjectEnumerable` with elements
     * returned by the `mapper` function.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable mapTo(IOperator mapper);

    /**
     * @description Returns a new `IIntEnumerable` with elements
     * returned by the `mapper` function.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable mapToInt(IFunction mapper);

    /**
     * @description Returns a new `ILongEnumerable` with elements
     * returned by the `mapper` function.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable mapToLong(IFunction mapper);

    /**
     * @description Returns a new `IDoubleEnumerable` with elements
     * returned by the `mapper` function.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable mapToDouble(IFunction mapper);

    /**
     * @description Returns a new `ISObjectEnumerable` with elements
     * returned by the `mapper` function.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable mapToSObject(IFunction mapper);

    /**
     * @description Returns a new `IObjectEnumerable` with elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Object>`
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable flatMapTo(IFunction mapper);

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
    IIntEnumerable flatMapToInt(IFunction mapper);

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
    ILongEnumerable flatMapToLong(IFunction mapper);

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
    IDoubleEnumerable flatMapToDouble(IFunction mapper);

    /**
     * @description Returns a new `ISObjectEnumerable` with elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<SObject>`
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable flatMapToSObject(IFunction mapper);

    /**
     * @description Returns an `IObjectEnumerable` after performing the `consumer` action
     * on each element.
     * <p>Intermediate Interfering Operation.</p>
     *
     * @param consumer the action
     *
     * @return the `IObjectEnumerable`
     */
    IObjectEnumerable forEach(IConsumer consumer);

    /**
     * @description Returns a new `IObjectEnumerable` with sorted elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable sort();

    /**
     * @description Returns a new `IObjectEnumerable` with sorted elements
     * considering `order`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param order the sort order
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable sort(SortOrder order);

    /**
     * @description Returns a new `IObjectEnumerable` with sorted elements
     * according to `comparer`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param comparer the comparer
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable sort(IComparer comparer);

    /**
     * @description Returns a new `IObjectEnumerable` with the first `lim` elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable lim(Integer lim);

    /**
     * @description Returns a new `IObjectEnumerable` that skips the first `n` elements
     * and returns the remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable skip(Integer n);
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
     * @return the `Object` result of the reduction
     */
    Object reduce(Object identity, IBiOperator accumulator);

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
     * If `IObjectEnumerable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean every(IPredicate predicate);

    /**
     * @description Returns whether some element matches `predicate`.
     * If `IObjectEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean some(IPredicate predicate);

    /**
     * @description Returns whether no elements match `predicate`.
     * If `IObjectEnumerable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean none(IPredicate predicate);

    /**
     * @description Returns an `IOptional` describing the maximum element
     * according to `comparer`.
     * <p>Terminal Operation.</p>
     *
     * @param comparer the comparer
     *
     * @return the `IOptional` containing the result
     */
    IOptional max(IComparer comparer);

    /**
     * @description Returns an `IOptional` describing the minimum element
     * according to `comparer`.
     * <p>Terminal Operation.</p>
     *
     * @param comparer the comparer
     *
     * @return the `IOptional` containing the result
     */
    IOptional min(IComparer comparer);

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
     * @description Accumulates elements into a `List<Object>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<Object>` containing the collected elements
     */
    List<Object> toList();

    /**
     * @description Accumulates elements into a `List<?>` according to `elementType`.
     * <p>Terminal Operation.</p>
     *
     * @param elementType the element type argument of a list
     *
     * @return the `List<Object>` containing the enumerable elements, which can be cast to `List<T>`
     */
    List<Object> toList(Type elementType);

    /**
     * @description Accumulates elements into a `Set<Object>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<Object>` containing the collected elements
     */
    Set<Object> toSet();
    //</editor-fold>
}
