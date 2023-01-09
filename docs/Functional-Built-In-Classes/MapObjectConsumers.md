# MapObjectConsumers

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides common implementations of `Map<T, Object> - T` [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md) and related utilities that are used by [Collectors](/docs/Functional-Built-In-Classes/Collectors.md).


**See** [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md)


**See** [Collectors](/docs/Functional-Built-In-Classes/Collectors.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Put to Map<?, ?> BiConsumers
##### `static putToObjectByBoolMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Boolean, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toByBoolMap

##### `static putToObjectByIdMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Id, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toByIdMap

##### `static putToObjectByStringMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<String, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toByStringMap

##### `static putToObjectByBlobMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Blob, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toByBlobMap

##### `static putToObjectByDateMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Date, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toByDateMap

##### `static putToObjectByDatetimeMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Datetime, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toByDatetimeMap

##### `static putToObjectByTimeMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Datetime, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toByDatetimeMap

##### `static putToObjectByIntMap(IToIntFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Integer, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toByIntMap

##### `static putToObjectByLongMap(IToLongFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Long, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toByLongMap

##### `static putToObjectByDoubleMap(IToDoubleFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Double, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toByDoubleMap

##### `static putToObjectByObjectMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `BiConsumer` that casts the first input argument to `Map<Object, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `merger` is null and mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toMap

##### `static putToObjectsByBoolMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Boolean, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.groupingByBool

##### `static putToObjectsByIdMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Id, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.groupingById

##### `static putToObjectsByStringMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<String, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.groupingByString

##### `static putToObjectsByBlobMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Blob, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.groupingByBlob

##### `static putToObjectsByDateMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Date, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.groupingByDate

##### `static putToObjectsByDatetimeMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Datetime, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.groupingByDatetime

##### `static putToObjectsByTimeMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Time, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.groupingByTime

##### `static putToObjectsByIntMap(ICollector downstream, IToIntFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Integer, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.groupingByInt

##### `static putToObjectsByLongMap(ICollector downstream, IToLongFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Long, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.groupingByLong

##### `static putToObjectsByDoubleMap(ICollector downstream, IToDoubleFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Double, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.groupingByDouble

##### `static putToObjectsByObjectMap(ICollector downstream, IFunction classifier)`

Returns a `BiConsumer` that casts the first input argument to `Map<Object, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `downstream` or `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.groupingBy

---
