/**
 * @description A sequence of `Integer` elements supporting aggregate operations.
 *
 * @see IEnumerable
 * @see ISObjectEnumerable
 * @see ILongEnumerable
 * @see IDoubleEnumerable
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 */
public interface IIntEnumerable extends INumberEnumerable<Integer> {

    //<editor-fold desc="Iterator">
    Iterator<Integer> iterator();
    //</editor-fold>

//    //<editor-fold desc="Sources">
//    /**
//     * @description Returns a new `IIntIterable` from the current
//     * to which another `iterable` is appended.
//     * <p>Intermediate Operation.</p>
//     *
//     * @param iterable the other iterable
//     *
//     * @return the new `IIntIterable`
//     */
//    IIntIterable append(Iterable<Integer> iterable);
//
//    /**
//     * @description Returns a new `IIntIterable` from the current
//     * to which another `iterable` is prepended.
//     * <p>Intermediate Operation.</p>
//     *
//     * @param iterable the other iterable
//     *
//     * @return the new `IIntIterable`
//     */
//    IIntIterable prepend(Iterable<Integer> iterable);
//    //</editor-fold>
//
//    //<editor-fold desc="Conversion Operations">
//    /**
//     * @description Returns a new `IObjectIterable` from the current `iterable`.
//     * <p>Intermediate Operation.</p>
//     *
//     * @return the new `IObjectIterable`
//     */
//    IIterable toObjectIterable();
//
//    /**
//     * @description Returns a new `ILongIterable` from the current `iterable`.
//     * <p>Intermediate Operation.</p>
//     *
//     * @return the new `ILongIterable`
//     */
//    ILongIterable toLongIterable();
//
//    /**
//     * @description Returns a new `IDoubleIterable` from the current `iterable`.
//     * <p>Intermediate Operation.</p>
//     *
//     * @return the new `IDoubleIterable`
//     */
//    IDoubleIterable toDoubleIterable();
//    //</editor-fold>
//
//    //<editor-fold desc="Intermediate Operations">
//    /**
//     * @description Returns a new `IIntIterable` as a set union
//     * of the current and another iterables.
//     *
//     * @param iterable the other iterable
//     *
//     * @return the new `IIntIterable`
//     */
//    IIntIterable union(Iterable<Integer> iterable);
//
//    /**
//     * @description Returns a new `IIntIterable` as a set intersection
//     * of the current and another iterables.
//     *
//     * @param iterable the other iterable
//     *
//     * @return the new `IIntIterable`
//     */
//    IIntIterable intersect(Iterable<Integer> iterable);
//
//    /**
//     * @description Returns a new `IIntIterable` as a set difference
//     * of the current and another iterables.
//     *
//     * @param iterable the other iterable
//     *
//     * @return the new `IIntIterable`
//     */
//    IIntIterable except(Iterable<Integer> iterable);
//
//    /**
//     * @description Returns a new `IIntIterable` with distinct `Integer` elements.
//     * <p>Intermediate Operation.</p>
//     *
//     * @return the new `IIntIterable`
//     */
//    IIntIterable distinct();
//
//    /**
//     * @description Returns a new `IIntIterable` with `Integer` elements
//     * that match `predicate`.
//     * <p>Intermediate Operation.</p>
//     *
//     * @param predicate the predicate
//     *
//     * @return the new `IIntIterable`
//     */
//    IIntIterable filter(IIntPredicate predicate);
//
//    /**
//     * @description Returns a new `IIntIterable` that takes `Integer` elements
//     * while `predicate` returns `true`.
//     * <p>Intermediate Operation.</p>
//     *
//     * @param predicate the predicate
//     *
//     * @return the new `IIntIterable`
//     */
//    IIntIterable take(IIntPredicate predicate);
//
//    /**
//     * @description Returns a new `IIntIterable` that drops `Integer` elements
//     * while `predicate` returns `true`.
//     * <p>Intermediate Operation.</p>
//     *
//     * @param predicate the predicate
//     *
//     * @return the new `IIntIterable`
//     */
//    IIntIterable drop(IIntPredicate predicate);
//
//    /**
//     * @description Returns a new `IIntIterable` without null elements.
//     * <p>Intermediate Operation.</p>
//     *
//     * @return the new `IIntIterable`
//     */
//    IIntIterable withoutNulls();
//
//    /**
//     * @description Returns a new `IIntIterable` with `Integer` elements
//     * returned by `mapper`.
//     * <p>Intermediate Operation.</p>
//     *
//     * @param mapper the mapping function
//     *
//     * @return the new `IIntIterable`
//     */
//    IIntIterable mapTo(IIntUnaryOperator mapper);

