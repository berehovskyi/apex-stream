/**
 * @description Provides a skeletal implementation of {@link IDoubleEnumerable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 */
public abstract inherited sharing class DoubleEnumerable implements IDoubleEnumerable {

    //<editor-fold desc="Iterator">
    public abstract Iterator<Double> iterator();
    //</editor-fold>

    //<editor-fold desc="Sources">
    public abstract DoubleEnumerable append(final Iterable<Double> iterable);

    public abstract DoubleEnumerable prepend(final Iterable<Double> iterable);
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
    public virtual DoubleEnumerable union(final Iterable<Double> iterable) {
        return (DoubleEnumerable) append(iterable).distinct();
    }

//    public virtual DoubleIterable union(final Iterable<Double> iterable, final IFunction classifier) {
//        return (DoubleIterable) append(iterable).distinct(classifier);
//    }

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
    public virtual DoubleEnumerable intersect(final Iterable<Double> iterable) {
        return (DoubleEnumerable) distinct().filter(BasePredicates.isIn(iterable));
    }

//    public virtual DoubleIterable intersect(final Iterable<Double> iterable, final IFunction classifier) {
//        return (DoubleIterable) distinct(classifier).filter(Predicates.isIn(
//            classifier, (Iterable<Double>) Iterators.toObjectSet(iterable.iterator(), classifier))
//        );
//    }

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
    public virtual DoubleEnumerable except(final Iterable<Double> iterable) {
        return (DoubleEnumerable) distinct().filter(BasePredicates.isIn(iterable).negate());
    }

//    public virtual DoubleIterable except(final Iterable<Double> iterable, final IFunction classifier) {
//        return (DoubleIterable) distinct(classifier).filter(Predicates.isIn(
//            classifier, (Iterable<Double>) Iterators.toObjectSet(iterable.iterator(), classifier)
//        ).negate());
//    }

    public abstract DoubleEnumerable distinct();
    
//    public abstract DoubleIterable distinct(final IFunction classifier);

    public abstract DoubleEnumerable filter(final IPredicate predicate);

    public abstract DoubleEnumerable take(final IPredicate predicate);

    public abstract DoubleEnumerable drop(final IPredicate predicate);

    public virtual DoubleEnumerable withoutNulls() {
        return filter(BasePredicates.isNotNull());
    }

    public abstract DoubleEnumerable mapTo(final IOperator mapper);

    public abstract IntEnumerable mapToInt(final IFunction mapper);

    public abstract LongEnumerable mapToLong(final IFunction mapper);
    
    public abstract SObjectEnumerable mapToSObject(final IFunction mapper);
    
    public abstract ObjectEnumerable mapToObject(final IFunction mapper);

    public abstract DoubleEnumerable flatMapTo(final IFunction mapper);

    public abstract DoubleEnumerable forEach(final IConsumer consumer);

    public abstract DoubleEnumerable sort();

//    public abstract DoubleIterable sort(final IComparer comparer);

    public abstract DoubleEnumerable sort(final SortOrder order);
//        return sort(Comparer.defaultOrder().order(order));
//    }

    public abstract DoubleEnumerable lim(final Integer lim);

    public abstract DoubleEnumerable skip(final Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    public abstract Double reduce(final Double identity, final IBiOperator accumulator);
    
    public abstract Optional reduce(final IBiOperator operator);

//    public abstract Object collect(final ISupplier supplier, final IBiConsumer accumulator);

    public abstract Object collect(final ICollector collector);

    public abstract Optional find(final IPredicate predicate);

    public abstract Boolean every(final IPredicate predicate);

    public abstract Boolean some(final IPredicate predicate);

    public virtual Boolean none(final IPredicate predicate) {
        return !some(predicate);
    }

    public virtual Optional max() {
        return reduce(BaseBiOperators.max());
    }

//    public virtual Optional max(final IComparer comparer) {
//        return reduce(BiOperator.maxBy(comparer));
//    }

    public virtual Optional min() {
        return reduce(BaseBiOperators.min());
    }

//    public virtual Optional min(final IComparer comparer) {
//        return reduce(BiOperator.minBy(comparer));
//    }

    public virtual Double sum() {
        return (Double) collect(BaseCollectors.summingDouble(Function.identity()));
    }

    public virtual Optional avg() {
        return Optional.ofNullable((Double) collect(BaseCollectors.averagingDouble(Function.identity())));
    }

    public abstract Integer count();
    
    public abstract Boolean isEmpty();

    public abstract List<Double> toList();

    public abstract Set<Double> toSet();
    //</editor-fold>

}
