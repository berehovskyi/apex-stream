# abstract Comparer

`SUPPRESSWARNINGS`

`APIVERSION: 58`

`STATUS: ACTIVE`

Provides default and static methods of
[IComparer](/docs/Functional-Interfaces/IComparer.md) functional interface.


**Implemented types**

[IComparer](/docs/Functional-Interfaces/IComparer.md)


**See** [IComparer](/docs/Functional-Interfaces/IComparer.md)


**See** [BiOperator.minBy](BiOperator.minBy)


**See** [BiOperator.maxBy](BiOperator.maxBy)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `public Integer compare(Object o1, Object o2)`
---
### Default Methods
##### `public virtual Comparer thenComparing(IComparer other)`

Returns a composed `Comparer` of `this` and the `other` comparer. If `this` considers two elements equal, the `other` determines the final result.

###### Parameters

|Param|Description|
|---|---|
|`other`|the comparer to compare keys|

###### Returns

|Type|Description|
|---|---|
|`Comparer`|the `Comparer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparer` is null|

##### `public virtual Comparer thenComparing(IFunction keyExtractor, IComparer keyComparer)`

Returns a composed `Comparer` of `this` and then comparing on the key extracted by the `keyExtractor` function to be compared with the given `keyComparer`.

###### Parameters

|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the key to compare|
|`keyComparer`|the comparer to compare keys|

###### Returns

|Type|Description|
|---|---|
|`Comparer`|the `Comparer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparer` is null|

##### `public virtual Comparer thenComparing(IFunction keyExtractor)`

Returns a composed `Comparer` of `this` and then comparing on the key extracted by the `keyExtractor` function.

###### Parameters

|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the key to compare|

###### Returns

|Type|Description|
|---|---|
|`Comparer`|the `Comparer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparer` is null|

##### `public virtual Comparer order(SortOrder order)`

Returns a `Comparer` that imposes either `default` or `reversed` ordering depending on the `order`.

###### Parameters

|Param|Description|
|---|---|
|`order`|the sort order|

###### Returns

|Type|Description|
|---|---|
|`Comparer`|the `Comparer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `order` is null|


**See** [SortOrder](/docs/Enums/SortOrder.md)

##### `public virtual Comparer nullsFirst()`

Returns a null-safe `Comparer` of `this` comparer that considers null to be less than non-null.

###### Returns

|Type|Description|
|---|---|
|`Comparer`|the `Comparer`|

##### `public virtual Comparer nullsLast()`

Returns a null-safe `Comparer` of `this` comparer that considers null to be greater than non-null.

###### Returns

|Type|Description|
|---|---|
|`Comparer`|the `Comparer`|

##### `public virtual Comparer reversed()`

Returns a comparer that imposes the reverse ordering of `this` comparer.

###### Returns

|Type|Description|
|---|---|
|`Comparer`|the `Comparer`|

---
### Static Methods
##### `public static Comparer comparing(IFunction keyExtractor, IComparer keyComparer)`

Returns a `Comparer` that compares extracted by the `keyExtractor` keys using the `keyComparer`.

###### Parameters

|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the key to compare|
|`keyComparer`|the comparer to compare keys|

###### Returns

|Type|Description|
|---|---|
|`Comparer`|the `Comparer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` or `keyComparer` is null|

##### `public static Comparer comparing(IFunction keyExtractor)`

Returns a `Comparer` that compares extracted by the `keyExtractor` keys.

###### Parameters

|Param|Description|
|---|---|
|`keyExtractor`|the function to extract the key to compare|

###### Returns

|Type|Description|
|---|---|
|`Comparer`|the `Comparer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyExtractor` is null|

##### `public static Comparer defaultOrder()`

Returns a comparer that imposes the default ordering.

###### Returns

|Type|Description|
|---|---|
|`Comparer`|the `Comparer`|

##### `public static Comparer reverseOrder()`

Returns a comparer that imposes the reverse ordering.

###### Returns

|Type|Description|
|---|---|
|`Comparer`|the `Comparer`|

##### `public static Comparer nullsFirst(Comparer comparer)`

Returns a null-safe `Comparer` of the `comparer` that considers null to be less than non-null.

###### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer|

###### Returns

|Type|Description|
|---|---|
|`Comparer`|the `Comparer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

##### `public static Comparer nullsLast(Comparer comparer)`

Returns a null-safe `Comparer` of the `comparer` that considers null to be greater than non-null.

###### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer|

###### Returns

|Type|Description|
|---|---|
|`Comparer`|the `Comparer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

---
