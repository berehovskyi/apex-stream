# DoubleConsumer

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides default and static methods of [IDoubleConsumer](/docs/Functional-Interfaces/IDoubleConsumer.md) functional interface.


**See** [IDoubleConsumer](/docs/Functional-Interfaces/IDoubleConsumer.md)


**See** IDoubleIterable.forEach


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `accept(Double d)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `andThen(IDoubleConsumer after)`

Returns a composed `DoubleConsumer` that executes `this` operation first, then the `after` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Return

**Type**

DoubleConsumer

**Description**

the composed `DoubleConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

---
### Static Methods
##### `static compose(List<IDoubleConsumer> consumers)`

Returns a composed `DoubleConsumer` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters
|Param|Description|
|---|---|
|`consumers`|the operations to sequentially perform|

###### Return

**Type**

DoubleConsumer

**Description**

the composed `DoubleConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumers` is null or some element is null|

---
