/**
 * @description Provides default and static methods of 
 * {@link IComparator} functional interface.
 *
 * @see IComparator
 * @see IObjectIterable.sort
 * @see IObjectIterable.min
 * @see IObjectIterable.max
 * @see BinaryOperator.minBy
 * @see BinaryOperator.maxBy
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class Comparator implements IComparator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Integer compare(Object o1, Object o2);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `Comparator` of `this` and the `other`
     * comparator. If `this` considers two elements equal, the `other` determines
     * the final result.
     *
     * @param other the comparator to compare keys
     *
     * @return the `Comparator`
     *
     * @throws NullPointerException if `keyExtractor` or `keyComparator` is null
     */
    public virtual Comparator thenComparing(final IComparator other) {
        Validate.notNull(other);
        return new ThenComparing(this, other);
    }

    /**
     * @description Returns a composed `Comparator` of `this` and then comparing on the
     * key extracted by the `keyExtractor` function to be compared with the given
     * `keyComparator`.
     *
     * @param keyExtractor the function to extract the key to compare
     * @param keyComparator the comparator to compare keys
     *
     * @return the `Comparator`
     *
     * @throws NullPointerException if `keyExtractor` or `keyComparator` is null
     */
    public virtual Comparator thenComparing(final IFunction keyExtractor, final IComparator keyComparator) {
        return thenComparing(comparing(keyExtractor, keyComparator));
    }

    /**
     * @description Returns a composed `Comparator` of `this` and then comparing on the
     * key extracted by the `keyExtractor` function.
     *
     * @param keyExtractor the function to extract the key to compare
     *
     * @return the `Comparator`
     *
     * @throws NullPointerException if `keyExtractor` or `keyComparator` is null
     */
    public virtual Comparator thenComparing(final IFunction keyExtractor) {
        return thenComparing(comparing(keyExtractor));
    }

    /**
     * @description Returns a composed `Comparator` of `this` and then comparing on the
     * key extracted by the `keyExtractor` function.
     *
     * @param keyExtractor the function to extract the Integer key to compare
     *
     * @return the `Comparator`
     *
     * @throws NullPointerException if `keyExtractor` or `keyComparator` is null
     */
    public virtual Comparator thenComparingInt(final IToIntFunction keyExtractor) {
        return thenComparing(comparingInt(keyExtractor));
    }

    /**
     * @description Returns a composed `Comparator` of `this` and then comparing on the
     * key extracted by the `keyExtractor` function.
     *
     * @param keyExtractor the function to extract the Long key to compare
     *
     * @return the `Comparator`
     *
     * @throws NullPointerException if `keyExtractor` or `keyComparator` is null
     */
    public virtual Comparator thenComparingLong(final IToLongFunction keyExtractor) {
        return thenComparing(comparingLong(keyExtractor));
    }

    /**
     * @description Returns a composed `Comparator` of `this` and then comparing on the
     * key extracted by the `keyExtractor` function.
     *
     * @param keyExtractor the function to extract the Double key to compare
     *
     * @return the `Comparator`
     *
     * @throws NullPointerException if `keyExtractor` or `keyComparator` is null
     */
    public virtual Comparator thenComparingDouble(final IToDoubleFunction keyExtractor) {
        return thenComparing(comparingDouble(keyExtractor));
    }

    /**
     * @description Returns a composed `Comparator` of `this` and then comparing on the
     * key extracted by the `keyExtractor` function.
     *
     * @param keyExtractor the function to extract the SObject key to compare
     *
     * @return the `Comparator`
     *
     * @throws NullPointerException if `keyExtractor` or `keyComparator` is null
     */
    public virtual Comparator thenComparingSObject(final IToSObjectFunction keyExtractor) {
        return thenComparing(comparingSObject(keyExtractor));
    }

    /**
     * @description Returns a `Comparator` that imposes either `default` or
     * `reversed` ordering depending on the `order`.
     *
     * @param order the sort order
     *
     * @return the `Comparator`
     *
     * @throws NullPointerException if `order` is null
     *
     * @see SortOrder
     */
    public virtual Comparator order(final SortOrder order) {
        Validate.notNull(order);
        return order === SortOrder.ASCENDING ? this : this.reversed();
    }

    /**
     * @description Returns a null-safe `Comparator` of `this` comparator
     * that considers null to be less than non-null.
     *
     * @return the `Comparator`
     */
    public virtual Comparator nullsFirst() {
        return nullsFirst(this);
    }

    /**
     * @description Returns a null-safe `Comparator` of `this` comparator
     * that considers null to be greater than non-null.
     *
     * @return the `Comparator`
     */
    public virtual Comparator nullsLast() {
        return nullsLast(this);
    }

    /**
     * @description Returns a comparator that imposes the reverse ordering of `this` comparator.
     *
     * @return the `Comparator`
     */
    public virtual Comparator reversed() {
        return new ReverseOrder(this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods

    //<editor-fold desc="Comparing">
    /**
     * @description Returns a `Comparator` that compares extracted by
     * the `keyExtractor` keys using the `keyComparator`.
     *
     * @param keyExtractor the function to extract the key to compare
     * @param keyComparator the comparator to compare keys
     *
     * @return the `Comparator`
     *
     * @throws NullPointerException if `keyExtractor` or `keyComparator` is null
     */
    public static Comparator comparing(final IFunction keyExtractor, final IComparator keyComparator) {
        Validate.notNull(keyExtractor);
        Validate.notNull(keyComparator);
        return new Comparing(keyExtractor, keyComparator);
    }

    /**
     * @description Returns a `Comparator` that compares extracted by
     * the `keyExtractor` keys.
     *
     * @param keyExtractor the function to extract the key to compare
     *
     * @return the `Comparator`
     *
     * @throws NullPointerException if `keyExtractor` is null
     */
    public static Comparator comparing(final IFunction keyExtractor) {
        return comparing(keyExtractor, Comparator.defaultOrder());
    }

    /**
     * @description Returns a `Comparator` that compares extracted by
     * the `keyExtractor` keys.
     *
     * @param keyExtractor the function to extract the Integer key to compare
     *
     * @return the `Comparator`
     *
     * @throws NullPointerException if `keyExtractor` is null
     */
    public static Comparator comparingInt(final IToIntFunction keyExtractor) {
        Validate.notNull(keyExtractor);
        return new ComparingInt(keyExtractor);
    }

    /**
     * @description Returns a `Comparator` that compares extracted by
     * the `keyExtractor` keys.
     *
     * @param keyExtractor the function to extract the Long key to compare
     *
     * @return the `Comparator`
     *
     * @throws NullPointerException if `keyExtractor` is null
     */
    public static Comparator comparingLong(final IToLongFunction keyExtractor) {
        Validate.notNull(keyExtractor);
        return new ComparingLong(keyExtractor);
    }

    /**
     * @description Returns a `Comparator` that compares extracted by
     * the `keyExtractor` keys.
     *
     * @param keyExtractor the function to extract the Double key to compare
     *
     * @return the `Comparator`
     *
     * @throws NullPointerException if `keyExtractor` is null
     */
    public static Comparator comparingDouble(final IToDoubleFunction keyExtractor) {
        Validate.notNull(keyExtractor);
        return new ComparingDouble(keyExtractor);
    }

    /**
     * @description Returns a `Comparator` that compares extracted by
     * the `keyExtractor` keys.
     *
     * @param keyExtractor the function to extract the SObject key to compare
     *
     * @return the `Comparator`
     *
     * @throws NullPointerException if `keyExtractor` is null
     */
    public static Comparator comparingSObject(final IToSObjectFunction keyExtractor) {
        Validate.notNull(keyExtractor);
        return new ComparingSObject(keyExtractor);
    }
    //</editor-fold>

    //<editor-fold desc="Ordering">
    /**
     * @description Returns a comparator that imposes the default ordering.
     *
     * @return the `Comparator`
     */
    public static Comparator defaultOrder() {
        return new DefaultOrder();
    }

    /**
     * @description Returns a comparator that imposes the reverse ordering.
     *
     * @return the `Comparator`
     */
    public static Comparator reverseOrder() {
        return defaultOrder().reversed();
    }

    /**
     * @description Returns a null-safe `Comparator` of the `comparator`
     * that considers null to be less than non-null.
     *
     * @param comparator the comparator
     *
     * @return the `Comparator`
     *
     * @throws NullPointerException if `comparator` is null
     */
    public static Comparator nullsFirst(final Comparator comparator) {
        return new NullsOrder(true, comparator);
    }

    /**
     * @description Returns a null-safe `Comparator` of the `comparator`
     * that considers null to be greater than non-null.
     *
     * @param comparator the comparator
     *
     * @return the `Comparator`
     *
     * @throws NullPointerException if `comparator` is null
     */
    public static Comparator nullsLast(final Comparator comparator) {
        return new NullsOrder(false, comparator);
    }
    //</editor-fold>

    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Comparing extends Comparator {
        private final IFunction keyExtractor;
        private final IComparator keyComparator;
        private Comparing(IFunction keyExtractor, IComparator keyComparator) {
            this.keyExtractor = keyExtractor;
            this.keyComparator = keyComparator;
        }
        public override Integer compare(Object o1, Object o2) {
            return keyComparator.compare(keyExtractor.apply(o1), keyExtractor.apply(o2));
        }
    }

    private class ComparingInt extends Comparator {
        private final IToIntFunction keyExtractor;
        private ComparingInt(IToIntFunction keyExtractor) { this.keyExtractor = keyExtractor; }
        public override Integer compare(Object o1, Object o2) {
            return Comparators.compareNullSafeInts(keyExtractor.apply(o1), keyExtractor.apply(o2));
        }
    }

    private class ComparingLong extends Comparator {
        private final IToLongFunction keyExtractor;
        private ComparingLong(IToLongFunction keyExtractor) { this.keyExtractor = keyExtractor; }
        public override Integer compare(Object o1, Object o2) {
            return Comparators.compareNullSafeLongs(keyExtractor.apply(o1), keyExtractor.apply(o2));
        }
    }

    private class ComparingDouble extends Comparator {
        private final IToDoubleFunction keyExtractor;
        private ComparingDouble(IToDoubleFunction keyExtractor) { this.keyExtractor = keyExtractor; }
        public override Integer compare(Object o1, Object o2) {
            return Comparators.compareNullSafeDoubles(keyExtractor.apply(o1), keyExtractor.apply(o2));
        }
    }

    private class ComparingSObject extends Comparator {
        private final IToSObjectFunction keyExtractor;
        private ComparingSObject(IToSObjectFunction keyExtractor) { this.keyExtractor = keyExtractor; }
        public override Integer compare(Object o1, Object o2) {
            return Comparators.compareNullSafeSObjects(keyExtractor.apply(o1), keyExtractor.apply(o2));
        }
    }

    private class DefaultOrder extends Comparator {
        public override Integer compare(Object o1, Object o2) {
            return Comparators.compareNullSafeUntyped(o1, o2);
        }
    }

    private class ReverseOrder extends Comparator {
        private final IComparator comparator;
        private ReverseOrder(IComparator comparator) { this.comparator = comparator; }
        public override Integer compare(Object o1, Object o2) {
            return comparator.compare(o2, o1);
        }
    }

    private class NullsOrder extends Comparator {
        private final Boolean nullsFirst;
        private final Comparator comp;
        private NullsOrder(Boolean nullsFirst, Comparator comparator) {
            this.nullsFirst = nullsFirst;
            this.comp = comparator;
        }
        public override Integer compare(Object o1, Object o2) {
            if (o1 == null || o2 == null) { return Comparators.compareNullables(o1, o2, !nullsFirst); }
            return comp.compare(o1, o2);
        }
        public override Comparator thenComparing(IComparator other) {
            return new NullsOrder(nullsFirst, comp.thenComparing(other));
        }
        public override Comparator reversed() {
            return new NullsOrder(!nullsFirst, comp.reversed());
        }
    }

    private class ThenComparing extends Comparator {
        private final IComparator comparator;
        private final IComparator other;
        private ThenComparing(IComparator comparator, IComparator other) {
            this.comparator = comparator;
            this.other = other;
        }
        public override Integer compare(Object o1, Object o2) {
            Integer result = comparator.compare(o1, o2);
            return (result != 0) ? result : other.compare(o1, o2);
        }
    }
    // @end-group
    //</editor-fold>

}
