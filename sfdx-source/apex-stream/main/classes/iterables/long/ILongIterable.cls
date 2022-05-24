/**
 * @author O. Berehovskyi
 * @group Iterables
 * @description A sequence of `Long` elements supporting aggregate operations.
 * @see IObjectIterable
 * @see ISObjectIterable
 * @see IIntIterable
 * @see IDoubleIterable
 */
public interface ILongIterable extends Iterable<Long> {

    //<editor-fold desc="Sources">
    /**
     * @description Returns a new `ILongIterable` from the current
     * to which another `iterable` is appended.
     * <p>Intermediate Operation.</p>
     * @param iterable the other iterable
     * @return the new `ILongIterable`
     */
    ILongIterable append(Iterable<Long> iterable);

    /**
     * @description Returns a new `ILongIterable` from the current
     * to which another `iterable` is prepended.
     * <p>Intermediate Operation.</p>
     * @param iterable the other iterable
     * @return the new `ILongIterable`
     */
    ILongIterable prepend(Iterable<Long> iterable);
    //</editor-fold>

    //<editor-fold desc="Conversion Operations">
    /**
     * @description Returns a new `IObjectIterable` from the current `iterable`.
     * <p>Intermediate Operation.</p>
     * @return the new `IObjectIterable`
     */
    IObjectIterable toObjectIterable();

    /**
     * @description Returns a new `IIntIterable` from the current `iterable`.
     * <p>Intermediate Operation.</p>
     * @return the new `IIntIterable`
     */
    IIntIterable toIntIterable();

    /**
     * @description Returns a new `IDoubleIterable` from the current `iterable`.
     * <p>Intermediate Operation.</p>
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable toDoubleIterable();
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `ILongIterable` with `Long` elements
     * that match `predicate`.
     * <p>Intermediate Operation.</p>
     * @param predicate the predicate
     * @return the new `ILongIterable`
     */
    ILongIterable filter(ILongPredicate predicate);

    /**
     * @description Returns a new `ILongIterable` that takes `Long` elements
     * while `predicate` returns `true`.
     * <p>Intermediate Operation.</p>
     * @param predicate the predicate
     * @return the new `ILongIterable`
     */
    ILongIterable take(ILongPredicate predicate);

    /**
     * @description Returns a new `ILongIterable` that drops `Long` elements
     * while `predicate` returns `true`.
     * <p>Intermediate Operation.</p>
     * @param predicate the predicate
     * @return the new `ILongIterable`
     */
    ILongIterable drop(ILongPredicate predicate);

    /**
     * @description Returns a new `ILongIterable` without null elements.
     * <p>Intermediate Operation.</p>
     * @return the new `ILongIterable`
     */
    ILongIterable withoutNulls();

    /**
     * @description Returns a new `ILongIterable` with `Long` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function
     * @return the new `ILongIterable`
     */
    ILongIterable mapTo(ILongUnaryOperator mapper);

    /**
     * @description Returns a new `IIntIterable` with `Integer` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function
     * @return the new `IIntIterable`
     */
    IIntIterable mapToInt(ILongToIntFunction mapper);

    /**
     * @description Returns a new `IDoubleIterable` with `Double` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable mapToDouble(ILongToDoubleFunction mapper);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping operator
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable mapToSObject(ILongToSObjectFunction mapper);

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function
     * @return the new `IObjectIterable`
     */
    IObjectIterable mapToObject(ILongFunction mapper);

    /**
     * @description Returns a new `ILongIterable` after performing `consumer` action
     * on each `Long` element.
     * <p>Intermediate Interfering Operation.</p>
     * @param consumer the action
     * @return the new `ILongIterable`
     */
    ILongIterable forEach(ILongConsumer consumer);

    /**
     * @description Returns a new `ILongIterable` with distinct `Long` elements.
     * <p>Intermediate Operation.</p>
     * @return the new `ILongIterable`
     */
    ILongIterable distinct();

