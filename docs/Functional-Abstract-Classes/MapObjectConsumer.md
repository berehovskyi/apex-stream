# MapObjectConsumer

`APIVERSION: 54`

`STATUS: ACTIVE`

Provides common class level implementations, and related utilities for `Map<T, Object> - T` two-arity consumers. Typically is used by collectors.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes

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
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** Collector.toByBoolMap

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
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** Collector.toByIdMap

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
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** Collector.toByStringMap

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
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** Collector.toByBlobMap

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
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** Collector.toByDateMap

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
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** Collector.toByDatetimeMap

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
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** Collector.toByDatetimeMap

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
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** Collector.toByIntMap

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
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** Collector.toByLongMap

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
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** Collector.toByDoubleMap

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
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** Collector.toMap

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
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collector.groupingByBool

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
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collector.groupingById

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
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collector.groupingByString

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
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collector.groupingByBlob

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
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collector.groupingByDate

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
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collector.groupingByDatetime

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
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collector.groupingByTime

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
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collector.groupingByInt

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
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collector.groupingByLong

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
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collector.groupingByDouble

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
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collector.groupingBy

---
