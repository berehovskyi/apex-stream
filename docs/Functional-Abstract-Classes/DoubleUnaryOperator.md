# DoubleUnaryOperator

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides default and static methods of [IDoubleUnaryOperator](/docs/Functional-Interfaces/IDoubleUnaryOperator.md) functional interface.


**See** [IDoubleUnaryOperator](/docs/Functional-Interfaces/IDoubleUnaryOperator.md)


**See** IDoubleIterable.mapTo


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `apply(Double operand)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `andThen(IDoubleUnaryOperator after)`

Returns a composed `DoubleUnaryOperator` that executes `this` operation first, then the `after` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Return

**Type**

DoubleUnaryOperator

**Description**

the composed `DoubleUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

##### `compose(IDoubleUnaryOperator before)`

Returns a composed `DoubleUnaryOperator` that executes `before` operation first, then the `this` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`before`|the operation to perform before this operation|

###### Return

**Type**

DoubleUnaryOperator

**Description**

the composed `DoubleUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `before` is null|

---
### Static Methods
##### `static compose(List<IDoubleUnaryOperator> operators)`

Returns a composed `DoubleUnaryOperator` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters
|Param|Description|
|---|---|
|`operators`|the operations to sequentially perform|

###### Return

**Type**

DoubleUnaryOperator

**Description**

the composed `DoubleUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operators` is null or some element is null|

##### `static identity()`

Returns a `DoubleUnaryOperator` that always returns the input argument.

###### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`

##### `static constant(Double value)`

Returns a `DoubleUnaryOperator` that always returns the `value`.

###### Parameters
|Param|Description|
|---|---|
|`value`|the Double value|

###### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`

---
