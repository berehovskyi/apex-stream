/**
 * @author O. Berehovskyi
 * @group Iterables
 * @description Provides a skeletal implementation of {@link IIntIterable}.
 */
public abstract inherited sharing class IntIterable implements IIntIterable {

    //<editor-fold desc="Sources">
    public abstract IIntIterable append(final Iterable<Integer> iterable);
    //</editor-fold>

    //<editor-fold desc="Conversion Operations">
    public virtual ILongIterable toLongIterable() {
        return mapToLong(IntToLongFunction.asLong());
    }

    public virtual IDoubleIterable toDoubleIterable() {
        return mapToDouble(IntToDoubleFunction.valueOf());
    }
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `IIntIterable` as a set union 
     * of the current and another iterables.
     * @example 
     * List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
     * List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
     * List<Integer> union = intsIterable1.union(ints2).toList(); // [5, 3, 9, 7, 8, 6, 4, 1, 0]
     * @param iterable the other iterable
     * @return the new `IIntIterable`
     */
    public virtual IIntIterable union(final Iterable<Integer> iterable) {
        return append(iterable).distinct();
    }

    /**
     * @description Returns a new `IIntIterable` as a set intersection 
     * of the current and another iterables.
     * @example 
     * List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
     * List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
     * List<Integer> intersection = intsIterable1.intersect(ints2).toList(); // [3, 9]
     * @param iterable the other iterable
     * @return the new `IIntIterable`
     */
    public virtual IIntIterable intersect(final Iterable<Integer> iterable) {
        return distinct().filter(IntPredicate.isIn(iterable));
    }

    /**
     * @description Returns a new `IIntIterable` as a set difference 
     * of the current and another iterables.
     * @example 
     * List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
     * List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
     * List<Integer> diff = intsIterable1.except(ints2).toList(); // [5, 7]
     * @param iterable the other iterable
     * @return the new `IIntIterable`
     */
    public virtual IIntIterable except(final Iterable<Integer> iterable) {
        return distinct().filter(IntPredicate.isIn(iterable).negate());
    }

    public abstract IIntIterable distinct();
    
    public abstract IIntIterable filter(final IIntPredicate predicate);

    public virtual IIntIterable withoutNulls() {
        return filter(IntPredicate.isNotNull());
    }

    public abstract ILongIterable mapToLong(final IIntToLongFunction mapper);

    public abstract IDoubleIterable mapToDouble(final IIntToDoubleFunction mapper);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    public abstract OptionalInt reduce(final IIntBinaryOperator operator);

    public abstract Boolean some(final IIntPredicate predicate);

    public virtual Boolean none(final IIntPredicate predicate) {
        return !some(predicate);
    }

    public virtual OptionalInt max() {
        return reduce(IntBinaryOperator.max());
    }

    public virtual OptionalInt min() {
        return reduce(IntBinaryOperator.min());
    }
    //</editor-fold>

}
