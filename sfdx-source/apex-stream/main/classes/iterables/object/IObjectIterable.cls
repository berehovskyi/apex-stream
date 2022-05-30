/**
 * @author O. Berehovskyi
 * @group Iterables
 * @description A sequence of `SObject` elements supporting aggregate operations.
 * @see ISObjectIterable
 * @see IIntIterable
 * @see ILongIterable
 * @see IDoubleIterable
 */
public interface IObjectIterable extends Iterable<Object> {

    //<editor-fold desc="Sources">
    /**
     * @description Returns a new `IObjectIterable` from the current
     * to which another `iterable` is appended.
     * <p>Intermediate Operation.</p>
     * @param iterable the other iterable
     * @return the new `IObjectIterable`
     */
    IObjectIterable append(Iterable<Object> iterable);

    /**
     * @description Returns a new `IObjectIterable` from the current
     * to which another `iterable` is prepended.
     * <p>Intermediate Operation.</p>
     * @param iterable the other iterable
     * @return the new `IObjectIterable`
     */
    IObjectIterable prepend(Iterable<Object> iterable);
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `IObjectIterable` as a set union 
     * of the current and another iterables.
     * @param iterable the other iterable
     * @return the new `IObjectIterable`
     */
    IObjectIterable union(Iterable<Object> iterable);

    /**
     * @description Returns a new `IObjectIterable` as a set union 
     * of the current and another iterables according to `classifier`.
     * @param iterable the other iterable
     * @param classifier the classifier function
     * @return the new `IObjectIterable`
     */
    IObjectIterable union(Iterable<Object> iterable, IFunction classifier);

    /**
     * @description Returns a new `IObjectIterable` as a set intersection 
     * of the current and another iterables.
     * @param iterable the other iterable
     * @return the new `IObjectIterable`
     */
    IObjectIterable intersect(Iterable<Object> iterable);

    /**
     * @description Returns a new `IObjectIterable` as a set intersection 
     * of the current and another iterables according to `classifier`.
     * @param iterable the other iterable
     * @param classifier the classifier function
     * @return the new `IObjectIterable`
     */
    IObjectIterable intersect(Iterable<Object> iterable, IFunction classifier);

    /**
     * @description Returns a new `IObjectIterable` as a set difference 
     * of the current and another iterables.
     * @param iterable the other iterable
     * @return the new `IObjectIterable`
     */
    IObjectIterable except(Iterable<Object> iterable);

    /**
     * @description Returns a new `IObjectIterable` as a set difference 
     * of the current and another iterables according to `classifier`.
     * @param iterable the other iterable
     * @param classifier the classifier function
     * @return the new `IObjectIterable`
     */
    IObjectIterable except(Iterable<Object> iterable, IFunction classifier);
    
    /**
     * @description Returns a new `IObjectIterable` with distinct `Object` elements.
     * <p>Intermediate Operation.</p>
     * @return the new `IObjectIterable`
     */
    IObjectIterable distinct();

    /**
     * @description Returns a new `IObjectIterable` with distinct `Object` elements
     * according to `classifier` function.
     * <p>Intermediate Operation.</p>
     * @param classifier the classifier function
     * @return the new `IObjectIterable`
     */
    IObjectIterable distinct(IFunction classifier);
    
    /**
     * @description Returns a new `IObjectIterable` with `Object` elements
     * that match `predicate`.
     * <p>Intermediate Operation.</p>
     * @param predicate the predicate
     * @return the new `IObjectIterable`
     */
    IObjectIterable filter(IPredicate predicate);

    /**
     * @description Returns a new `IObjectIterable` that takes `Object` elements
     * while `predicate` returns `true`.
     * <p>Intermediate Operation.</p>
     * @param predicate the predicate
     * @return the new `IObjectIterable`
     */
    IObjectIterable take(IPredicate predicate);

    /**
     * @description Returns a new `IObjectIterable` that drops `Object` elements
     * while `predicate` returns `true`.
     * <p>Intermediate Operation.</p>
     * @param predicate the predicate
     * @return the new `IObjectIterable`
     */
    IObjectIterable drop(IPredicate predicate);

    /**
     * @description Returns a new `IObjectIterable` without null elements.
     * <p>Intermediate Operation.</p>
     * @return the new `IObjectIterable`
     */
    IObjectIterable withoutNulls();

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function
     * @return the new `IObjectIterable`
     */
    IObjectIterable mapTo(IFunction mapper);

    /**
     * @description Returns a new `IIntIterable` with `Integer` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function
     * @return the new `IIntIterable`
     */
    IIntIterable mapToInt(IToIntFunction mapper);

    /**
     * @description Returns a new `ILongIterable` with `Long` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function
     * @return the new `ILongIterable`
     */
    ILongIterable mapToLong(IToLongFunction mapper);

    /**
     * @description Returns a new `IDoubleIterable` with `Double` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable mapToDouble(IToDoubleFunction mapper);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping operator
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable mapToSObject(IToSObjectFunction mapper);

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements as a result of 
     * replacing each element with the contents of a mapped iterable created by applying 
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function which must produce `Iterable<Object>`
     * @return the new `IObjectIterable`
     */
    IObjectIterable flatMapTo(IFunction mapper);

    /**
     * @description Returns a new `IIntIterable` with `Integer` elements as a result of 
     * replacing each element with the contents of a mapped iterable created by applying 
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function which must produce `Iterable<Integer>`
     * @return the new `IIntIterable`
     */
    IIntIterable flatMapToInt(IFunction mapper);

