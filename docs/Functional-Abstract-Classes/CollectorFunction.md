# CollectorFunction

`APIVERSION: 54`

`STATUS: ACTIVE`

Extends `Function` functions and provides `CollectorFunction` used specifically by `Collector` and `SObjectCollector`.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes


**See** [Collector](/docs/Collectors/Collector.md)


**See** [SObjectCollector](/docs/Collectors/SObjectCollector.md)

## Methods
### Finishers
##### `static append(String suffix)`

Returns a `Function` that appends the `suffix` the the boxed string.

###### Parameters
|Param|Description|
|---|---|
|`suffix`|the string to append|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `index` is null|


**See** Collector.joining


**See** SObjectCollector.joining

##### `static averagingInt()`

Returns a `Function` that returns the final result of Integer averaging.

###### Return

**Type**

Function

**Description**

the `Function`


**See** Collector.averagingInt


**See** SObjectCollector.averagingInt

##### `static averagingLong()`

Returns a `Function` that returns the final result of Long averaging.

###### Return

**Type**

Function

**Description**

the `Function`


**See** Collector.averagingLong


**See** SObjectCollector.averagingLong

##### `static averagingDouble()`

Returns a `Function` that returns the final result of Double averaging.

###### Return

**Type**

Function

**Description**

the `Function`


**See** Collector.averagingDouble


**See** SObjectCollector.averagingDouble

##### `static summingDouble()`

Returns a `Function` that returns the final result of Double summation.

###### Return

**Type**

Function

**Description**

the `Function`


**See** Collector.summingDouble


**See** SObjectCollector.summingDouble

##### `static groupByBool(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by booleans final result.

###### Parameters
|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Return

**Type**

Function

**Description**

the `Function`


**See** Collector.groupingByBool


**See** SObjectCollector.groupingByBool

##### `static groupById(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by ids final result.

###### Parameters
|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Return

**Type**

Function

**Description**

the `Function`


**See** Collector.groupingById


**See** SObjectCollector.groupingById

##### `static groupByString(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by strings final result.

###### Parameters
|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Return

**Type**

Function

**Description**

the `Function`


**See** Collector.groupingByString


**See** SObjectCollector.groupingByString

##### `static groupByBlob(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by blobs final result.

###### Parameters
|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Return

**Type**

Function

**Description**

the `Function`


**See** Collector.groupingByBlob


**See** SObjectCollector.groupingByBlob

##### `static groupByDate(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by dates final result.

###### Parameters
|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Return

**Type**

Function

**Description**

the `Function`


**See** Collector.groupingByDate


**See** SObjectCollector.groupingByDate

##### `static groupByDatetime(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by datetimes final result.

###### Parameters
|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Return

**Type**

Function

**Description**

the `Function`


**See** Collector.groupingByDatetime


**See** SObjectCollector.groupingByDatetime

##### `static groupByTime(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by times final result.

###### Parameters
|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Return

**Type**

Function

**Description**

the `Function`


**See** Collector.groupingByTime


**See** SObjectCollector.groupingByTime

##### `static groupByInt(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by integers final result.

###### Parameters
|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Return

**Type**

Function

**Description**

the `Function`


**See** Collector.groupingByInt


**See** SObjectCollector.groupingByInt

##### `static groupByLong(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by longs final result.

###### Parameters
|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Return

**Type**

Function

**Description**

the `Function`


**See** Collector.groupingByLong


**See** SObjectCollector.groupingByLong

##### `static groupByDouble(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by Doubles final result.

###### Parameters
|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Return

**Type**

Function

**Description**

the `Function`


**See** Collector.groupingByDouble


**See** SObjectCollector.groupingByDouble

##### `static groupByObject(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by objects final result.

###### Parameters
|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Return

**Type**

Function

**Description**

the `Function`


**See** Collector.groupingBy


**See** SObjectCollector.groupingBy

##### `static reducingOptionalSObject()`

Returns a `Function` that returns the final result of SObject reducing as `SObjectOptional`.

###### Return

**Type**

Function

**Description**

the `Function`


**See** SObjectCollector.reducing

##### `static reducingOptional()`

Returns a `Function` that returns the final result of object reducing as `Optional`.

###### Return

**Type**

Function

**Description**

the `Function`


**See** Collector.reducing

---
