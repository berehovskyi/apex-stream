# DoubleBinaryOperators

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides common implementations of [DoubleBinaryOperator](/docs/Functional-Abstract-Classes/DoubleBinaryOperator.md) and related utilities.


**See** [DoubleBinaryOperator](/docs/Functional-Abstract-Classes/DoubleBinaryOperator.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `static euclideanDistance()`

Returns a `IntBinaryOperator` that return a the square root of the sum of the squares of the Integer input arguments.

###### Return

**Type**

DoubleBinaryOperator

**Description**

the `IntBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if one of the Integer input argument is null|

##### `static sum()`

Returns a `IntBinaryOperator` that return a <strong>naive</strong> sum of two Integer input arguments. Please use compensated summation whenever it is possible. <p><strong>Note: </strong></p> <p>Using `IDoubleIterable.sum()` is preferable over `IDoubleIterable.reduce(0, DoubleBinaryOperators.sum())`.</p>

###### Return

**Type**

DoubleBinaryOperator

**Description**

the `IntBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if one of the Integer input argument is null|


**See** IDoubleIterable.sum

##### `static product()`

Returns a `IntBinaryOperator` that return a product of two Integer input arguments.

###### Return

**Type**

DoubleBinaryOperator

**Description**

the `IntBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if one of the Integer input argument is null|

##### `static min()`

Returns a `IntBinaryOperator` that return a lesser Integer input argument.

###### Return

**Type**

DoubleBinaryOperator

**Description**

the `IntBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if one of the Integer input argument is null|

##### `static max()`

Returns a `IntBinaryOperator` that return a greater Integer input argument.

###### Return

**Type**

DoubleBinaryOperator

**Description**

the `IntBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if one of the Integer input argument is null|

---
