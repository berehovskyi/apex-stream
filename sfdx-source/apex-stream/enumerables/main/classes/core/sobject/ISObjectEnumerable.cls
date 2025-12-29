/**
 * @description A sequence of `SObject` elements supporting aggregate operations.
 *
 * @see IObjectEnumerable
 * @see IIntEnumerable
 * @see ILongEnumerable
 * @see IDoubleEnumerable
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 */
public interface ISObjectEnumerable extends Iterable<SObject> {
    //<editor-fold desc="Iterator">
    /**
     * @description Returns an instance of an iterator for this enumerable.
     * <p>Terminal Operation.</p>
     *
     * @return the iterator
     */
    Iterator<SObject> iterator();
    //</editor-fold>

    //<editor-fold desc="Sources">
    /**
     * @description Returns a new `ISObjectEnumerable` from the current
     * to which another `iterable` is appended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable append(Iterable<SObject> iterable);

    /**
     * @description Returns a new `ISObjectEnumerable` from the current
     * to which another `iterable` is prepended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable prepend(Iterable<SObject> iterable);
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `ISObjectEnumerable` as a set union
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable union(Iterable<SObject> iterable);

    /**
     * @description Returns a new `ISObjectEnumerable` as a set union
     * of the current and another `iterable` according to `classifier`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable union(Iterable<SObject> iterable, IFunction classifier);

    /**
     * @description Returns a new `ISObjectEnumerable` as a set union
     * of the current and another `iterable` according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param field the field
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable union(Iterable<SObject> iterable, String field);

    /**
     * @description Returns a new `ISObjectEnumerable` as a set union
     * of the current and another `iterable` according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param field the field
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable union(Iterable<SObject> iterable, SObjectField field);

    /**
     * @description Returns a new `ISObjectEnumerable` as a set intersection
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable intersect(Iterable<SObject> iterable);

    /**
     * @description Returns a new `ISObjectEnumerable` as a set intersection
     * of the current and another `iterable` according to `classifier`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable intersect(Iterable<SObject> iterable, IFunction classifier);

    /**
     * @description Returns a new `ISObjectEnumerable` as a set intersection
     * of the current and another `iterable` according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param field the field
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable intersect(Iterable<SObject> iterable, String field);

    /**
     * @description Returns a new `ISObjectEnumerable` as a set intersection
     * of the current and another `iterable` according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param field the field
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable intersect(Iterable<SObject> iterable, SObjectField field);

    /**
     * @description Returns a new `ISObjectEnumerable` as a set difference
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable except(Iterable<SObject> iterable);

    /**
     * @description Returns a new `ISObjectEnumerable` as a set difference
     * of the current and another `iterable` according to `classifier`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable except(Iterable<SObject> iterable, IFunction classifier);

    /**
     * @description Returns a new `ISObjectEnumerable` as a set difference
     * of the current and another `iterable` according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param field the field
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable except(Iterable<SObject> iterable, String field);

    /**
     * @description Returns a new `ISObjectEnumerable` as a set difference
     * of the current and another `iterable` according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param field the field
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable except(Iterable<SObject> iterable, SObjectField field);

    /**
     * @description Returns a new `ISObjectEnumerable` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable distinct();

    /**
     * @description Returns a new `ISObjectEnumerable` with distinct elements
     * according to `classifier` function.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param classifier the classifier function
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable distinct(IFunction classifier);

    /**
     * @description Returns a new `ISObjectEnumerable` with distinct elements
     * according to `field`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable distinct(String field);

    /**
     * @description Returns a new `ISObjectEnumerable` with distinct elements
     * according to `field`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable distinct(SObjectField field);

    /**
     * @description Returns a new `ISObjectEnumerable` with elements
     * that match `predicate`.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable filter(IPredicate predicate);

    /**
     * @description Returns a new `ISObjectEnumerable` with elements
     * that have `field`'s value.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable filter(String field, Object value);

    /**
     * @description Returns a new `ISObjectEnumerable` with elements
     * that have `field`'s value.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable filter(SObjectField field, Object value);

    /**
     * @description Returns a new `ISObjectEnumerable` that takes elements
     * while `predicate` returns `true`.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable take(IPredicate predicate);

    /**
     * @description Returns a new `ISObjectEnumerable` that takes elements
     * while `field` equals `value`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable take(String field, Object value);

    /**
     * @description Returns a new `ISObjectEnumerable` that takes elements
     * while `field` equals `value`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable take(SObjectField field, Object value);

    /**
     * @description Returns a new `ISObjectEnumerable` that drops elements
     * while `predicate` returns `true`, then takes the rest.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable drop(IPredicate predicate);

    /**
     * @description Returns a new `ISObjectEnumerable` that drops elements
     * while `field` equals `value`, then takes the rest.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable drop(String field, Object value);

    /**
     * @description Returns a new `ISObjectEnumerable` that drops elements
     * while `field` equals `value`, then takes the rest.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable drop(SObjectField field, Object value);

    /**
     * @description Returns a new `ISObjectEnumerable` without null elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable withoutNulls();

    /**
     * @description Returns a new `ISObjectEnumerable` with elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable mapTo(IOperator mapper);

    /**
     * @description Returns a new `ISObjectEnumerable` with elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the parent reference field
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable mapTo(String field);

    /**
     * @description Returns a new `ISObjectEnumerable` with elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the parent reference field
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable mapTo(SObjectField field);

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
     * @description Returns a new `IIntEnumerable` with elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable mapToInt(String field);

    /**
     * @description Returns a new `IIntEnumerable` with elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `IIntEnumerable`
     */
    IIntEnumerable mapToInt(SObjectField field);

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
     * @description Returns a new `ILongEnumerable` with elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable mapToLong(String field);

