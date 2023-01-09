/**
 * @description Provides common implementations of {@link Comparator}
 * and related utilities.
 *
 * @see Comparator
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class Comparators {

    @TestVisible
    private Comparators() {}

    //<editor-fold desc="Null-Safe Comparators">
    /**
     * @description Returns a `Comparator` that compares two nullable Boolean values.
     * Any non-null value is always greater than a null value.
     *
     * @return the `Comparator`
     */
    public static Comparator bools() {
        return new CompareBool();
    }

    /**
     * @description Returns a `Comparator` that compares two nullable Id values.
     * Any non-null value is always greater than a null value.
     *
     * @return the `Comparator`
     */
    public static Comparator ids() {
        return new CompareId();
    }

    /**
     * @description Returns a `Comparator` that compares two nullable String values.
     * Any non-null value is always greater than a null value.
     *
     * @return the `Comparator`
     */
    public static Comparator strings() {
        return new CompareString();
    }

    /**
     * @description Returns a `Comparator` that compares two nullable Blob values.
     * Any non-null value is always greater than a null value.
     *
     * @return the `Comparator`
     */
    public static Comparator blobs() {
        return new CompareBlob();
    }

    /**
     * @description Returns a `Comparator` that compares two nullable Date values.
     * Any non-null value is always greater than a null value.
     *
     * @return the `Comparator`
     */
    public static Comparator dates() {
        return new CompareDate();
    }

    /**
     * @description Returns a `Comparator` that compares two nullable Datetime values.
     * Any non-null value is always greater than a null value.
     *
     * @return the `Comparator`
     */
    public static Comparator datetimes() {
        return new CompareDatetime();
    }

    /**
     * @description Returns a `Comparator` that compares two nullable Time values.
     * Any non-null value is always greater than a null value.
     *
     * @return the `Comparator`
     */
    public static Comparator times() {
        return new CompareTime();
    }

    /**
     * @description Returns a `Comparator` that compares two nullable Integer values.
     * Any non-null value is always greater than a null value.
     *
     * @return the `Comparator`
     */
    public static Comparator ints() {
        return new CompareInt();
    }

    /**
     * @description Returns a `Comparator` that compares two nullable Long values.
     * Any non-null value is always greater than a null value.
     *
     * @return the `Comparator`
     */
    public static Comparator longs() {
        return new CompareLong();
    }

    /**
     * @description Returns a `Comparator` that compares two nullable Double values.
     * Any non-null value is always greater than a null value.
     *
     * @return the `Comparator`
     */
    public static Comparator doubles() {
        return new CompareDouble();
    }

    /**
     * @description Returns a `Comparator` that compares two nullable SObject values.
     * Any non-null value is always greater than a null value.
     *
     * @return the `Comparator`
     */
    public static Comparator sObjects() {
        return new CompareSObject();
    }

    /**
     * @description Returns a `Comparator` that compares two nullable Comparable values.
     * Any non-null value is always greater than a null value.
     *
     * @return the `Comparator`
     */
    public static Comparator comparables() {
        return new CompareComparable();
    }
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
    public static Integer compareNullables(Object o1, Object o2, Boolean isNullGreater) {
        return o1 == o2 ? 0 : compareUnequalNullables(o1, isNullGreater);
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
    public static Integer compareNullables(Object o1, Object o2) {
        return compareNullables(o1, o2, false);
    }

    /**
     * @description Compares the two non-null booleans considering `true` is greater than
     * `false`.
     *
     * @param o1 the first boolean to compare
     * @param o2 the second boolean to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareBools(Boolean o1, Boolean o2) {
        return o1 == o2 ? 0 : compareUnequalBools(o1, o2);
    }

    /**
     * @description Compares the two non-null strings.
     * <p><strong>Note: </strong></p>
     * <p>Id comparison is case-sensitive and does not distinguish between 15-character and 18-character formats</p>
     *
     * @param id1 the first id to compare
     * @param id2 the second id to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareIds(Id id1, Id id2) {
        return id1 == id2 ? 0 : compareUnequalIds(id1, id2);
    }

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

    /**
     * @description Compares the two non-null blobs.
     *
     * @param b1 the first blob to compare
     * @param b2 the second blob to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareBlobs(Blob b1, Blob b2) {
        return (b1 == b2 && EncodingUtil.base64Encode(b1) == EncodingUtil.base64Encode(b2))
                ? 0 : compareUnequalBlobs(b1, b2);
    }

    /**
     * @description Compares the two non-null dates.
     *
     * @param d1 the first date to compare
     * @param d2 the second date to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareDates(Date d1, Date d2) {
        return d1 == d2 ? 0 : compareUnequalDates(d1, d2);
    }

    /**
     * @description Compares the two non-null datetimes.
     *
     * @param dt1 the first datetime to compare
     * @param dt2 the second datetime to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareDatetimes(Datetime dt1, Datetime dt2) {
        return dt1 == dt2 ? 0 : compareUnequalDatetimes(dt1, dt2);
    }

    /**
     * @description Compares the two non-null times.
     *
     * @param t1 the first time to compare
     * @param t2 the second time to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareTimes(Time t1, Time t2) {
        return t1 == t2 ? 0 : compareUnequalTimes(t1, t2);
    }

    /**
     * @description Compares the two non-null integers.
     *
     * @param i1 the first Integer to compare
     * @param i2 the second Integer to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareInts(Integer i1, Integer i2) {
        return i1 == i2 ? 0 : compareUnequalInts(i1, i2);
    }

    /**
     * @description Compares the two non-null longs.
     *
     * @param l1 the first Long to compare
     * @param l2 the second Long to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareLongs(Long l1, Long l2) {
        return l1 == l2 ? 0 : compareUnequalLongs(l1, l2);
    }

    /**
     * @description Compares the two non-null Doubles.
     *
     * @param d1 the first Double to compare
     * @param d2 the second Double to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareDoubles(Double d1, Double d2) {
        return d1 == d2 ? 0 : compareUnequalDoubles(d1, d2);
    }

    /**
     * @description Compares the two non-null sobjects.
     *
     * @param sObj1 the first SObject to compare
     * @param sObj2 the second SObject to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareSObjects(SObject sObj1, SObject sObj2) {
        return sObj1 == sObj2 ? 0 : compareUnequalSObjects(sObj1, sObj2);
    }

    /**
     * @description Compares the two non-null comparables.
     *
     * @param x the first SObject to compare
     * @param y the second SObject to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareComparables(Comparable x, Comparable y) {
        return x.compareTo(y);
    }

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
    public static Integer compareUntyped(Object value1, Object value2) {
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
        if (value1 instanceof Comparable && value2 instanceof Comparable) {
            return compareComparables((Comparable) value1, (Comparable) value2);
        }
        String type1Name;
        String type2Name;
        Object result;
        try { result = (JSON) value1; } catch (TypeException exc) { type1Name = parseTypeName(exc); }
        try { result = (JSON) value2; } catch (TypeException exc) { type2Name = parseTypeName(exc); }
        throw new TypeException(
                String.format(Label.TypesMismatchErrorMessage, new List<String>{ type1Name, type2Name })
        );
    }

    /**
     * @description Compares the two nullable Booleans.
     *
     * @param b1 the first Boolean to compare
     * @param b2 the second Boolean to compare
     * @param isNullGreater the boolean determines if null value is greater than any other value
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeBools(Boolean b1, Boolean b2, Boolean isNullGreater) {
        if (b1 == null || b2 == null) { return compareNullables(b1, b2, isNullGreater); }
        return compareBools(b1, b2);
    }

    /**
     * @description Compares the two nullable Booleans.
     *
     * @param b1 the first Boolean to compare
     * @param b2 the second Boolean to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeBools(Boolean b1, Boolean b2) {
        return compareNullSafeBools(b1, b2, false);
    }

    /**
     * @description Compares the two nullable Ids.
     *
     * @param id1 the first Id to compare
     * @param id2 the second Id to compare
     * @param isNullGreater the boolean determines if null value is greater than any other value
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeIds(Id id1, Id id2, Boolean isNullGreater) {
        if (id1 == null || id2 == null) { return compareNullables(id1, id2, isNullGreater); }
        return compareIds(id1, id2);
    }

    /**
     * @description Compares the two nullable Ids.
     *
     * @param id1 the first Id to compare
     * @param id2 the second Id to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeIds(Id id1, Id id2) {
        return compareNullSafeIds(id1, id2, false);
    }

    /**
     * @description Compares the two nullable Strings.
     *
     * @param str1 the first String to compare
     * @param str2 the second String to compare
     * @param isNullGreater the boolean determines if null value is greater than any other value
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeStrings(String str1, String str2, Boolean isNullGreater) {
        if (str1 == null || str2 == null) { return compareNullables(str1, str2, isNullGreater); }
        return compareStrings(str1, str2);
    }

    /**
     * @description Compares the two nullable Strings.
     *
     * @param str1 the first String to compare
     * @param str2 the second String to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeStrings(String str1, String str2) {
        return compareNullSafeStrings(str1, str2, false);
    }

    /**
     * @description Compares the two nullable Blobs.
     *
     * @param b1 the first Blob to compare
     * @param b2 the second Blob to compare
     * @param isNullGreater the boolean determines if null value is greater than any other value
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeBlobs(Blob b1, Blob b2, Boolean isNullGreater) {
        if (b1 == null || b2 == null) { return compareNullables(b1, b2, isNullGreater); }
        return compareBlobs(b1, b2);
    }

    /**
     * @description Compares the two nullable Blobs.
     *
     * @param b1 the first Blob to compare
     * @param b2 the second Blob to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeBlobs(Blob b1, Blob b2) {
        return compareNullSafeBlobs(b1, b2, false);
    }

    /**
     * @description Compares the two nullable Dates.
     *
     * @param d1 the first Date to compare
     * @param d2 the second Date to compare
     * @param isNullGreater the boolean determines if null value is greater than any other value
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeDates(Date d1, Date d2, Boolean isNullGreater) {
        if (d1 == null || d2 == null) { return compareNullables(d1, d2, isNullGreater); }
        return compareDates(d1, d2);
    }

    /**
     * @description Compares the two nullable Dates.
     *
     * @param d1 the first Date to compare
     * @param d2 the second Date to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeDates(Date d1, Date d2) {
        return compareNullSafeDates(d1, d2, false);
    }

    /**
     * @description Compares the two nullable Datetimes.
     *
     * @param dt1 the first Datetime to compare
     * @param dt2 the second Datetime to compare
     * @param isNullGreater the boolean determines if null value is greater than any other value
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeDatetimes(Datetime dt1, Datetime dt2, Boolean isNullGreater) {
        if (dt1 == null || dt2 == null) { return compareNullables(dt1, dt2, isNullGreater); }
        return compareDatetimes(dt1, dt2);
    }

    /**
     * @description Compares the two nullable Datetimes.
     *
     * @param dt1 the first Datetime to compare
     * @param dt2 the second Datetime to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeDatetimes(Datetime dt1, Datetime dt2) {
        return compareNullSafeDatetimes(dt1, dt2, false);
    }

    /**
     * @description Compares the two nullable Times.
     *
     * @param t1 the first Time to compare
     * @param t2 the second Time to compare
     * @param isNullGreater the boolean determines if null value is greater than any other value
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeTimes(Time t1, Time t2, Boolean isNullGreater) {
        if (t1 == null || t2 == null) { return compareNullables(t1, t2, isNullGreater); }
        return compareTimes(t1, t2);
    }

    /**
     * @description Compares the two nullable Times.
     *
     * @param t1 the first Time to compare
     * @param t2 the second Time to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeTimes(Time t1, Time t2) {
        return compareNullSafeTimes(t1, t2, false);
    }

    /**
     * @description Compares the two nullable integers.
     *
     * @param i1 the first Integer to compare
     * @param i2 the second Integer to compare
     * @param isNullGreater the boolean determines if null value is greater than any other value
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeInts(Integer i1, Integer i2, Boolean isNullGreater) {
        if (i1 == null || i2 == null) { return compareNullables(i1, i2, isNullGreater); }
        return compareInts(i1, i2);
    }

    /**
     * @description Compares the two nullable integers.
     *
     * @param i1 the first Integer to compare
     * @param i2 the second Integer to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeInts(Integer i1, Integer i2) {
        return compareNullSafeInts(i1, i2, false);
    }

    /**
     * @description Compares the two nullable Longs.
     *
     * @param l1 the first Long to compare
     * @param l2 the second Long to compare
     * @param isNullGreater the boolean determines if null value is greater than any other value
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeLongs(Long l1, Long l2, Boolean isNullGreater) {
        if (l1 == null || l2 == null) { return compareNullables(l1, l2, isNullGreater); }
        return compareLongs(l1, l2);
    }

    /**
     * @description Compares the two nullable Longs.
     *
     * @param l1 the first Long to compare
     * @param l2 the second Long to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeLongs(Long l1, Long l2) {
        return compareNullSafeLongs(l1, l2, false);
    }

    /**
     * @description Compares the two nullable Doubles.
     *
     * @param d1 the first Double to compare
     * @param d2 the second Double to compare
     * @param isNullGreater the boolean determines if null value is greater than any other value
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeDoubles(Double d1, Double d2, Boolean isNullGreater) {
        if (d1 == null || d2 == null) { return compareNullables(d1, d2, isNullGreater); }
        return compareDoubles(d1, d2);
    }

    /**
     * @description Compares the two nullable Doubles.
     *
     * @param d1 the first Double to compare
     * @param d2 the second Double to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeDoubles(Double d1, Double d2) {
        return compareNullSafeDoubles(d1, d2, false);
    }

    /**
     * @description Compares the two nullable SObjects.
     *
     * @param sObj1 the first SObject to compare
     * @param sObj2 the second SObject to compare
     * @param isNullGreater the boolean determines if null value is greater than any other value
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeSObjects(SObject sObj1, SObject sObj2, Boolean isNullGreater) {
        if (sObj1 == null || sObj2 == null) { return compareNullables(sObj1, sObj2, isNullGreater); }
        return compareSObjects(sObj1, sObj2);
    }

    /**
     * @description Compares the two nullable SObjects.
     *
     * @param sObj1 the first SObject to compare
     * @param sObj2 the second SObject to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeSObjects(SObject sObj1, SObject sObj2) {
        return compareNullSafeSObjects(sObj1, sObj2, false);
    }

    /**
     * @description Compares the two nullable Comparables.
     *
     * @param x the first Comparable to compare
     * @param y the second Comparable to compare
     * @param isNullGreater the boolean determines if null value is greater than any other value
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeComparables(Comparable x, Comparable y, Boolean isNullGreater) {
        if (x == null || y == null) { return compareNullables(x, y, isNullGreater); }
        return compareComparables(x, y);
    }

    /**
     * @description Compares the two nullable Comparables.
     *
     * @param x the first Comparable to compare
     * @param y the second Comparable to compare
     *
     * @return `-1` if the first input arguments is less than the second one,
     * `0` if they're equal, and `1` otherwise
     */
    public static Integer compareNullSafeComparables(Comparable x, Comparable y) {
        return compareNullSafeComparables(x, y, false);
    }

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
    public static Integer compareNullSafeUntyped(Object value1, Object value2, Boolean isNullGreater) {
        if (value1 == null || value2 == null) { return compareNullables(value1, value2, isNullGreater); }
        return compareUntyped(value1, value2);
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
    public static Integer compareNullSafeUntyped(Object value1, Object value2) {
        return compareNullSafeUntyped(value1, value2, false);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Private Methods">
    // @start-group Private Methods
    private static String parseTypeName(TypeException exc) {
        return exc.getMessage()
                .substringAfter('Invalid conversion from runtime type ')
                .substringBefore(' to System.JSON');
    }

    private static Integer compareUnequalNullables(Object o1, Boolean isNullGreater) {
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
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class CompareBool extends Comparator {
        public override Integer compare(Object o1, Object o2) {
            return compareNullSafeBools((Boolean) o1, (Boolean) o2);
        }
    }

    private class CompareId extends Comparator {
        public override Integer compare(Object o1, Object o2) {
            return compareNullSafeIds((Id) o1, (Id) o2);
        }
    }

    private class CompareString extends Comparator {
        public override Integer compare(Object o1, Object o2) {
            return compareNullSafeStrings((String) o1, (String) o2);
        }
    }

    private class CompareBlob extends Comparator {
        public override Integer compare(Object o1, Object o2) {
            return compareNullSafeBlobs((Blob) o1, (Blob) o2);
        }
    }

    private class CompareDate extends Comparator {
        public override Integer compare(Object o1, Object o2) {
            return compareNullSafeDates((Date) o1, (Date) o2);
        }
    }

    private class CompareDatetime extends Comparator {
        public override Integer compare(Object o1, Object o2) {
            return compareNullSafeDatetimes((Datetime) o1, (Datetime) o2);
        }
    }

    private class CompareTime extends Comparator {
        public override Integer compare(Object o1, Object o2) {
            return compareNullSafeTimes((Time) o1, (Time) o2);
        }
    }

    private class CompareInt extends Comparator {
        public override Integer compare(Object o1, Object o2) {
            return compareNullSafeInts((Integer) o1, (Integer) o2);
        }
    }

    private class CompareLong extends Comparator {
        public override Integer compare(Object o1, Object o2) {
            return compareNullSafeLongs((Long) o1, (Long) o2);
        }
    }

    private class CompareDouble extends Comparator {
        public override Integer compare(Object o1, Object o2) {
            return compareNullSafeDoubles((Double) o1, (Double) o2);
        }
    }

    private class CompareSObject extends Comparator {
        public override Integer compare(Object o1, Object o2) {
            return compareNullSafeSObjects((SObject) o1, (SObject) o2);
        }
    }

    private class CompareComparable extends Comparator {
        public override Integer compare(Object o1, Object o2) {
            return compareNullSafeComparables((Comparable) o1, (Comparable) o2);
        }
    }
    // @end-group
    //</editor-fold>

}
