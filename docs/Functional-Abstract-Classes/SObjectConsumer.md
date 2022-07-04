# SObjectConsumer

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides default and static methods of [ISObjectConsumer](/docs/Functional-Interfaces/ISObjectConsumer.md) functional interface.


**See** [ISObjectConsumer](/docs/Functional-Interfaces/ISObjectConsumer.md)


**See** ISObjectIterable.forEach


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `accept(SObject sObj)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `andThen(ISObjectConsumer after)`

Returns a composed `SObjectConsumer` that executes `this` operation first, then the `after` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Return

**Type**

SObjectConsumer

**Description**

the composed `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

---
### Static Methods
##### `static compose(List<ISObjectConsumer> consumers)`

Returns a composed `SObjectConsumer` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters
|Param|Description|
|---|---|
|`consumers`|the operations to sequentially perform|

###### Return

**Type**

SObjectConsumer

**Description**

the composed `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumers` is null or some element is null|

---