    /**
     * @description Returns a new `ILongEnumerable` with elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `ILongEnumerable`
     */
    ILongEnumerable mapToLong(SObjectField field);

    /**
     * @description Returns a new `IDoubleEnumerable` with elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable mapToDouble(IFunction mapper);

    /**
     * @description Returns a new `IDoubleEnumerable` with elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable mapToDouble(String field);

    /**
     * @description Returns a new `IDoubleEnumerable` with elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `IDoubleEnumerable`
     */
    IDoubleEnumerable mapToDouble(SObjectField field);

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
     * @description Returns a new `IObjectEnumerable` with elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable mapToObject(String field);

    /**
     * @description Returns a new `IObjectEnumerable` with elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable mapToObject(SObjectField field);

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
    ISObjectEnumerable flatMapTo(IFunction mapper);

    /**
     * @description Returns a new `ISObjectEnumerable` with elements as a result of
     * replacing each element with the contents of a mapped iterable
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the child relationship field
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable flatMapTo(String field);

    /**
     * @description Returns a new `ISObjectEnumerable` with elements as a result of
     * replacing each element with the contents of a mapped iterable
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the child relationship field
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable flatMapTo(SObjectField field);

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
     * @description Returns a new `IObjectEnumerable` with elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Object>`
     *
     * @return the new `IObjectEnumerable`
     */
    IObjectEnumerable flatMapToObject(IFunction mapper);

    /**
     * @description Returns an `ISObjectEnumerable` after performing `consumer` action
     * on each element.
     * <p>Intermediate Interfering Operation.</p>
     *
     * @param consumer the action
     *
     * @return the `ISObjectEnumerable`
     */
    ISObjectEnumerable forEach(IConsumer consumer);

    /**
     * @description Returns an `ISObjectEnumerable` after setting the `value` for `field`
     * on each element.
     * <p>Intermediate Interfering Operation.</p>
     *
     * @param field the field
     * @param value the value
     *
     * @return the `ISObjectEnumerable`
     */
    ISObjectEnumerable forEach(String field, Object value);

    /**
     * @description Returns an `ISObjectEnumerable` after setting the `value` for `field`
     * on each element.
     * <p>Intermediate Interfering Operation.</p>
     *
     * @param field the field
     * @param value the value
     *
     * @return the `ISObjectEnumerable`
     */
    ISObjectEnumerable forEach(SObjectField field, Object value);

