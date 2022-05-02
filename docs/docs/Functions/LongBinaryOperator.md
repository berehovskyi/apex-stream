# LongBinaryOperator

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ILongBinaryOperator](/docs/Functional-Interfaces/ILongBinaryOperator.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions


**See** LongStream.zip


**See** LongSequence.zip


**See** ILongIterable.reduce


**See** [Collector](/docs/Collectors/Collector.md)

## Methods
### Function
##### `apply(Long l1, Long l2)`
###### Parameters
|Param|Description|
|---|---|

---
### Built-Ins
##### `static max()`

Returns a `LongBinaryOperator` that return a greater Long input argument.

###### Return

**Type**

LongBinaryOperator

**Description**

the `LongBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if one of the Long input argument is null|


**See** Math.max

##### `static min()`

Returns a `LongBinaryOperator` that return a lesser Long input argument.

###### Return

**Type**

LongBinaryOperator

**Description**

the `LongBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if one of the Long input argument is null|


**See** Math.min

##### `static product()`

Returns a `LongBinaryOperator` that return a product of two Long input arguments.

###### Return

**Type**

LongBinaryOperator

**Description**

the `LongBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if one of the Long input argument is null|

##### `static sum()`

Returns a `LongBinaryOperator` that return a sum of two Long input arguments.

###### Return

**Type**

LongBinaryOperator

**Description**

the `LongBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if one of the Long input argument is null|

---