    /**
     * @description Returns a new `ILongIterable` with sorted `Long` elements.
     * <p>Intermediate Operation.</p>
     * @return the new `ILongIterable`
     */
    ILongIterable sort();

    /**
     * @description Returns a new `ILongIterable` with first `lim` `Long` elements.
     * <p>Intermediate Operation.</p>
     * @param lim the number of elements to limit
     * @return the new `ILongIterable`
     */
    ILongIterable lim(Integer lim);

    /**
     * @description Returns a new `ILongIterable` that skips first `n` `Long` elements
     * and returns remaining elements.
     * <p>Intermediate Operation.</p>
     * @param n the number of elements to skip
     * @return the new `ILongIterable`
     */
    ILongIterable skip(Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    /**
     * @description Performs a reduction on `Long` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `Long` result of the reduction
     */
    Long reduce(Long identity, ILongBinaryOperator accumulator);

    /**
     * @description Performs a reduction on `Long` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `OptionalLong` describing the reduced value.
     * <p>Terminal Operation.</p>
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `OptionalLong` result of the reduction
     */
    OptionalLong reduce(ILongBinaryOperator accumulator);

    /**
     * @description Performs a mutable reduction operation on `Long` elements, collecting elements
     * to a container returned by `supplier` by applying `accumulator` function.
     * <p>Terminal Operation.</p>
     * @param supplier the function that returns a mutable result container
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `Object` result of the collection
     */
    Object collect(ISupplier supplier, IObjectLongConsumer accumulator);

    /**
     * @description Returns an `OptionalLong` describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param predicate the predicate
     * @return the `OptionalLong`
     */
    OptionalLong find(ILongPredicate predicate);

    /**
     * @description Returns whether all `Long` elements match `predicate`.
     * If `ILongIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param predicate the predicate
     * @return `true` or `false`
     */
    Boolean every(ILongPredicate predicate);

    /**
     * @description Returns whether some `Long` element matches `predicate`.
     * If `ILongIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param predicate the predicate
     * @return `true` or `false`
     */
    Boolean some(ILongPredicate predicate);

    /**
     * @description Returns whether no `Long` elements match `predicate`.
     * If `ILongIterable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param predicate the predicate
     * @return `true` or `false`
     */
    Boolean none(ILongPredicate predicate);

    /**
     * @description Returns an `OptionalLong` describing the maximum `Long` element.
     * <p>Terminal Operation.</p>
     * @return the `OptionalLong` describing the result
     */
    OptionalLong max();

    /**
     * @description Returns an `OptionalLong` describing the minimum `Long` element.
     * <p>Terminal Operation.</p>
     * @return the `OptionalLong` describing the result
     */
    OptionalLong min();

    /**
     * @description Returns the arithmetic sum of `Long` values.
     * <p>Terminal Operation.</p>
     * @return the sum of elements
     */
    Long sum();

    /**
     * @description Returns the arithmetic mean of `Long` values.
     * <p>Terminal Operation.</p>
     * @return the `OptionalDouble` describing the result
     */
    OptionalDouble avg();

    /**
     * @description Returns the count of `Long` elements.
     * <p>Terminal Operation.</p>
     * @return the count of `Long` elements
     */
    Integer count();

    /**
     * @description Returns the count of `Long` elements is 0.
     * <p>Terminal Operation.</p>
     * @return `true` or `false`
     */
    Boolean isEmpty();

    /**
     * @description Accumulates `Long` elements into a `List<Long>`.
     * <p>Terminal Operation.</p>
     * @return the List<Long> containing the iterable elements
     */
    List<Long> toList();

    /**
     * @description Accumulates `Long` elements into a `Set<Long>`.
     * <p>Terminal Operation.</p>
     * @return the Set<Long> containing the iterable elements
     */
    Set<Long> toSet();
    //</editor-fold>

}
