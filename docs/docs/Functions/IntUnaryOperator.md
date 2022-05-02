# IntUnaryOperator

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IIntUnaryOperator](/docs/Functional-Interfaces/IIntUnaryOperator.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions


**See** IIntIterable.mapTo

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
### Built-Ins
##### `static abs()`

Returns a `IntUnaryOperator` that returns the absolute value of the input argument.

###### Return

**Type**

IntUnaryOperator

**Description**

the `IntUnaryOperator`


**See** Math.abs

##### `static add(Integer i)`

Returns a `IntUnaryOperator` that returns the sum of the input argument and the `i`.

###### Parameters
|Param|Description|
|---|---|
|`i`|the int value|

###### Return

**Type**

IntUnaryOperator

**Description**

the `IntUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `i` is null|

##### `static decrement()`

Returns a `IntUnaryOperator` that returns the input argument decremented by 1.

###### Return

**Type**

IntUnaryOperator

**Description**

the `IntUnaryOperator`

##### `static divide(Integer i)`

Returns a `IntUnaryOperator` that returns the division of the input argument and the `i`.

###### Parameters
|Param|Description|
|---|---|
|`i`|the int value|

###### Return

**Type**

IntUnaryOperator

**Description**

the `IntUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `i` is null|
|`IllegalArgumentException`|if `i` is 0|

##### `static increment()`

Returns a `IntUnaryOperator` that returns the input argument incremented by 1.

###### Return

**Type**

IntUnaryOperator

**Description**

the `IntUnaryOperator`

##### `static max(Integer i)`

Returns a `IntUnaryOperator` that returns a larger value between the input argument and the `i`.

###### Parameters
|Param|Description|
|---|---|
|`i`|the int value|

###### Return

**Type**

IntUnaryOperator

**Description**

the `IntUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `i` is null|


**See** Math.max

##### `static min(Integer i)`

Returns a `IntUnaryOperator` that returns a smaller value between the input argument and the `i`.

###### Parameters
|Param|Description|
|---|---|
|`i`|the int value|

###### Return

**Type**

IntUnaryOperator

**Description**

the `IntUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `i` is null|


**See** Math.min

##### `static mod(Integer i)`

Returns a `IntUnaryOperator` that returns a remainder of the input argument divided by the `i`.

###### Parameters
|Param|Description|
|---|---|
|`i`|the int value|

###### Return

**Type**

IntUnaryOperator

**Description**

the `IntUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `i` is null|
|`IllegalArgumentException`|if `i` is 0|


**See** Math.mod

##### `static multiply(Integer i)`

Returns a `IntUnaryOperator` that returns the multiplication of the of the input argument and the `i`.

###### Parameters
|Param|Description|
|---|---|
|`i`|the int value|

###### Return

**Type**

IntUnaryOperator

**Description**

the `IntUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `i` is null|

##### `static subtract(Integer i)`

Returns a `IntUnaryOperator` that returns the subtraction of the input argument and the `i`.

###### Parameters
|Param|Description|
|---|---|
|`i`|the int value|

###### Return

**Type**

IntUnaryOperator

**Description**

the `IntUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `i` is null|

---
