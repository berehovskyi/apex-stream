# IntUnaryOperator

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides default and static methods of [IIntUnaryOperator](/docs/Functional-Interfaces/IIntUnaryOperator.md) functional interface.


**See** [IIntUnaryOperator](/docs/Functional-Interfaces/IIntUnaryOperator.md)


**See** IIntIterable.mapTo


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `apply(Integer operand)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `andThen(IIntUnaryOperator after)`

Returns a composed `IntUnaryOperator` that executes `this` operation first, then the `after` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Return

**Type**

IntUnaryOperator

**Description**

the composed `IntUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

##### `compose(IIntUnaryOperator before)`

Returns a composed `IntUnaryOperator` that executes `before` operation first, then the `this` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`before`|the operation to perform before this operation|

###### Return

**Type**

IntUnaryOperator

**Description**

the composed `IntUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `before` is null|

---
### Static Methods
##### `static compose(List<IIntUnaryOperator> operators)`

Returns a composed `IntUnaryOperator` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters
|Param|Description|
|---|---|
|`operators`|the operations to sequentially perform|

###### Return

**Type**

IntUnaryOperator

**Description**

the composed `IntUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operators` is null or some element is null|

##### `static identity()`

Returns a `IntUnaryOperator` that always returns the input argument.

###### Return

**Type**

IntUnaryOperator

**Description**

the `IntUnaryOperator`

##### `static constant(Integer value)`

Returns a `IntUnaryOperator` that always returns the `value`.

###### Parameters
|Param|Description|
|---|---|
|`value`|the int value|

###### Return

**Type**

IntUnaryOperator

**Description**

the `IntUnaryOperator`

---
