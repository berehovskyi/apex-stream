/**
 * @description Provides a skeletal implementation of {@link IEnumerable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 */
public abstract inherited sharing class ObjectEnumerable implements IObjectEnumerable {

    //<editor-fold desc="Iterator">
    public abstract Iterator<Object> iterator();
    //</editor-fold>

    //<editor-fold desc="Sources">
    public abstract ObjectEnumerable append(final Iterable<Object> iterable);

    public abstract ObjectEnumerable prepend(final Iterable<Object> iterable);
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `IObjectIterable` as a set union
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IObjectIterable`
     *
     * @example
     * List<Object> objects1 = new List<Object>{ obj5, obj3, obj9, obj7, obj5, obj9, obj3, obj7 };
     * List<Object> objects2 = new List<Object>{ obj8, obj3, obj6, obj4, obj4, obj9, obj1, obj0 };
     * List<Object> union = objectsIterable1.union(objects2).toList();
     * // [obj5, obj3, obj9, obj7, obj8, obj6, obj4, obj1, obj0]
     */
    public virtual ObjectEnumerable union(final Iterable<Object> iterable) {
        return (ObjectEnumerable) append(iterable).distinct();
    }

    /**
     * @description Returns a new `IObjectIterable` as a set union
     * of the current and another iterables according to `classifier`.
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `IObjectIterable`
     *
     * @example
     * List<Object> objects1 = new List<Object>{ obj5, obj3, obj9, obj7, obj5, obj9, obj3, obj7 };
     * List<Object> objects2 = new List<Object>{ obj8, obj3, obj6, obj4, obj4, obj9, obj1, obj0 };
     * List<Object> unionByClassifier = objectsIterable1.union(objects2, classifier);
     */
    public virtual ObjectEnumerable union(final Iterable<Object> iterable, final IFunction classifier) {
        return (ObjectEnumerable) append(iterable).distinct(classifier);
    }

    /**
     * @description Returns a new `IObjectIterable` as a set intersection
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IObjectIterable`
     *
     * @example
     * List<Object> objects1 = new List<Object>{ obj5, obj3, obj9, obj7, obj5, obj9, obj3, obj7 };
     * List<Object> objects2 = new List<Object>{ obj8, obj3, obj6, obj4, obj4, obj9, obj1, obj0 };
     * List<Object> intersection = objectsIterable1.intersect(objects2).toList(); // [obj3, obj9]
     */
    public virtual ObjectEnumerable intersect(final Iterable<Object> iterable) {
        return (ObjectEnumerable) distinct().filter(BasePredicates.isIn(iterable));
    }

    /**
     * @description Returns a new `IObjectIterable` as a set intersection
     * of the current and another iterables according to `classifier`.
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `IObjectIterable`
     *
     * @example
     * List<Object> objects1 = new List<Object>{ obj5, obj3, obj9, obj7, obj5, obj9, obj3, obj7 };
     * List<Object> objects2 = new List<Object>{ obj8, obj3, obj6, obj4, obj4, obj9, obj1, obj0 };
     * List<Object> intersectionByClassifier = objectsIterable1.intersect(objects2, classifier);
     */
    public virtual ObjectEnumerable intersect(final Iterable<Object> iterable, final IFunction classifier) {
        return (ObjectEnumerable) distinct(classifier).filter(BasePredicates.isIn(
                classifier, (Iterable<Object>) EnumerablePipeline.toObjectSet(iterable, classifier))
        );
    }

    /**
     * @description Returns a new `IObjectIterable` as a set difference
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `IObjectIterable`
     *
     * @example
     * List<Object> objects1 = new List<Object>{ obj5, obj3, obj9, obj7, obj5, obj9, obj3, obj7 };
     * List<Object> objects2 = new List<Object>{ obj8, obj3, obj6, obj4, obj4, obj9, obj1, obj0 };
     * List<Object> diff = objectsIterable1.except(objects2).toList(); // [obj5, obj7]
     */
    public virtual ObjectEnumerable except(final Iterable<Object> iterable) {
        return (ObjectEnumerable) distinct().filter(BasePredicates.isIn(iterable).negate());
    }

    /**
     * @description Returns a new `IObjectIterable` as a set difference
     * of the current and another iterables according to `classifier`.
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `IObjectIterable`
     *
     * @example
     * List<Object> objects1 = new List<Object>{ obj5, obj3, obj9, obj7, obj5, obj9, obj3, obj7 };
     * List<Object> objects2 = new List<Object>{ obj8, obj3, obj6, obj4, obj4, obj9, obj1, obj0 };
     * List<Object> diffByClassifier = objectsIterable1.except(objects2, classifier);
     */
    public virtual ObjectEnumerable except(final Iterable<Object> iterable, final IFunction classifier) {
        return (ObjectEnumerable) distinct(classifier).filter(BasePredicates.isIn(
                classifier, (Iterable<Object>) EnumerablePipeline.toObjectSet(iterable, classifier)
        ).negate());
    }

    public abstract ObjectEnumerable distinct();

    public abstract ObjectEnumerable distinct(final IFunction classifier);

    public abstract ObjectEnumerable filter(final IPredicate predicate);
    
    public abstract ObjectEnumerable take(final IPredicate predicate);
    
    public abstract ObjectEnumerable drop(final IPredicate predicate);

    public virtual ObjectEnumerable withoutNulls() {
        return filter(BasePredicates.isNotNull());
    }

    public abstract ObjectEnumerable mapTo(final IOperator mapper);

    public abstract IntEnumerable mapToInt(final IFunction mapper);
    
    public abstract LongEnumerable mapToLong(final IFunction mapper);
    
    public abstract DoubleEnumerable mapToDouble(final IFunction mapper);

    public abstract SObjectEnumerable mapToSObject(final IFunction mapper);
    
    public abstract ObjectEnumerable flatMapTo(final IFunction mapper);

    public abstract IntEnumerable flatMapToInt(final IFunction mapper);
    
    public abstract LongEnumerable flatMapToLong(final IFunction mapper);
    
    public abstract DoubleEnumerable flatMapToDouble(final IFunction mapper);
    
    public abstract SObjectEnumerable flatMapToSObject(final IFunction mapper);

    public abstract ObjectEnumerable forEach(final IConsumer consumer);

    public abstract ObjectEnumerable sort();

    public abstract ObjectEnumerable sort(final IComparer comparer);

    public virtual ObjectEnumerable sort(final SortOrder order) {
        return sort(Comparer.defaultOrder().order(order));
    }

    public abstract ObjectEnumerable lim(final Integer lim);

    public abstract ObjectEnumerable skip(final Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    public abstract Object reduce(final Object identity, final IBiOperator accumulator);
    
    public abstract Optional reduce(final IBiOperator accumulator);

//    public abstract Object collect(final ISupplier supplier, final IBiConsumer accumulator);

    public abstract Object collect(final ICollector collector);

    public abstract Optional find(final IPredicate predicate);

    public abstract Boolean every(final IPredicate predicate);

    public abstract Boolean some(final IPredicate predicate);

    public virtual Boolean none(final IPredicate predicate) {
        return !some(predicate);
    }

    public virtual Optional max(final IComparer comparer) {
        return reduce(BiOperator.maxBy(comparer));
    }

    public virtual Optional min(final IComparer comparer) {
        return reduce(BiOperator.minBy(comparer));
    }

    public abstract Integer count();

    public abstract Boolean isEmpty();

    public abstract List<Object> toList();

    public virtual List<Object> toList(final Type elementType) {
        return (List<Object>) collect(BaseCollectors.toList(elementType));
    }

    public abstract Set<Object> toSet();
    //</editor-fold>

}
