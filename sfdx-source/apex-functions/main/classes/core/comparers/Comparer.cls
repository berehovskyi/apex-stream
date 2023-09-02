/**
 * @description Provides default and static methods of 
 * {@link IComparer} functional interface.
 *
 * @see IComparer
 * @see BiOperator.minBy
 * @see BiOperator.maxBy
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class Comparer implements IComparer {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Integer compare(Object o1, Object o2);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `Comparer` of `this` and the `other`
     * comparer. If `this` considers two elements equal, the `other` determines
     * the final result.
     *
     * @param other the comparer to compare keys
     *
     * @return the `Comparer`
     *
     * @throws NullPointerException if `keyExtractor` or `keyComparer` is null
     */
    public virtual Comparer thenComparing(final IComparer other) {
        Validate.notNull(other);
        return new ThenComparing(this, other);
    }

    /**
     * @description Returns a composed `Comparer` of `this` and then comparing on the
     * key extracted by the `keyExtractor` function to be compared with the given
     * `keyComparer`.
     *
     * @param keyExtractor the function to extract the key to compare
     * @param keyComparer the comparer to compare keys
     *
     * @return the `Comparer`
     *
     * @throws NullPointerException if `keyExtractor` or `keyComparer` is null
     */
    public virtual Comparer thenComparing(final IFunction keyExtractor, final IComparer keyComparer) {
        return thenComparing(comparing(keyExtractor, keyComparer));
    }

    /**
     * @description Returns a composed `Comparer` of `this` and then comparing on the
     * key extracted by the `keyExtractor` function.
     *
     * @param keyExtractor the function to extract the key to compare
     *
     * @return the `Comparer`
     *
     * @throws NullPointerException if `keyExtractor` or `keyComparer` is null
     */
    public virtual Comparer thenComparing(final IFunction keyExtractor) {
        return thenComparing(comparing(keyExtractor));
    }

    /**
     * @description Returns a `Comparer` that imposes either `default` or
     * `reversed` ordering depending on the `order`.
     *
     * @param order the sort order
     *
     * @return the `Comparer`
     *
     * @throws NullPointerException if `order` is null
     *
     * @see SortOrder
     */
    public virtual Comparer order(final SortOrder order) {
        Validate.notNull(order);
        return order === SortOrder.ASCENDING ? this : this.reversed();
    }

    /**
     * @description Returns a null-safe `Comparer` of `this` comparer
     * that considers null to be less than non-null.
     *
     * @return the `Comparer`
     */
    public virtual Comparer nullsFirst() {
        return nullsFirst(this);
    }

    /**
     * @description Returns a null-safe `Comparer` of `this` comparer
     * that considers null to be greater than non-null.
     *
     * @return the `Comparer`
     */
    public virtual Comparer nullsLast() {
        return nullsLast(this);
    }

    /**
     * @description Returns a comparer that imposes the reverse ordering of `this` comparer.
     *
     * @return the `Comparer`
     */
    public virtual Comparer reversed() {
        return new ReverseOrder(this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a `Comparer` that compares extracted by
     * the `keyExtractor` keys using the `keyComparer`.
     *
     * @param keyExtractor the function to extract the key to compare
     * @param keyComparer the comparer to compare keys
     *
     * @return the `Comparer`
     *
     * @throws NullPointerException if `keyExtractor` or `keyComparer` is null
     */
    public static Comparer comparing(final IFunction keyExtractor, final IComparer keyComparer) {
        Validate.notNull(keyExtractor);
        Validate.notNull(keyComparer);
        return new Comparing(keyExtractor, keyComparer);
    }

    /**
     * @description Returns a `Comparer` that compares extracted by
     * the `keyExtractor` keys.
     *
     * @param keyExtractor the function to extract the key to compare
     *
     * @return the `Comparer`
     *
     * @throws NullPointerException if `keyExtractor` is null
     */
    public static Comparer comparing(final IFunction keyExtractor) {
        return comparing(keyExtractor, Comparer.defaultOrder());
    }
    //</editor-fold>

    //<editor-fold desc="Ordering">
    /**
     * @description Returns a comparer that imposes the default ordering.
     *
     * @return the `Comparer`
     */
    public static Comparer defaultOrder() {
        return new DefaultOrder();
    }

    /**
     * @description Returns a comparer that imposes the reverse ordering.
     *
     * @return the `Comparer`
     */
    public static Comparer reverseOrder() {
        return defaultOrder().reversed();
    }

    /**
     * @description Returns a null-safe `Comparer` of the `comparer`
     * that considers null to be less than non-null.
     *
     * @param comparer the comparer
     *
     * @return the `Comparer`
     *
     * @throws NullPointerException if `comparer` is null
     */
    public static Comparer nullsFirst(final Comparer comparer) {
        return new NullsOrder(true, comparer);
    }

    /**
     * @description Returns a null-safe `Comparer` of the `comparer`
     * that considers null to be greater than non-null.
     *
     * @param comparer the comparer
     *
     * @return the `Comparer`
     *
     * @throws NullPointerException if `comparer` is null
     */
    public static Comparer nullsLast(final Comparer comparer) {
        return new NullsOrder(false, comparer);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Compare Methods">
    // @start-group Compare Methods
    /**
     * @description Compares the two nullable objects considering that at least one of them is null.
     *
     * @param o1 the first boolean to compare
     * @param o2 the second boolean to compare
     * @param isNullGreater the boolean determines if null value is greater than any other value
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNulls(Object o1, Object o2, Boolean isNullGreater) {
        return o1 == o2 ? 0 : compareUnequalNulls(o1, isNullGreater);
    }

    /**
     * @description Compares the two nullable objects considering that at least one of them is null.
     * Considers a non-null value as always greater than a null value.
     *
     * @param o1 the first boolean to compare
     * @param o2 the second boolean to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNulls(Object o1, Object o2) {
        return compareNulls(o1, o2, false);
    }

//    /**
//     * @description Compares the two non-null booleans considering `true` is greater than
//     * `false`.
//     *
//     * @param o1 the first boolean to compare
//     * @param o2 the second boolean to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareBools(Boolean o1, Boolean o2) {
//        return o1 == o2 ? 0 : compareUnequalBools(o1, o2);
//    }
//
//    /**
//     * @description Compares the two non-null strings.
//     * <p><strong>Note: </strong></p>
//     * <p>Id comparison is case-sensitive and does not distinguish between 15-character and 18-character formats</p>
//     *
//     * @param id1 the first id to compare
//     * @param id2 the second id to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareIds(Id id1, Id id2) {
//        return id1 == id2 ? 0 : compareUnequalIds(id1, id2);
//    }
//
    /**
     * @description Compares the two non-null strings.
     * <p><strong>Note: </strong></p>
     * <p>String comparison is case-insensitive.</p>
     *
     * @param str1 the first string to compare
     * @param str2 the second string to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareStrings(String str1, String str2) {
        return str1 == str2 ? 0 : compareUnequalStrings(str1, str2);
    }
//
//    /**
//     * @description Compares the two non-null blobs.
//     *
//     * @param b1 the first blob to compare
//     * @param b2 the second blob to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareBlobs(Blob b1, Blob b2) {
//        return (b1 == b2 && EncodingUtil.base64Encode(b1) == EncodingUtil.base64Encode(b2))
//            ? 0 : compareUnequalBlobs(b1, b2);
//    }
//
//    /**
//     * @description Compares the two non-null dates.
//     *
//     * @param d1 the first date to compare
//     * @param d2 the second date to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareDates(Date d1, Date d2) {
//        return d1 == d2 ? 0 : compareUnequalDates(d1, d2);
//    }
//
//    /**
//     * @description Compares the two non-null datetimes.
//     *
//     * @param dt1 the first datetime to compare
//     * @param dt2 the second datetime to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareDatetimes(Datetime dt1, Datetime dt2) {
//        return dt1 == dt2 ? 0 : compareUnequalDatetimes(dt1, dt2);
//    }
//
//    /**
//     * @description Compares the two non-null times.
//     *
//     * @param t1 the first time to compare
//     * @param t2 the second time to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareTimes(Time t1, Time t2) {
//        return t1 == t2 ? 0 : compareUnequalTimes(t1, t2);
//    }
//
//    /**
//     * @description Compares the two non-null integers.
//     *
//     * @param i1 the first Integer to compare
//     * @param i2 the second Integer to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareInts(Integer i1, Integer i2) {
//        return i1 == i2 ? 0 : compareUnequalInts(i1, i2);
//    }
//
//    /**
//     * @description Compares the two non-null longs.
//     *
//     * @param l1 the first Long to compare
//     * @param l2 the second Long to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareLongs(Long l1, Long l2) {
//        return l1 == l2 ? 0 : compareUnequalLongs(l1, l2);
//    }
//
//    /**
//     * @description Compares the two non-null Doubles.
//     *
//     * @param d1 the first Double to compare
//     * @param d2 the second Double to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareDoubles(Double d1, Double d2) {
//        return d1 == d2 ? 0 : compareUnequalDoubles(d1, d2);
//    }
//
//    /**
//     * @description Compares the two non-null sobjects.
//     *
//     * @param sObj1 the first SObject to compare
//     * @param sObj2 the second SObject to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareSObjects(SObject sObj1, SObject sObj2) {
//        return sObj1 == sObj2 ? 0 : compareUnequalSObjects(sObj1, sObj2);
//    }
//
//    /**
//     * @description Compares the two non-null comparables.
//     *
//     * @param x the first SObject to compare
//     * @param y the second SObject to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */


    /**
     * @description Compares the two non-null objects identifying its types first.
     * Supports all primitive types and comparable type.
     *
     * @param value1 the first object to compare
     * @param value2 the second object to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     *
     * @throws TypeException if types of comparing objects mismatch or if the type is user-defined type
     * and is not comparable.
     */
    public static Integer compareNonNullObjects(Object value1, Object value2) {
        if (value1 instanceof Comparable && value2 instanceof Comparable) {
            return compareComparables((Comparable) value1, (Comparable) value2);
        }
        if (value1 == value2) { return 0; }
        if (value1 instanceof SObject && !(value1 instanceof List<SObject>)
            && value2 instanceof SObject && !(value2 instanceof List<SObject>)) {
            return compareUnequalSObjects((SObject) value1, (SObject) value2);
        }
        if (value1 instanceof Boolean && value2 instanceof Boolean) {
            return compareUnequalBools((Boolean) value1, (Boolean) value2);
        }
        if (value1 instanceof Id && value2 instanceof Id) {
            return compareUnequalIds((Id) value1, (Id) value2);
        }
        if (value1 instanceof String && value2 instanceof String) {
            return compareUnequalStrings((String) value1, (String) value2);
        }
        if (value1 instanceof Blob && value2 instanceof Blob) {
            return compareUnequalBlobs((Blob) value1, (Blob) value2);
        }
        if (value1 instanceof Date && value2 instanceof Date) {
            return compareUnequalDates((Date) value1, (Date) value2);
        }
        if (value1 instanceof Datetime && value2 instanceof Datetime) {
            return compareUnequalDatetimes((Datetime) value1, (Datetime) value2);
        }
        if (value1 instanceof Time && value2 instanceof Time) {
            return compareUnequalTimes((Time) value1, (Time) value2);
        }
        if (value1 instanceof Integer && value2 instanceof Integer) {
            return compareUnequalInts((Integer) value1, (Integer) value2);
        }
        if (value1 instanceof Long && value2 instanceof Long) {
            return compareUnequalLongs((Long) value1, (Long) value2);
        }
        if (value1 instanceof Double && value2 instanceof Double) {
            return compareUnequalDoubles((Double) value1, (Double) value2);
        }
        return compareStrings(String.valueOf(value1), String.valueOf(value2));
    }

//    /**
//     * @description Compares the two nullable Booleans.
//     *
//     * @param b1 the first Boolean to compare
//     * @param b2 the second Boolean to compare
//     * @param isNullGreater the boolean determines if null value is greater than any other value
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeBools(Boolean b1, Boolean b2, Boolean isNullGreater) {
//        if (b1 == null || b2 == null) { return compareNullables(b1, b2, isNullGreater); }
//        return compareBools(b1, b2);
//    }
//
//    /**
//     * @description Compares the two nullable Booleans.
//     *
//     * @param b1 the first Boolean to compare
//     * @param b2 the second Boolean to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeBools(Boolean b1, Boolean b2) {
//        return compareNullSafeBools(b1, b2, false);
//    }
//
//    /**
//     * @description Compares the two nullable Ids.
//     *
//     * @param id1 the first Id to compare
//     * @param id2 the second Id to compare
//     * @param isNullGreater the boolean determines if null value is greater than any other value
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeIds(Id id1, Id id2, Boolean isNullGreater) {
//        if (id1 == null || id2 == null) { return compareNullables(id1, id2, isNullGreater); }
//        return compareIds(id1, id2);
//    }
//
//    /**
//     * @description Compares the two nullable Ids.
//     *
//     * @param id1 the first Id to compare
//     * @param id2 the second Id to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeIds(Id id1, Id id2) {
//        return compareNullSafeIds(id1, id2, false);
//    }
//
//    /**
//     * @description Compares the two nullable Strings.
//     *
//     * @param str1 the first String to compare
//     * @param str2 the second String to compare
//     * @param isNullGreater the boolean determines if null value is greater than any other value
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeStrings(String str1, String str2, Boolean isNullGreater) {
//        if (str1 == null || str2 == null) { return compareNullables(str1, str2, isNullGreater); }
//        return compareStrings(str1, str2);
//    }
//
//    /**
//     * @description Compares the two nullable Strings.
//     *
//     * @param str1 the first String to compare
//     * @param str2 the second String to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeStrings(String str1, String str2) {
//        return compareNullSafeStrings(str1, str2, false);
//    }
//
//    /**
//     * @description Compares the two nullable Blobs.
//     *
//     * @param b1 the first Blob to compare
//     * @param b2 the second Blob to compare
//     * @param isNullGreater the boolean determines if null value is greater than any other value
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeBlobs(Blob b1, Blob b2, Boolean isNullGreater) {
//        if (b1 == null || b2 == null) { return compareNullables(b1, b2, isNullGreater); }
//        return compareBlobs(b1, b2);
//    }
//
//    /**
//     * @description Compares the two nullable Blobs.
//     *
//     * @param b1 the first Blob to compare
//     * @param b2 the second Blob to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeBlobs(Blob b1, Blob b2) {
//        return compareNullSafeBlobs(b1, b2, false);
//    }
//
//    /**
//     * @description Compares the two nullable Dates.
//     *
//     * @param d1 the first Date to compare
//     * @param d2 the second Date to compare
//     * @param isNullGreater the boolean determines if null value is greater than any other value
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeDates(Date d1, Date d2, Boolean isNullGreater) {
//        if (d1 == null || d2 == null) { return compareNullables(d1, d2, isNullGreater); }
//        return compareDates(d1, d2);
//    }
//
//    /**
//     * @description Compares the two nullable Dates.
//     *
//     * @param d1 the first Date to compare
//     * @param d2 the second Date to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeDates(Date d1, Date d2) {
//        return compareNullSafeDates(d1, d2, false);
//    }
//
//    /**
//     * @description Compares the two nullable Datetimes.
//     *
//     * @param dt1 the first Datetime to compare
//     * @param dt2 the second Datetime to compare
//     * @param isNullGreater the boolean determines if null value is greater than any other value
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeDatetimes(Datetime dt1, Datetime dt2, Boolean isNullGreater) {
//        if (dt1 == null || dt2 == null) { return compareNullables(dt1, dt2, isNullGreater); }
//        return compareDatetimes(dt1, dt2);
//    }
//
//    /**
//     * @description Compares the two nullable Datetimes.
//     *
//     * @param dt1 the first Datetime to compare
//     * @param dt2 the second Datetime to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeDatetimes(Datetime dt1, Datetime dt2) {
//        return compareNullSafeDatetimes(dt1, dt2, false);
//    }
//
//    /**
//     * @description Compares the two nullable Times.
//     *
//     * @param t1 the first Time to compare
//     * @param t2 the second Time to compare
//     * @param isNullGreater the boolean determines if null value is greater than any other value
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeTimes(Time t1, Time t2, Boolean isNullGreater) {
//        if (t1 == null || t2 == null) { return compareNullables(t1, t2, isNullGreater); }
//        return compareTimes(t1, t2);
//    }
//
//    /**
//     * @description Compares the two nullable Times.
//     *
//     * @param t1 the first Time to compare
//     * @param t2 the second Time to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeTimes(Time t1, Time t2) {
//        return compareNullSafeTimes(t1, t2, false);
//    }
//
//    /**
//     * @description Compares the two nullable integers.
//     *
//     * @param i1 the first Integer to compare
//     * @param i2 the second Integer to compare
//     * @param isNullGreater the boolean determines if null value is greater than any other value
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeInts(Integer i1, Integer i2, Boolean isNullGreater) {
//        if (i1 == null || i2 == null) { return compareNullables(i1, i2, isNullGreater); }
//        return compareInts(i1, i2);
//    }
//
//    /**
//     * @description Compares the two nullable integers.
//     *
//     * @param i1 the first Integer to compare
//     * @param i2 the second Integer to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeInts(Integer i1, Integer i2) {
//        return compareNullSafeInts(i1, i2, false);
//    }
//
//    /**
//     * @description Compares the two nullable Longs.
//     *
//     * @param l1 the first Long to compare
//     * @param l2 the second Long to compare
//     * @param isNullGreater the boolean determines if null value is greater than any other value
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeLongs(Long l1, Long l2, Boolean isNullGreater) {
//        if (l1 == null || l2 == null) { return compareNullables(l1, l2, isNullGreater); }
//        return compareLongs(l1, l2);
//    }
//
//    /**
//     * @description Compares the two nullable Longs.
//     *
//     * @param l1 the first Long to compare
//     * @param l2 the second Long to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeLongs(Long l1, Long l2) {
//        return compareNullSafeLongs(l1, l2, false);
//    }
//
//    /**
//     * @description Compares the two nullable Doubles.
//     *
//     * @param d1 the first Double to compare
//     * @param d2 the second Double to compare
//     * @param isNullGreater the boolean determines if null value is greater than any other value
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeDoubles(Double d1, Double d2, Boolean isNullGreater) {
//        if (d1 == null || d2 == null) { return compareNullables(d1, d2, isNullGreater); }
//        return compareDoubles(d1, d2);
//    }
//
//    /**
//     * @description Compares the two nullable Doubles.
//     *
//     * @param d1 the first Double to compare
//     * @param d2 the second Double to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeDoubles(Double d1, Double d2) {
//        return compareNullSafeDoubles(d1, d2, false);
//    }
//
//    /**
//     * @description Compares the two nullable SObjects.
//     *
//     * @param sObj1 the first SObject to compare
//     * @param sObj2 the second SObject to compare
//     * @param isNullGreater the boolean determines if null value is greater than any other value
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeSObjects(SObject sObj1, SObject sObj2, Boolean isNullGreater) {
//        if (sObj1 == null || sObj2 == null) { return compareNullables(sObj1, sObj2, isNullGreater); }
//        return compareSObjects(sObj1, sObj2);
//    }
//
//    /**
//     * @description Compares the two nullable SObjects.
//     *
//     * @param sObj1 the first SObject to compare
//     * @param sObj2 the second SObject to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeSObjects(SObject sObj1, SObject sObj2) {
//        return compareNullSafeSObjects(sObj1, sObj2, false);
//    }
//
//    /**
//     * @description Compares the two nullable Comparables.
//     *
//     * @param x the first Comparable to compare
//     * @param y the second Comparable to compare
//     * @param isNullGreater the boolean determines if null value is greater than any other value
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeComparables(Comparable x, Comparable y, Boolean isNullGreater) {
//        if (x == null || y == null) { return compareNullables(x, y, isNullGreater); }
//        return compareComparables(x, y);
//    }
//
//    /**
//     * @description Compares the two nullable Comparables.
//     *
//     * @param x the first Comparable to compare
//     * @param y the second Comparable to compare
//     *
//     * @return `-1` if the first input arguments is less than the second one,
//     * `0` if they're equal, and `1` otherwise
//     */
//    public static Integer compareNullSafeComparables(Comparable x, Comparable y) {
//        return compareNullSafeComparables(x, y, false);
//    }
//
    /**
     * @description Compares the two non-null Objects identifying its types first.
     * Supports all primitive types as well as comparable type.
     *
     * @param value1 the first object to compare
     * @param value2 the second object to compare
     * @param isNullGreater the boolean determines if null value is greater than any other value
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     *
     * @throws TypeException if types of comparing objects mismatch or if the type is user-defined type
     * and is not comparable.
     */
    public static Integer compareObjects(Object value1, Object value2, Boolean isNullGreater) {
        if (value1 == null || value2 == null) { return compareNulls(value1, value2, isNullGreater); }
        return compareNonNullObjects(value1, value2);
    }

    /**
     * @description Compares the two non-null Objects identifying its types first.
     * Supports all primitive types as well as comparable type.
     * Considers a non-null value as always greater than a null value.
     *
     * @param value1 the first object to compare
     * @param value2 the second object to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     *
     * @throws TypeException if types of comparing objects mismatch or if the type is user-defined type
     * and is not comparable.
     */
    public static Integer compareObjects(Object value1, Object value2) {
        return compareObjects(value1, value2, false);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Private Methods">
    // @start-group Private Methods
    private static Integer compareUnequalNulls(Object o1, Boolean isNullGreater) {
        return o1 == null ? (isNullGreater ? 1 : -1) : (isNullGreater ? -1 : 1);
    }

    private static Integer compareUnequalBools(Boolean b1, Boolean b2) {
        return b1 && !b2 ? 1 : -1;
    }

    private static Integer compareUnequalIds(Id id1, Id id2) {
        return id1 > id2 ? 1 : -1;
    }

    private static Integer compareUnequalStrings(String str1, String str2) {
        return str1 > str2 ? 1 : -1;
    }

    private static Integer compareUnequalBlobs(Blob b1, Blob b2) {
        return b1.size() > b2.size() ? 1 : EncodingUtil.base64Encode(b1) > EncodingUtil.base64Encode(b2) ? 1 : -1;
    }

    private static Integer compareUnequalDates(Date d1, Date d2) {
        return d1 > d2 ? 1 : -1;
    }

    private static Integer compareUnequalDatetimes(Datetime dt1, Datetime dt2) {
        return dt1 > dt2 ? 1 : -1;
    }

    private static Integer compareUnequalTimes(Time t1, Time t2) {
        return t1 > t2 ? 1 : -1;
    }

    private static Integer compareUnequalInts(Integer i1, Integer i2) {
        return i1 > i2 ? 1 : -1;
    }

    private static Integer compareUnequalLongs(Long l1, Long l2) {
        return l1 > l2 ? 1 : -1;
    }

    private static Integer compareUnequalDoubles(Double d1, Double d2) {
        return d1 > d2 ? 1 : -1;
    }

    private static Integer compareUnequalSObjects(SObject sObj1, SObject sObj2) {
        List<SObject> pair = new List<SObject>{ sObj1, sObj2 };
        pair.sort();
        return pair[0] == sObj2 ? 1 : -1;
    }

    private static Integer compareComparables(Comparable x, Comparable y) {
        return x.compareTo(y);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Comparing extends Comparer {
        private final IFunction keyExtractor;
        private final IComparer keyComparer;
        private Comparing(IFunction keyExtractor, IComparer keyComparer) {
            this.keyExtractor = keyExtractor;
            this.keyComparer = keyComparer;
        }
        public override Integer compare(Object o1, Object o2) {
            return keyComparer.compare(keyExtractor.apply(o1), keyExtractor.apply(o2));
        }
    }

    private class DefaultOrder extends Comparer {
        public override Integer compare(Object o1, Object o2) { return compareObjects(o1, o2); }
    }

    private class ReverseOrder extends Comparer {
        private final IComparer comparer;
        private ReverseOrder(IComparer comparer) { this.comparer = comparer; }
        public override Integer compare(Object o1, Object o2) { return comparer.compare(o2, o1); }
    }

    private class NullsOrder extends Comparer {
        private final Boolean nullsFirst;
        private final Comparer comp;
        private NullsOrder(Boolean nullsFirst, Comparer comparer) {
            this.nullsFirst = nullsFirst;
            this.comp = comparer;
        }
        public override Integer compare(Object o1, Object o2) {
            if (o1 == null || o2 == null) { return compareNulls(o1, o2, !nullsFirst); }
            return comp.compare(o1, o2);
        }
        public override Comparer thenComparing(IComparer other) {
            return new NullsOrder(nullsFirst, comp.thenComparing(other));
        }
        public override Comparer reversed() {
            return new NullsOrder(!nullsFirst, comp.reversed());
        }
    }

    private class ThenComparing extends Comparer {
        private final IComparer comparer;
        private final IComparer other;
        private ThenComparing(IComparer comparer, IComparer other) {
            this.comparer = comparer;
            this.other = other;
        }
        public override Integer compare(Object o1, Object o2) {
            Integer result = comparer.compare(o1, o2);
            return (result != 0) ? result : other.compare(o1, o2);
        }
    }
    // @end-group
    //</editor-fold>

}
