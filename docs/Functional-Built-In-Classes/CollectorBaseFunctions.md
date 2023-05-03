# CollectorBaseFunctions

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides common implementations of [Function](/docs/Functional-Abstract-Classes/Function.md) and related utilities that are used by [SObjectCollectors](/docs/Functional-Built-In-Classes/SObjectCollectors.md).


**See** [Function](/docs/Functional-Abstract-Classes/Function.md)


**See** [SObjectCollectors](/docs/Functional-Built-In-Classes/SObjectCollectors.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
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


**See** SObjectCollectors.joining

##### `static averagingInt()`

Returns a `Function` that returns the final result of Integer averaging.

###### Return

**Type**

Function

**Description**

the `Function`


**See** SObjectCollectors.averagingInt

##### `static averagingLong()`

Returns a `Function` that returns the final result of Long averaging.

###### Return

**Type**

Function

**Description**

the `Function`


**See** SObjectCollectors.averagingLong

##### `static averagingDouble()`

Returns a `Function` that returns the final result of Double averaging.

###### Return

**Type**

Function

**Description**

the `Function`


**See** SObjectCollectors.averagingDouble

##### `static summingDouble()`

Returns a `Function` that returns the final result of Double summation.

###### Return

**Type**

Function

**Description**

the `Function`


**See** SObjectCollectors.summingDouble

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


**See** SObjectCollectors.groupingByBool

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


**See** SObjectCollectors.groupingById

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


**See** SObjectCollectors.groupingByString

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


**See** SObjectCollectors.groupingByBlob

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


**See** SObjectCollectors.groupingByDate

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


**See** SObjectCollectors.groupingByDatetime

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


**See** SObjectCollectors.groupingByTime

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


**See** SObjectCollectors.groupingByInt

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


**See** SObjectCollectors.groupingByLong

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


**See** SObjectCollectors.groupingByDouble

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


**See** SObjectCollectors.groupingBy

##### `static reducingOptionalSObject()`

Returns a `Function` that returns the final result of SObject reducing as `SObjectOptional`.

###### Return

**Type**

Function

**Description**

the `Function`


**See** SObjectCollectors.reducing

---
