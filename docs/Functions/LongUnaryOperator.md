# LongUnaryOperator

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ILongUnaryOperator](/docs/Functional-Interfaces/ILongUnaryOperator.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions


**See** ILongIterable.mapTo

## Methods
### `apply(Long operand)`
#### Parameters
|Param|Description|
|---|---|

### `andThen(ILongUnaryOperator after)`

Returns a composed `LongUnaryOperator` that executes `this` operation first, then the `after` operation in that order.

#### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

#### Return

**Type**

LongUnaryOperator

**Description**

the composed `LongUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

### `compose(ILongUnaryOperator before)`

Returns a composed `LongUnaryOperator` that executes `before` operation first, then the `this` operation in that order.

#### Parameters
|Param|Description|
|---|---|
|`before`|the operation to perform before this operation|

#### Return

**Type**

LongUnaryOperator

**Description**

the composed `LongUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `before` is null|

### `static compose(List<ILongUnaryOperator> operators)`

Returns a composed `LongUnaryOperator` that sequentially executes the operations in the same order as the order of the consumers input list.

#### Parameters
|Param|Description|
|---|---|
|`operators`|the operations to sequentially perform|

#### Return

**Type**

LongUnaryOperator

**Description**

the composed `LongUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operators` is null or some element is null|

### `static identity()`

Returns a `LongUnaryOperator` that always returns the input argument.

#### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

### `static constant(Long value)`

Returns a `LongUnaryOperator` that always returns the `value`.

#### Parameters
|Param|Description|
|---|---|
|`value`|the Long value|

#### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

### `static abs()`

Returns a `LongUnaryOperator` that returns the absolute value of the input argument.

#### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`


**See** Math.abs

### `static add(Long l)`

Returns a `LongUnaryOperator` that returns the sum of the input argument and the `l`.

#### Parameters
|Param|Description|
|---|---|
|`l`|the Long value|

#### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|

### `static decrement()`

Returns a `LongUnaryOperator` that returns the input argument decremented by 1.

#### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

### `static divide(Long l)`

Returns a `LongUnaryOperator` that returns the division of the input argument and the `l`.

#### Parameters
|Param|Description|
|---|---|
|`l`|the Long value|

#### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|
|`IllegalArgumentException`|if `l` is 0|

### `static increment()`

Returns a `LongUnaryOperator` that returns the input argument incremented by 1.

#### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

### `static max(Long l)`

Returns a `LongUnaryOperator` that returns a larger value between the input argument and the `l`.

#### Parameters
|Param|Description|
|---|---|
|`l`|the Long value|

#### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|


**See** Math.max

### `static min(Long l)`

Returns a `LongUnaryOperator` that returns a smaller value between the input argument and the `l`.

#### Parameters
|Param|Description|
|---|---|
|`l`|the Long value|

#### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|


**See** Math.min

### `static mod(Long l)`

Returns a `LongUnaryOperator` that returns a remainder of the input argument divided by the `l`.

#### Parameters
|Param|Description|
|---|---|
|`l`|the Long value|

#### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|
|`IllegalArgumentException`|if `l` is 0|


**See** Math.mod

### `static multiply(Long l)`

Returns a `LongUnaryOperator` that returns the multiplication of the of the input argument and the `l`.

#### Parameters
|Param|Description|
|---|---|
|`l`|the Long value|

#### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|

### `static subtract(Long l)`

Returns a `LongUnaryOperator` that returns the subtraction of the input argument and the `l`.

#### Parameters
|Param|Description|
|---|---|
|`l`|the Long value|

#### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|

---
