/**
 * @description Provides a skeletal implementation of {@link IDoubleIterable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 */
public abstract inherited sharing class DoubleIterable implements IDoubleIterable {

    //<editor-fold desc="Sources">
    public abstract IDoubleIterable append(final Iterable<Double> iterable);
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `IDoubleIterable` as a set union
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IDoubleIterable`
     *
     * @example
     * List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
     * List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
     * List<Double> union = doublesIterable1.union(doubles2).toList();
     * // [5.0, 3.0, 9.0, 7.0, 8.0, 6.0, 4.0, 1.0, 0.0]
     */
    public virtual IDoubleIterable union(final Iterable<Double> iterable) {
        return append(iterable).distinct();
    }

    /**
     * @description Returns a new `IDoubleIterable` as a set intersection
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IDoubleIterable`
     * 
     * @example
     * List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
     * List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
     * List<Double> intersection = doublesIterable1.intersect(doubles2).toList(); // [3.0, 9.0]
     */
    public virtual IDoubleIterable intersect(final Iterable<Double> iterable) {
        return distinct().filter(DoublePredicates.isIn(iterable));
    }

    /**
     * @description Returns a new `IDoubleIterable` as a set difference
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IDoubleIterable`
     *
     * @example
     * List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
     * List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
     * List<Double> diff = doublesIterable1.except(doubles2).toList(); // [5.0, 7.0]
     */
    public virtual IDoubleIterable except(final Iterable<Double> iterable) {
        return distinct().filter(DoublePredicates.isIn(iterable).negate());
    }

    public abstract IDoubleIterable distinct();

    public abstract IDoubleIterable filter(final IDoublePredicate predicate);

    public virtual IDoubleIterable withoutNulls() {
        return filter(DoublePredicates.isNotNull());
    }
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    public abstract OptionalDouble reduce(final IDoubleBinaryOperator operator);

    public abstract Object collect(final ISupplier supplier, final IObjectDoubleConsumer accumulator);

    public abstract Boolean some(final IDoublePredicate predicate);

    public virtual Boolean none(final IDoublePredicate predicate) {
        return !some(predicate);
    }

    public virtual OptionalDouble max() {
        return reduce(DoubleBinaryOperators.max());
    }

    public virtual OptionalDouble min() {
        return reduce(DoubleBinaryOperators.min());
    }

    public virtual Double sum() {
        return (Double) CollectorBaseFunctions.summingDouble()
                .apply(collect(CollectorBaseSuppliers.summingDouble(), ListDoubleConsumers.summingDouble()));
    }

    public virtual OptionalDouble avg() {
        final List<Double> avg = (List<Double>) collect(
                CollectorBaseSuppliers.averagingDouble(),
                ListDoubleConsumers.averagingDouble()
        );
        return avg[2] == 0 ? OptionalDouble.empty() : OptionalDouble.of((avg[0] + avg[1]) / avg[2]);
    }
    //</editor-fold>

}
