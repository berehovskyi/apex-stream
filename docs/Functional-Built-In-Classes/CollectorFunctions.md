# virtual CollectorFunctions

`SUPPRESSWARNINGS`

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides common implementations of [Function](/docs/Functional-Abstract-Classes/Function.md)
and related utilities that are used by [Collectors](/docs/Functional-Built-In-Classes/Collectors.md).


**See** [Function](/docs/Functional-Abstract-Classes/Function.md)


**See** [Collectors](/docs/Functional-Built-In-Classes/Collectors.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static Function append(String suffix)`

Returns a `Function` that appends the `suffix` the the boxed string.

###### Parameters

|Param|Description|
|---|---|
|`suffix`|the string to append|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `index` is null|


**See** [Collectors.joining](Collectors.joining)

##### `public static Function summing()`

Returns a `Function` that returns the final result of summing.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Collectors.summingInt](Collectors.summingInt)


**See** [Collectors.summingLong](Collectors.summingLong)

##### `public static Function summingDouble()`

Returns a `Function` that returns the final result of Double summing.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Collectors.averagingDouble](Collectors.averagingDouble)

##### `public static Function averagingInt()`

Returns a `Function` that returns the final result of Integer averaging.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Collectors.averagingInt](Collectors.averagingInt)

##### `public static Function averagingLong()`

Returns a `Function` that returns the final result of Long averaging.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Collectors.averagingLong](Collectors.averagingLong)

##### `public static Function averagingDouble()`

Returns a `Function` that returns the final result of Double averaging.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Collectors.averagingDouble](Collectors.averagingDouble)

##### `public static Function groupByBool(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by booleans final result.

###### Parameters

|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Collectors.groupingByBool](Collectors.groupingByBool)

##### `public static Function groupById(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by ids final result.

###### Parameters

|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Collectors.groupingById](Collectors.groupingById)

##### `public static Function groupByString(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by strings final result.

###### Parameters

|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Collectors.groupingByString](Collectors.groupingByString)

##### `public static Function groupByBlob(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by blobs final result.

###### Parameters

|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Collectors.groupingByBlob](Collectors.groupingByBlob)

##### `public static Function groupByDate(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by dates final result.

###### Parameters

|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Collectors.groupingByDate](Collectors.groupingByDate)

##### `public static Function groupByDatetime(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by datetimes final result.

###### Parameters

|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Collectors.groupingByDatetime](Collectors.groupingByDatetime)

##### `public static Function groupByTime(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by times final result.

###### Parameters

|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Collectors.groupingByTime](Collectors.groupingByTime)

##### `public static Function groupByInt(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by integers final result.

###### Parameters

|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Collectors.groupingByInt](Collectors.groupingByInt)

##### `public static Function groupByLong(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by longs final result.

###### Parameters

|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Collectors.groupingByLong](Collectors.groupingByLong)

##### `public static Function groupByDouble(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by Doubles final result.

###### Parameters

|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Collectors.groupingByDouble](Collectors.groupingByDouble)

##### `public static Function groupByObject(IFunction finisher)`

Returns a `Function` that applies the `finisher` to every map value and returns the grouping by objects final result.

###### Parameters

|Param|Description|
|---|---|
|`finisher`|the function applied to every map value|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Collectors.groupingByObject](Collectors.groupingByObject)

##### `public static Function reducingOptional()`

Returns a `Function` that returns the final result of SObject reducing as `Optional`.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Collectors.reducing](Collectors.reducing)

---