    /**
     * @description Returns a new `ISObjectEnumerable` with sorted elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable sort();

    /**
     * @description Returns a new `ISObjectEnumerable` with sorted elements
     * according to `comparer`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param comparer the comparer
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable sort(IComparer comparer);

    /**
     * @description Returns a new `ISObjectEnumerable` with sorted elements
     * considering `order`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param order the sort order
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable sort(SortOrder order);

    /**
     * @description Returns a new `ISObjectEnumerable` with sorted elements
     * according to `field`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable sort(String field);

    /**
     * @description Returns a new `ISObjectEnumerable` with sorted elements
     * taken from `field` values considering `order`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param field the field
     * @param order the sort order
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable sort(String field, SortOrder order);

    /**
     * @description Returns a new `ISObjectEnumerable` with sorted elements
     * according to `field`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable sort(SObjectField field);

    /**
     * @description Returns a new `ISObjectEnumerable` with sorted elements
     * taken from `field` values considering `order`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param field the field
     * @param order the sort order
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable sort(SObjectField field, SortOrder order);

    /**
     * @description Returns a new `ISObjectEnumerable` with the first `lim` elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable lim(Integer lim);

    /**
     * @description Returns a new `ISObjectEnumerable` that skips the first `n` elements
     * and returns the remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the new `ISObjectEnumerable`
     */
    ISObjectEnumerable skip(Integer n);
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
     * @return the `SObject` result of the reduction
     */
    SObject reduce(SObject identity, IBiOperator accumulator);

    /**
     * @description Performs a reduction on elements,
     * using an associative `accumulator` function, and returns
     * an `IOptional` describing the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `IOptional` result of the reduction
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
     * @description Returns an `IOptional` describing the first element
     * which has `value` of `field`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return the `IOptional` containing the result
     */
    IOptional find(String field, Object value);

    /**
     * @description Returns an `IOptional` describing the first element
     * which has `value` of `field`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return the `IOptional` containing the result
     */
    IOptional find(SObjectField field, Object value);

    /**
     * @description Returns whether all elements match `predicate`.
     * If `ISObjectEnumerable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean every(IPredicate predicate);

    /**
     * @description Returns whether all elements have `field` `value`.
     * If `ISObjectEnumerable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return `true` or `false`
     */
    Boolean every(String field, Object value);

    /**
     * @description Returns whether all elements have `field` `value`.
     * If `ISObjectEnumerable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return `true` or `false`
     */
    Boolean every(SObjectField field, Object value);

    /**
     * @description Returns whether some element matches `predicate`.
     * If `ISObjectEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean some(IPredicate predicate);

    /**
     * @description Returns whether some element has `field` `value`.
     * If `ISObjectEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return `true` or `false`
     */
    Boolean some(String field, Object value);

    /**
     * @description Returns whether some element has `field` `value`.
     * If `ISObjectEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return `true` or `false`
     */
    Boolean some(SObjectField field, Object value);

    /**
     * @description Returns whether no elements match `predicate`.
     * If `ISObjectEnumerable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean none(IPredicate predicate);

    /**
     * @description Returns whether no elements have `field` `value`.
     * If `ISObjectEnumerable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return `true` or `false`
     */
    Boolean none(String field, Object value);

    /**
     * @description Returns whether no elements have `field` `value`.
     * If `ISObjectEnumerable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return `true` or `false`
     */
    Boolean none(SObjectField field, Object value);

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
     * @description Returns an `IOptional` describing the maximum element
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `IOptional` containing the result
     */
    IOptional max(String field);

    /**
     * @description Returns an `IOptional` describing the maximum element
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `IOptional` containing the result
     */
    IOptional max(SObjectField field);

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
     * @description Returns an `IOptional` describing the minimum element
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `IOptional` containing the result
     */
    IOptional min(String field);

    /**
     * @description Returns an `IOptional` describing the minimum element
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `IOptional` containing the result
     */
    IOptional min(SObjectField field);

    /**
     * @description Returns the arithmetic sum of values returned by `classifier` function.
     * <p>Terminal Operation.</p>
     *
     * @param classifier the classifier function
     *
     * @return the sum of the values returned by the `classifier`
     */
    Double sum(IFunction classifier);

