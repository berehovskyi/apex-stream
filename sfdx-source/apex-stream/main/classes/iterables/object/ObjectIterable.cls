/**
 * @description Provides a skeletal implementation of {@link IObjectIterable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 */
public abstract inherited sharing class ObjectIterable implements IObjectIterable {

    //<editor-fold desc="Sources">
    public abstract IObjectIterable append(final Iterable<Object> iterable);
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
    public virtual IObjectIterable union(final Iterable<Object> iterable) {
        return append(iterable).distinct();
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
    public virtual IObjectIterable union(final Iterable<Object> iterable, final IFunction classifier) {
        return append(iterable).distinct(classifier);
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
    public virtual IObjectIterable intersect(final Iterable<Object> iterable) {
        return distinct().filter(Predicate.isIn(iterable));
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
    public virtual IObjectIterable intersect(final Iterable<Object> iterable, final IFunction classifier) {
        return distinct(classifier).filter(Predicate.isIn(
                classifier, (Iterable<Object>) Iterators.toObjectSet(iterable.iterator(), classifier))
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
    public virtual IObjectIterable except(final Iterable<Object> iterable) {
        return distinct().filter(Predicate.isIn(iterable).negate());
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
    public virtual IObjectIterable except(final Iterable<Object> iterable, final IFunction classifier) {
        return distinct(classifier).filter(Predicate.isIn(
                classifier, (Iterable<Object>) Iterators.toObjectSet(iterable.iterator(), classifier)
        ).negate());
    }

    public abstract IObjectIterable distinct();

    public abstract IObjectIterable distinct(final IFunction classifier);

    public abstract IObjectIterable filter(final IPredicate predicate);

    public virtual IObjectIterable withoutNulls() {
        return filter(Predicate.isNotNull());
    }

    public abstract IObjectIterable sort(final IComparator comparator);

    public virtual IObjectIterable sort(final SortOrder order) {
        return sort(Comparator.defaultOrder().order(order));
    }
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
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
