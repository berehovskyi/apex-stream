/**
 * @author O. Berehovskyi
 * @group Iterables
 * @description A sequence of `Double` elements supporting aggregate operations.
 * @see IObjectIterable
 * @see ISObjectIterable
 * @see IIntIterable
 * @see ILongIterable
 */
public interface IDoubleIterable extends Iterable<Double> {

    //<editor-fold desc="Sources">
    /**
     * @description Returns a new `IDoubleIterable` from the current
     * to which another `iterable` is appended.
     * <p>Intermediate Operation.</p>
     * @param iterable the other iterable
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable append(IDoubleIterable iterable);

    /**
     * @description Returns a new `IDoubleIterable` from the current
     * to which another `iterable` is prepended.
     * <p>Intermediate Operation.</p>
     * @param iterable the other iterable
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable prepend(IDoubleIterable iterable);
    //</editor-fold>

    //<editor-fold desc="Conversion Operations">
    /**
     * @description Returns a new `IObjectIterable` from the current `iterable`.
     * <p>Intermediate Operation.</p>
     * @return the new `IObjectIterable`
     */
    IObjectIterable toObjectIterable();
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `IDoubleIterable` with `Double` elements
     * that match `predicate`.
     * <p>Intermediate Operation.</p>
     * @param predicate the predicate
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable filter(IDoublePredicate predicate);

    /**
     * @description Returns a new `IDoubleIterable` that takes `Double` elements
     * while `predicate` returns `true`.
     * <p>Intermediate Operation.</p>
     * @param predicate the predicate
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable take(IDoublePredicate predicate);

    /**
     * @description Returns a new `IDoublePredicate` that drops `Double` elements
     * while `predicate` returns `true`.
     * <p>Intermediate Operation.</p>
     * @param predicate the predicate
     * @return the new `IDoublePredicate`
     */
    IDoubleIterable drop(IDoublePredicate predicate);

    /**
     * @description Returns a new `IDoubleIterable` without null elements.
     * <p>Intermediate Operation.</p>
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable withoutNulls();

    /**
     * @description Returns a new `IDoubleIterable` with `Double` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable mapTo(IDoubleUnaryOperator mapper);

    /**
     * @description Returns a new `IIntIterable` with `Integer` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function
     * @return the new `IIntIterable`
     */
    IIntIterable mapToInt(IDoubleToIntFunction mapper);

    /**
     * @description Returns a new `ILongIterable` with `Long` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function
     * @return the new `ILongIterable`
     */
    ILongIterable mapToLong(IDoubleToLongFunction mapper);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping operator
     * @return the new `ISObjectIterable`
     */
    ISObjectIterable mapToSObject(IDoubleToSObjectFunction mapper);

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     * @param mapper the mapping function
     * @return the new `IObjectIterable`
     */
    IObjectIterable mapToObject(IDoubleFunction mapper);

    /**
     * @description Returns a new `IDoubleIterable` after performing `consumer` action
     * on each `Double` element.
     * <p>Intermediate Interfering Operation.</p>
     * @param consumer the action
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable forEach(IDoubleConsumer consumer);

    /**
     * @description Returns a new `IDoubleIterable` with distinct `Double` elements.
     * <p>Intermediate Operation.</p>
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable distinct();

    /**
     * @description Returns a new `IDoubleIterable` with sorted `Double` elements.
     * <p>Intermediate Operation.</p>
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable sort();

    /**
     * @description Returns a new `IDoubleIterable` with first `lim` `Double` elements.
     * <p>Intermediate Operation.</p>
     * @param lim the number of elements to limit
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable lim(Integer lim);

    /**
     * @description Returns a new `IDoubleIterable` that skips first `n` `Double` elements
     * and returns remaining elements.
     * <p>Intermediate Operation.</p>
     * @param n the number of elements to skip
     * @return the new `IDoubleIterable`
     */
    IDoubleIterable skip(Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    /**
     * @description Performs a reduction on `Double` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `Double` result of the reduction
     */
    Double reduce(Double identity, IDoubleBinaryOperator accumulator);

    /**
     * @description Performs a reduction on `Double` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `OptionalLong` describing the reduced value.
     * <p>Terminal Operation.</p>
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `OptionalDouble` result of the reduction
     */
    OptionalDouble reduce(IDoubleBinaryOperator accumulator);

    /**
     * @description Performs a mutable reduction operation on `Double` elements, collecting elements
     * to a container returned by `supplier` by applying `accumulator` function.
     * <p>Terminal Operation.</p>
     * @param supplier the function that returns a mutable result container
     * @param accumulator the associative, non-interfering, stateless accumulation function
     * @return the `Object` result of the collection
     */
    Object collect(ISupplier supplier, IObjectDoubleConsumer accumulator);

    /**
     * @description Returns an `OptionalDouble` describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param predicate the predicate
     * @return the `OptionalDouble`
     */
    OptionalDouble find(IDoublePredicate predicate);

    /**
     * @description Returns whether all `Double` elements match `predicate`.
     * If `IDoubleIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param predicate the predicate
     * @return `true` or `false`
     */
    Boolean every(IDoublePredicate predicate);

    /**
     * @description Returns whether some `Double` element matches `predicate`.
     * If `IDoubleIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param predicate the predicate
     * @return `true` or `false`
     */
    Boolean some(IDoublePredicate predicate);

    /**
     * @description Returns whether no `Double` elements match `predicate`.
     * If `IDoubleIterable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @param predicate the predicate
     * @return `true` or `false`
     */
    Boolean none(IDoublePredicate predicate);

    /**
     * @description Returns an `OptionalDouble` describing the maximum `Double` element.
     * <p>Terminal Operation.</p>
     * @return the `OptionalDouble` describing the result
     */
    OptionalDouble max();

    /**
     * @description Returns an `OptionalDouble` describing the minimum `Double` element.
     * <p>Terminal Operation.</p>
     * @return the `OptionalDouble` describing the result
     */
    OptionalDouble min();

    /**
     * @description Returns the arithmetic sum of `Double` values.
     * <p>Terminal Operation.</p>
     * @return the sum of elements
     */
    Double sum();

    /**
     * @description Returns the arithmetic mean of `Double` values.
     * <p>Terminal Operation.</p>
     * @return the `OptionalDouble` describing the result
     */
    OptionalDouble avg();

    /**
     * @description Returns the count of `Integer` elements.
     * <p>Terminal Operation.</p>
     * @return the count of `Integer` elements
     */
    Integer count();

    /**
     * @description Returns the count of `Integer` elements is 0.
     * <p>Terminal Operation.</p>
     * @return `true` or `false`
     */
    Boolean isEmpty();

    /**
     * @description Accumulates `Double` elements into a `List<Double>`.
     * <p>Terminal Operation.</p>
     * @return the List<Double> containing the iterable elements
     */
    List<Double> toList();

    /**
     * @description Accumulates `Double` elements into a `Set<Double>`.
     * <p>Terminal Operation.</p>
     * @return the Set<Double> containing the iterable elements
     */
    Set<Double> toSet();
    //</editor-fold>

}