    /**
     * @description Returns the arithmetic sum of field values of elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field to sum the values
     *
     * @return the sum of field values
     */
    Double sum(String field);

    /**
     * @description Returns the arithmetic sum of field values of elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field to sum the values
     *
     * @return the sum of field values
     */
    Double sum(SObjectField field);

    /**
     * @description Returns the arithmetic mean of values returned by `classifier` function.
     * <p>Terminal Operation.</p>
     *
     * @param classifier the classifier function
     *
     * @return the `IOptional` containing the result
     */
    IOptional avg(IFunction classifier);

    /**
     * @description Returns the arithmetic mean of field values of elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field to calculate the average
     *
     * @return the `IOptional` containing the result
     */
    IOptional avg(String field);

    /**
     * @description Returns the arithmetic mean of field values of elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field to calculate the average
     *
     * @return the `IOptional` containing the result
     */
    IOptional avg(SObjectField field);

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
     * @description Accumulates elements into a `List<SObject>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<SObject>` containing the collected elements
     */
    List<SObject> toList();

    /**
     * @description Accumulates elements returned by `mapper` into a `List<Object>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `List<Object>` containing the collected elements
     */
    List<Object> toList(IFunction mapper);

    /**
     * @description Accumulates elements into a `List<Object>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `List<Object>` containing the collected elements
     */
    List<Object> toList(String field);

    /**
     * @description Accumulates elements into a `List<Object>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `List<Object>` containing the collected elements
     */
    List<Object> toList(SObjectField field);

    /**
     * @description Accumulates elements returned by `mapper` into a `List<?>` of specific `elementType`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     * @param elementType the result type
     *
     * @return the `List<Object>` containing the collected elements, which can be cast to `List<T>`
     */
    List<Object> toList(IFunction mapper, Type elementType);

    /**
     * @description Accumulates elements into a `List<?>` of specific `elementType`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     * @param elementType the result type
     *
     * @return the `List<Object>` containing the collected elements, which can be cast to `List<T>`
     */
    List<Object> toList(String field, Type elementType);

    /**
     * @description Accumulates elements into a `List<?>` of specific `elementType`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     * @param elementType the result type
     *
     * @return the `List<Object>` containing the collected elements, which can be cast to `List<T>`
     */
    List<Object> toList(SObjectField field, Type elementType);

    /**
     * @description Accumulates elements into a `Set<SObject>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<SObject>` containing the collected elements
     */
    Set<SObject> toSet();

    /**
     * @description Accumulates elements returned by `mapper` into a `Set<Object>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `Set<Object>` containing the collected elements
     */
    Set<Object> toSet(IFunction mapper);

    /**
     * @description Accumulates elements into a `Set<Object>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Set<Object>` containing the collected elements
     */
    Set<Object> toSet(String field);

    /**
     * @description Accumulates elements into a `Set<Object>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Set<Object>` containing the collected elements
     */
    Set<Object> toSet(SObjectField field);

    /**
     * @description Accumulates `Id` elements into a `Set<Id>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<Id>` containing the collected elements
     */
    Set<Id> toIdSet();

    /**
     * @description Accumulates `Id` elements returned by `mapper` into a `Set<Id>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `Set<Id>` containing the collected elements
     */
    Set<Id> toIdSet(IFunction mapper);

    /**
     * @description Accumulates `Id` elements into a `Set<Id>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Set<Id>` containing the collected elements
     */
    Set<Id> toIdSet(String field);

    /**
     * @description Accumulates `Id` elements into a `Set<Id>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Set<Id>` containing the collected elements
     */
    Set<Id> toIdSet(SObjectField field);

    /**
     * @description Accumulates `String` elements returned by `mapper` into a `Set<String>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `Set<String>` containing the collected elements
     */
    Set<String> toStringSet(IFunction mapper);

    /**
     * @description Accumulates `String` elements into a `Set<String>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Set<String>` containing the collected elements
     */
    Set<String> toStringSet(String field);

    /**
     * @description Accumulates `String` elements into a `Set<String>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Set<String>` containing the collected elements
     */
    Set<String> toStringSet(SObjectField field);

