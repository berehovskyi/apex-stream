# BiConsumer

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IBiConsumer](/docs/Functional-Interfaces/IBiConsumer.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes


**See** [IBiConsumer](/docs/Functional-Interfaces/IBiConsumer.md)


**See** [Collector](/docs/Collectors/Collector.md)

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
### Built-Ins
##### `static filtering(IPredicate predicate, IBiConsumer accumulator)`

Returns a composed `BiConsumer` that executes `accumulator` operation, if the second input argument satisfies the predicate.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate applied to the second input argument|
|`accumulator`|the operation to perform after filtering|

###### Return

**Type**

BiConsumer

**Description**

the composed `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` or `accumulator` is null|

##### `static mapping(IFunction mapper, IBiConsumer accumulator)`

Returns a composed `BiConsumer` that applies `accumulator` operation to the result returned by the mapper.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the operator applied to the second input argument|
|`accumulator`|the operation to perform|

###### Return

**Type**

BiConsumer

**Description**

the composed `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `accumulator` is null|

##### `static flatMapping(IFunction mapper, IBiConsumer accumulator)`

Returns a composed `BiConsumer` that applies `accumulator` operation to the `Iterable<Object>` elements produced by the `mapper`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the operator applied to the second input argument which must produce `Iterable<Object>`|
|`accumulator`|the operation to perform|

###### Return

**Type**

BiConsumer

**Description**

the composed `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `accumulator` is null|

---
