# LongConsumer

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides default and static methods of [ILongConsumer](/docs/Functional-Interfaces/ILongConsumer.md) functional interface.


**See** [ILongConsumer](/docs/Functional-Interfaces/ILongConsumer.md)


**See** ILongIterable.forEach


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `accept(Long l)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `andThen(ILongConsumer after)`

Returns a composed `LongConsumer` that executes `this` operation first, then the `after` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Return

**Type**

LongConsumer

**Description**

the composed `LongConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

---
### Static Methods
##### `static compose(List<ILongConsumer> consumers)`

Returns a composed `LongConsumer` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters
|Param|Description|
|---|---|
|`consumers`|the operations to sequentially perform|

###### Return

**Type**

LongConsumer

**Description**

the composed `LongConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumers` is null or some element is null|

---