    /**
     * @description Accumulates elements into a `Map<Id, SObject>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Map<Id, SObject>` containing the collected elements
     */
    Map<Id, SObject> toMap();

    /**
     * @description Accumulates elements into a `Map<Id, ? extends SObject>` of specific `valueType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     * @param valueType the value type
     *
     * @return the `Map<Id, SObject>` containing the collected elements, which can be cast to `Map<Id, T>`
     */
    Map<Id, SObject> toByIdMap(IFunction keyMapper, Type valueType);

    /**
     * @description Accumulates elements into a `Map<Id, ? extends SObject>` of specific `valueType`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     * @param valueType the value type
     *
     * @return the `Map<Id, SObject>` containing the collected elements, which can be cast to `Map<Id, T>`
     */
    Map<Id, SObject> toByIdMap(String field, Type valueType);

    /**
     * @description Accumulates elements into a `Map<Id, ? extends SObject>` of specific `valueType`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     * @param valueType the value type
     *
     * @return the `Map<Id, SObject>` containing the collected elements, which can be cast to `Map<Id, T>`
     */
    Map<Id, SObject> toByIdMap(SObjectField field, Type valueType);

    /**
     * @description Accumulates elements into a `Map<String, ? extends SObject>` of specific `valueType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     * @param valueType the value type
     *
     * @return the `Map<String, SObject>` containing the collected elements, which can be cast to `Map<String, T>`
     */
    Map<String, SObject> toByStringMap(IFunction keyMapper, Type valueType);

    /**
     * @description Accumulates elements into a `Map<String, ? extends SObject>` of specific `valueType`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     * @param valueType the value type
     *
     * @return the `Map<String, SObject>` containing the collected elements, which can be cast to `Map<String, T>`
     */
    Map<String, SObject> toByStringMap(String field, Type valueType);

    /**
     * @description Accumulates elements into a `Map<String, ? extends SObject>` of specific `valueType`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     * @param valueType the value type
     *
     * @return the `Map<String, SObject>` containing the collected elements, which can be cast to `Map<String, T>`
     */
    Map<String, SObject> toByStringMap(SObjectField field, Type valueType);

    /**
     * @description Groups elements into a `Map<Id, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     *
     * @return the `Map<Id, List<SObject>>` containing the collected elements
     */
    Map<Id, List<SObject>> groupById(IFunction keyMapper);

    /**
     * @description Groups elements into a `Map<Id, List<SObject>>`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Map<Id, List<SObject>>` containing the collected elements
     */
    Map<Id, List<SObject>> groupById(String field);

    /**
     * @description Groups elements into a `Map<Id, List<SObject>>`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Map<Id, List<SObject>>` containing the collected elements
     */
    Map<Id, List<SObject>> groupById(SObjectField field);

    /**
     * @description Groups elements into a `Map<String, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     *
     * @return the `Map<String, List<SObject>>` containing the collected elements
     */
    Map<String, List<SObject>> groupByString(IFunction keyMapper);

    /**
     * @description Groups elements into a `Map<String, List<SObject>>`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Map<String, List<SObject>>` containing the collected elements
     */
    Map<String, List<SObject>> groupByString(String field);

    /**
     * @description Groups elements into a `Map<String, List<SObject>>`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Map<String, List<SObject>>` containing the collected elements
     */
    Map<String, List<SObject>> groupByString(SObjectField field);

    /**
     * @description Partitions elements by `predicate`.
     * <p>Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `Map<Boolean, List<SObject>>` containing the collected elements
     */
    Map<Boolean, List<SObject>> partition(IPredicate predicate);

    /**
     * @description Partitions elements by `field` having `value`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return the `Map<Boolean, List<SObject>>` containing the collected elements
     */
    Map<Boolean, List<SObject>> partition(String field, Object value);

    /**
     * @description Partitions elements by `field` having `value`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return the `Map<Boolean, List<SObject>>` containing the collected elements
     */
    Map<Boolean, List<SObject>> partition(SObjectField field, Object value);
    //</editor-fold>
}
