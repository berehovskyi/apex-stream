/**
 * @author O. Berehovskyi
 * @group Iterables
 * @description Provides a skeletal implementation of {@link IObjectIterable}.
 */
public abstract inherited sharing class ObjectIterable implements IObjectIterable {

    //<editor-fold desc="Intermediate Operations">
    public abstract IObjectIterable filter(final IPredicate predicate);

    public virtual IObjectIterable withoutNulls() {
        return filter(Predicate.isNotNull());
    }
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    public abstract IObjectIterable sort(final IComparator comparator);
    
    public virtual IObjectIterable sort(final SortOrder order) {
        return sort(Comparator.defaultOrder().order(order));
    }
    
    public abstract Optional reduce(final IBinaryOperator accumulator);

    public abstract Object collect(final ICollector collector);

    public abstract Boolean some(final IPredicate predicate);

    public virtual Boolean none(final IPredicate predicate) {
        return !some(predicate);
    }

    public virtual Optional max(final IComparator comparator) {
        return reduce(BinaryOperator.maxBy(comparator));
    }

    public virtual Optional min(final IComparator comparator) {
        return reduce(BinaryOperator.minBy(comparator));
    }

    public virtual List<Object> toList(final Type t) {
        return (List<Object>) collect(Collector.toList().cast(t));
    }
    //</editor-fold>

}
