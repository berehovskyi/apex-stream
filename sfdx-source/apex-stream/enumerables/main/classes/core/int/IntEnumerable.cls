/**
 * @description Provides a skeletal implementation of {@link IIntEnumerable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 */
public abstract inherited sharing class IntEnumerable implements IIntEnumerable {

    public abstract Iterator<Integer> iterator();

    //<editor-fold desc="Sources">
    public abstract IntEnumerable append(final Iterable<Integer> iterable);
    
    public abstract IntEnumerable prepend(final Iterable<Integer> iterable);
    //</editor-fold>

//    //<editor-fold desc="Conversion Operations">
//    public virtual ILongIterable toLongIterable() {
//        return mapToLong(IntToLongFunctions.asLong());
//    }
//
//    public virtual IDoubleIterable toDoubleIterable() {
//        return mapToDouble(IntToDoubleFunctions.valueOf());
//    }
//    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `IIntIterable` as a set union
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IIntIterable`
     *
     * @example
     * List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
     * List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
     * List<Integer> union = intsIterable1.union(ints2).toList(); // [5, 3, 9, 7, 8, 6, 4, 1, 0]
     */
    public virtual IntEnumerable union(final Iterable<Integer> iterable) {
        return (IntEnumerable) append(iterable).distinct();
    }

    /**
     * @description Returns a new `IIntIterable` as a set intersection
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IIntIterable`
     *
     * @example
     * List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
     * List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
     * List<Integer> intersection = intsIterable1.intersect(ints2).toList(); // [3, 9]
     */
    public virtual IntEnumerable intersect(final Iterable<Integer> iterable) {
        return (IntEnumerable) distinct().filter(BasePredicates.isIn(iterable));
    }

    /**
     * @description Returns a new `IIntIterable` as a set difference
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IIntIterable`
     *
     * @example
     * List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
     * List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
     * List<Integer> diff = intsIterable1.except(ints2).toList(); // [5, 7]
     */
    public virtual IntEnumerable except(final Iterable<Integer> iterable) {
        return (IntEnumerable) distinct().filter(BasePredicates.isIn(iterable).negate());
    }

    public abstract IntEnumerable distinct();

    public abstract IntEnumerable filter(final IPredicate predicate);

    public abstract IntEnumerable take(final IPredicate predicate);

    public abstract IntEnumerable drop(final IPredicate predicate);

    public virtual IntEnumerable withoutNulls() {
        return filter(BasePredicates.isNotNull());
    }

    public abstract IntEnumerable mapTo(final IOperator mapper);

    public abstract LongEnumerable mapToLong(final IFunction mapper);

    public abstract DoubleEnumerable mapToDouble(final IFunction mapper);

    public abstract SObjectEnumerable mapToSObject(final IFunction mapper);

    public abstract ObjectEnumerable mapToObject(final IFunction mapper);

    public abstract IntEnumerable flatMapTo(final IFunction mapper);

    public abstract IntEnumerable forEach(final IConsumer consumer);

    public abstract IntEnumerable sort();

    public abstract IntEnumerable sort(final SortOrder order);

    public abstract IntEnumerable lim(final Integer lim);

    public abstract IntEnumerable skip(final Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    public abstract Integer reduce(final Integer identity, final IBiOperator accumulator);
    
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

    public abstract Integer sum();

    public abstract Optional avg();

    public abstract Integer count();

    public abstract Boolean isEmpty();

    public abstract List<Integer> toList();

    public abstract Set<Integer> toSet();
    //</editor-fold>

}
