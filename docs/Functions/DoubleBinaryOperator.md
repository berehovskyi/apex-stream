# DoubleBinaryOperator

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IDoubleBinaryOperator](/docs/Functional-Interfaces/IDoubleBinaryOperator.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions


**See** DoubleStream.zip


**See** DoubleSequence.zip


**See** IDoubleIterable.reduce


**See** [Collector](/docs/Collectors/Collector.md)

## Methods
### Function
##### `apply(Double d1, Double d2)`
###### Parameters
|Param|Description|
|---|---|

---
### Built-Ins
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


**See** Math.max

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


**See** Math.min

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

##### `static sum()`

Returns a `IntBinaryOperator` that return a <strong>naive</strong> sum of two Integer input arguments. Please use compensated summation whenever it is possible. <p><strong>Note: </strong></p> <p>Using `IDoubleIterable.sum()` is preferable over `IDoubleIterable.reduce(0, DoubleBinaryOperator.sum())`.</p>

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

---
