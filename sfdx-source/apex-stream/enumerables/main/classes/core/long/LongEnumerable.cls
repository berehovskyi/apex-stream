/**
 * @description Provides a skeletal implementation of {@link ILongEnumerable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 */
public abstract inherited sharing class LongEnumerable implements ILongEnumerable {

    //<editor-fold desc="Iterator">
    public abstract Iterator<Long> iterator();
    //</editor-fold>

    //<editor-fold desc="Sources">
    public abstract LongEnumerable append(final Iterable<Long> iterable);

    public abstract LongEnumerable prepend(final Iterable<Long> iterable);
    //</editor-fold>

//    //<editor-fold desc="Conversion Operations">
//    public virtual IIntIterable toIntIterable() {
//        return mapToInt(LongToIntFunctions.valueOf());
//    }
//
//    public virtual IDoubleIterable toDoubleIterable() {
//        return mapToDouble(LongToDoubleFunctions.valueOf());
//    }
//    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `ILongIterable` as a set union
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `ILongIterable`
     *
     * @example
     * List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
     * List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
     * List<Long> union = longsIterable1.union(longs2).toList(); // [5L, 3L, 9L, 7L, 8L, 6L, 4L, 1L, 0L]
     */
    public virtual LongEnumerable union(final Iterable<Long> iterable) {
        return (LongEnumerable) append(iterable).distinct();
    }

    /**
     * @description Returns a new `ILongIterable` as a set intersection
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `ILongIterable`
     *
     * @example
     * List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
     * List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
     * List<Long> intersection = longsIterable1.intersect(longs2).toList(); // [3L, 9L]
     */
    public virtual LongEnumerable intersect(final Iterable<Long> iterable) {
        return (LongEnumerable) distinct().filter(BasePredicates.isIn(iterable));
    }

    /**
     * @description Returns a new `ILongIterable` as a set difference
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `ILongIterable`
     *
     * @example
     * List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
     * List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
     * List<Long> diff = longsIterable1.except(longs2).toList(); // [5L, 7L]
     */
    public virtual LongEnumerable except(final Iterable<Long> iterable) {
        return (LongEnumerable) distinct().filter(BasePredicates.isIn(iterable).negate());
    }

    public abstract LongEnumerable distinct();

    public abstract LongEnumerable filter(final IPredicate predicate);

    public abstract LongEnumerable take(final IPredicate predicate);

    public abstract LongEnumerable drop(final IPredicate predicate);

    public virtual LongEnumerable withoutNulls() {
        return filter(BasePredicates.isNotNull());
    }

    public abstract LongEnumerable mapTo(final IOperator mapper);

    public abstract IntEnumerable mapToInt(final IFunction mapper);

    public abstract DoubleEnumerable mapToDouble(final IFunction mapper);

    public abstract SObjectEnumerable mapToSObject(final IFunction mapper);

    public abstract ObjectEnumerable mapToObject(final IFunction mapper);

    public abstract LongEnumerable flatMapTo(final IFunction mapper);

    public abstract LongEnumerable forEach(final IConsumer consumer);

    public abstract LongEnumerable sort();

    public abstract LongEnumerable sort(final SortOrder order);

    public abstract LongEnumerable lim(final Integer lim);

    public abstract LongEnumerable skip(final Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    public abstract Long reduce(final Long identity, final IBiOperator accumulator);
    
    public abstract Optional reduce(final IBiOperator operator);

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

    public virtual Optional min() {
        return reduce(BaseBiOperators.min());
    }

    public abstract Long sum();

    public abstract Optional avg();

    public abstract Integer count();

    public abstract Boolean isEmpty();

    public abstract List<Long> toList();

    public abstract Set<Long> toSet();
    //</editor-fold>

}
