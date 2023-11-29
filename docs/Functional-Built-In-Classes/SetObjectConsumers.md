# virtual SetObjectConsumers

`APIVERSION: 58`

`STATUS: ACTIVE`

Provides common implementations of `Set<T> - T` [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md)
and related utilities that are used by [Collectors](/docs/Functional-Built-In-Classes/Collectors.md).


**See** [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md)


**See** [Collectors](/docs/Functional-Built-In-Classes/Collectors.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static BiConsumer addToSet(IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Object>` and adds the second input argument to it.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toObjectSet](Collectors.toObjectSet)

##### `public static BiConsumer addToBoolSet(IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Boolean>` and adds the second input argument to it.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toBoolSet](Collectors.toBoolSet)

##### `public static BiConsumer addToIdSet(IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Id>` and adds the second input argument to it.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toIdSet](Collectors.toIdSet)

##### `public static BiConsumer addToStringSet(IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<String>` and adds the second input argument to it.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toStringSet](Collectors.toStringSet)

##### `public static BiConsumer addToBlobSet(IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Blob>` and adds the second input argument to it.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toBlobSet](Collectors.toBlobSet)

##### `public static BiConsumer addToDateSet(IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Date>` and adds the second input argument to it.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toDateSet](Collectors.toDateSet)

##### `public static BiConsumer addToDatetimeSet(IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Datetime>` and adds the second input argument to it.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toDatetimeSet](Collectors.toDatetimeSet)

##### `public static BiConsumer addToTimeSet(IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Time>` and adds the second input argument to it.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toTimeSet](Collectors.toTimeSet)

##### `public static BiConsumer addToIntSet(IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Integer>` and adds the second input argument to it.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toIntSet](Collectors.toIntSet)

##### `public static BiConsumer addToLongSet(IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Long>` and adds the second input argument to it.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toLongSet](Collectors.toLongSet)

##### `public static BiConsumer addToDoubleSet(IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Double>` and adds the second input argument to it.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toDoubleSet](Collectors.toDoubleSet)

##### `public static BiConsumer addToSObjectSet(IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<SObject>` and adds the second input argument to it.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toSObjectSet](Collectors.toSObjectSet)

---
