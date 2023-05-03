# LongUnaryOperator

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides default and static methods of [ILongUnaryOperator](/docs/Functional-Interfaces/ILongUnaryOperator.md) functional interface.


**See** [ILongUnaryOperator](/docs/Functional-Interfaces/ILongUnaryOperator.md)


**See** ILongIterable.mapTo


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `apply(Long operand)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `andThen(ILongUnaryOperator after)`

Returns a composed `LongUnaryOperator` that executes `this` operation first, then the `after` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Return

**Type**

LongUnaryOperator

**Description**

the composed `LongUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

##### `compose(ILongUnaryOperator before)`

Returns a composed `LongUnaryOperator` that executes `before` operation first, then the `this` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`before`|the operation to perform before this operation|

###### Return

**Type**

LongUnaryOperator

**Description**

the composed `LongUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `before` is null|

---
### Static Methods
##### `static compose(List<ILongUnaryOperator> operators)`

Returns a composed `LongUnaryOperator` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters
|Param|Description|
|---|---|
|`operators`|the operations to sequentially perform|

###### Return

**Type**

LongUnaryOperator

**Description**

the composed `LongUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operators` is null or some element is null|

##### `static identity()`

Returns a `LongUnaryOperator` that always returns the input argument.

###### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

##### `static constant(Long value)`

Returns a `LongUnaryOperator` that always returns the `value`.

###### Parameters
|Param|Description|
|---|---|
|`value`|the Long value|

###### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

---
