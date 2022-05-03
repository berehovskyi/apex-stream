# ListDoubleConsumer

`APIVERSION: 54`

`STATUS: ACTIVE`

Provides common class level implementations, and related utilities for `List<Double> - Double` two-arity consumers. Typically is used by collectors.


**Author** O. Berehovskyi


**Group** Functions


**See** [Collector](/docs/Collectors/Collector.md)

## Methods
### Built-Ins
##### `static averagingDouble()`

Returns a `ObjectDoubleConsumer` that casts the first input argument to `List<Double>`, which is used as a container to track the number of elements and the total sum using `Kahan Summation`.

###### Return

**Type**

ObjectDoubleConsumer

**Description**

the `ObjectDoubleConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if at least one of the input arguments is null|


**See** Collector.averagingDouble

##### `static summingDouble()`

Returns a `ObjectDoubleConsumer` that casts the first input argument to `List<Double>`, which is used as a container to track the total sum using `Kahan Summation`.

###### Return

**Type**

ObjectDoubleConsumer

**Description**

the `ObjectDoubleConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if at least one of the input arguments is null|


**See** Collector.summingDouble

---
### Public Methods
##### `static kahanSum(List<Double> intermediateSum, Double d)`

Integrates a new summand value to <a href=&quot;https://en.wikipedia.org/wiki/Kahan_summation_algorithm&quot;>Kahan Summation</a>. High-order bits of the sum are in intermediateSum[0], low-order bits of the sum are in intermediateSum[1]

###### Parameters
|Param|Description|
|---|---|
|`intermediateSum`|the high-order and low-order bits of the intermediate sum|
|`d`|the summand|

###### Return

**Type**

Double

**Description**

intermediate high-order / low-order sum container

---