    /**
     * @description Returns a new `ILongIterable` with `Long` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `ILongIterable`
     */
    ILongEnumerable mapToLong(IFunction mapper);

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

//    /**
//     * @description Returns a new `IIntIterable` after performing `consumer` action
//     * on each `Long` element.
//     * <p>Intermediate Interfering Operation.</p>
//     *
//     * @param consumer the action
//     *
//     * @return the new `IIntIterable`
//     */
//    IIntIterable forEach(IIntConsumer consumer);
//
//    /**
//     * @description Returns a new `IIntIterable` with sorted `Integer` elements.
//     * <p>Intermediate Operation.</p>
//     *
//     * @return the new `IIntIterable`
//     */
//    IIntIterable sort();
//
//    /**
//     * @description Returns a new `IIntIterable` with first `lim` `Integer` elements.
//     * <p>Intermediate Operation.</p>
//     *
//     * @param lim the number of elements to limit
//     *
//     * @return the new `IIntIterable`
//     */
//    IIntIterable lim(Integer lim);
//
//    /**
//     * @description Returns a new `IIntIterable` that skips first `n` `Integer` elements
//     * and returns remaining elements.
//     * <p>Intermediate Operation.</p>
//     *
//     * @param n the number of elements to skip
//     *
//     * @return the new `IIntIterable`
//     */
//    IIntIterable skip(Integer n);
//    //</editor-fold>
//
    //<editor-fold desc="Terminal Operations">
    /**
     * @description Performs a reduction on `Integer` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Integer` result of the reduction
     */
    Integer reduce(Integer identity, IBiOperator accumulator);

//    /**
//     * @description Performs a reduction on `Integer` elements,
//     * using `identity` value and associative `accumulator` function, and returns
//     * an `OptionalInt` describing the reduced value.
//     * <p>Terminal Operation.</p>
//     *
//     * @param accumulator the associative, non-interfering, stateless accumulation function
//     *
//     * @return the `OptionalInt` result of the reduction
//     */
//    OptionalInt reduce(IIntBinaryOperator accumulator);
//
//    /**
//     * @description Performs a mutable reduction operation on `Integer` elements, collecting elements
//     * to a container returned by `supplier` by applying `accumulator` function.
//     * <p>Terminal Operation.</p>
//     *
//     * @param supplier the function that returns a mutable result container
//     * @param accumulator the associative, non-interfering, stateless accumulation function
//     *
//     * @return the `Object` result of the collection
//     */
//    Object collect(ISupplier supplier, IObjectIntConsumer accumulator);
//
//    /**
//     * @description Returns an `OptionalInt` describing the first element
//     * that matches `predicate`.
//     * <p>Short-circuiting Terminal Operation.</p>
//     *
//     * @param predicate the predicate
//     *
//     * @return the `OptionalInt`
//     */
//    OptionalInt find(IIntPredicate predicate);
//
//    /**
//     * @description Returns whether all `Integer` elements match `predicate`.
//     * If `IIntIterable` is empty then `false` is returned.
//     * <p>Short-circuiting Terminal Operation.</p>
//     *
//     * @param predicate the predicate
//     *
//     * @return `true` or `false`
//     */
//    Boolean every(IIntPredicate predicate);
//
//    /**
//     * @description Returns whether some `Integer` element matches `predicate`.
//     * If `IIntIterable` is empty then `false` is returned.
//     * <p>Short-circuiting Terminal Operation.</p>
//     *
//     * @param predicate the predicate
//     *
//     * @return `true` or `false`
//     */
//    Boolean some(IIntPredicate predicate);
//
//    /**
//     * @description Returns whether no `Integer` elements match `predicate`.
//     * If `IIntIterable` is empty then `true` is returned.
//     * <p>Short-circuiting Terminal Operation.</p>
//     *
//     * @param predicate the predicate
//     *
//     * @return `true` or `false`
//     */
//    Boolean none(IIntPredicate predicate);
//
//    /**
//     * @description Returns an `OptionalInt` describing the maximum `Integer` element.
//     * <p>Terminal Operation.</p>
//     *
//     * @return the `OptionalInt` describing the result
//     */
//    OptionalInt max();
//
//    /**
//     * @description Returns an `OptionalInt` describing the minimum `Integer` element.
//     * <p>Terminal Operation.</p>
//     *
//     * @return the `OptionalInt` describing the result
//     */
//    OptionalInt min();
//
//    /**
//     * @description Returns the arithmetic sum of `Integer` values.
//     * <p>Terminal Operation.</p>
//     *
//     * @return the sum of elements
//     */
//    Integer sum();
//
//    /**
//     * @description Returns the arithmetic mean of `Integer` values.
//     * <p>Terminal Operation.</p>
//     *
//     * @return the `OptionalDouble` describing the result
//     */
//    OptionalDouble avg();
//
//    /**
//     * @description Returns the count of `Integer` elements.
//     * <p>Terminal Operation.</p>
//     *
//     * @return the count of `Integer` elements
//     */
//    Integer count();
//
//    /**
//     * @description Returns the count of `Integer` elements is 0.
//     * <p>Terminal Operation.</p>
//     *
//     * @return `true` or `false`
//     */
//    Boolean isEmpty();
//
//    /**
//     * @description Accumulates `Integer` elements into a `List<Integer>`.
//     * <p>Terminal Operation.</p>
//     *
//     * @return the List<Integer> containing the iterable elements
//     */
//    List<Integer> toList();
//
//    /**
//     * @description Accumulates `Integer` elements into a `Set<Integer>`.
//     * <p>Terminal Operation.</p>
//     *
//     * @return the Set<Integer> containing the iterable elements
//     */
//    Set<Integer> toSet();
    //</editor-fold>

}
