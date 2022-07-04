# LongUnaryOperators

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides common implementations of [LongUnaryOperator](/docs/Functional-Abstract-Classes/LongUnaryOperator.md) and related utilities.


**See** [LongUnaryOperator](/docs/Functional-Abstract-Classes/LongUnaryOperator.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `static abs()`

Returns a `LongUnaryOperator` that returns the absolute value of the input argument.

###### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`


**See** Math.abs

##### `static add(Long l)`

Returns a `LongUnaryOperator` that returns the sum of the input argument and the `l`.

###### Parameters
|Param|Description|
|---|---|
|`l`|the Long value|

###### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|

##### `static decrement()`

Returns a `LongUnaryOperator` that returns the input argument decremented by 1.

###### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

##### `static divide(Long l)`

Returns a `LongUnaryOperator` that returns the division of the input argument and the `l`.

###### Parameters
|Param|Description|
|---|---|
|`l`|the Long value|

###### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `l` is 0|
|`NullPointerException`|if `l` is null|

##### `static increment()`

Returns a `LongUnaryOperator` that returns the input argument incremented by 1.

###### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

##### `static max(Long l)`

Returns a `LongUnaryOperator` that returns a larger value between the input argument and the `l`.

###### Parameters
|Param|Description|
|---|---|
|`l`|the Long value|

###### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|


**See** Math.max

##### `static min(Long l)`

Returns a `LongUnaryOperator` that returns a smaller value between the input argument and the `l`.

###### Parameters
|Param|Description|
|---|---|
|`l`|the Long value|

###### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|


**See** Math.min

##### `static mod(Long l)`

Returns a `LongUnaryOperator` that returns a remainder of the input argument divided by the `l`.

###### Parameters
|Param|Description|
|---|---|
|`l`|the Long value|

###### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `l` is 0|
|`NullPointerException`|if `l` is null|


**See** Math.mod

##### `static multiply(Long l)`

Returns a `LongUnaryOperator` that returns the multiplication of the of the input argument and the `l`.

###### Parameters
|Param|Description|
|---|---|
|`l`|the Long value|

###### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|

##### `static subtract(Long l)`

Returns a `LongUnaryOperator` that returns the subtraction of the input argument and the `l`.

###### Parameters
|Param|Description|
|---|---|
|`l`|the Long value|

###### Return

**Type**

LongUnaryOperator

**Description**

the `LongUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|

---
