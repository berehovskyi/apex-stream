# BiConsumer

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides default and static methods of [IBiConsumer](/docs/Functional-Interfaces/IBiConsumer.md) functional interface.


**See** [IBiConsumer](/docs/Functional-Interfaces/IBiConsumer.md)


**See** [Collector](/docs/Functional-Abstract-Classes/Collector.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Properties

### `downstream` → `ICollector`


Downstream collector.

---
## Methods
### Function
##### `accept(Object o1, Object o2)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `andThen(IBiConsumer after)`

Returns a composed `BiConsumer` that executes `this` operation first, then the `after` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Return

**Type**

BiConsumer

**Description**

the composed `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

##### `compose(IBiConsumer before)`

Returns a composed `BiConsumer` that executes `before` operation first, then the `this` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`before`|the operation to perform before this operation|

###### Return

**Type**

BiConsumer

**Description**

the composed `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `before` is null|

---
### Static Methods
##### `static compose(List<IBiConsumer> consumers)`

Returns a composed `BiConsumer` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters
|Param|Description|
|---|---|
|`consumers`|the operations to sequentially perform|

###### Return

**Type**

BiConsumer

**Description**

the composed `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumers` is null or some element is null|

---
