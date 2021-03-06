# UnaryOperator

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IUnaryOperator](/docs/Functional-Interfaces/IUnaryOperator.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes


**See** IObjectIterable.mapTo

## Methods
### Function
##### `apply(Object o)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `andThen(IUnaryOperator after)`

Returns a composed `UnaryOperator` that executes `this` operation first, then the `after` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Return

**Type**

UnaryOperator

**Description**

the composed `UnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

##### `compose(IUnaryOperator before)`

Returns a composed `UnaryOperator` that executes `before` operation first, then the `this` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`before`|the operation to perform before this operation|

###### Return

**Type**

UnaryOperator

**Description**

the composed `UnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `before` is null|

---
### Static Methods
##### `static compose(List<IUnaryOperator> operators)`

Returns a composed `UnaryOperator` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters
|Param|Description|
|---|---|
|`operators`|the operations to sequentially perform|

###### Return

**Type**

UnaryOperator

**Description**

the composed `UnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operators` is null or some element is null|

##### `static identity()`

Returns a `UnaryOperator` that always returns the input argument.

###### Return

**Type**

UnaryOperator

**Description**

the `UnaryOperator`

##### `static constant(Object value)`

Returns a `UnaryOperator` that always returns the `value`.

###### Parameters
|Param|Description|
|---|---|
|`value`|the value|

###### Return

**Type**

UnaryOperator

**Description**

the `UnaryOperator`

##### `static upcast(IIntUnaryOperator operator)`

Returns a composed `UnaryOperator` of the `IIntUnaryOperator`.

###### Parameters
|Param|Description|
|---|---|
|`operator`|applied to the input argument cast to `Integer`|

###### Return

**Type**

UnaryOperator

**Description**

the `UnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operator` is null|

##### `static upcast(ILongUnaryOperator operator)`

Returns a composed `UnaryOperator` of the `ILongUnaryOperator`.

###### Parameters
|Param|Description|
|---|---|
|`operator`|applied to the input argument cast to `Long`|

###### Return

**Type**

UnaryOperator

**Description**

the `UnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operator` is null|

##### `static upcast(IDoubleUnaryOperator operator)`

Returns a composed `UnaryOperator` of the `IDoubleUnaryOperator`.

###### Parameters
|Param|Description|
|---|---|
|`operator`|applied to the input argument cast to `Double`|

###### Return

**Type**

UnaryOperator

**Description**

the `UnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operator` is null|

##### `static upcast(ISObjectUnaryOperator operator)`

Returns a composed `UnaryOperator` of the `ISObjectUnaryOperator`.

###### Parameters
|Param|Description|
|---|---|
|`operator`|applied to the input argument cast to `SObject`|

###### Return

**Type**

UnaryOperator

**Description**

the `UnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operator` is null|

---
