# SObjectComparator

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ISObjectComparator](/docs/Functional-Interfaces/ISObjectComparator.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes


**See** ISObjectIterable.sort


**See** ISObjectIterable.min


**See** ISObjectIterable.max


**See** SObjectBinaryOperator.minBy


**See** SObjectBinaryOperator.maxBy

## Methods
### Function
##### `compare(SObject sObj1, SObject sObj2)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `thenComparing(ISObjectComparator other)`

Returns a composed `SObjectComparator` of `this` and the `other` comparator. If `this` considers two elements equal, the `other` determines the final result.

###### Parameters
|Param|Description|
|---|---|
|`other`|the comparator to compare keys|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparator` is null|

##### `thenComparing(ISObjectFunction keyExtractor, IComparator keyComparator)`

Returns a composed `SObjectComparator` of `this` and then comparing on the key extracted by the `keyExtractor` function to be compared with the given `keyComparator`.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the key to compare|
|`keyComparator`|the comparator to compare keys|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparator` is null|

##### `thenComparing(ISObjectFunction keyExtractor)`

Returns a composed `SObjectComparator` of `this` and then comparing on the key extracted by the `keyExtractor` function.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the key to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparator` is null|

##### `thenComparingInt(ISObjectToIntFunction keyExtractor)`

Returns a composed `SObjectComparator` of `this` and then comparing on the key extracted by the `keyExtractor` function.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the Integer key to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparator` is null|

##### `thenComparingLong(ISObjectToLongFunction keyExtractor)`

Returns a composed `SObjectComparator` of `this` and then comparing on the key extracted by the `keyExtractor` function.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the Long key to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparator` is null|

##### `thenComparingDouble(ISObjectToDoubleFunction keyExtractor)`

Returns a composed `SObjectComparator` of `this` and then comparing on the key extracted by the `keyExtractor` function.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the Double key to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparator` is null|

##### `thenComparingSObject(ISObjectUnaryOperator keyExtractor)`

Returns a composed `SObjectComparator` of `this` and then comparing on the key extracted by the `keyExtractor` function.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the SObject key to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparator` is null|

##### `order(SortOrder order)`

Returns a `SObjectComparator` that imposes either `default` or `reversed` ordering depending on the `order`.

###### Parameters
|Param|Description|
|---|---|
|`order`|the sort order|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `order` is null|


**See** [SortOrder](/docs/Enums/SortOrder.md)

##### `nullsFirst()`

Returns a null-safe `SObjectComparator` of `this` comparator that considers null to be less than non-null.

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

##### `nullsLast()`

Returns a null-safe `SObjectComparator` of `this` comparator that considers null to be greater than non-null.

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

##### `reversed()`

Returns a comparator that imposes the reverse ordering of `this` comparator.

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

---
### Static Methods
##### `static comparing(ISObjectFunction keyExtractor, IComparator keyComparator)`

Returns a `SObjectComparator` that compares extracted by the `keyExtractor` keys using the `keyComparator`.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the key to compare|
|`keyComparator`|the comparator to compare keys|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparator` is null|

##### `static comparing(ISObjectFunction keyExtractor)`

Returns a `SObjectComparator` that compares extracted by the `keyExtractor` keys.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the key to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` is null|

##### `static comparing(String fieldName)`

Returns a `SObjectComparator` that compares `fieldName` values. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

##### `static comparing(SObjectField field)`

Returns a `SObjectComparator` that compares `field` values.

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

##### `static comparingInt(ISObjectToIntFunction keyExtractor)`

Returns a `SObjectComparator` that compares extracted by the `keyExtractor` keys.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the Integer key to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` is null|

##### `static comparingInt(String fieldName)`

Returns a `SObjectComparator` that compares `fieldName` values. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the Integer value of which to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

##### `static comparingInt(SObjectField field)`

Returns a `SObjectComparator` that compares `field` values.

###### Parameters
|Param|Description|
|---|---|
|`field`|the Integer value of which to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

##### `static comparingLong(ISObjectToLongFunction keyExtractor)`

Returns a `SObjectComparator` that compares extracted by the `keyExtractor` keys.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the Long key to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` is null|

##### `static comparingLong(String fieldName)`

Returns a `SObjectComparator` that compares `fieldName` values. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the Long value of which to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

##### `static comparingLong(SObjectField field)`

Returns a `SObjectComparator` that compares `field` values.

###### Parameters
|Param|Description|
|---|---|
|`field`|the Long value of which to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

##### `static comparingDouble(ISObjectToDoubleFunction keyExtractor)`

Returns a `SObjectComparator` that compares extracted by the `keyExtractor` keys.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the Double key to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` is null|

##### `static comparingDouble(String fieldName)`

Returns a `SObjectComparator` that compares `fieldName` values. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the Double value of which to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

##### `static comparingDouble(SObjectField field)`

Returns a `SObjectComparator` that compares `field` values.

###### Parameters
|Param|Description|
|---|---|
|`field`|the Double value of which to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

##### `static comparingSObject(ISObjectUnaryOperator keyExtractor)`

Returns a `SObjectComparator` that compares extracted by the `keyExtractor` keys.

###### Parameters
|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the SObject key to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` is null|

##### `static comparingSObject(String fieldName)`

Returns a `SObjectComparator` that compares `fieldName` values. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the SObject value of which to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

##### `static comparingSObject(SObjectField field)`

Returns a `SObjectComparator` that compares `field` values.

###### Parameters
|Param|Description|
|---|---|
|`field`|the SObject value of which to compare|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

##### `static defaultOrder()`

Returns a comparator that imposes the default ordering.

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

##### `static reverseOrder()`

Returns a comparator that imposes the reverse ordering.

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

##### `static nullsFirst(SObjectComparator comparator)`

Returns a null-safe `SObjectComparator` of the `comparator` that considers null to be less than non-null.

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `comparator` is null|

##### `static nullsLast(SObjectComparator comparator)`

Returns a null-safe `SObjectComparator` of the `comparator` that considers null to be greater than non-null.

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

SObjectComparator

**Description**

the `SObjectComparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `comparator` is null|

---
