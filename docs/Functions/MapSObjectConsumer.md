# MapSObjectConsumer

`APIVERSION: 54`

`STATUS: ACTIVE`

Provides common class level implementations, and related utilities for `Map<T, Object> - SObject` two-arity consumers. Typically is used by collectors.


**Author** O. Berehovskyi


**Group** Functions

## Methods
### Put to Map<?, ?> ObjectSObjectConsumers
##### `static putToObjectByBoolMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `ObjectSObjectConsumers` that casts the first input argument to `Map<Boolean, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumers`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByBoolMap

##### `static putToSObjectByBoolMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `ObjectSObjectConsumers` that casts the first input argument to `Map<Boolean, SObject>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumers`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByBoolMap

##### `static putToObjectByIdMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Id, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByIdMap

##### `static putToSObjectByIdMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Id, SObject>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByIdMap

##### `static putToObjectByStringMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<String, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByStringMap

##### `static putToSObjectByStringMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<String, SObject>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByStringMap

##### `static putToObjectByBlobMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Blob, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByBlobMap

##### `static putToSObjectByBlobMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Blob, SObject>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByBlobMap

##### `static putToObjectByDateMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Date, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByDateMap

##### `static putToSObjectByDateMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Date, SObject>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByDateMap

##### `static putToObjectByDatetimeMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Datetime, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByDatetimeMap

##### `static putToSObjectByDatetimeMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Datetime, SObject>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByDatetimeMap

##### `static putToObjectByTimeMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Time, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByTimeMap

##### `static putToSObjectByTimeMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Time, SObject>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByTimeMap

##### `static putToObjectByIntMap(ISObjectToIntFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Integer, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByIntMap

##### `static putToSObjectByIntMap(ISObjectToIntFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Integer, SObject>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByIntMap

##### `static putToObjectByLongMap(ISObjectToLongFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Long, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByLongMap

##### `static putToSObjectByLongMap(ISObjectToLongFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Long, SObject>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByLongMap

##### `static putToObjectByDoubleMap(ISObjectToDoubleFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Double, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByDoubleMap

##### `static putToSObjectByDoubleMap(ISObjectToDoubleFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Double, SObject>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toByDoubleMap

##### `static putToObjectByObjectMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Object, Object>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toMap

##### `static putToSObjectByObjectMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Object, SObject>` and puts an entry returned by the `keyMapper` and `valueMapper`. If a key is already contained in the `Map` results are merged using the provided `merger`.

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueMapper`|the mapping function producing values|
|`merger`|the merge function to resolve possible key collisions|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `keyMapper` or the `valueMapper` is null|
|`NullPointerException`|if the first input argument is null|
|`IllegalStateException`|if the the `merger` is null and mapped keys contain duplicates|


**See** SObjectCollector.toMap

##### `static putToObjectsByBoolMap(ISObjectCollector downstream, ISObjectFunction classifier)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Boolean, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.groupingByBool

##### `static putToObjectsByIdMap(ISObjectCollector downstream, ISObjectFunction classifier)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Id, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.groupingById

##### `static putToObjectsByStringMap(ISObjectCollector downstream, ISObjectFunction classifier)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<String, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.groupingByString

##### `static putToObjectsByBlobMap(ISObjectCollector downstream, ISObjectFunction classifier)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Blob, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.groupingByBlob

##### `static putToObjectsByDateMap(ISObjectCollector downstream, ISObjectFunction classifier)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Date, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.groupingByDate

##### `static putToObjectsByDatetimeMap(ISObjectCollector downstream, ISObjectFunction classifier)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Datetime, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.groupingByDatetime

##### `static putToObjectsByTimeMap(ISObjectCollector downstream, ISObjectFunction classifier)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Time, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.groupingByTime

##### `static putToObjectsByIntMap(ISObjectCollector downstream, ISObjectToIntFunction classifier)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Integer, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.groupingByInt

##### `static putToObjectsByLongMap(ISObjectCollector downstream, ISObjectToLongFunction classifier)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Long, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.groupingByLong

##### `static putToObjectsByDoubleMap(ISObjectCollector downstream, ISObjectToDoubleFunction classifier)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Double, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.groupingByDouble

##### `static putToObjectsByObjectMap(ISObjectCollector downstream, ISObjectFunction classifier)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `Map<Object, Object>` and groups input arguments according to a classification function.

###### Parameters
|Param|Description|
|---|---|
|`downstream`|the collector implementing the downstream reduction|
|`classifier`|the classifier function mapping input elements to keys|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `downstream` or the `classifier` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.groupingBy

---
