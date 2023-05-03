# IntConsumer

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides default and static methods of [IIntConsumer](/docs/Functional-Interfaces/IIntConsumer.md) functional interface.


**See** [IIntConsumer](/docs/Functional-Interfaces/IIntConsumer.md)


**See** IIntIterable.forEach


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `accept(Integer i)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `andThen(IIntConsumer after)`

Returns a composed `IntConsumer` that executes `this` operation first, then the `after` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Return

**Type**

IntConsumer

**Description**

the composed `IntConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

---
### Static Methods
##### `static compose(List<IIntConsumer> consumers)`

Returns a composed `IntConsumer` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters
|Param|Description|
|---|---|
|`consumers`|the operations to sequentially perform|

###### Return

**Type**

IntConsumer

**Description**

the composed `IntConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumers` is null or some element is null|

---
