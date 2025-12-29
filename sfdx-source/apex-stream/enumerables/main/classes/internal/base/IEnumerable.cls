/**
 * @description A sequence of `T` elements supporting aggregate operations for reference types.
 * This interface is parameterized to accommodate various data types and extends the `Iterable<T>` interface
 * to enrich the standard iteration capabilities with additional collection operations.
 * It is crucial to keep the API version of this class as is.
 * <p><strong>Note: </strong></p>
 * <p>This is an internal class and should not be referenced outside of this package.</p>
 *
 * @see IObjectEnumerable
 * @see ISObjectEnumerable
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 */
public interface IEnumerable<T> extends Iterable<T> {
    //<editor-fold desc="Sources">
    /**
     * @description Returns a new `IEnumerable<T>` from the current
     * to which another `iterable` is appended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> append(Iterable<T> iterable);

    /**
     * @description Returns a new `IEnumerable<T>` from the current
     * to which another `iterable` is prepended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> prepend(Iterable<T> iterable);
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `IEnumerable<T>` as a set union
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> union(Iterable<T> iterable);

    /**
     * @description Returns a new `IEnumerable<T>` as a set union
     * of the current and another `iterable` according to `classifier`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> union(Iterable<T> iterable, IFunction classifier);

    /**
     * @description Returns a new `IEnumerable<T>` as a set intersection
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> intersect(Iterable<T> iterable);

    /**
     * @description Returns a new `IEnumerable<T>` as a set intersection
     * of the current and another `iterable` according to `classifier`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> intersect(Iterable<T> iterable, IFunction classifier);

    /**
     * @description Returns a new `IEnumerable<T>` as a set difference
     * of the current and another `iterable`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> except(Iterable<T> iterable);

    /**
     * @description Returns a new `IEnumerable<T>` as a set difference
     * of the current and another `iterable` according to `classifier`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> except(Iterable<T> iterable, IFunction classifier);

    /**
     * @description Returns a new `IEnumerable<T>` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> distinct();

    /**
     * @description Returns a new `IEnumerable<T>` with distinct elements
     * according to `classifier` function.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param classifier the classifier function
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> distinct(IFunction classifier);

    /**
     * @description Returns a new `IEnumerable<T>` with elements
     * that match `predicate`.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> filter(IPredicate predicate);

    /**
     * @description Returns a new `IEnumerable<T>` that takes elements
     * while `predicate` returns `true`.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> take(IPredicate predicate);

    /**
     * @description Returns a new `IEnumerable<T>` that drops elements
     * while `predicate` returns `true`, then takes the rest.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> drop(IPredicate predicate);

    /**
     * @description Returns a new `IEnumerable<T>` without null elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> withoutNulls();

    /**
     * @description Returns a new `IEnumerable<T>` with elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> mapTo(IOperator mapper);

    /**
     * @description Returns a new `IEnumerable<T>` with elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<T>`
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> flatMapTo(IFunction mapper);

    /**
     * @description Returns an `IEnumerable<T>` after performing the `consumer` action
     * on each element.
     * <p>Intermediate Interfering Operation.</p>
     *
     * @param consumer the action
     *
     * @return the `IEnumerable<T>`
     */
    IEnumerable<T> forEach(IConsumer consumer);

    /**
     * @description Returns a new `IEnumerable<T>` with sorted elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> sort();

    /**
     * @description Returns a new `IEnumerable<T>` with sorted elements
     * considering `order`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param order the sort order
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> sort(SortOrder order);

    /**
     * @description Returns a new `IEnumerable<T>` with sorted elements
     * according to `comparer`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param comparer the comparer
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> sort(IComparer comparer);

    /**
     * @description Returns a new `IEnumerable<T>` with the first `lim` elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> lim(Integer lim);

    /**
     * @description Returns a new `IEnumerable<T>` that skips the first `n` elements
     * and returns the remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> skip(Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    /**
     * @description Performs a reduction on elements,
     * using the `identity` value and an associative `accumulator` function, and returns the reduced value.
     * This is equivalent to:
     * <pre>
     *     <code>T result = identity;
     *     for (T element : this) {
     *         result = accumulator.apply(result, element)
     *     }
     *     return result;
     *     </code>
     * </pre>
     * <p>Terminal Operation.</p>
     *
     * @param identity the initial value for the `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the result of the reduction
     */
    T fold(T identity, IBiOperator accumulator);

    /**
     * @description Performs a reduction on elements,
     * using the `identity` value and an associative `accumulator` function, and returns the reduced value.
     * This is equivalent to:
     * <pre>
     *     <code>T result = identity;
     *     for (T element : this) {
     *         result = accumulator.apply(result, element)
     *     }
     *     return result;
     *     </code>
     * </pre>
     * <p>Terminal Operation.</p>
     *
     * @deprecated Use {@link #fold()} instead
     *
     * @param identity the initial value for the `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the result of the reduction
     */
    T reduce(T identity, IBiOperator accumulator);

    /**
     * @description Performs a reduction on elements,
     * using an associative `accumulator` function, and returns
     * an `IOptional` describing the reduced value.
     * This is equivalent to:
     * <pre>
     *     <code>Boolean foundAny = false;
     *     T result;
     *     for (T element : this) {
     *         if (!foundAny) {
     *             foundAny = true;
     *             result = element;
     *         } else {
     *            result = accumulator.apply(result, element);
     *         }
     *     }
     *     return foundAny ? IOptional.of(result) : IOptional.empty();
     *     </code>
     * </pre>
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
     * This produces a result equivalent to:
     * <pre>
     *     <code>Object result = supplier.get();
     *     for (T element : this) {
     *         accumulator.accept(result, element);
     *     }
     *     return result;
     *     </code>
     * </pre>
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
     * If `IEnumerable<T>` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean every(IPredicate predicate);

    /**
     * @description Returns whether some element matches `predicate`.
     * If `IEnumerable<T>` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean some(IPredicate predicate);

    /**
     * @description Returns whether no elements match `predicate`.
     * If `IEnumerable<T>` is empty then `true` is returned.
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
     * @description Accumulates elements into a `List<T>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<T>` containing the iterable elements
     */
    List<T> toList();

    /**
     * @description Accumulates elements into a `Set<T>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<T>` containing the iterable elements
     */
    Set<T> toSet();
    //</editor-fold>
}
