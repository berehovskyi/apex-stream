# BinaryOperator

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IBinaryOperator](/docs/Functional-Interfaces/IBinaryOperator.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions


**See** ObjectStream.zip


**See** ObjectSequence.zip


**See** IObjectIterable.reduce


**See** [Collector](/docs/Collectors/Collector.md)

## Methods
### Function
##### `apply(Object o1, Object o2)`
###### Parameters
|Param|Description|
|---|---|

---
### Static Methods
##### `static left()`

Returns a `SObjectBinaryOperator` that return the first input argument.

###### Return

**Type**

BinaryOperator

**Description**

the `SObjectBinaryOperator`

##### `static right()`

Returns a `SObjectBinaryOperator` that return the second input argument.

###### Return

**Type**

BinaryOperator

**Description**

the `SObjectBinaryOperator`

##### `static minBy(IComparator comparator)`

Returns a `SObjectBinaryOperator` that returns a lesser input argument according to the `comparator`.

###### Parameters
|Param|Description|
|---|---|
|`comparator`|the comparator to compare arguments|

###### Return

**Type**

BinaryOperator

**Description**

the `SObjectBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `comparator` is null|

##### `static maxBy(IComparator comparator)`

Returns a `SObjectBinaryOperator` that returns a greater input argument according to the `comparator`.

###### Parameters
|Param|Description|
|---|---|
|`comparator`|the comparator to compare arguments|

###### Return

**Type**

BinaryOperator

**Description**

the `SObjectBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `comparator` is null|

##### `static upcast(IIntBinaryOperator operator)`

Returns a composed `BinaryOperator` of the `IIntBinaryOperator`.

###### Parameters
|Param|Description|
|---|---|
|`operator`|the binary operator|

###### Return

**Type**

BinaryOperator

**Description**

the `BinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operator` is null|

##### `static upcast(ILongBinaryOperator operator)`

Returns a composed `BinaryOperator` of the `ILongBinaryOperator`.

###### Parameters
|Param|Description|
|---|---|
|`operator`|the binary operator|

###### Return

**Type**

BinaryOperator

**Description**

the `BinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operator` is null|

##### `static upcast(IDoubleBinaryOperator operator)`

Returns a composed `BinaryOperator` of the `IDoubleBinaryOperator`.

###### Parameters
|Param|Description|
|---|---|
|`operator`|the binary operator|

###### Return

**Type**

BinaryOperator

**Description**

the `BinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operator` is null|

##### `static upcast(ISObjectBinaryOperator operator)`

Returns a composed `BinaryOperator` of the `ISObjectBinaryOperator`.

###### Parameters
|Param|Description|
|---|---|
|`operator`|the binary operator|

###### Return

**Type**

BinaryOperator

**Description**

the `BinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operator` is null|

---
