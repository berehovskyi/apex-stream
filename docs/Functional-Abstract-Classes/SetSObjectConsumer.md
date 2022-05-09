# SetSObjectConsumer

`APIVERSION: 54`

`STATUS: ACTIVE`

Provides common class level implementations, and related utilities for `Set<T> - T` two-arity consumers. Typically is used by collectors.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes


**See** [IObjectSObjectConsumer](/docs/Functional-Interfaces/IObjectSObjectConsumer.md)


**See** [SObjectCollector](/docs/Collectors/SObjectCollector.md)

## Methods
### Add To Set<?> BiConsumers
##### `static addToBoolSet(ISObjectFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Boolean>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.toBoolSet

##### `static addToIdSet(ISObjectFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Id>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.toIdSet

##### `static addToStringSet(ISObjectFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<String>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.toStringSet

##### `static addToBlobSet(ISObjectFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Blob>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.toBlobSet

##### `static addToDateSet(ISObjectFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Date>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.toDateSet

##### `static addToDatetimeSet(ISObjectFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Datetime>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.toDatetimeSet

##### `static addToTimeSet(ISObjectFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Time>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.toTimeSet

##### `static addToIntSet(ISObjectToIntFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Integer>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.toIntSet

##### `static addToLongSet(ISObjectToLongFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Long>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.toLongSet

##### `static addToDoubleSet(ISObjectToDoubleFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Double>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.toDoubleSet

##### `static addToSObjectSet(ISObjectUnaryOperator mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<SObject>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.toSet

##### `static addToObjectSet(ISObjectFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to the `Set<Object>` and adds to it the result of applying the `mapper` function to the second input argument

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.toSet

---
