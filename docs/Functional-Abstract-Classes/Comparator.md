# Comparator

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides default and static methods of [IComparator](/docs/Functional-Interfaces/IComparator.md) functional interface.


**See** [IComparator](/docs/Functional-Interfaces/IComparator.md)


**See** IObjectIterable.sort


**See** IObjectIterable.min


**See** IObjectIterable.max


**See** BinaryOperator.minBy


**See** BinaryOperator.maxBy


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

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
|`comparator`|the comparator|

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
|`comparator`|the comparator|

###### Return

**Type**

Comparator

**Description**

the `Comparator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `comparator` is null|

---
