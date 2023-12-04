# abstract BiConsumer

`APIVERSION: 59`

`STATUS: ACTIVE`

Provides default and static methods of
[IBiConsumer](/docs/Functional-Interfaces/IBiConsumer.md) functional interface.


**Implemented types**

[IBiConsumer](/docs/Functional-Interfaces/IBiConsumer.md)


**See** [IBiConsumer](/docs/Functional-Interfaces/IBiConsumer.md)


**See** [Collector](/docs/Functional-Abstract-Classes/Collector.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Properties

### `public downstream` → `ICollector`


Downstream collector.

---
## Methods
### Function
##### `public void accept(Object o1, Object o2)`
---
### Default Methods
##### `public virtual BiConsumer andThen(IBiConsumer after)`

Returns a composed `BiConsumer` that executes `this` operation first, then the `after` operation in that order.

###### Parameters

|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the composed `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

##### `public virtual BiConsumer compose(IBiConsumer before)`

Returns a composed `BiConsumer` that executes `before` operation first, then the `this` operation in that order.

###### Parameters

|Param|Description|
|---|---|
|`before`|the operation to perform before this operation|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the composed `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `before` is null|

---
### Static Methods
##### `public static BiConsumer compose(List<IBiConsumer> consumers)`

Returns a composed `BiConsumer` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters

|Param|Description|
|---|---|
|`consumers`|the operations to sequentially perform|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the composed `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `consumers` is null or some element is null|

---
