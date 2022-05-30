/**
 * @author O. Berehovskyi
 * @description A sequence of `SObject` elements core supporting aggregate operations.
 * @group Iterables
 * @see ISObjectIterable
 */
public interface ISObjectBaseIterable extends Iterable<SObject> {

    //<editor-fold desc="Sources">
    /**
     * @description Returns a new `ISObjectIterable` from the current
     * to which another `iterable` is appended.
     * <p>Intermediate Operation.</p>
     * @param iterable the other iterable
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable append(Iterable<SObject> iterable);

    /**
     * @description Returns a new `ISObjectIterable` from the current
     * to which another `iterable` is prepended.
     * <p>Intermediate Operation.</p>
     * @param iterable the other iterable
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable prepend(Iterable<SObject> iterable);
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `ISObjectIterable` as a set union 
     * of the current and another iterables.
     * @param iterable the other iterable
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable union(Iterable<SObject> iterable);

    /**
     * @description Returns a new `ISObjectIterable` as a set union 
     * of the current and another iterables according to `classifier` function.
     * @param iterable the other iterable
     * @param classifier the classifier function
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable union(Iterable<SObject> iterable, ISObjectFunction classifier);

    /**
     * @description Returns a new `ISObjectIterable` as a set intersection 
     * of the current and another iterables.
     * @param iterable the other iterable
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable intersect(Iterable<SObject> iterable);

    /**
     * @description Returns a new `ISObjectIterable` as a set intersection 
     * of the current and another iterables according to `classifier` function.
     * @param iterable the other iterable
     * @param classifier the classifier function
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable intersect(Iterable<SObject> iterable, ISObjectFunction classifier);

    /**
     * @description Returns a new `ISObjectIterable` as a set difference 
     * of the current and another iterables.
     * @param iterable the other iterable
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable except(Iterable<SObject> iterable);

    /**
     * @description Returns a new `ISObjectIterable` as a set difference 
     * of the current and another iterables according to `classifier` function.
     * @param iterable the other iterable
     * @param classifier the classifier function
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable except(Iterable<SObject> iterable, ISObjectFunction classifier);
    
    /**
     * @description Returns a new `ISObjectIterable` with distinct `SObject` elements.
     * <p>Intermediate Operation.</p>
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable distinct();
    
    /**
     * @description Returns a new `ISObjectIterable` with distinct `SObject` elements
     * according to `classifier` function.
     * <p>Intermediate Operation.</p>
     * @param classifier the classifier function
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable distinct(ISObjectFunction classifier);
    
    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * that match `predicate`.
     * <p>Intermediate Operation.</p>
     * @param predicate the predicate
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable filter(ISObjectPredicate predicate);

    /**
     * @description Returns a new `ISObjectIterable` that takes `SObject` elements
     * while `predicate` returns `true`.
     * <p>Intermediate Operation.</p>
     * @param predicate the predicate
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable take(ISObjectPredicate predicate);

    /**
     * @description Returns a new `ISObjectIterable` that drops `SObject` elements
     * while `predicate` returns `true`.
     * <p>Intermediate Operation.</p>
     * @param predicate the predicate
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable drop(ISObjectPredicate predicate);

    /**
     * @description Returns a new `ISObjectIterable` without null elements.
     * <p>Intermediate Operation.</p>
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable withoutNulls();

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping operator
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable mapTo(ISObjectUnaryOperator mapper);

    /**
     * @description Returns a new `IIntIterable` with `Integer` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function
     * @return the new `IIntIterable`
     */
    IIntIterable mapToInt(ISObjectToIntFunction mapper);

    /**
     * @description Returns a new `ILongIterable` with `Long` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function
     * @return the new `ILongIterable`
     */
    ILongIterable mapToLong(ISObjectToLongFunction mapper);

    /**
     * @description Returns a new `IDoubleIterable` with `Double` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable mapToDouble(ISObjectToDoubleFunction mapper);

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function
     * @return the new `IObjectIterable`
     */
    IObjectIterable mapToObject(ISObjectFunction mapper);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements as a result of 
     * replacing each element with the contents of a mapped iterable created by applying 
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function which must produce `Iterable<SObject>`
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable flatMapTo(ISObjectFunction mapper);

    /**
     * @description Returns a new `IIntIterable` with `Integer` elements as a result of 
     * replacing each element with the contents of a mapped iterable created by applying 
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function which must produce `Iterable<Integer>`
     * @return the new `IIntIterable`
     */
    IIntIterable flatMapToInt(ISObjectFunction mapper);

    /**
     * @description Returns a new `ILongIterable` with `Long` elements as a result of 
     * replacing each element with the contents of a mapped iterable created by applying 
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function which must produce `Iterable<Long>`
     * @return the new `ILongIterable`
     */
    ILongIterable flatMapToLong(ISObjectFunction mapper);

