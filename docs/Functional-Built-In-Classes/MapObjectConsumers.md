# virtual MapObjectConsumers

`SUPPRESSWARNINGS`

`APIVERSION: 58`

`STATUS: ACTIVE`

Provides common implementations of `Map<T, Object> - T` [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md)
and related utilities that are used by [Collectors](/docs/Functional-Built-In-Classes/Collectors.md).


**See** [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md)


**See** [Collectors](/docs/Functional-Built-In-Classes/Collectors.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static BiConsumer putToObjectByBoolMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Boolean, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toByBoolMap](Collectors.toByBoolMap)

##### `public static BiConsumer putToObjectByIdMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Id, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toByIdMap](Collectors.toByIdMap)

##### `public static BiConsumer putToObjectByStringMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<String, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toByStringMap](Collectors.toByStringMap)

##### `public static BiConsumer putToObjectByBlobMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Blob, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toByBlobMap](Collectors.toByBlobMap)

##### `public static BiConsumer putToObjectByDateMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Date, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toByDateMap](Collectors.toByDateMap)

##### `public static BiConsumer putToObjectByDatetimeMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Datetime, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toByDatetimeMap](Collectors.toByDatetimeMap)

##### `public static BiConsumer putToObjectByTimeMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Datetime, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toByDatetimeMap](Collectors.toByDatetimeMap)

##### `public static BiConsumer putToObjectByIntMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Integer, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toByIntMap](Collectors.toByIntMap)

##### `public static BiConsumer putToObjectByLongMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Long, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toByLongMap](Collectors.toByLongMap)

##### `public static BiConsumer putToObjectByDoubleMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Double, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toByDoubleMap](Collectors.toByDoubleMap)

##### `public static BiConsumer putToObjectByObjectMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Object, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.toByObjectMap](Collectors.toByObjectMap)

##### `public static BiConsumer putToObjectsByBoolMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Boolean, Object>` and groups input arguments according to a classification function.

###### Parameters

|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.groupingByBool](Collectors.groupingByBool)

##### `public static BiConsumer putToObjectsByIdMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Id, Object>` and groups input arguments according to a classification function.

###### Parameters

|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.groupingById](Collectors.groupingById)

##### `public static BiConsumer putToObjectsByStringMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<String, Object>` and groups input arguments according to a classification function.

###### Parameters

|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.groupingByString](Collectors.groupingByString)

##### `public static BiConsumer putToObjectsByBlobMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Blob, Object>` and groups input arguments according to a classification function.

###### Parameters

|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.groupingByBlob](Collectors.groupingByBlob)

##### `public static BiConsumer putToObjectsByDateMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Date, Object>` and groups input arguments according to a classification function.

###### Parameters

|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.groupingByDate](Collectors.groupingByDate)

##### `public static BiConsumer putToObjectsByDatetimeMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Datetime, Object>` and groups input arguments according to a classification function.

###### Parameters

|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.groupingByDatetime](Collectors.groupingByDatetime)

##### `public static BiConsumer putToObjectsByTimeMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Time, Object>` and groups input arguments according to a classification function.

###### Parameters

|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.groupingByTime](Collectors.groupingByTime)

##### `public static BiConsumer putToObjectsByIntMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Integer, Object>` and groups input arguments according to a classification function.

###### Parameters

|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.groupingByInt](Collectors.groupingByInt)

##### `public static BiConsumer putToObjectsByLongMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Long, Object>` and groups input arguments according to a classification function.

###### Parameters

|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.groupingByLong](Collectors.groupingByLong)

##### `public static BiConsumer putToObjectsByDoubleMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Double, Object>` and groups input arguments according to a classification function.

###### Parameters

|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.groupingByDouble](Collectors.groupingByDouble)

##### `public static BiConsumer putToObjectsByObjectMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Object, Object>` and groups input arguments according to a classification function.

###### Parameters

|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.groupingByObject](Collectors.groupingByObject)

---
