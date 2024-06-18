/**
 * @description A sequence of `T` elements supporting aggregate operations for reference types.
 * This interface is parameterized to accommodate various data types and extends the `Iterable<T>` interface
 * to enrich the standard iteration capabilities with additional collection operations.
 * It is crucial to keep the API version of this class as is and it is not recommended to extend or implement
 * this interface in custom code outside of the framework scope.
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
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> union(Iterable<T> iterable);

    /**
     * @description Returns a new `IEnumerable<T>` as a set union
     * of the current and another iterables according to `classifier`.
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> union(Iterable<T> iterable, IFunction classifier);

    /**
     * @description Returns a new `IEnumerable<T>` as a set intersection
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> intersect(Iterable<T> iterable);

    /**
     * @description Returns a new `IEnumerable<T>` as a set intersection
     * of the current and another iterables according to `classifier`.
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> intersect(Iterable<T> iterable, IFunction classifier);

    /**
     * @description Returns a new `IEnumerable<T>` as a set difference
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> except(Iterable<T> iterable);

    /**
     * @description Returns a new `IEnumerable<T>` as a set difference
     * of the current and another iterables according to `classifier`.
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> except(Iterable<T> iterable, IFunction classifier);

    /**
     * @description Returns a new `IEnumerable<T>` with distinct `T` elements.
     * <p>Intermediate Operation.</p>
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> distinct();

    /**
     * @description Returns a new `IEnumerable<T>` with distinct `T` elements
     * according to `classifier` function.
     * <p>Intermediate Operation.</p>
     *
     * @param classifier the classifier function
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> distinct(IFunction classifier);

    /**
     * @description Returns a new `IEnumerable<T>` with `T` elements
     * that match `predicate`.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> filter(IPredicate predicate);

    /**
     * @description Returns a new `IEnumerable<T>` that takes `T` elements
     * while `predicate` returns `true`.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> take(IPredicate predicate);

    /**
     * @description Returns a new `IEnumerable<T>` that drops `T` elements
     * while `predicate` returns `true`.
     * <p>Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> drop(IPredicate predicate);

    /**
     * @description Returns a new `IEnumerable<T>` without null elements.
     * <p>Intermediate Operation.</p>
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> withoutNulls();

    /**
     * @description Returns a new `IEnumerable<T>` with `T` elements
     * returned by `mapper`.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> mapTo(IOperator mapper);

    /**
     * @description Returns a new `IEnumerable<T>` with `T` elements as a result of
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
     * @description Returns a new `IEnumerable<T>` after performing `consumer` action
     * on each `T` element.
     * <p>Intermediate Interfering Operation.</p>
     *
     * @param consumer the action
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> forEach(IConsumer consumer);

    /**
     * @description Returns a new `IEnumerable<T>` with sorted `T` elements.
     * <p>Intermediate Operation.</p>
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> sort();

    /**
     * @description Returns a new `IEnumerable<T>` with sorted `T` elements
     * considering `order`.
     * <p>Intermediate Operation.</p>
     *
     * @param order the sort order
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> sort(SortOrder order);

    /**
     * @description Returns a new `IEnumerable<T>` with sorted `T` elements
     * according to `comparer`.
     * <p>Intermediate Operation.</p>
     *
     * @param comparer the comparer
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> sort(IComparer comparer);

    /**
     * @description Returns a new `IEnumerable<T>` with first `lim` `T` elements.
     * <p>Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> lim(Integer lim);

    /**
     * @description Returns a new `IEnumerable<T>` that skips first `n` `T` elements
     * and returns remaining elements.
     * <p>Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the new `IEnumerable<T>`
     */
    IEnumerable<T> skip(Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    /**
     * @description Performs a reduction on `T` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
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
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `T` result of the reduction
     */
    T reduce(T identity, IBiOperator accumulator);

    /**
     * @description Performs a reduction on `T` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `Optional` describing the reduced value.
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
     *     return foundAny ? Optional.of(result) : Optional.empty();
     *     </code>
     * </pre>
     * <p>Terminal Operation.</p>
     *
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Optional` result of the reduction
     */
    IOptional reduce(IBiOperator accumulator);

    /**
     * @description Performs a mutable reduction operation on `T` elements, collecting elements
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
     * @description Returns whether all `T` elements match `predicate`.
     * If `IEnumerable<T>` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean every(IPredicate predicate);

    /**
     * @description Returns whether some `T` element matches `predicate`.
     * If `IEnumerable<T>` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean some(IPredicate predicate);

    /**
     * @description Returns whether no `T` elements match `predicate`.
     * If `IEnumerable<T>` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     */
    Boolean none(IPredicate predicate);

    /**
     * @description Returns an `Optional` describing the maximum `T` element
     * according to `comparer`.
     * <p>Terminal Operation.</p>
     *
     * @param comparer the comparer
     *
     * @return the `Optional` describing the result
     */
    IOptional max(IComparer comparer);

    /**
     * @description Returns an `Optional` describing the minimum `T` element
     * according to `comparer`.
     * <p>Terminal Operation.</p>
     *
     * @param comparer the comparer
     *
     * @return the `Optional` describing the result
     */
    IOptional min(IComparer comparer);

    /**
     * @description Returns the count of `T` elements.
     * <p>Terminal Operation.</p>
     *
     * @return the count of `T` elements
     */
    Integer count();

    /**
     * @description Returns the count of `T` elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
     */
    Boolean isEmpty();

    /**
     * @description Accumulates `T` elements into a `List<T>`.
     * <p>Terminal Operation.</p>
     *
     * @return the List<T> containing the iterable elements
     */
    List<T> toList();

    /**
     * @description Accumulates `T` elements into a `Set<T>`.
     * <p>Terminal Operation.</p>
     *
     * @return the Set<T> containing the iterable elements
     */
    Set<T> toSet();
    //</editor-fold>

}
