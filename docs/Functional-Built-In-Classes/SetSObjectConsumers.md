# SetSObjectConsumers

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides common implementations of `Set<T> - T` [ObjectSObjectConsumer](/docs/Functional-Abstract-Classes/ObjectSObjectConsumer.md) and related utilities that are used by [SObjectCollectors](/docs/Functional-Built-In-Classes/SObjectCollectors.md).


**See** [ObjectSObjectConsumer](/docs/Functional-Abstract-Classes/ObjectSObjectConsumer.md)


**See** [SObjectCollectors](/docs/Functional-Built-In-Classes/SObjectCollectors.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Add To Set<?> BiConsumers
##### `static addToBoolSet(ISObjectFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Boolean>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollectors.toBoolSet

##### `static addToIdSet(ISObjectFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Id>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollectors.toIdSet

##### `static addToStringSet(ISObjectFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<String>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollectors.toStringSet

##### `static addToBlobSet(ISObjectFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Blob>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollectors.toBlobSet

##### `static addToDateSet(ISObjectFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Date>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollectors.toDateSet

##### `static addToDatetimeSet(ISObjectFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Datetime>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollectors.toDatetimeSet

##### `static addToTimeSet(ISObjectFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Time>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollectors.toTimeSet

##### `static addToIntSet(ISObjectToIntFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Integer>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollectors.toIntSet

##### `static addToLongSet(ISObjectToLongFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Long>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollectors.toLongSet

##### `static addToDoubleSet(ISObjectToDoubleFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Double>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollectors.toDoubleSet

##### `static addToSObjectSet(ISObjectUnaryOperator mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<SObject>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollectors.toSet

##### `static addToObjectSet(ISObjectFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Object>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollectors.toSet

---
