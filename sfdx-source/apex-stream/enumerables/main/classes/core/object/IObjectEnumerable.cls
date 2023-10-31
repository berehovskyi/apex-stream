/**
 * @description A sequence of `SObject` elements supporting aggregate operations.
 *
 * @see ISObjectEnumerable
 * @see IIntEnumerable
 * @see ILongEnumerable
 * @see IDoubleEnumerable
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 */
public interface IObjectEnumerable extends IEnumerable<Object> {

    //<editor-fold desc="Iterator">
    Iterator<Object> iterator();
    //</editor-fold>

    //<editor-fold desc="Sources">
//    /**
//     * @description Returns a new `IObjectIterable` from the current
//     * to which another `iterable` is appended.
//     * <p>Intermediate Operation.</p>
//     *
//     * @param iterable the other iterable
//     *
//     * @return the new `IObjectIterable`
//     */
//    IObjectIterable append(Iterable<Object> iterable);
//
//    /**
//     * @description Returns a new `IObjectIterable` from the current
//     * to which another `iterable` is prepended.
//     * <p>Intermediate Operation.</p>
//     *
//     * @param iterable the other iterable
//     *
//     * @return the new `IObjectIterable`
//     */
//    IObjectIterable prepend(Iterable<Object> iterable);
//    //</editor-fold>
//
//    //<editor-fold desc="Intermediate Operations">
//    /**
//     * @description Returns a new `IObjectIterable` as a set union
//     * of the current and another iterables.
//     *
//     * @param iterable the other iterable
//     *
//     * @return the new `IObjectIterable`
//     */
//    IObjectIterable union(Iterable<Object> iterable);
//
//    /**
//     * @description Returns a new `IObjectIterable` as a set union
//     * of the current and another iterables according to `classifier`.
//     *
//     * @param iterable the other iterable
//     * @param classifier the classifier function
//     *
//     * @return the new `IObjectIterable`
//     */
//    IObjectIterable union(Iterable<Object> iterable, IFunction classifier);
//
//    /**
//     * @description Returns a new `IObjectIterable` as a set intersection
//     * of the current and another iterables.
//     *
//     * @param iterable the other iterable
//     *
//     * @return the new `IObjectIterable`
//     */
//    IObjectIterable intersect(Iterable<Object> iterable);
//
//    /**
//     * @description Returns a new `IObjectIterable` as a set intersection
//     * of the current and another iterables according to `classifier`.
//     *
//     * @param iterable the other iterable
//     * @param classifier the classifier function
//     *
//     * @return the new `IObjectIterable`
//     */
//    IObjectIterable intersect(Iterable<Object> iterable, IFunction classifier);
//
//    /**
//     * @description Returns a new `IObjectIterable` as a set difference
//     * of the current and another iterables.
//     *
//     * @param iterable the other iterable
//     *
//     * @return the new `IObjectIterable`
//     */
//    IObjectIterable except(Iterable<Object> iterable);
//
//    /**
//     * @description Returns a new `IObjectIterable` as a set difference
//     * of the current and another iterables according to `classifier`.
//     *
//     * @param iterable the other iterable
//     * @param classifier the classifier function
//     *
//     * @return the new `IObjectIterable`
//     */
//    IObjectIterable except(Iterable<Object> iterable, IFunction classifier);
//
//    /**
//     * @description Returns a new `IObjectIterable` with distinct `Object` elements.
//     * <p>Intermediate Operation.</p>
//     *
//     * @return the new `IObjectIterable`
//     */
//    IObjectIterable distinct();
//
//    /**
//     * @description Returns a new `IObjectIterable` with distinct `Object` elements
//     * according to `classifier` function.
//     * <p>Intermediate Operation.</p>
//     *
//     * @param classifier the classifier function
//     *
//     * @return the new `IObjectIterable`
//     */
//    IObjectIterable distinct(IFunction classifier);
//
//    /**
//     * @description Returns a new `IObjectIterable` with `Object` elements
//     * that match `predicate`.
//     * <p>Intermediate Operation.</p>
//     *
//     * @param predicate the predicate
//     *
//     * @return the new `IObjectIterable`
//     */
//    IObjectIterable filter(IPredicate predicate);
//
//    /**
//     * @description Returns a new `IObjectIterable` that takes `Object` elements
//     * while `predicate` returns `true`.
//     * <p>Intermediate Operation.</p>
//     *
//     * @param predicate the predicate
//     *
//     * @return the new `IObjectIterable`
//     */
//    IObjectIterable take(IPredicate predicate);
//
//    /**
//     * @description Returns a new `IObjectIterable` that drops `Object` elements
//     * while `predicate` returns `true`.
//     * <p>Intermediate Operation.</p>
//     *
//     * @param predicate the predicate
//     *
//     * @return the new `IObjectIterable`
//     */
//    IObjectIterable drop(IPredicate predicate);
//
//    /**
//     * @description Returns a new `IObjectIterable` without null elements.
//     * <p>Intermediate Operation.</p>
//     *
//     * @return the new `IObjectIterable`
//     */
//    IObjectIterable withoutNulls();
//
//    /**
//     * @description Returns a new `IObjectIterable` with `Object` elements
//     * returned by `mapper`.
//     * <p>Intermediate Operation.</p>
//     *
//     * @param mapper the mapping function
//     *
//     * @return the new `IObjectIterable`
//     */
//    IObjectIterable mapTo(IOperator mapper);

    /**
     * @description Returns a new `IIntIterable` with `Integer` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IIntIterable`
     */
    IIntEnumerable mapToInt(IFunction mapper);

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

//    /**
//     * @description Returns a new `IObjectIterable` with `Object` elements as a result of
//     * replacing each element with the contents of a mapped iterable created by applying
//     * the specified `mapper` function to each element.
//     * <p>Intermediate Operation.</p>
//     *
//     * @param mapper the mapping function which must produce `Iterable<Object>`
//     *
//     * @return the new `IObjectIterable`
//     */
//    IObjectIterable flatMapTo(IFunction mapper);

    /**
     * @description Returns a new `IIntIterable` with `Integer` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Integer>`
     *
     * @return the new `IIntIterable`
     */
    IIntEnumerable flatMapToInt(IFunction mapper);

    /**
     * @description Returns a new `ILongIterable` with `Long` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Long>`
     *
     * @return the new `ILongIterable`
     */
    ILongEnumerable flatMapToLong(IFunction mapper);

    /**
     * @description Returns a new `IDoubleIterable` with `Double` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Double>`
     *
     * @return the new `IDoubleIterable`
     */
    IDoubleEnumerable flatMapToDouble(IFunction mapper);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<SObject>`
     *
     * @return the new `IDoubleIterable`
     */
    ISObjectEnumerable flatMapToSObject(IFunction mapper);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    Object reduce(Object identity, IBiOperator accumulator);

    /**
     * @description Accumulates `SObject` elements into a `List<T>`.
     * <p>Terminal Operation.</p>
     *
     * @param t the type argument of List
     *
     * @return the List<T> containing the iterable elements
     */
    List<Object> toList(Type t);
    //</editor-fold>

}
