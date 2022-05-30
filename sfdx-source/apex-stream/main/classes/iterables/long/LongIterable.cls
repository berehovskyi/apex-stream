/**
 * @author O. Berehovskyi
 * @group Iterables
 * @description Provides a skeletal implementation of {@link ILongIterable}.
 */
public abstract inherited sharing class LongIterable implements ILongIterable {

    //<editor-fold desc="Sources">
    public abstract ILongIterable append(final Iterable<Long> iterable);
    //</editor-fold>

    //<editor-fold desc="Conversion Operations">
    public virtual IIntIterable toIntIterable() {
        return mapToInt(LongToIntFunction.valueOf());
    }

    public virtual IDoubleIterable toDoubleIterable() {
        return mapToDouble(LongToDoubleFunction.valueOf());
    }
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `ILongIterable` as a set union 
     * of the current and another iterables.
     * @example 
     * List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
     * List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
     * List<Long> union = longsIterable1.union(longs2).toList(); // [5L, 3L, 9L, 7L, 8L, 6L, 4L, 1L, 0L]
     * @param iterable the other iterable
     * @return the new `ILongIterable`
     */
    public virtual ILongIterable union(final Iterable<Long> iterable) {
        return append(iterable).distinct();
    }

    /**
     * @description Returns a new `ILongIterable` as a set intersection 
     * of the current and another iterables.
     * @example 
     * List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
     * List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
     * List<Long> intersection = longsIterable1.intersect(longs2).toList(); // [3L, 9L]
     * @param iterable the other iterable
     * @return the new `ILongIterable`
     */
    public virtual ILongIterable intersect(final Iterable<Long> iterable) {
        return distinct().filter(LongPredicate.isIn(iterable));
    }

    /**
     * @description Returns a new `ILongIterable` as a set difference 
     * of the current and another iterables.
     * @example 
     * List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
     * List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
     * List<Long> diff = longsIterable1.except(longs2).toList(); // [5L, 7L]
     * @param iterable the other iterable
     * @return the new `ILongIterable`
     */
    public virtual ILongIterable except(final Iterable<Long> iterable) {
        return distinct().filter(LongPredicate.isIn(iterable).negate());
    }

    public abstract ILongIterable distinct();
    
    public abstract ILongIterable filter(final ILongPredicate predicate);

    public virtual ILongIterable withoutNulls() {
        return filter(LongPredicate.isNotNull());
    }

    public abstract IIntIterable mapToInt(final ILongToIntFunction mapper);

    public abstract IDoubleIterable mapToDouble(final ILongToDoubleFunction mapper);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    public abstract OptionalLong reduce(final ILongBinaryOperator operator);

    public abstract Boolean some(final ILongPredicate predicate);

    public virtual Boolean none(final ILongPredicate predicate) {
        return !some(predicate);
    }

    public virtual OptionalLong max() {
        return reduce(LongBinaryOperator.max());
    }

    public virtual OptionalLong min() {
        return reduce(LongBinaryOperator.min());
    }
    //</editor-fold>

}
