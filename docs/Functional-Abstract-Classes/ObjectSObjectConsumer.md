# ObjectSObjectConsumer

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IObjectSObjectConsumer](/docs/Functional-Interfaces/IObjectSObjectConsumer.md) functional interface and provides common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes


**See** [IObjectSObjectConsumer](/docs/Functional-Interfaces/IObjectSObjectConsumer.md)


**See** [SObjectCollector](/docs/Collectors/SObjectCollector.md)

## Properties

### `downstream` → `ISObjectCollector`


Downstream collector.

---
## Methods
### Function
##### `accept(Object container, SObject sObj)`
###### Parameters
|Param|Description|
|---|---|

---
### Composed BiConsumers
##### `static filtering(ISObjectPredicate predicate, IObjectSObjectConsumer accumulator)`

Returns a composed `ObjectSObjectConsumer` that executes `accumulator` operation, if the second input argument satisfies the predicate.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate applied to the second input argument|
|`accumulator`|the operation to perform after filtering|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the composed `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` or `accumulator` is null|

##### `static mapping(ISObjectFunction mapper, IBiConsumer accumulator)`

Returns a composed `ObjectSObjectConsumer` that applies `accumulator` operation to the result returned by the mapper.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the operator applied to the second input argument|
|`accumulator`|the operation to perform|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the composed `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `accumulator` is null|

---
