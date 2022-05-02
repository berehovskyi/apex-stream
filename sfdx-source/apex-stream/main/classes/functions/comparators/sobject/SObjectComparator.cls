/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Inherits {@link ISObjectComparator} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see ISObjectIterable.sort
 * @see ISObjectIterable.min
 * @see ISObjectIterable.max
 * @see SObjectBinaryOperator.minBy
 * @see SObjectBinaryOperator.maxBy
 */
public abstract inherited sharing class SObjectComparator implements ISObjectComparator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Integer compare(SObject sObj1, SObject sObj2);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `SObjectComparator` of `this` and the `other`
     * comparator. If `this` considers two elements equal, the `other` determines
     * the final result.
     * @param other the comparator to compare keys
     * @return the `SObjectComparator`
     * @throws NullPointerException if `keyExtractor` or `keyComparator` is null
     */
    public virtual SObjectComparator thenComparing(final ISObjectComparator other) {
        Validate.notNull(other);
        return new ThenComparing(this, other);
    }

    /**
     * @description Returns a composed `SObjectComparator` of `this` and then comparing on the
     * key extracted by the `keyExtractor` function to be compared with the given
     * `keyComparator`.
     * @param keyExtractor the function to extract the key to compare
     * @param keyComparator the comparator to compare keys
     * @return the `SObjectComparator`
     * @throws NullPointerException if `keyExtractor` or `keyComparator` is null
     */
    public virtual SObjectComparator thenComparing(
            final ISObjectFunction keyExtractor,
            final IComparator keyComparator
    ) {
        return thenComparing(comparing(keyExtractor, keyComparator));
    }

    /**
     * @description Returns a composed `SObjectComparator` of `this` and then comparing on the
     * key extracted by the `keyExtractor` function.
     * @param keyExtractor the function to extract the key to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `keyExtractor` or `keyComparator` is null
     */
    public virtual SObjectComparator thenComparing(final ISObjectFunction keyExtractor) {
        return thenComparing(comparing(keyExtractor));
    }

    /**
     * @description Returns a composed `SObjectComparator` of `this` and then comparing on the
     * key extracted by the `keyExtractor` function.
     * @param keyExtractor the function to extract the Integer key to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `keyExtractor` or `keyComparator` is null
     */
    public virtual SObjectComparator thenComparingInt(final ISObjectToIntFunction keyExtractor) {
        return thenComparing(comparingInt(keyExtractor));
    }

    /**
     * @description Returns a composed `SObjectComparator` of `this` and then comparing on the
     * key extracted by the `keyExtractor` function.
     * @param keyExtractor the function to extract the Long key to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `keyExtractor` or `keyComparator` is null
     */
    public virtual SObjectComparator thenComparingLong(final ISObjectToLongFunction keyExtractor) {
        return thenComparing(comparingLong(keyExtractor));
    }

    /**
     * @description Returns a composed `SObjectComparator` of `this` and then comparing on the
     * key extracted by the `keyExtractor` function.
     * @param keyExtractor the function to extract the Double key to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `keyExtractor` or `keyComparator` is null
     */
    public virtual SObjectComparator thenComparingDouble(final ISObjectToDoubleFunction keyExtractor) {
        return thenComparing(comparingDouble(keyExtractor));
    }

    /**
     * @description Returns a composed `SObjectComparator` of `this` and then comparing on the
     * key extracted by the `keyExtractor` function.
     * @param keyExtractor the function to extract the SObject key to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `keyExtractor` or `keyComparator` is null
     */
    public virtual SObjectComparator thenComparingSObject(final ISObjectUnaryOperator keyExtractor) {
        return thenComparing(comparingSObject(keyExtractor));
    }

    /**
     * @description Returns a `SObjectComparator` that imposes either `default` or
     * `reversed` ordering depending on the `order`.
     * @param order the sort order
     * @return the `SObjectComparator`
     * @throws NullPointerException if `order` is null
     * @see SortOrder
     */
    public virtual SObjectComparator order(final SortOrder order) {
        Validate.notNull(order);
        return order === SortOrder.ASCENDING ? this : this.reversed();
    }

    /**
     * @description Returns a null-safe `SObjectComparator` of `this` comparator
     * that considers null to be less than non-null.
     * @return the `SObjectComparator`
     */
    public virtual SObjectComparator nullsFirst() {
        return nullsFirst(this);
    }

    /**
     * @description Returns a null-safe `SObjectComparator` of `this` comparator
     * that considers null to be greater than non-null.
     * @return the `SObjectComparator`
     */
    public virtual SObjectComparator nullsLast() {
        return nullsLast(this);
    }

    /**
     * @description Returns a comparator that imposes the reverse ordering of `this` comparator.
     * @return the `SObjectComparator`
     */
    public virtual SObjectComparator reversed() {
        return new ReverseOrder(this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods

    //<editor-fold desc="Comparing">
    /**
     * @description Returns a `SObjectComparator` that compares extracted by
     * the `keyExtractor` keys using the `keyComparator`.
     * @param keyExtractor the function to extract the key to compare
     * @param keyComparator the comparator to compare keys
     * @return the `SObjectComparator`
     * @throws NullPointerException if `keyExtractor` or `keyComparator` is null
     */
    public static SObjectComparator comparing(final ISObjectFunction keyExtractor, final IComparator keyComparator) {
        Validate.notNull(keyExtractor);
        Validate.notNull(keyComparator);
        return new Comparing(keyExtractor, keyComparator);
    }

    /**
     * @description Returns a `SObjectComparator` that compares extracted by
     * the `keyExtractor` keys.
     * @param keyExtractor the function to extract the key to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `keyExtractor` is null
     */
    public static SObjectComparator comparing(final ISObjectFunction keyExtractor) {
        return comparing(keyExtractor, Comparator.defaultOrder());
    }

    /**
     * @description Returns a `SObjectComparator` that compares `fieldName` values.
     * Cross-reference fields and safe navigation are supported.
     * @param fieldName the value of which to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     */
    public static SObjectComparator comparing(final String fieldName) {
        return comparing(SObjectFunction.get(fieldName));
    }

    /**
     * @description Returns a `SObjectComparator` that compares `field` values.
     * @param field the value of which to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `field` is null
     */
    public static SObjectComparator comparing(final SObjectField field) {
        return comparing(SObjectFunction.get(field));
    }

    /**
     * @description Returns a `SObjectComparator` that compares extracted by
     * the `keyExtractor` keys.
     * @param keyExtractor the function to extract the Integer key to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `keyExtractor` is null
     */
    public static SObjectComparator comparingInt(final ISObjectToIntFunction keyExtractor) {
        Validate.notNull(keyExtractor);
        return new ComparingInt(keyExtractor);
    }

    /**
     * @description Returns a `SObjectComparator` that compares `fieldName` values.
     * Cross-reference fields and safe navigation are supported.
     * @param fieldName the Integer value of which to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     */
    public static SObjectComparator comparingInt(final String fieldName) {
        return comparingInt(SObjectToIntFunction.get(fieldName));
    }

    /**
     * @description Returns a `SObjectComparator` that compares `field` values.
     * @param field the Integer value of which to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `field` is null
     */
    public static SObjectComparator comparingInt(final SObjectField field) {
        return comparingInt(SObjectToIntFunction.get(field));
    }

    /**
     * @description Returns a `SObjectComparator` that compares extracted by
     * the `keyExtractor` keys.
     * @param keyExtractor the function to extract the Long key to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `keyExtractor` is null
     */
    public static SObjectComparator comparingLong(final ISObjectToLongFunction keyExtractor) {
        Validate.notNull(keyExtractor);
        return new ComparingLong(keyExtractor);
    }

    /**
     * @description Returns a `SObjectComparator` that compares `fieldName` values.
     * Cross-reference fields and safe navigation are supported.
     * @param fieldName the Long value of which to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     */
    public static SObjectComparator comparingLong(final String fieldName) {
        return comparingLong(SObjectToLongFunction.get(fieldName));
    }

    /**
     * @description Returns a `SObjectComparator` that compares `field` values.
     * @param field the Long value of which to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `field` is null
     */
    public static SObjectComparator comparingLong(final SObjectField field) {
        return comparingLong(SObjectToLongFunction.get(field));
    }

    /**
     * @description Returns a `SObjectComparator` that compares extracted by
     * the `keyExtractor` keys.
     * @param keyExtractor the function to extract the Double key to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `keyExtractor` is null
     */
    public static SObjectComparator comparingDouble(final ISObjectToDoubleFunction keyExtractor) {
        Validate.notNull(keyExtractor);
        return new ComparingDouble(keyExtractor);
    }

    /**
     * @description Returns a `SObjectComparator` that compares `fieldName` values.
     * Cross-reference fields and safe navigation are supported.
     * @param fieldName the Double value of which to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     */
    public static SObjectComparator comparingDouble(final String fieldName) {
        return comparingDouble(SObjectToDoubleFunction.get(fieldName));
    }

    /**
     * @description Returns a `SObjectComparator` that compares `field` values.
     * @param field the Double value of which to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `field` is null
     */
    public static SObjectComparator comparingDouble(final SObjectField field) {
        return comparingDouble(SObjectToDoubleFunction.get(field));
    }

    /**
     * @description Returns a `SObjectComparator` that compares extracted by
     * the `keyExtractor` keys.
     * @param keyExtractor the function to extract the SObject key to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `keyExtractor` is null
     */
    public static SObjectComparator comparingSObject(final ISObjectUnaryOperator keyExtractor) {
        Validate.notNull(keyExtractor);
        return new ComparingSObject(keyExtractor);
    }

    /**
     * @description Returns a `SObjectComparator` that compares `fieldName` values.
     * Cross-reference fields and safe navigation are supported.
     * @param fieldName the SObject value of which to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `fieldName` is blank
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     */
    public static SObjectComparator comparingSObject(final String fieldName) {
        return comparingSObject(SObjectUnaryOperator.getSObject(fieldName));
    }

    /**
     * @description Returns a `SObjectComparator` that compares `field` values.
     * @param field the SObject value of which to compare
     * @return the `SObjectComparator`
     * @throws NullPointerException if `field` is null
     */
    public static SObjectComparator comparingSObject(final SObjectField field) {
        return comparingSObject(SObjectUnaryOperator.getSObject(field));
    }
    //</editor-fold>

    //<editor-fold desc="Ordering">
    /**
     * @description Returns a comparator that imposes the default ordering.
     * @return the `SObjectComparator`
     */
    public static SObjectComparator defaultOrder() {
        return new DefaultOrder();
    }

    /**
     * @description Returns a comparator that imposes the reverse ordering.
     * @return the `SObjectComparator`
     */
    public static SObjectComparator reverseOrder() {
        return defaultOrder().reversed();
    }

    /**
     * @description Returns a null-safe `SObjectComparator` of the `comparator`
     * that considers null to be less than non-null.
     * @return the `SObjectComparator`
     * @throws NullPointerException if `comparator` is null
     */
    public static SObjectComparator nullsFirst(final SObjectComparator comparator) {
        Validate.notNull(comparator);
        return new NullsOrder(true, comparator);
    }

    /**
     * @description Returns a null-safe `SObjectComparator` of the `comparator`
     * that considers null to be greater than non-null.
     * @return the `SObjectComparator`
     * @throws NullPointerException if `comparator` is null
     */
    public static SObjectComparator nullsLast(final SObjectComparator comparator) {
        Validate.notNull(comparator);
        return new NullsOrder(false, comparator);
    }
    //</editor-fold>

    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Comparing extends SObjectComparator {
        private final ISObjectFunction keyExtractor;
        private final IComparator keyComparator;
        private Comparing(ISObjectFunction keyExtractor, IComparator keyComparator) {
            this.keyExtractor = keyExtractor;
            this.keyComparator = keyComparator;
        }
        public override Integer compare(SObject sObj1, SObject sObj2) {
            return keyComparator.compare(keyExtractor.apply(sObj1), keyExtractor.apply(sObj2));
        }
    }

    private class ComparingInt extends SObjectComparator {
        private final ISObjectToIntFunction keyExtractor;
        private ComparingInt(ISObjectToIntFunction keyExtractor) { this.keyExtractor = keyExtractor; }
        public override Integer compare(SObject sObj1, SObject sObj2) {
            return Comparator.compareNullSafeInts(keyExtractor.apply(sObj1), keyExtractor.apply(sObj2));
        }
    }

    private class ComparingLong extends SObjectComparator {
        private final ISObjectToLongFunction keyExtractor;
        private ComparingLong(ISObjectToLongFunction keyExtractor) { this.keyExtractor = keyExtractor; }
        public override Integer compare(SObject sObj1, SObject sObj2) {
            return Comparator.compareNullSafeLongs(keyExtractor.apply(sObj1), keyExtractor.apply(sObj2));
        }
    }

    private class ComparingDouble extends SObjectComparator {
        private final ISObjectToDoubleFunction keyExtractor;
        private ComparingDouble(ISObjectToDoubleFunction keyExtractor) { this.keyExtractor = keyExtractor; }
        public override Integer compare(SObject sObj1, SObject sObj2) {
            return Comparator.compareNullSafeDoubles(keyExtractor.apply(sObj1), keyExtractor.apply(sObj2));
        }
    }

    private class ComparingSObject extends SObjectComparator {
        private final ISObjectUnaryOperator keyExtractor;
        private ComparingSObject(ISObjectUnaryOperator keyExtractor) { this.keyExtractor = keyExtractor; }
        public override Integer compare(SObject sObj1, SObject sObj2) {
            return Comparator.compareNullSafeSObjects(keyExtractor.apply(sObj1), keyExtractor.apply(sObj2));
        }
    }

    private class DefaultOrder extends SObjectComparator {
        public override Integer compare(SObject sObj1, SObject sObj2) {
            return Comparator.compareNullSafeSObjects(sObj1, sObj2);
        }
    }

    private class ReverseOrder extends SObjectComparator {
        private final ISObjectComparator comparator;
        private ReverseOrder(ISObjectComparator comparator) { this.comparator = comparator; }
        public override Integer compare(SObject sObj1, SObject sObj2) {
            return comparator.compare(sObj2, sObj1);
        }
    }

    private class NullsOrder extends SObjectComparator {
        private final Boolean nullsFirst;
        private final SObjectComparator comp;
        private NullsOrder(Boolean nullsFirst, SObjectComparator comparator) {
            this.nullsFirst = nullsFirst;
            this.comp = comparator;
        }
        public override Integer compare(SObject sObj1, SObject sObj2) {
            if (sObj1 == null || sObj2 == null) {
                return Comparator.compareNullables(sObj1, sObj2, !nullsFirst);
            }
            return comp.compare(sObj1, sObj2);
        }
        public override SObjectComparator thenComparing(ISObjectComparator other) {
            Validate.notNull(other);
            return new NullsOrder(nullsFirst, comp.thenComparing(other));
        }
        public override SObjectComparator reversed() {
            return new NullsOrder(!nullsFirst, comp.reversed());
        }
    }

    private class ThenComparing extends SObjectComparator {
        private final ISObjectComparator comparator;
        private final ISObjectComparator other;
        private ThenComparing(ISObjectComparator comparator, ISObjectComparator other) {
            this.comparator = comparator;
            this.other = other;
        }
        public override Integer compare(SObject sObj1, SObject sObj2) {
            Integer result = comparator.compare(sObj1, sObj2);
            return (result != 0) ? result : other.compare(sObj1, sObj2);
        }
    }
    // @end-group
    //</editor-fold>

}
