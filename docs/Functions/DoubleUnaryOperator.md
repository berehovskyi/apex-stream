# DoubleUnaryOperator

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IDoubleUnaryOperator](/docs/Functional-Interfaces/IDoubleUnaryOperator.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions


**See** IDoubleIterable.mapTo

## Methods
### `apply(Double operand)`
#### Parameters
|Param|Description|
|---|---|

### `andThen(IDoubleUnaryOperator after)`

Returns a composed `DoubleUnaryOperator` that executes `this` operation first, then the `after` operation in that order.

#### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

#### Return

**Type**

DoubleUnaryOperator

**Description**

the composed `DoubleUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

### `compose(IDoubleUnaryOperator before)`

Returns a composed `DoubleUnaryOperator` that executes `before` operation first, then the `this` operation in that order.

#### Parameters
|Param|Description|
|---|---|
|`before`|the operation to perform before this operation|

#### Return

**Type**

DoubleUnaryOperator

**Description**

the composed `DoubleUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `before` is null|

### `static compose(List<IDoubleUnaryOperator> operators)`

Returns a composed `DoubleUnaryOperator` that sequentially executes the operations in the same order as the order of the consumers input list.

#### Parameters
|Param|Description|
|---|---|
|`operators`|the operations to sequentially perform|

#### Return

**Type**

DoubleUnaryOperator

**Description**

the composed `DoubleUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operators` is null or some element is null|

### `static identity()`

Returns a `DoubleUnaryOperator` that always returns the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`

### `static constant(Double value)`

Returns a `DoubleUnaryOperator` that always returns the `value`.

#### Parameters
|Param|Description|
|---|---|
|`value`|the Double value|

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`

### `static abs()`

Returns a `DoubleUnaryOperator` that returns the absolute value of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.abs

### `static add(Double d)`

Returns a `DoubleUnaryOperator` that returns the sum of the input argument and the `d`.

#### Parameters
|Param|Description|
|---|---|
|`d`|the Double value|

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `d` is null|

### `static acos()`

Returns a `DoubleUnaryOperator` that returns the arc cos of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.acos

### `static asin()`

Returns a `DoubleUnaryOperator` that returns the arc sin of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.asin

### `static atan()`

Returns a `DoubleUnaryOperator` that returns the arc tan of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.atan

### `static cbrt()`

Returns a `DoubleUnaryOperator` that returns the cube root of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.cbrt

### `static ceil()`

Returns a `DoubleUnaryOperator` that returns the ceil of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.ceil

### `static cos()`

Returns a `DoubleUnaryOperator` that returns the cos of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.cos

### `static cosh()`

Returns a `DoubleUnaryOperator` that returns the cosh of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.cosh

### `static divide(Double d)`

Returns a `DoubleUnaryOperator` that returns the division of the input argument and the `d`.

#### Parameters
|Param|Description|
|---|---|
|`d`|the Double value|

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `d` is null|
|`IllegalArgumentException`|if `d` is 0|

### `static exp()`

Returns a `DoubleUnaryOperator` that returns the e ^ the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.exp

### `static floor()`

Returns a `DoubleUnaryOperator` that returns the floor of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.floor

### `static ln()`

Returns a `DoubleUnaryOperator` that returns the ln of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.log

### `static log()`

Returns a `DoubleUnaryOperator` that returns the log of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.log10

### `static max(Double d)`

Returns a `DoubleUnaryOperator` that returns a larger value between the input argument and the `d`.

#### Parameters
|Param|Description|
|---|---|
|`d`|the Double value|

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `d` is null|


**See** Math.max

### `static min(Double d)`

Returns a `DoubleUnaryOperator` that returns a smaller value between the input argument and the `d`.

#### Parameters
|Param|Description|
|---|---|
|`d`|the Double value|

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `d` is null|


**See** Math.min

### `static multiply(Double d)`

Returns a `DoubleUnaryOperator` that returns the multiplication of the of the input argument and the `d`.

#### Parameters
|Param|Description|
|---|---|
|`d`|the Double value|

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `d` is null|

### `static pow(Double exp)`

Returns a `DoubleUnaryOperator` that returns the input argument raised to the power of the `exp`.

#### Parameters
|Param|Description|
|---|---|
|`exp`|the Double power value|

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `d` is null|


**See** Math.pow

### `static rint()`

Returns a `DoubleUnaryOperator` that returns the rint of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.rint

### `static signum()`

Returns a `DoubleUnaryOperator` that returns the signum of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.signum

### `static sin()`

Returns a `DoubleUnaryOperator` that returns the sin of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.sin

### `static sinh()`

Returns a `DoubleUnaryOperator` that returns the sinh of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.sinh

### `static sqrt()`

Returns a `DoubleUnaryOperator` that returns the square root of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.sqrt

### `static subtract(Double d)`

Returns a `DoubleUnaryOperator` that returns the subtraction of the input argument and the `d`.

#### Parameters
|Param|Description|
|---|---|
|`d`|the Double value|

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `d` is null|

### `static tan()`

Returns a `DoubleUnaryOperator` that returns the tan of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.tan

### `static tanh()`

Returns a `DoubleUnaryOperator` that returns the tanh of the input argument.

#### Return

**Type**

DoubleUnaryOperator

**Description**

the `DoubleUnaryOperator`


**See** Math.tanh

---