    /**
     * @description Returns a new `IDoubleIterable` with `Double` elements as a result of 
     * replacing each element with the contents of a mapped iterable created by applying 
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function which must produce `Iterable<Double>`
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable flatMapToDouble(ISObjectFunction mapper);

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements as a result of 
     * replacing each element with the contents of a mapped iterable created by applying 
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function which must produce `Iterable<Object>`
     * @return the new `IObjectIterable`
     */
    IObjectIterable flatMapToObject(ISObjectFunction mapper);

    /**
     * @description Returns a new `ISObjectIterable` after performing `consumer` action
     * on each `SObject` element.
     * <p>Intermediate Interfering Operation.</p>
     * @param consumer the action
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable forEach(ISObjectConsumer consumer);

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements in ascending order.
     * <p>Intermediate Operation.</p>
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable sort();

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * according to `comparator`.
     * <p>Intermediate Operation.</p>
     * @param comparator the comparator
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable sort(ISObjectComparator comparator);
    
    /**
     * @description Returns a new `ISObjectIterable` with first `lim` `SObject` elements.
     * <p>Intermediate Operation.</p>
     * @param lim the number of elements to limit
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable lim(Integer lim);

    /**
     * @description Returns a new `ISObjectIterable` that skips first `n` `SObject` elements
     * and returns remaining elements.
     * <p>Intermediate Operation.</p>
     * @param n the number of elements to skip
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable skip(Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    /**
     * @description Performs a reduction on `SObject` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `SObject` result of the reduction
     */
    SObject reduce(SObject identity, ISObjectBinaryOperator accumulator);

    /**
     * @description Performs a reduction on `SObject` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `OptionalSObject` describing the reduced value.
     * <p>Terminal Operation.</p>
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `OptionalSObject` result of the reduction
     */
    OptionalSObject reduce(ISObjectBinaryOperator accumulator);

    /**
     * @description Performs a mutable reduction operation on `SObject` elements, collecting elements
     * to a container returned by `supplier` by applying `accumulator` function.
     * <p>Terminal Operation.</p>
     * @param supplier the function that returns a mutable result container
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `Object` result of the collection
     */
    Object collect(ISupplier supplier, IObjectSObjectConsumer accumulator);

    /**
     * @description Performs a mutable reduction operation on `SObject` elements, collecting elements
     * to a container using `collector`.
     * <p>Terminal Operation.</p>
     * @param collector the collector
     * @return the `Object` result of the collection
     */
    Object collect(ISObjectCollector collector);

    /**
     * @description Returns an `OptionalSObject` describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param predicate the predicate
     * @return the `OptionalSObject`
     */
    OptionalSObject find(ISObjectPredicate predicate);

    /**
     * @description Returns whether all `SObject` elements match `predicate`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param predicate the predicate
     * @return `true` or `false`
     */
    Boolean every(ISObjectPredicate predicate);

    /**
     * @description Returns whether some `SObject` element matches `predicate`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param predicate the predicate
     * @return `true` or `false`
     */
    Boolean some(ISObjectPredicate predicate);

    /**
     * @description Returns whether no `SObject` elements match `predicate`.
     * If `ISObjectIterable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param predicate the predicate
     * @return `true` or `false`
     */
    Boolean none(ISObjectPredicate predicate);

    /**
     * @description Returns an `OptionalSObject` describing the maximum `SObject` element
     * according to `comparator`.
     * <p>Terminal Operation.</p>
     * @param comparator the comparator
     * @return the `OptionalSObject` describing the result
     */
    OptionalSObject max(ISObjectComparator comparator);

    /**
     * @description Returns an `OptionalSObject` describing the minimum `SObject` element
     * according to `comparator`.
     * <p>Terminal Operation.</p>
     * @param comparator the comparator
     * @return the `OptionalSObject` describing the result
     */
    OptionalSObject min(ISObjectComparator comparator);

    /**
     * @description Returns the arithmetic sum of values returned by `classifier` function.
     * <p>Terminal Operation.</p>
     * @param classifier the classifier function
     * @return the sum of elements returned by function
     */
    Double sum(ISObjectToDoubleFunction classifier);

    /**
     * @description Returns the arithmetic mean of values returned by `classifier` function.
     * <p>Terminal Operation.</p>
     * @param classifier the classifier function
     * @return the arithmetic mean of elements returned by function
     */
    OptionalDouble avg(ISObjectToDoubleFunction classifier);

    /**
     * @description Returns the count of `SObject` elements.
     * <p>Terminal Operation.</p>
     * @return the count of `SObject` elements
     */
    Integer count();

    /**
     * @description Returns the count of `SObject` elements is 0.
     * <p>Terminal Operation.</p>
     * @return `true` or `false`
     */
    Boolean isEmpty();

    /**
     * @description Accumulates `SObject` elements into a `List<SObject>`.
     * <p>Terminal Operation.</p>
     * @return the `List<SObject>` containing the iterable elements
     */
    List<SObject> toList();

    /**
     * @description Accumulates `SObject` elements into a `Set<SObject>`.
     * <p>Terminal Operation.</p>
     * @return the `Set<SObject>` containing the iterable elements
     */
    Set<SObject> toSet();
    //</editor-fold>
    
}
