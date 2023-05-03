# ObjectSObjectConsumers

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides common implementations of [ObjectSObjectConsumer](/docs/Functional-Abstract-Classes/ObjectSObjectConsumer.md) and related utilities that are used by [SObjectCollectors](/docs/Functional-Built-In-Classes/SObjectCollectors.md).


**See** [ObjectSObjectConsumer](/docs/Functional-Abstract-Classes/ObjectSObjectConsumer.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
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

Returns a composed `ObjectSObjectConsumer` that applies `accumulator` operation to the result returned by the `mapper`.

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

##### `static flatMapping(ISObjectFunction mapper, IBiConsumer accumulator)`

Returns a composed `ObjectSObjectConsumer` that applies `accumulator` operation to the `Iterable<SObject>` elements produced by the `mapper`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the operator applied to the second input argument which must produce `Iterable<SObject>`|
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
