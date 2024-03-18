# abstract Consumer

`APIVERSION: 60`

`STATUS: ACTIVE`

Provides default and static methods of
[IConsumer](/docs/Functional-Interfaces/IConsumer.md) functional interface.


**Implemented types**

[IConsumer](/docs/Functional-Interfaces/IConsumer.md)


**See** [IConsumer](/docs/Functional-Interfaces/IConsumer.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `public void accept(Object o)`
---
### Default Methods
##### `public virtual Consumer andThen(IConsumer after)`

Returns a composed `Consumer` that executes `this` operation first, then the `after` operation in that order.

###### Parameters

|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the composed `Consumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

---
### Static Methods
##### `public static Consumer compose(List<IConsumer> consumers)`

Returns a composed `Consumer` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters

|Param|Description|
|---|---|
|`consumers`|the operations to sequentially perform|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the composed `Consumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `consumers` is null or some element is null|

---
