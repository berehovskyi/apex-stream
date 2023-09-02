/**
 * @description
 * @author Oleh Berehovskyi
 */
public interface INumberEnumerable<T> extends Iterable<T> {

    //<editor-fold desc="Sources">
    /**
     * @description Returns a new `IObjectIterable` from the current
     * to which another `iterable` is appended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IObjectIterable`
     */
    INumberEnumerable<T> append(Iterable<T> iterable);

    /**
     * @description Returns a new `IObjectIterable` from the current
     * to which another `iterable` is prepended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IObjectIterable`
     */
    INumberEnumerable<T> prepend(Iterable<T> iterable);
    //</editor-fold>


    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `IObjectIterable` as a set union
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IObjectIterable`
     */
    INumberEnumerable<T> union(Iterable<T> iterable);

    /**
     * @description Returns a new `IObjectIterable` as a set intersection
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IObjectIterable`
     */
    INumberEnumerable<T> intersect(Iterable<T> iterable);

    /**
     * @description Returns a new `IObjectIterable` as a set difference
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IObjectIterable`
     */
    INumberEnumerable<T> except(Iterable<T> iterable);

    /**
     * @description Returns a new `IObjectIterable` with distinct `Object` elements.
     * <p>Intermediate Operation.</p>
     *
     * @return the new `IObjectIterable`
     */
    INumberEnumerable<T> distinct();

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements
     * that match `predicate`.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IObjectIterable`
     */
    INumberEnumerable<T> filter(IPredicate predicate);

    /**
     * @description Returns a new `IObjectIterable` that takes `Object` elements
     * while `predicate` returns `true`.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IObjectIterable`
     */
    INumberEnumerable<T> take(IPredicate predicate);

    /**
     * @description Returns a new `IObjectIterable` that drops `Object` elements
     * while `predicate` returns `true`.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IObjectIterable`
     */
    INumberEnumerable<T> drop(IPredicate predicate);

    /**
     * @description Returns a new `IObjectIterable` without null elements.
     * <p>Intermediate Operation.</p>
     *
     * @return the new `IObjectIterable`
     */
    INumberEnumerable<T> withoutNulls();

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IObjectIterable`
     */
    INumberEnumerable<T> mapTo(IOperator mapper);

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<T>`
     *
     * @return the new `IObjectIterable`
     */
    INumberEnumerable<T> flatMapTo(IFunction mapper);

    /**
     * @description Returns a new `IObjectIterable` after performing `consumer` action
     * on each `SObject` element.
     * <p>Intermediate Interfering Operation.</p>
     *
     * @param consumer the action
     *
     * @return the new `IObjectIterable`
     */
    INumberEnumerable<T> forEach(IConsumer consumer);

    /**
     * @description Returns a new `IObjectIterable` with sorted `Object` elements.
     * <p>Intermediate Operation.</p>
     *
     * @return the new `IObjectIterable`
     */
    INumberEnumerable<T> sort();

    /**
     * @description Returns a new `IObjectIterable` with sorted `Object` elements
     * considering `order`.
     * <p>Intermediate Operation.</p>
     *
     * @param order the sort order
     *
     * @return the new `IObjectIterable`
     */
    INumberEnumerable<T> sort(SortOrder order);

    /**
     * @description Returns a new `IObjectIterable` with first `lim` `Object` elements.
     * <p>Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the new `IObjectIterable`
     */
    INumberEnumerable<T> lim(Integer lim);

    /**
     * @description Returns a new `IObjectIterable` that skips first `n` `Object` elements
     * and returns remaining elements.
     * <p>Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the new `IObjectIterable`
     */
    INumberEnumerable<T> skip(Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    /**
     * @description Performs a reduction on `Object` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Object` result of the reduction
     */
    T reduce(T identity, IBiOperator accumulator);

    /**
     * @description Performs a reduction on `Object` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `Optional` describing the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Optional` result of the reduction
     */
    IOptional reduce(IBiOperator accumulator);

    /**
     * @description Performs a mutable reduction operation on `Object` elements, collecting elements
     * to a container using `collector`.
     * <p>Terminal Operation.</p>
     *
     * @param collector the collector
     *
     * @return the `Object` result of the collection
     */
    Object collect(ICollector collector);

    /**
     * @description Returns an `Optional` describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `Optional`
     */
    IOptional find(IPredicate predicate);

    /**
     * @description Returns whether all `Object` elements match `predicate`.
     * If `IObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean every(IPredicate predicate);

    /**
     * @description Returns whether some `Object` element matches `predicate`.
     * If `IObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean some(IPredicate predicate);

    /**
     * @description Returns whether no `Object` elements match `predicate`.
     * If `IObjectIterable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean none(IPredicate predicate);
    
    /**
     * @description Returns an `OptionalDouble` describing the maximum `Number` element.
     * <p>Terminal Operation.</p>
     *
     * @return the `IOptional` describing the result
     */
    IOptional max();

    /**
     * @description Returns an `OptionalDouble` describing the minimum `Number` element.
     * <p>Terminal Operation.</p>
     *
     * @return the `IOptional` describing the result
     */
    IOptional min();

    /**
     * @description Returns the arithmetic sum of `Number` values.
     * <p>Terminal Operation.</p>
     *
     * @return the sum of elements
     */
    Object sum();

    /**
     * @description Returns the arithmetic mean of `Number` values.
     * <p>Terminal Operation.</p>
     *
     * @return the `OptionalDouble` describing the result
     */
    IOptional avg();

    /**
 * @description Returns the count of `Object` elements.
 * <p>Terminal Operation.</p>
 *
 * @return the count of `Object` elements
 */
    Integer count();

    /**
     * @description Returns the count of `Object` elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
     */
    Boolean isEmpty();

    /**
     * @description Accumulates `SObject` elements into a `List<Object>`.
     * <p>Terminal Operation.</p>
     *
     * @return the List<Object> containing the iterable elements
     */
    List<Object> toList();

    /**
     * @description Accumulates `SObject` elements into a `Set<Object>`.
     * <p>Terminal Operation.</p>
     *
     * @return the Set<Object> containing the iterable elements
     */
    Object toSet();

}
