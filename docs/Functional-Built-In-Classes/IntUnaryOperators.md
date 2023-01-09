# IntUnaryOperators

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides common implementations of [IntUnaryOperator](/docs/Functional-Abstract-Classes/IntUnaryOperator.md) and related utilities.


**See** [IntUnaryOperator](/docs/Functional-Abstract-Classes/IntUnaryOperator.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
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
|`IllegalArgumentException`|if `i` is 0|
|`NullPointerException`|if `i` is null|

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
|`IllegalArgumentException`|if `i` is 0|
|`NullPointerException`|if `i` is null|


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
