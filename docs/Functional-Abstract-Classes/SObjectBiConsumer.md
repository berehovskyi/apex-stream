# SObjectBiConsumer

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides default and static methods of [ISObjectBiConsumer](/docs/Functional-Interfaces/ISObjectBiConsumer.md) functional interface.


**See** [ISObjectBiConsumer](/docs/Functional-Interfaces/ISObjectBiConsumer.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `accept(SObject sObj1, SObject sObj2)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `andThen(ISObjectBiConsumer after)`

Returns a composed `SObjectBiConsumer` that executes `this` operation first, then the `after` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Return

**Type**

SObjectBiConsumer

**Description**

the composed `SObjectBiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

##### `compose(ISObjectBiConsumer before)`

Returns a composed `SObjectBiConsumer` that executes `before` operation first, then the `this` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`before`|the operation to perform before this operation|

###### Return

**Type**

SObjectBiConsumer

**Description**

the composed `SObjectBiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `before` is null|

---
### Static Methods
##### `static compose(List<ISObjectBiConsumer> consumers)`

Returns a composed `SObjectBiConsumer` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters
|Param|Description|
|---|---|
|`consumers`|the operations to sequentially perform|

###### Return

**Type**

SObjectBiConsumer

**Description**

the composed `SObjectBiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumers` is null or some element is null|

---
