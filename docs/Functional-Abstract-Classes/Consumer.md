# Consumer

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides default and static methods of [IConsumer](/docs/Functional-Interfaces/IConsumer.md) functional interface.


**See** [IConsumer](/docs/Functional-Interfaces/IConsumer.md)


**See** IObjectIterable.forEach


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `accept(Object o)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `andThen(IConsumer after)`

Returns a composed `Consumer` that executes `this` operation first, then the `after` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Return

**Type**

Consumer

**Description**

the composed `Consumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

---
### Static Methods
##### `static compose(List<IConsumer> consumers)`

Returns a composed `Consumer` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters
|Param|Description|
|---|---|
|`consumers`|the operations to sequentially perform|

###### Return

**Type**

Consumer

**Description**

the composed `Consumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumers` is null or some element is null|

---
