# IntBinaryOperator

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IIntBinaryOperator](/docs/Functional-Interfaces/IIntBinaryOperator.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions


**See** IntStream.zip


**See** IntSequence.zip


**See** IIntIterable.reduce


**See** [Collector](/docs/Collectors/Collector.md)

## Methods
### Function
##### `apply(Integer i1, Integer i2)`
###### Parameters
|Param|Description|
|---|---|

---
### Built-Ins
##### `static max()`

Returns a `IntBinaryOperator` that return a greater Integer input argument.

###### Return

**Type**

IntBinaryOperator

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

IntBinaryOperator

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

IntBinaryOperator

**Description**

the `IntBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if one of the Integer input argument is null|

##### `static sum()`

Returns a `IntBinaryOperator` that return a sum of two Integer input arguments.

###### Return

**Type**

IntBinaryOperator

**Description**

the `IntBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if one of the Integer input argument is null|

---
