# Comparator

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IComparator](/docs/Functional-Interfaces/IComparator.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes


**See** IObjectIterable.sort


**See** IObjectIterable.min


**See** IObjectIterable.max


**See** BinaryOperator.minBy


**See** BinaryOperator.maxBy

## Methods
### Function
##### `compare(Object o1, Object o2)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `thenComparing(IComparator other)`

Returns a composed `Comparator` of `this` and the `other` comparator. If `this` considers two elements equal, the `other` determines the final result.

###### Parameters
|Param|Description|
|---|---|
|`other`|the comparator to compare keys|

###### Return

**Type**

Comparator

**Description**

the `Comparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparator` is null|

##### `thenComparing(IFunction keyExtractor, IComparator keyComparator)`

Returns a composed `Comparator` of `this` and then comparing on the key extracted by the `keyExtractor` function to be compared with the given `keyComparator`.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the key to compare|
|`keyComparator`|the comparator to compare keys|

###### Return

**Type**

Comparator

**Description**

the `Comparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparator` is null|

##### `thenComparing(IFunction keyExtractor)`

Returns a composed `Comparator` of `this` and then comparing on the key extracted by the `keyExtractor` function.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the key to compare|

###### Return

**Type**

Comparator

**Description**

the `Comparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparator` is null|

##### `thenComparingInt(IToIntFunction keyExtractor)`

Returns a composed `Comparator` of `this` and then comparing on the key extracted by the `keyExtractor` function.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the Integer key to compare|

###### Return

**Type**

Comparator

**Description**

the `Comparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparator` is null|

##### `thenComparingLong(IToLongFunction keyExtractor)`

Returns a composed `Comparator` of `this` and then comparing on the key extracted by the `keyExtractor` function.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the Long key to compare|

###### Return

**Type**

Comparator

**Description**

the `Comparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparator` is null|

##### `thenComparingDouble(IToDoubleFunction keyExtractor)`

Returns a composed `Comparator` of `this` and then comparing on the key extracted by the `keyExtractor` function.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the Double key to compare|

###### Return

**Type**

Comparator

**Description**

the `Comparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparator` is null|

##### `thenComparingSObject(IToSObjectFunction keyExtractor)`

Returns a composed `Comparator` of `this` and then comparing on the key extracted by the `keyExtractor` function.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the SObject key to compare|

###### Return

**Type**

Comparator

**Description**

the `Comparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparator` is null|

##### `order(SortOrder order)`

Returns a `Comparator` that imposes either `default` or `reversed` ordering depending on the `order`.

###### Parameters
|Param|Description|
|---|---|
|`order`|the sort order|

###### Return

**Type**

Comparator

**Description**

the `Comparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `order` is null|


**See** [SortOrder](/docs/Enums/SortOrder.md)

##### `nullsFirst()`

Returns a null-safe `Comparator` of `this` comparator that considers null to be less than non-null.

###### Return

**Type**

Comparator

**Description**

the `Comparator`

##### `nullsLast()`

Returns a null-safe `Comparator` of `this` comparator that considers null to be greater than non-null.

###### Return

**Type**

Comparator

**Description**

the `Comparator`

##### `reversed()`

Returns a comparator that imposes the reverse ordering of `this` comparator.

###### Return

**Type**

Comparator

**Description**

the `Comparator`

---
### Static Methods
##### `static comparing(IFunction keyExtractor, IComparator keyComparator)`

Returns a `Comparator` that compares extracted by the `keyExtractor` keys using the `keyComparator`.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the key to compare|
|`keyComparator`|the comparator to compare keys|

###### Return

**Type**

Comparator

**Description**

the `Comparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparator` is null|

##### `static comparing(IFunction keyExtractor)`

Returns a `Comparator` that compares extracted by the `keyExtractor` keys.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the key to compare|

###### Return

**Type**

Comparator

**Description**

the `Comparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` is null|

##### `static comparingInt(IToIntFunction keyExtractor)`

Returns a `Comparator` that compares extracted by the `keyExtractor` keys.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the Integer key to compare|

###### Return

**Type**

Comparator

**Description**

the `Comparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` is null|

##### `static comparingLong(IToLongFunction keyExtractor)`

Returns a `Comparator` that compares extracted by the `keyExtractor` keys.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the Long key to compare|

###### Return

**Type**

Comparator

**Description**

the `Comparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` is null|

##### `static comparingDouble(IToDoubleFunction keyExtractor)`

Returns a `Comparator` that compares extracted by the `keyExtractor` keys.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the Double key to compare|

###### Return

**Type**

Comparator

**Description**

the `Comparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` is null|

##### `static comparingSObject(IToSObjectFunction keyExtractor)`

Returns a `Comparator` that compares extracted by the `keyExtractor` keys.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the SObject key to compare|

###### Return

**Type**

Comparator

**Description**

the `Comparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` is null|

##### `static defaultOrder()`

Returns a comparator that imposes the default ordering.

###### Return

**Type**

Comparator

**Description**

the `Comparator`

##### `static reverseOrder()`

Returns a comparator that imposes the reverse ordering.

###### Return

**Type**

Comparator

**Description**

the `Comparator`

##### `static nullsFirst(Comparator comparator)`

Returns a null-safe `Comparator` of the `comparator` that considers null to be less than non-null.

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

Comparator

**Description**

the `Comparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `comparator` is null|

##### `static nullsLast(Comparator comparator)`

Returns a null-safe `Comparator` of the `comparator` that considers null to be greater than non-null.

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

Comparator

**Description**

the `Comparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `comparator` is null|

##### `static bools()`
##### `static ids()`
##### `static strings()`
##### `static blobs()`
##### `static dates()`
##### `static datetimes()`
##### `static times()`
##### `static ints()`
##### `static longs()`
##### `static doubles()`
##### `static sObjects()`
##### `static comparables()`
---
### Compare Methods
##### `static compareNullables(Object o1, Object o2, Boolean isNullGreater)`

Compares the two nullable objects considering that at least one of them is null.

###### Parameters
|Param|Description|
|---|---|
|`o1`|the first boolean to compare|
|`o2`|the second boolean to compare|
|`isNullGreater`|the boolean determines if null value is greater than any other value|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullables(Object o1, Object o2)`

Compares the two nullable objects considering that at least one of them is null. Considers a non-null value as always greater than a null value.

###### Parameters
|Param|Description|
|---|---|
|`o1`|the first boolean to compare|
|`o2`|the second boolean to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareBools(Boolean o1, Boolean o2)`

Compares the two non-null booleans considering `true` is greater than `false`.

###### Parameters
|Param|Description|
|---|---|
|`o1`|the first boolean to compare|
|`o2`|the second boolean to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareIds(Id id1, Id id2)`

Compares the two non-null strings. <p><strong>Note: </strong></p> <p>Id comparison is case-sensitive and does not distinguish between 15-character and 18-character formats</p>

###### Parameters
|Param|Description|
|---|---|
|`id1`|the first id to compare|
|`id2`|the second id to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareStrings(String str1, String str2)`

Compares the two non-null strings. <p><strong>Note: </strong></p> <p>String comparison is case-insensitive.</p>

###### Parameters
|Param|Description|
|---|---|
|`str1`|the first string to compare|
|`str2`|the second string to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareBlobs(Blob b1, Blob b2)`

Compares the two non-null blobs.

###### Parameters
|Param|Description|
|---|---|
|`b1`|the first blob to compare|
|`b2`|the second blob to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareDates(Date d1, Date d2)`

Compares the two non-null dates.

###### Parameters
|Param|Description|
|---|---|
|`d1`|the first date to compare|
|`d2`|the second date to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareDatetimes(Datetime dt1, Datetime dt2)`

Compares the two non-null datetimes.

###### Parameters
|Param|Description|
|---|---|
|`dt1`|the first datetime to compare|
|`dt2`|the second datetime to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareTimes(Time t1, Time t2)`

Compares the two non-null times.

###### Parameters
|Param|Description|
|---|---|
|`t1`|the first time to compare|
|`t2`|the second time to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareInts(Integer i1, Integer i2)`

Compares the two non-null integers.

###### Parameters
|Param|Description|
|---|---|
|`i1`|the first Integer to compare|
|`i2`|the second Integer to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareLongs(Long l1, Long l2)`

Compares the two non-null longs.

###### Parameters
|Param|Description|
|---|---|
|`l1`|the first Long to compare|
|`l2`|the second Long to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareDoubles(Double d1, Double d2)`

Compares the two non-null Doubles.

###### Parameters
|Param|Description|
|---|---|
|`d1`|the first Double to compare|
|`d2`|the second Double to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareSObjects(SObject sObj1, SObject sObj2)`

Compares the two non-null sobjects.

###### Parameters
|Param|Description|
|---|---|
|`sObj1`|the first SObject to compare|
|`sObj2`|the second SObject to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareComparables(Comparable x, Comparable y)`

Compares the two non-null comparables.

###### Parameters
|Param|Description|
|---|---|
|`x`|the first SObject to compare|
|`y`|the second SObject to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareUntyped(Object value1, Object value2)`

Compares the two non-null objects identifying its types first. Supports all primitive types and comparable type.

###### Parameters
|Param|Description|
|---|---|
|`value1`|the first object to compare|
|`value2`|the second object to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

###### Throws
|Exception|Description|
|---|---|
|`TypeException`|if types of comparing objects mismatch or if the type is user-defined type and is not comparable.|

##### `static compareNullSafeBools(Boolean b1, Boolean b2, Boolean isNullGreater)`

Compares the two nullable Booleans.

###### Parameters
|Param|Description|
|---|---|
|`b1`|the first Boolean to compare|
|`b2`|the second Boolean to compare|
|`isNullGreater`|the boolean determines if null value is greater than any other value|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeBools(Boolean b1, Boolean b2)`

Compares the two nullable Booleans.

###### Parameters
|Param|Description|
|---|---|
|`b1`|the first Boolean to compare|
|`b2`|the second Boolean to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeIds(Id id1, Id id2, Boolean isNullGreater)`

Compares the two nullable Ids.

###### Parameters
|Param|Description|
|---|---|
|`id1`|the first Id to compare|
|`id2`|the second Id to compare|
|`isNullGreater`|the boolean determines if null value is greater than any other value|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeIds(Id id1, Id id2)`

Compares the two nullable Ids.

###### Parameters
|Param|Description|
|---|---|
|`id1`|the first Id to compare|
|`id2`|the second Id to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeStrings(String str1, String str2, Boolean isNullGreater)`

Compares the two nullable Strings.

###### Parameters
|Param|Description|
|---|---|
|`str1`|the first String to compare|
|`str2`|the second String to compare|
|`isNullGreater`|the boolean determines if null value is greater than any other value|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeStrings(String str1, String str2)`

Compares the two nullable Strings.

###### Parameters
|Param|Description|
|---|---|
|`str1`|the first String to compare|
|`str2`|the second String to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeBlobs(Blob b1, Blob b2, Boolean isNullGreater)`

Compares the two nullable Blobs.

###### Parameters
|Param|Description|
|---|---|
|`b1`|the first Blob to compare|
|`b2`|the second Blob to compare|
|`isNullGreater`|the boolean determines if null value is greater than any other value|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeBlobs(Blob b1, Blob b2)`

Compares the two nullable Blobs.

###### Parameters
|Param|Description|
|---|---|
|`b1`|the first Blob to compare|
|`b2`|the second Blob to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeDates(Date d1, Date d2, Boolean isNullGreater)`

Compares the two nullable Dates.

###### Parameters
|Param|Description|
|---|---|
|`d1`|the first Date to compare|
|`d2`|the second Date to compare|
|`isNullGreater`|the boolean determines if null value is greater than any other value|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeDates(Date d1, Date d2)`

Compares the two nullable Dates.

###### Parameters
|Param|Description|
|---|---|
|`d1`|the first Date to compare|
|`d2`|the second Date to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeDatetimes(Datetime dt1, Datetime dt2, Boolean isNullGreater)`

Compares the two nullable Datetimes.

###### Parameters
|Param|Description|
|---|---|
|`dt1`|the first Datetime to compare|
|`dt2`|the second Datetime to compare|
|`isNullGreater`|the boolean determines if null value is greater than any other value|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeDatetimes(Datetime dt1, Datetime dt2)`

Compares the two nullable Datetimes.

###### Parameters
|Param|Description|
|---|---|
|`dt1`|the first Datetime to compare|
|`dt2`|the second Datetime to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeTimes(Time t1, Time t2, Boolean isNullGreater)`

Compares the two nullable Times.

###### Parameters
|Param|Description|
|---|---|
|`t1`|the first Time to compare|
|`t2`|the second Time to compare|
|`isNullGreater`|the boolean determines if null value is greater than any other value|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeTimes(Time t1, Time t2)`

Compares the two nullable Times.

###### Parameters
|Param|Description|
|---|---|
|`t1`|the first Time to compare|
|`t2`|the second Time to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeInts(Integer i1, Integer i2, Boolean isNullGreater)`

Compares the two nullable integers.

###### Parameters
|Param|Description|
|---|---|
|`i1`|the first Integer to compare|
|`i2`|the second Integer to compare|
|`isNullGreater`|the boolean determines if null value is greater than any other value|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeInts(Integer i1, Integer i2)`

Compares the two nullable integers.

###### Parameters
|Param|Description|
|---|---|
|`i1`|the first Integer to compare|
|`i2`|the second Integer to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeLongs(Long l1, Long l2, Boolean isNullGreater)`

Compares the two nullable Longs.

###### Parameters
|Param|Description|
|---|---|
|`l1`|the first Long to compare|
|`l2`|the second Long to compare|
|`isNullGreater`|the boolean determines if null value is greater than any other value|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeLongs(Long l1, Long l2)`

Compares the two nullable Longs.

###### Parameters
|Param|Description|
|---|---|
|`l1`|the first Long to compare|
|`l2`|the second Long to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeDoubles(Double d1, Double d2, Boolean isNullGreater)`

Compares the two nullable Doubles.

###### Parameters
|Param|Description|
|---|---|
|`d1`|the first Double to compare|
|`d2`|the second Double to compare|
|`isNullGreater`|the boolean determines if null value is greater than any other value|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeDoubles(Double d1, Double d2)`

Compares the two nullable Doubles.

###### Parameters
|Param|Description|
|---|---|
|`d1`|the first Double to compare|
|`d2`|the second Double to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeSObjects(SObject sObj1, SObject sObj2, Boolean isNullGreater)`

Compares the two nullable SObjects.

###### Parameters
|Param|Description|
|---|---|
|`sObj1`|the first SObject to compare|
|`sObj2`|the second SObject to compare|
|`isNullGreater`|the boolean determines if null value is greater than any other value|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeSObjects(SObject sObj1, SObject sObj2)`

Compares the two nullable SObjects.

###### Parameters
|Param|Description|
|---|---|
|`sObj1`|the first SObject to compare|
|`sObj2`|the second SObject to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeComparables(Comparable x, Comparable y, Boolean isNullGreater)`

Compares the two nullable Comparables.

###### Parameters
|Param|Description|
|---|---|
|`x`|the first Comparable to compare|
|`y`|the second Comparable to compare|
|`isNullGreater`|the boolean determines if null value is greater than any other value|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeComparables(Comparable x, Comparable y)`

Compares the two nullable Comparables.

###### Parameters
|Param|Description|
|---|---|
|`x`|the first Comparable to compare|
|`y`|the second Comparable to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

##### `static compareNullSafeUntyped(Object value1, Object value2, Boolean isNullGreater)`

Compares the two non-null Objects identifying its types first. Supports all primitive types as well as comparable type.

###### Parameters
|Param|Description|
|---|---|
|`value1`|the first object to compare|
|`value2`|the second object to compare|
|`isNullGreater`|the boolean determines if null value is greater than any other value|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

###### Throws
|Exception|Description|
|---|---|
|`TypeException`|if types of comparing objects mismatch or if the type is user-defined type and is not comparable.|

##### `static compareNullSafeUntyped(Object value1, Object value2)`

Compares the two non-null Objects identifying its types first. Supports all primitive types as well as comparable type. Considers a non-null value as always greater than a null value.

###### Parameters
|Param|Description|
|---|---|
|`value1`|the first object to compare|
|`value2`|the second object to compare|

###### Return

**Type**

Integer

**Description**

`-1` if the first input arguments is less than the second one, `0` if they&apos;re equal, and `1` otherwise

###### Throws
|Exception|Description|
|---|---|
|`TypeException`|if types of comparing objects mismatch or if the type is user-defined type and is not comparable.|

---