    /**
     * @description Returns a new `ILongIterable` with `Long` elements as a result of 
     * replacing each element with the contents of a mapped iterable created by applying 
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function which must produce `Iterable<Long>`
     * @return the new `ILongIterable`
     */
    ILongIterable flatMapToLong(IFunction mapper);

    /**
     * @description Returns a new `IDoubleIterable` with `Double` elements as a result of 
     * replacing each element with the contents of a mapped iterable created by applying 
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function which must produce `Iterable<Double>`
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable flatMapToDouble(IFunction mapper);

    /**
     * @description Returns a new `IObjectIterable` with `SObject` elements as a result of 
     * replacing each element with the contents of a mapped iterable created by applying 
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function which must produce `Iterable<SObject>`
     * @return the new `IObjectIterable`
     */
    ISObjectIterable flatMapToSObject(IFunction mapper);

    /**
     * @description Returns a new `IObjectIterable` after performing `consumer` action
     * on each `SObject` element.
     * <p>Intermediate Interfering Operation.</p>
     * @param consumer the action
     * @return the new `IObjectIterable`
     */
    IObjectIterable forEach(IConsumer consumer);

    /**
     * @description Returns a new `IObjectIterable` with sorted `Object` elements.
     * <p>Intermediate Operation.</p>
     * @return the new `IObjectIterable`
     */
    IObjectIterable sort();

    /**
     * @description Returns a new `IObjectIterable` with sorted `Object` elements
     * considering `order`.
     * <p>Intermediate Operation.</p>
     * @return the new `IObjectIterable`
     */
    IObjectIterable sort(SortOrder order);

    /**
     * @description Returns a new `IObjectIterable` with sorted `Object` elements
     * according to `comparator`.
     * <p>Intermediate Operation.</p>
     * @param comparator the comparator
     * @return the new `IObjectIterable`
     */
    IObjectIterable sort(IComparator comparator);

    /**
     * @description Returns a new `IObjectIterable` with first `lim` `Object` elements.
     * <p>Intermediate Operation.</p>
     * @param lim the number of elements to limit
     * @return the new `IObjectIterable`
     */
    IObjectIterable lim(Integer lim);

    /**
     * @description Returns a new `IObjectIterable` that skips first `n` `Object` elements
     * and returns remaining elements.
     * <p>Intermediate Operation.</p>
     * @param n the number of elements to skip
     * @return the new `IObjectIterable`
     */
    IObjectIterable skip(Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    /**
     * @description Performs a reduction on `Object` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `Object` result of the reduction
     */
    Object reduce(Object identity, IBinaryOperator accumulator);

    /**
     * @description Performs a reduction on `Object` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `Optional` describing the reduced value.
     * <p>Terminal Operation.</p>
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `Optional` result of the reduction
     */
    Optional reduce(IBinaryOperator accumulator);

    /**
     * @description Performs a mutable reduction operation on `Object` elements, collecting elements
     * to a container returned by `supplier` by applying `accumulator` function.
     * <p>Terminal Operation.</p>
     * @param supplier the function that returns a mutable result container
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `Object` result of the collection
     */
    Object collect(ISupplier supplier, IBiConsumer accumulator);

    /**
     * @description Performs a mutable reduction operation on `Object` elements, collecting elements
     * to a container using `collector`.
     * <p>Terminal Operation.</p>
     * @param collector the collector
     * @return the `Object` result of the collection
     */
    Object collect(ICollector collector);

    /**
     * @description Returns an `Optional` describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param predicate the predicate
     * @return the `Optional`
     */
    Optional find(IPredicate predicate);

    /**
     * @description Returns whether all `Object` elements match `predicate`.
     * If `IObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param predicate the predicate
     * @return `true` or `false`
     */
    Boolean every(IPredicate predicate);

    /**
     * @description Returns whether some `Object` element matches `predicate`.
     * If `IObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param predicate the predicate
     * @return `true` or `false`
     */
    Boolean some(IPredicate predicate);

    /**
     * @description Returns whether no `Object` elements match `predicate`.
     * If `IObjectIterable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param predicate the predicate
     * @return `true` or `false`
     */
    Boolean none(IPredicate predicate);

    /**
     * @description Returns an `Optional` describing the maximum `Object` element
     * according to `comparator`.
     * <p>Terminal Operation.</p>
     * @param comparator the comparator
     * @return the `Optional` describing the result
     */
    Optional max(IComparator comparator);

    /**
     * @description Returns an `Optional` describing the minimum `Object` element
     * according to `comparator`.
     * <p>Terminal Operation.</p>
     * @param comparator the comparator
     * @return the `Optional` describing the result
     */
    Optional min(IComparator comparator);

    /**
     * @description Returns the count of `Object` elements.
     * <p>Terminal Operation.</p>
     * @return the count of `Object` elements
     */
    Integer count();

    /**
     * @description Returns the count of `Object` elements is 0.
     * <p>Terminal Operation.</p>
     * @return `true` or `false`
     */
    Boolean isEmpty();

    /**
     * @description Accumulates `SObject` elements into a `List<Object>`.
     * <p>Terminal Operation.</p>
     * @return the List<Object> containing the iterable elements
     */
    List<Object> toList();

    /**
     * @description Accumulates `SObject` elements into a `List<T>`.
     * <p>Terminal Operation.</p>
     * @param t the type argument of List
     * @return the List<T> containing the iterable elements
     */
    List<Object> toList(Type t);

    /**
     * @description Accumulates `SObject` elements into a `Set<Object>`.
     * <p>Terminal Operation.</p>
     * @return the Set<Object> containing the iterable elements
     */
    Set<Object> toSet();
    //</editor-fold>

}
