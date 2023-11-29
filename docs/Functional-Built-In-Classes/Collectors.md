# virtual Collectors

`SUPPRESSWARNINGS`

`APIVERSION: 58`

`STATUS: ACTIVE`

Provides common implementations of [Collector](/docs/Functional-Abstract-Classes/Collector.md)
and related utilities.


**Inheritance**

[BaseCollectors](/docs/Functional-Built-In-Classes/BaseCollectors.md)
 > 
Collectors


**See** [Collector](/docs/Functional-Abstract-Classes/Collector.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Set<?> Collectors
##### `public static Collector toBoolSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Boolean>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a Set
Set<Boolean> bools = (Set<Boolean>) [ObjectEnumerable].of(booleans).collect(Collectors.toBoolSet());
```


##### `public static Collector toBoolSet(IFunction mapper)`

Returns a `Collector` that accumulates elements returned by `mapper` function into a new `Set<Boolean>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<Boolean> bools = (Set<Boolean>) [ObjectEnumerable].of(booleans).collect(Collectors.toBoolSet(mapper));
```


##### `public static Collector toIdSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Id>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a Set
Set<Boolean> ids = (Set<Boolean>) [ObjectEnumerable].of(ids).collect(Collectors.toIdSet());
```


##### `public static Collector toIdSet(IFunction mapper)`

Returns a `Collector` that accumulates elements returned by `mapper` function into a new `Set<Id>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a Set
Set<Boolean> ids = (Set<Boolean>) [ObjectEnumerable].of(ids).collect(Collectors.toIdSet(mapper));
```


##### `public static Collector toStringSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<String>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<String> strs = (Set<String>) [ObjectEnumerable].of(strings).collect(Collectors.toStringSet());
```


##### `public static Collector toStringSet(IFunction mapper)`

Returns a `Collector` that accumulates elements returned by `mapper` function into a new `Set<String>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<String> strs = (Set<String>) [ObjectEnumerable].of(strings).collect(Collectors.toStringSet(mapper));
```


##### `public static Collector toBlobSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Blob>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<Blob> blbs = (Set<Blob>) [ObjectEnumerable].of(blobs).collect(Collectors.toBlobSet());
```


##### `public static Collector toBlobSet(IFunction mapper)`

Returns a `Collector` that accumulates elements returned by `mapper` function into a new `Set<Blob>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<Blob> blbs = (Set<Blob>) [ObjectEnumerable].of(blobs).collect(Collectors.toBlobSet(mapper));
```


##### `public static Collector toDateSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Date>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<Date> dts = (Set<Date>) [ObjectEnumerable].of(dates).collect(Collectors.toDateSet());
```


##### `public static Collector toDateSet(IFunction mapper)`

Returns a `Collector` that accumulates elements returned by `mapper` function into a new `Set<Date>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<Date> dts = (Set<Date>) [ObjectEnumerable].of(dates).collect(Collectors.toDateSet(mapper));
```


##### `public static Collector toDatetimeSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Datetime>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<Datetime> dts = (Set<Datetime>) [ObjectEnumerable].of(datetimes).collect(Collectors.toDatetimeSet());
```


##### `public static Collector toDatetimeSet(IFunction mapper)`

Returns a `Collector` that accumulates elements returned by `mapper` function into a new `Set<Datetime>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<Datetime> dts = (Set<Datetime>) [ObjectEnumerable].of(datetimes).collect(Collectors.toDatetimeSet(mapper));
```


##### `public static Collector toTimeSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Time>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<Time> tms = (Set<Time>) [ObjectEnumerable].of(times).collect(Collectors.toTimeSet());
```


##### `public static Collector toTimeSet(IFunction mapper)`

Returns a `Collector` that accumulates elements returned by `mapper` function into a new `Set<Time>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<Time> tms = (Set<Time>) [ObjectEnumerable].of(times).collect(Collectors.toTimeSet(mapper));
```


##### `public static Collector toIntSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Integer>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<Integer> ints = (Set<Integer>) [ObjectEnumerable].of(integers).collect(Collectors.toIntSet());
```


##### `public static Collector toIntSet(IFunction mapper)`

Returns a `Collector` that accumulates elements returned by `mapper` function into a new `Set<Integer>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<Integer> ints = (Set<Integer>) [ObjectEnumerable].of(integers).collect(Collectors.toIntSet(mapper));
```


##### `public static Collector toLongSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Long>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<Long> ls = (Set<Long>) [ObjectEnumerable].of(longs).collect(Collectors.toLongSet());
```


##### `public static Collector toLongSet(IFunction mapper)`

Returns a `Collector` that accumulates elements returned by `mapper` function into a new `Set<Long>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<Long> ls = (Set<Long>) [ObjectEnumerable].of(longs).collect(Collectors.toLongSet(mapper));
```


##### `public static Collector toDoubleSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Double>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<Double> ds = (Set<Double>) [ObjectEnumerable].of(doubles).collect(Collectors.toDoubleSet());
```


##### `public static Collector toDoubleSet(IFunction mapper)`

Returns a `Collector` that accumulates elements returned by `mapper` function into a new `Set<Double>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<Double> ds = (Set<Double>) [ObjectEnumerable].of(doubles).collect(Collectors.toDoubleSet(mapper));
```


##### `public static Collector toSObjectSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<SObject>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<SObject> sObjects = (Set<SObject>) [ObjectEnumerable].of(accounts).collect(Collectors.toSObjectSet());
```


##### `public static Collector toSObjectSet(IFunction mapper)`

Returns a `Collector` that accumulates elements returned by `mapper` function into a new `Set<SObject>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<SObject> sObjects = (Set<SObject>) [ObjectEnumerable].of(accounts).collect(Collectors.toSObjectSet(mapper));
```


##### `public static Collector toObjectSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Object>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p> <p>[ObjectEnumerable.collect(Collectors.toObjectSet())](ObjectEnumerable.collect(Collectors.toObjectSet())) can be replaced with [ObjectEnumerable.toSet()](ObjectEnumerable.toSet())</p>

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a Set
Set<Object> ppl = (Set<Object>) [ObjectEnumerable].of(people).collect(Collectors.toObjectSet());
```


##### `public static Collector toObjectSet(IFunction mapper)`

Returns a `Collector` that accumulates elements returned by `mapper` function into a new `Set<Object>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p> <p>[ObjectEnumerable.collect(Collectors.toObjectSet())](ObjectEnumerable.collect(Collectors.toObjectSet())) can be replaced with [ObjectEnumerable.toSet()](ObjectEnumerable.toSet())</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a Set
Set<Object> ppl = (Set<Object>) [ObjectEnumerable].of(people).collect(Collectors.toObjectSet(mapper));
```


---
### Map<Boolean, Object> Collectors
##### `public static Collector toByBoolMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Boolean, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use [Collectors.toByBoolMap(IFunction, IFunction, IBiOperator)](Collectors.toByBoolMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<Boolean, Object> personByBoolProperty = (Map<Boolean, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBoolMap(getBoolProperty));
Map<Boolean, Comparable> personByBoolProperty = (Map<Boolean, Comparable>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBoolMap(getBoolProperty).cast(Map<Boolean, Comparable>.class));
```


##### `public static Collector toByBoolMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use [Collectors.toByBoolMap(IFunction, IFunction, IBiOperator)](Collectors.toByBoolMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Boolean, Object> stringPropertyByBoolProperty = (Map<Boolean, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBoolMap(getBoolProperty, getStringProperty));
Map<Boolean, String> stringPropertyByBoolProperty = (Map<Boolean, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBoolMap(getBoolProperty, getStringProperty).cast(Map<Boolean, String>.class));
```


##### `public static Collector toByBoolMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Boolean, Object> stringPropertyByBoolProperty = (Map<Boolean, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBoolMap(
        getBoolProperty,
        getStringProperty,
        BiOperator.right()
    ));
Map<Boolean, String> stringPropertyByBoolProperty = (Map<Boolean, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBoolMap(
        getBoolProperty,
        getStringProperty,
        BiOperator.right()
    ).cast(Map<Boolean, String>.class));
```


##### `public static Collector toByBoolMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Boolean, ?>` into which the results are inserted|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Boolean, String> stringPropertyByBoolProperty = (Map<Boolean, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBoolMap(
        getBoolProperty,
        getStringProperty,
        BiOperator.right(),
        Supplier.of(Map<Boolean, String>.class)
    ));
```


---
### Map<Id, Object> Collectors
##### `public static Collector toByIdMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Id, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use [Collectors.toByIdMap(IFunction, IFunction, IBiOperator)](Collectors.toByIdMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Id, Object> personByIdProperty = (Map<Id, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByIdMap(getIdProperty));
Map<Id, Comparable> personByIdProperty = (Map<Id, Comparable>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBoolMap(getIdProperty).cast(Map<Id, Comparable>.class));
```


##### `public static Collector toByIdMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Id, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use [Collectors.toByIdMap(IFunction, IFunction, IBiOperator)](Collectors.toByIdMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Id, Object> stringPropertyByIdProperty = (Map<Id, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByIdMap(getIdProperty, getStringProperty));
Map<Id, String> stringPropertyByIdProperty = (Map<Id, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByIdMap(getIdProperty, getStringProperty).cast(Map<Id, String>.class));
```


##### `public static Collector toByIdMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Id, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Id, Object> stringPropertyByIdProperty = (Map<Id, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByIdMap(
        getIdProperty,
        getStringProperty,
        BiOperator.right()
    ));
Map<Id, String> stringPropertyByIdProperty = (Map<Id, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByIdMap(
        getIdProperty,
        getStringProperty,
        BiOperator.right()
    ).cast(Map<Id, String>.class));
```


##### `public static Collector toByIdMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Id, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Id, ?>` into which the results are inserted|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Id, String> stringPropertyByIdProperty = (Map<Id, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByIdMap(
        getIdProperty,
        getStringProperty,
        BiOperator.right(),
        Supplier.of(Map<Id, String>.class)
    ));
```


---
### Map<String, Object> Collectors
##### `public static Collector toByStringMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<String, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use [Collectors.toByStringMap(IFunction, IFunction, IBiOperator)](Collectors.toByStringMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<String, Object> personByStringProperty = (Map<String, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByStringMap(getStringProperty));
Map<String, Comparable> personByStringProperty = (Map<String, Comparable>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBoolMap(getStringProperty).cast(Map<String, Comparable>.class));
```


##### `public static Collector toByStringMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<String, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use [Collectors.toByStringMap(IFunction, IFunction, IBiOperator)](Collectors.toByStringMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<String, Object> stringPropertyByStringProperty = (Map<String, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByStringMap(getStringProperty, getStringProperty));
Map<String, String> stringPropertyByStringProperty = (Map<String, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByStringMap(getStringProperty, getStringProperty).cast(Map<String, String>.class));
```


##### `public static Collector toByStringMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<String, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<String, Object> stringPropertyByStringProperty = (Map<String, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByStringMap(
        getStringProperty,
        getStringProperty,
        BiOperator.right()
    ));
Map<String, String> stringPropertyByStringProperty = (Map<String, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByStringMap(
        getStringProperty,
        getStringProperty,
        BiOperator.right()
    ).cast(Map<String, String>.class));
```


##### `public static Collector toByStringMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<String, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<String, ?>` into which the results are inserted|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<String, String> stringPropertyByStringProperty = (Map<String, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByStringMap(
        getStringProperty,
        getStringProperty,
        BiOperator.right(),
        Supplier.of(Map<String, String>.class)
    ));
```


---
### Map<Blob, Object> Collectors
##### `public static Collector toByBlobMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Blob, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use [Collectors.toByBlobMap(IFunction, IFunction, IBiOperator)](Collectors.toByBlobMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Blob, Object> personByBlobProperty = (Map<Blob, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBlobMap(getBlobProperty));
Map<Blob, Comparable> personByBlobProperty = (Map<Blob, Comparable>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBoolMap(getBlobProperty).cast(Map<Blob, Comparable>.class));
```


##### `public static Collector toByBlobMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use [Collectors.toByBlobMap(IFunction, IFunction, IBiOperator)](Collectors.toByBlobMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Blob, Object> stringPropertyByBlobProperty = (Map<Blob, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBlobMap(getBlobProperty, getStringProperty));
Map<Blob, String> stringPropertyByBlobProperty = (Map<Blob, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBlobMap(getBlobProperty, getStringProperty).cast(Map<Blob, String>.class));
```


##### `public static Collector toByBlobMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Blob, Object> stringPropertyByBlobProperty = (Map<Blob, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBlobMap(
        getBlobProperty,
        getStringProperty,
        BiOperator.right()
    ));
Map<Blob, String> stringPropertyByBlobProperty = (Map<Blob, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBlobMap(
        getBlobProperty,
        getStringProperty,
        BiOperator.right()
    ).cast(Map<Blob, String>.class));
```


##### `public static Collector toByBlobMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Blob, ?>` into which the results are inserted|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Blob, String> stringPropertyByBlobProperty = (Map<Blob, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBlobMap(
        getBlobProperty,
        getStringProperty,
        BiOperator.right(),
        Supplier.of(Map<Blob, String>.class)
    ));
```


---
### Map<Date, Object> Collectors
##### `public static Collector toByDateMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Date, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use [Collectors.toByDateMap(IFunction, IFunction, IBiOperator)](Collectors.toByDateMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Date, Object> personByDateProperty = (Map<Date, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDateMap(getDateProperty));
Map<Date, Comparable> personByDateProperty = (Map<Date, Comparable>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBoolMap(getDateProperty).cast(Map<Date, Comparable>.class));
```


##### `public static Collector toByDateMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Date, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use [Collectors.toByDateMap(IFunction, IFunction, IBiOperator)](Collectors.toByDateMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Date, Object> stringPropertyByDateProperty = (Map<Date, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDateMap(getDateProperty, getStringProperty));
Map<Date, String> stringPropertyByDateProperty = (Map<Date, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDateMap(getDateProperty, getStringProperty).cast(Map<Date, String>.class));
```


##### `public static Collector toByDateMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Date, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Date, Object> stringPropertyByDateProperty = (Map<Date, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDateMap(
        getDateProperty,
        getStringProperty,
        BiOperator.right()
    ));
Map<Date, String> stringPropertyByDateProperty = (Map<Date, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDateMap(
        getDateProperty,
        getStringProperty,
        BiOperator.right()
    ).cast(Map<Date, String>.class));
```


##### `public static Collector toByDateMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Date, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Date, ?>` into which the results are inserted|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Date, String> stringPropertyByDateProperty = (Map<Date, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDateMap(
        getDateProperty,
        getStringProperty,
        BiOperator.right(),
        Supplier.of(Map<Date, String>.class)
    ));
```


---
### Map<Datetime, Object> Collectors
##### `public static Collector toByDatetimeMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Datetime, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use [Collectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)](Collectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Datetime, Object> personByDatetimeProperty = (Map<Datetime, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDatetimeMap(getDatetimeProperty));
Map<Datetime, Comparable> personByDatetimeProperty = (Map<Datetime, Comparable>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBoolMap(getDatetimeProperty).cast(Map<Datetime, Comparable>.class));
```


##### `public static Collector toByDatetimeMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use [Collectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)](Collectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Datetime, Object> stringPropertyByDatetimeProperty = (Map<Datetime, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDatetimeMap(getDatetimeProperty, getStringProperty));
Map<Datetime, String> stringPropertyByDatetimeProperty = (Map<Datetime, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDatetimeMap(getDatetimeProperty, getStringProperty)
        .cast(Map<Datetime, String>.class)
    );
```


##### `public static Collector toByDatetimeMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Datetime, Object> stringPropertyByDatetimeProperty = (Map<Datetime, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDatetimeMap(
        getDatetimeProperty,
        getStringProperty,
        BiOperator.right()
    ));
Map<Datetime, String> stringPropertyByDatetimeProperty = (Map<Datetime, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDatetimeMap(
        getDatetimeProperty,
        getStringProperty,
        BiOperator.right()
    ).cast(Map<Datetime, String>.class));
```


##### `public static Collector toByDatetimeMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Datetime, ?>` into which the results are inserted|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Datetime, String> stringPropertyByDatetimeProperty = (Map<Datetime, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDatetimeMap(
        getDatetimeProperty,
        getStringProperty,
        BiOperator.right(),
        Supplier.of(Map<Datetime, String>.class)
    ));
```


---
### Map<Time, Object> Collectors
##### `public static Collector toByTimeMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Time, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use [Collectors.toByTimeMap(IFunction, IFunction, IBiOperator)](Collectors.toByTimeMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Time, Object> personByTimeProperty = (Map<Time, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByTimeMap(getTimeProperty));
Map<Time, Comparable> personByTimeProperty = (Map<Time, Comparable>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBoolMap(getTimeProperty).cast(Map<Time, Comparable>.class));
```


##### `public static Collector toByTimeMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Time, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use [Collectors.toByTimeMap(IFunction, IFunction, IBiOperator)](Collectors.toByTimeMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Time, Object> stringPropertyByTimeProperty = (Map<Time, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByTimeMap(getTimeProperty, getStringProperty));
Map<Time, String> stringPropertyByTimeProperty = (Map<Time, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByTimeMap(getTimeProperty, getStringProperty).cast(Map<Time, String>.class));
```


##### `public static Collector toByTimeMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Time, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Time, Object> stringPropertyByTimeProperty = (Map<Time, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByTimeMap(
        getTimeProperty,
        getStringProperty,
        BiOperator.right()
    ));
Map<Time, String> stringPropertyByTimeProperty = (Map<Time, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByTimeMap(
        getTimeProperty,
        getStringProperty,
        BiOperator.right()
    ).cast(Map<Time, String>.class));
```


##### `public static Collector toByTimeMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Time, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Time, ?>` into which the results are inserted|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Time, String> stringPropertyByTimeProperty = (Map<Time, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByTimeMap(
        getTimeProperty,
        getStringProperty,
        BiOperator.right(),
        Supplier.of(Map<Time, String>.class)
    ));
```


---
### Map<Integer, Object> Collectors
##### `public static Collector toByIntMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Integer, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use [Collectors.toByIntMap(IFunction, IFunction, IBiOperator)](Collectors.toByIntMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Integer, Object> personByIntProperty = (Map<Integer, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByIntMap(getIntProperty));
Map<Integer, Comparable> personByIntProperty = (Map<Integer, Comparable>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByIntMap(getIntProperty).cast(Map<Integer, Comparable>.class));
```


##### `public static Collector toByIntMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use [Collectors.toByIntMap(IFunction, IFunction, IBiOperator)](Collectors.toByIntMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Integer, Object> stringPropertyByIntProperty = (Map<Integer, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByIntMap(getIntProperty, getStringProperty));
Map<Integer, String> stringPropertyByIntProperty = (Map<Integer, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByIntMap(getIntProperty, getStringProperty).cast(Map<Integer, String>.class));
```


##### `public static Collector toByIntMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Integer, Object> stringPropertyByTimeProperty = (Map<Integer, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByIntMap(
        getIntProperty,
        getStringProperty,
        BiOperator.right()
    ));
Map<Integer, String> stringPropertyByTimeProperty = (Map<Integer, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByIntMap(
        getIntProperty,
        getStringProperty,
        BiOperator.right()
    ).cast(Map<Integer, String>.class));
```


##### `public static Collector toByIntMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Integer, ?>` into which the results are inserted|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Integer, String> stringPropertyByIntProperty = (Map<Integer, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByIntMap(
        getIntProperty,
        getStringProperty,
        BiOperator.right(),
        Supplier.of(Map<Integer, String>.class)
    ));
```


---
### Map<Long, Object> Collectors
##### `public static Collector toByLongMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Long, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use [Collectors.toByLongMap(IFunction, IFunction, IBiOperator)](Collectors.toByLongMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Long, Object> personByLongProperty = (Map<Long, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByLongMap(getLongProperty));
Map<Long, Comparable> personByLongProperty = (Map<Long, Comparable>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBoolMap(getLongProperty).cast(Map<Long, Comparable>.class));
```


##### `public static Collector toByLongMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Long, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use [Collectors.toByLongMap(IFunction, IFunction, IBiOperator)](Collectors.toByLongMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Long, Object> stringPropertyByLongProperty = (Map<Long, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByLongMap(getLongProperty, getStringProperty));
Map<Long, String> stringPropertyByLongProperty = (Map<Long, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByLongMap(getLongProperty, getStringProperty).cast(Map<Long, String>.class));
```


##### `public static Collector toByLongMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Long, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Long, Object> stringPropertyByLongProperty = (Map<Long, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByLongMap(
        getLongProperty,
        getStringProperty,
        BiOperator.right()
    ));
Map<Long, String> stringPropertyByLongProperty = (Map<Long, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByLongMap(
        getLongProperty,
        getStringProperty,
        BiOperator.right()
    ).cast(Map<Long, String>.class));
```


##### `public static Collector toByLongMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Long, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Long, ?>` into which the results are inserted|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Long, String> stringPropertyByLongProperty = (Map<Long, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByLongMap(
        getLongProperty,
        getStringProperty,
        BiOperator.right(),
        Supplier.of(Map<Long, String>.class)
    ));
```


---
### Map<Double, Object> Collectors
##### `public static Collector toByDoubleMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Double, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use [Collectors.toByDoubleMap(IFunction, IFunction, IBiOperator)](Collectors.toByDoubleMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Double, Object> personByDoubleProperty = (Map<Double, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDoubleMap(getDoubleProperty));
Map<Double, Comparable> personByDoubleProperty = (Map<Double, Comparable>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByBoolMap(getDoubleProperty).cast(Map<Double, Comparable>.class));
```


##### `public static Collector toByDoubleMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Double, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use [Collectors.toByDoubleMap(IFunction, IFunction, IBiOperator)](Collectors.toByDoubleMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Double, Object> stringPropertyByDoubleProperty = (Map<Double, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDoubleMap(getDoubleProperty, getStringProperty));
Map<Double, String> stringPropertyByDoubleProperty = (Map<Double, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDoubleMap(getDoubleProperty, getStringProperty).cast(Map<Double, String>.class));
```


##### `public static Collector toByDoubleMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Double, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Double, Object> stringPropertyByDoubleProperty = (Map<Double, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDoubleMap(
        getDoubleProperty,
        getStringProperty,
        BiOperator.right()
    ));
Map<Double, String> stringPropertyByDoubleProperty = (Map<Double, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDoubleMap(
        getDoubleProperty,
        getStringProperty,
        BiOperator.right()
    ).cast(Map<Double, String>.class));
```


##### `public static Collector toByDoubleMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Double, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Double, ?>` into which the results are inserted|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Double, String> stringPropertyByDoubleProperty = (Map<Double, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByDoubleMap(
        getDoubleProperty,
        getStringProperty,
        BiOperator.right(),
        Supplier.of(Map<Double, String>.class)
    ));
```


---
### Map<Object, Object> Collectors
##### `public static Collector toByObjectMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Object, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use [Collectors.toByObjectMap(IFunction, IFunction, IBiOperator)](Collectors.toByObjectMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as [Collectors.toByIdMap](Collectors.toByIdMap), [Collectors.toByStringMap](Collectors.toByStringMap), etc.</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Object, Object> personByTimeProperty = (Map<Object, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByObjectMap(getTimeProperty));
Map<Object, Comparable> personByTimeProperty = (Map<Object, Comparable>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByObjectMap(getTimeProperty).cast(Map<Object, Comparable>.class));
```


##### `public static Collector toByObjectMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Object, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use [Collectors.toByObjectMap(IFunction, IFunction, IBiOperator)](Collectors.toByObjectMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as [Collectors.toByIdMap](Collectors.toByIdMap), [Collectors.toByStringMap](Collectors.toByStringMap), etc.</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Object, Object> stringPropertyByTimeProperty = (Map<Object, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByObjectMap(getTimeProperty, getStringProperty));
Map<Object, String> stringPropertyByTimeProperty = (Map<Object, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByObjectMap(getTimeProperty, getStringProperty).cast(Map<Object, String>.class));
```


##### `public static Collector toByObjectMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Object, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as [Collectors.toByIdMap](Collectors.toByIdMap), [Collectors.toByStringMap](Collectors.toByStringMap), etc.</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Object, Object> stringPropertyByTimeProperty = (Map<Object, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByTimeMap(
        getTimeProperty,
        getStringProperty,
        BiOperator.right()
    ));
Map<Object, String> stringPropertyByTimeProperty = (Map<Object, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByTimeMap(
        getTimeProperty,
        getStringProperty,
        BiOperator.right()
    ).cast(Map<Object, String>.class));
```


##### `public static Collector toByObjectMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Object, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Object, ?>` into which the results are inserted|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Object, String> stringPropertyByTimeProperty = (Map<Object, String>) [ObjectEnumerable].of(people)
    .collect(Collectors.toByObjectMap(
        getTimeProperty,
        getStringProperty,
        BiOperator.right(),
        Supplier.of(Map<Object, String>.class)
    ));
```


---
### Map<Boolean, ?> Collectors
##### `public static Collector groupingByBool(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Boolean, List<Object>>`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Boolean, List<Object>> personsByBoolProperty = (Map<Boolean, List<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByBool(getBoolProperty));
Map<Boolean, List<Comparable>> personsByBoolProperty = (Map<Boolean, List<Comparable>>)
    [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByBool(getBoolProperty).cast(Map<Boolean, List<Comparable>>.class));
```


##### `public static Collector groupingByBool(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Boolean, Object> personsByBoolProperty = (Map<Boolean, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByBool(
        getBoolProperty,
        Collectors.toObjectSet()
    ));
Map<Boolean, Set<Object>> personsByBoolProperty = (Map<Boolean, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByBool(
        getBoolProperty,
        Collectors.toObjectSet()
    ).cast(Map<Boolean, Set<Object>>.class));
```


##### `public static Collector groupingByBool(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Boolean, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Boolean, Set<Object>> personsByBoolProperty = (Map<Boolean, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByBool(
        getBoolProperty,
        Supplier.of(Map<Boolean, Set<Object>>.class),
        Collectors.toObjectSet()
    ));
```


---
### Grouping By Map<Id, ?> Collectors
##### `public static Collector groupingById(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Id, List<Object>>`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Id, List<Object>> personsByIdProperty = (Map<Id, List<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingById(getIdProperty));
Map<Id, List<Comparable>> personsByIdProperty = (Map<Id, List<Comparable>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingById(getIdProperty).cast(Map<Id, List<Comparable>>.class));
```


##### `public static Collector groupingById(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Id, Object> personsByIdProperty = (Map<Id, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingById(
        getIdProperty,
        Collectors.toObjectSet()
    ));
Map<Id, Set<Object>> personsByIdProperty = (Map<Id, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingById(
        getIdProperty,
        Collectors.toObjectSet()
    ).cast(Map<Id, Set<Object>>.class));
```


##### `public static Collector groupingById(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Id, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Id, Set<Object>> personsByIdProperty = (Map<Id, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingById(
        getIdProperty,
        Supplier.of(Map<Id, Set<Object>>.class),
        Collectors.toObjectSet()
    ));
```


---
### Grouping By Map<String, ?> Collectors
##### `public static Collector groupingByString(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<String, List<Object>>`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<String, List<Object>> personsByStringProperty = (Map<String, List<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByString(getStringProperty));
Map<String, List<Comparable>> personsByStringProperty = (Map<String, List<Comparable>>)
    [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByString(getStringProperty).cast(Map<String, List<Comparable>>.class));
```


##### `public static Collector groupingByString(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<String, Object> personsByStringProperty = (Map<String, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByString(
        getStringProperty,
        Collectors.toObjectSet()
    ));
Map<String, Set<Object>> personsByStringProperty = (Map<String, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByString(
        getStringProperty,
        Collectors.toObjectSet()
    ).cast(Map<String, Set<Object>>.class));
```


##### `public static Collector groupingByString(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<String, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<String, Set<Object>> personsByStringProperty = (Map<String, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByString(
        getStringProperty,
        Supplier.of(Map<String, Set<Object>>.class),
        Collectors.toObjectSet()
    ));
```


---
### Grouping By Map<Blob, ?> Collectors
##### `public static Collector groupingByBlob(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Blob, List<Object>>`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Blob, List<Object>> personsByBlobProperty = (Map<Blob, List<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByBlob(getBlobProperty));
Map<Blob, List<Comparable>> personsByBlobProperty = (Map<Blob, List<Comparable>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByBlob(getBlobProperty).cast(Map<Blob, List<Comparable>>.class));
```


##### `public static Collector groupingByBlob(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Blob, Object> personsByBlobProperty = (Map<Blob, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByBlob(
        getBlobProperty,
        Collectors.toObjectSet()
    ));
Map<Blob, Set<Object>> personsByBlobProperty = (Map<Blob, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByBlob(
        getBlobProperty,
        Collectors.toObjectSet()
    ).cast(Map<Blob, Set<Object>>.class));
```


##### `public static Collector groupingByBlob(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Blob, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Blob, Set<Object>> personsByBlobProperty = (Map<Blob, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByBlob(
        getBlobProperty,
        Supplier.of(Map<Blob, Set<Object>>.class),
        Collectors.toObjectSet()
    ));
```


---
### Grouping By Map<Date, ?> Collectors
##### `public static Collector groupingByDate(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Date, List<Object>>`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Date, List<Object>> personsByDateProperty = (Map<Date, List<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByDate(getDateProperty));
Map<Date, List<Comparable>> personsByDateProperty = (Map<Date, List<Comparable>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByDate(getDateProperty).cast(Map<Date, List<Comparable>>.class));
```


##### `public static Collector groupingByDate(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Date, Object> personsByDateProperty = (Map<Date, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByDate(
        getDateProperty,
        Collectors.toObjectSet()
    ));
Map<Date, Set<Object>> personsByDateProperty = (Map<Date, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByDate(
        getDateProperty,
        Collectors.toObjectSet()
    ).cast(Map<Date, Set<Object>>.class));
```


##### `public static Collector groupingByDate(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Date, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Date, Set<Object>> personsByDateProperty = (Map<Date, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByDate(
        getDateProperty,
        Supplier.of(Map<Date, Set<Object>>.class),
        Collectors.toObjectSet()
    ));
```


---
### Grouping By Map<Datetime, ?> Collectors
##### `public static Collector groupingByDatetime(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Datetime, List<Object>>`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Datetime, List<Object>> personsByDatetimeProperty = (Map<Datetime, List<Object>>)
    [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByDatetime(getDatetimeProperty));
Map<Datetime, List<Comparable>> personsByDatetimeProperty = (Map<Datetime, List<Comparable>>)
    [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByDatetime(getDatetimeProperty).cast(Map<Datetime, List<Comparable>>.class));
```


##### `public static Collector groupingByDatetime(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Datetime, Object> personsByDatetimeProperty = (Map<Datetime, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByDatetime(
        getDatetimeProperty,
        Collectors.toObjectSet()
    ));
Map<Datetime, Set<Object>> personsByDatetimeProperty = (Map<Datetime, Set<Object>>)
    [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByDatetime(
        getDatetimeProperty,
        Collectors.toObjectSet()
    ).cast(Map<Datetime, Set<Object>>.class));
```


##### `public static Collector groupingByDatetime(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Datetime, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Datetime, Set<Object>> personsByDatetimeProperty = (Map<Datetime, Set<Object>>)
    [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByDatetime(
        getDatetimeProperty,
        Supplier.of(Map<Datetime, Set<Object>>.class),
        Collectors.toObjectSet()
    ));
```


---
### Grouping By Map<Time, ?> Collectors
##### `public static Collector groupingByTime(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Time, List<Object>>`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Time, List<Object>> personsByTimeProperty = (Map<Time, List<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByTime(getTimeProperty));
Map<Time, List<Comparable>> personsByTimeProperty = (Map<Time, List<Comparable>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByTime(getTimeProperty).cast(Map<Time, List<Comparable>>.class));
```


##### `public static Collector groupingByTime(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Time, Object> personsByTimeProperty = (Map<Time, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByTime(
        getTimeProperty,
        Collectors.toObjectSet()
    ));
Map<Time, Set<Object>> personsByTimeProperty = (Map<Time, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByTime(
        getTimeProperty,
        Collectors.toObjectSet()
    ).cast(Map<Time, Set<Object>>.class));
```


##### `public static Collector groupingByTime(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Time, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Time, Set<Object>> personsByTimeProperty = (Map<Time, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByTime(
        getTimeProperty,
        Supplier.of(Map<Time, Set<Object>>.class),
        Collectors.toObjectSet()
    ));
```


---
### Grouping By Map<Integer, ?> Collectors
##### `public static Collector groupingByInt(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Integer, List<Object>>`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Integer, List<Object>> personsByIntProperty = (Map<Integer, List<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByInt(getIntProperty));
Map<Integer, List<Comparable>> personsByIntProperty = (Map<Integer, List<Comparable>>)
    [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByInt(getIntProperty).cast(Map<Integer, List<Comparable>>.class));
```


##### `public static Collector groupingByInt(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Integer, Object> personsByIntProperty = (Map<Integer, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByInt(
        getIntProperty,
        Collectors.toObjectSet()
    ));
Map<Integer, Set<Object>> personsByTimeProperty = (Map<Integer, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByInt(
        getIntProperty,
        Collectors.toObjectSet()
    ).cast(Map<Integer, Set<Object>>.class));
```


##### `public static Collector groupingByInt(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Integer, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Integer, Set<Object>> personsByIntProperty = (Map<Integer, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByInt(
        getIntProperty,
        Supplier.of(Map<Integer, Set<Object>>.class),
        Collectors.toObjectSet()
    ));
```


---
### Grouping By Map<Long, ?> Collectors
##### `public static Collector groupingByLong(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Long, List<Object>>`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Long, List<Object>> personsByLongProperty = (Map<Long, List<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByLong(getLongProperty));
Map<Long, List<Comparable>> personsByLongProperty = (Map<Long, List<Comparable>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByLong(getLongProperty).cast(Map<Long, List<Comparable>>.class));
```


##### `public static Collector groupingByLong(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Long, Object> personsByLongProperty = (Map<Long, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByLong(
        getLongProperty,
        Collectors.toObjectSet()
    ));
Map<Long, Set<Object>> personsByLongProperty = (Map<Long, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByLong(
        getLongProperty,
        Collectors.toObjectSet()
    ).cast(Map<Long, Set<Object>>.class));
```


##### `public static Collector groupingByLong(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Long, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Long, Set<Object>> personsByLongProperty = (Map<Long, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByLong(
        getLongProperty,
        Supplier.of(Map<Long, Set<Object>>.class),
        Collectors.toObjectSet()
    ));
```


---
### Grouping By Map<Double, ?> Collectors
##### `public static Collector groupingByDouble(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Double, List<Object>>`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Double, List<Object>> personsByDoubleProperty = (Map<Double, List<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByDouble(getDoubleProperty));
Map<Double, List<Comparable>> personsByDoubleProperty = (Map<Double, List<Comparable>>)
    [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByDouble(getDoubleProperty).cast(Map<Double, List<Comparable>>.class));
```


##### `public static Collector groupingByDouble(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Double, Object> personsByDoubleProperty = (Map<Double, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByDouble(
        getDoubleProperty,
        Collectors.toObjectSet()
    ));
Map<Double, Set<Object>> personsByDoubleProperty = (Map<Double, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByDouble(
        getDoubleProperty,
        Collectors.toObjectSet()
    ).cast(Map<Double, Set<Object>>.class));
```


##### `public static Collector groupingByDouble(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Double, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Double, Set<Object>> personsByDoubleProperty = (Map<Double, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByDouble(
        getDoubleProperty,
        Supplier.of(Map<Double, Set<Object>>.class),
        Collectors.toObjectSet()
    ));
```


##### `public static Collector groupingByObject(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Object, List<Object>>`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as [Collectors.groupingById](Collectors.groupingById), [Collectors.groupingByString](Collectors.groupingByString), etc.</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Object, List<Object>> personsByTimeProperty = (Map<Object, List<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByObject(getTimeProperty));
Map<Object, List<Comparable>> personsByTimeProperty = (Map<Object, List<Comparable>>)
    [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByObject(getTimeProperty).cast(Map<Object, List<Comparable>>.class));
```


##### `public static Collector groupingByObject(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as [Collectors.groupingById](Collectors.groupingById), [Collectors.groupingByString](Collectors.groupingByString), etc.</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Object, Object> personsByTimeProperty = (Map<Object, Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByObject(
        getTimeProperty,
        Collectors.toObjectSet()
    ));
Map<Object, Set<Object>> personsByTimeProperty = (Map<Object, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByObject(
        getTimeProperty,
        Collectors.toObjectSet()
    ).cast(Map<Object, Set<Object>>.class));
```


##### `public static Collector groupingByObject(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Object, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Object, Set<Object>> personsByTimeProperty = (Map<Object, Set<Object>>) [ObjectEnumerable].of(people)
    .collect(Collectors.groupingByObject(
        getTimeProperty,
        Supplier.of(Map<Object, Set<Object>>.class),
        Collectors.toObjectSet()
    ));
```


---
### Partitioning By Collectors
##### `public static Collector partitioningBy(IPredicate predicate)`

Returns a `Collector` that partitions the SObject input arguments according to `predicate` and organizes them into a `Map<Boolean, Object>`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate that classifies input arguments (true or false)|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Map<Boolean, Object> personsPartitionedByPredicate = (Map<Boolean, Object>)
    [ObjectEnumerable].of(people)
        .collect(Collectors.partitioningBy(predicate));
Map<Boolean, List<Comparable>> personsPartitionedByPredicate = (Map<Boolean, List<Comparable>>)
    [ObjectEnumerable].of(people)
        .collect(Collectors.partitioningBy(predicate).cast(Map<Boolean, List<Comparable>>.class));
```


##### `public static Collector partitioningBy(IPredicate predicate, ICollector downstream)`

Returns a `Collector` that partitions the SObject input arguments according to `predicate` and organizes them into a `Map<Boolean, Object>`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate that classifies input arguments (true or false)|
|`downstream`|the downstream reduction collector|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` or `downstream` is null|

###### Example
```apex
Map<Boolean, Set<String>> personNamesPartitionedByPredicate = (Map<Boolean, Set<String>>)
    [ObjectEnumerable].of(people)
        .collect(Collectors.partitioningBy(
            predicate,
            Collectors.toStringSet(getStringProperty)
        ).cast(Map<Boolean, Set<String>>.class));
```


---
### Joining
##### `public static Collector joining()`

Returns a `Collector` that concatenates String input arguments.

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
String concatenatedStrings = (String) [ObjectEnumerable].of(strings).collect(Collectors.joining());
```


##### `public static Collector joining(String delimiter)`

Returns a `Collector` that concatenates String input arguments, separated by `delimiter`.

###### Parameters

|Param|Description|
|---|---|
|`delimiter`|the delimiter between each element|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `delimiter` is null|

###### Example
```apex
String concatenatedStrings = (String) [ObjectEnumerable].of(strings).collect(Collectors.joining('; '));
```


##### `public static Collector joining(String delimiter, String prefix, String suffix)`

Returns a `Collector` that concatenates String input arguments, separated by `delimiter`.

###### Parameters

|Param|Description|
|---|---|
|`delimiter`|the delimiter between each element|
|`prefix`|the prefix|
|`suffix`|the suffix|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `delimiter`, `prefix` or `suffix` is null|

###### Example
```apex
String concatenatedStrings = (String) [ObjectEnumerable].of(strings)
    .collect(Collectors.joining('; ', 'prefix', 'suffix'));
```


##### `public static Collector joining(IFunction mapper, String delimiter, String prefix, String suffix)`

Returns a `Collector` that concatenates String elements returned by `mapper` function, separated by `delimiter`.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|
|`delimiter`|the delimiter between each element|
|`prefix`|the prefix|
|`suffix`|the suffix|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper`, `delimiter`, `prefix` or `suffix` is null|

###### Example
```apex
String concatenatedNames = (String) [ObjectEnumerable].of(people)
    .collect(Collectors.joining(getNameFunction, '; ', 'prefix', 'suffix'));
```


---
### Int Collectors
##### `public static Collector averagingInt(IFunction mapper)`

Returns a `Collector` that returns the arithmetic mean of values returned by `mapper`. If no elements are present, the result is null.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function extracting the Integer value to average|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Double averageOfIntProperties = (Double) [ObjectEnumerable].of(people)
    .collect(Collectors.averagingInt(getIntProperty));
```


##### `public static Collector counting()`

Returns a `Collector` that counts the number of input elements. If no elements are present, the result is 0.

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
Integer numberOfPeople = (Integer) [ObjectEnumerable].of(people).collect(Collectors.counting());
```


##### `public static Collector summingInt(IFunction mapper)`

Returns a `Collector` that returns the arithmetic sum of values returned by `mapper`. If no elements are present, the result is null.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function extracting the Integer value to sum|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Integer sumOfIntProperties = (Integer) [ObjectEnumerable].of(people)
    .collect(Collectors.summingInt(getIntProperty));
```


---
### Long Collectors
##### `public static Collector averagingLong(IFunction mapper)`

Returns a `Collector` that returns the arithmetic mean of values returned by `mapper`. If no elements are present, the result is null.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function extracting the Long value to average|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Double averageOfLongProperties = (Double) [ObjectEnumerable].of(people)
    .collect(Collectors.averagingLong(getLongProperty));
```


##### `public static Collector summingLong(IFunction mapper)`

Returns a `Collector` that returns the arithmetic sum of values returned by `mapper`. If no elements are present, the result is null.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function extracting the Long value to sum|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Long sumOfLongProperties = (Long) [ObjectEnumerable].of(people)
    .collect(Collectors.summingLong(getLongProperty));
```


---
### Intermediate Collectors
##### `public static Collector filtering(IPredicate predicate)`

Adapts a `Collector` to one accepting elements by applying `predicate` to each input element and only accumulating if it returns true.

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate to test input arguments|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
// Get people matched by predicate
List<Object> filteredPeople = (List<Object>) [ObjectEnumerable].of(people)
    .collect(Collectors.filtering(predicate));
// Group people matched by predicate
Map<String, List<Comparable>> filteredPeopleByStringProperty =
    (Map<String, List<Comparable>>) [ObjectEnumerable].of(people)
       .collect(
            Collectors.groupingByString(
                getStringProperty,
                Collectors.filtering(predicate)
       ).cast(Map<String, List<Comparable>>.class));
```


##### `public static Collector filtering(IPredicate predicate, ICollector downstream)`

Adapts a `Collector` to one accepting elements by applying `predicate` to each input element and only accumulating if it returns true.

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate to test input arguments|
|`downstream`|the collector that accumulates only matched values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
// Get people String properties matched by predicate
List<String> filteredStringProperties = (List<String>) [ObjectEnumerable].of(people)
    .collect(Collectors.filtering(
        predicate,
        Collectors.toList(getStringProperty)
    ).cast(List<String>.class));
```


##### `public static Collector mapping(IFunction mapper)`

Adapts a `Collector` to one accepting elements by applying `mapper` function to each input element before accumulation.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function to return the value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<String> accountNames = (List<String>)
    [ObjectEnumerable].of(people)
        .collect(Collectors.mapping(getStringProperty).cast(List<String>.class));
```


##### `public static Collector mapping(IFunction mapper, ICollector downstream)`

Adapts a `Collector` to one accepting elements by applying `mapper` function to each input element before accumulation.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function to return the value to accumulate|
|`downstream`|the collector which accepts mapped values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `downstream` is null|

###### Example
```apex
Map<String, Set<String>> otherStringPropertiesByStringProperty = (Map<String, Set<String>>)
    [ObjectEnumerable].of(people)
        .collect(Collectors.groupingByString(
            getStringProperty,
            Collectors.mapping(
                getOtherStringProperty,
                Collectors.toStringSet()
            )
        ).cast(Map<String, Set<String>>.class));
```


##### `public static Collector flatMapping(IFunction mapper)`

Adapts a `Collector` to one accepting elements as a result of replacing each input element with the contents of a mapped iterable created by applying the specified `mapper` function to each element before accumulation.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function which must produce `Iterable<Object>`|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `downstream` is null|

###### Example
```apex
List<String> flattenedStringProperties = (List<String>) [ObjectEnumerable].of(people)
    .collect(Collectors.flatMapping(getStringListProperty).cast(List<String>.class));
Map<String, List<String>> flattenedStringPropertiesByOtherStringProperty
    = (Map<String, List<String>>) [ObjectEnumerable].of(people)
        .collect(Collectors.groupingByString(
            getOtherStringProperty,
            Collectors.flatMapping(getStringListProperty)
        ).cast(Map<String, List<String>>.class));
```


##### `public static Collector flatMapping(IFunction mapper, ICollector downstream)`

Adapts a `Collector` to one accepting elements as a result of replacing each input element with the contents of a mapped iterable created by applying the specified `mapper` function to each element before accumulation.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function which must produce `Iterable<Object>`|
|`downstream`|the collector which accepts mapped values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `downstream` is null|

###### Example
```apex
Set<String> contacts = (Set<String>) [ObjectEnumerable].of(people)
    .collect(Collectors.flatMapping(
        getStringListProperty,
        Collectors.toStringSet()
    ));
Map<String, Set<String>> flattenedStringPropertiesByOtherStringProperty
   = (Map<String, Set<String>>) [ObjectEnumerable].of(people)
        .collect(Collectors.groupingByString(
            getOtherStringProperty,
            Collectors.flatMapping(
                getStringListProperty,
                Collectors.toStringSet()
        )).cast(Map<String, Set<String>>.class));
```


##### `public static Collector reducing(Object identity, IBiOperator accumulator)`

Returns a `Collector` which performs a reduction of its input elements under `accumulator` using `identity`.

###### Parameters

|Param|Description|
|---|---|
|`identity`|the identity value for the reduction|
|`accumulator`|the input arguments reducer|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
Person personWithSummedIntProperties = (Person) [ObjectEnumerable].of(people)
    .collect(Collectors.reducing(
        new Person(IntProperty = 0),
        sumIntPropertyReducer
     ));
```


##### `public static Collector reducing(Object identity, IFunction mapper, IBiOperator accumulator)`

Returns a `Collector` which performs a reduction of its input elements under `mapper` function and `accumulator`.

###### Parameters

|Param|Description|
|---|---|
|`identity`|the identity value for the reduction|
|`mapper`|the function to return the value to accumulate|
|`accumulator`|the input arguments reducer|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `accumulator` is null|

###### Example
```apex
Person personWithSummedIntProperties = (Person) [ObjectEnumerable].of(people)
    .collect(Collectors.reducing(
        new Person(IntProperty = 0),
        Function.identity(),
        sumIntPropertyReducer
     ));
```


---
### Optional Collectors
##### `public static Collector reducing(IBiOperator accumulator)`

Returns a `Collector` which performs a reduction of its input elements under `accumulator`. The result is described as an `Optional`. <p>The result container <strong>cannot</strong> be cast to a specific `Optional`.</p>

###### Parameters

|Param|Description|
|---|---|
|`accumulator`|the input arguments reducer|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
Map<String, Object> optionalPersonWithMaxIntPropertyByStringProperty = (Map<String, Object>)
    [ObjectEnumerable].of(people)
        .collect(Collectors.groupingByString(
            getStringProperty,
            Collectors.reducing(BiOperator.maxBy(Comparer.comparing(getIntProperty)))
        ));
Person personWithMaxIntProperty = (Person)
    optionalPersonWithMaxIntPropertyByStringProperty.get('SomePropertyValues').get();
```


##### `public static Collector maximizing(IComparer comparer)`

Returns a `Collector` which produces the maximal element according to `comparer`. The result is described as an `Optional`. <p>The result container <strong>cannot</strong> be cast to a specific `Optional`.</p>

###### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

###### Example
```apex
Map<String, Object> optionalPersonWithMaxIntPropertyByStringProperty = (Map<String, Object>)
    [ObjectEnumerable].of(people)
        .collect(Collectors.groupingByString(
            getStringProperty,
            Collectors.maximizing(Comparer.comparing(getIntProperty))
        ));
Person personWithMaxIntProperty = (Person)
    optionalPersonWithMaxIntPropertyByStringProperty.get('SomePropertyValues').get();
```


##### `public static Collector minimizing(IComparer comparer)`

Returns a `Collector` which produces the minimal element according to `comparer`. The result is described as an `Optional`. <p>The result container <strong>cannot</strong> be cast to a specific `Optional`.</p>

###### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

###### Example
```apex
Map<String, Object> optionalPersonWithMinIntPropertyByStringProperty = (Map<String, Object>)
    [ObjectEnumerable].of(people)
        .collect(Collectors.groupingByString(
            getStringProperty,
            Collectors.minimizing(Comparer.comparing(getIntProperty))
        ));
Person personWithMaxIntProperty = (Person)
    optionalPersonWithMinIntPropertyByStringProperty.get('SomePropertyValues').get();
```


---
### Built-Ins
##### `public static Collector toList()`

*Inherited*


Returns a `Collector` that accumulates input arguments into a new `List<Object>`. <p>The result container can be cast to a specific type using [Collector.cast](Collector.cast).</p> <p>[IEnumerable.collect(BaseCollectors.toList())](IEnumerable.collect(BaseCollectors.toList())) can be replaced with [IEnumerable.toList()](IEnumerable.toList())</p>

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates SObjects into a List
List<Object> people = (List<Object>) [ObjectEnumerable].of(persons)
    .collect(BaseCollectors.toList());
List<Account> accs = (List<Account>) [SObjectEnumerable].of(accounts)
    .collect(BaseCollectors.toList().cast(List<Account>.class));
```


##### `public static Collector toList(Type elementType)`

*Inherited*


Returns a `Collector` that accumulates `T` input arguments into a new `List<T>`. <p>The result container can be cast to a specific `Type`.</p>

###### Parameters

|Param|Description|
|---|---|
|`elementType`|the type of the element|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `elementType` is null|

###### Example
```apex
// Accumulates Objects into a String List
List<String> strs = (List<String>) [ObjectEnumerable].of(strings)
    .collect(BaseCollectors.toList(String.class));
// is equivalent to
List<String> strs = (List<String>) [ObjectEnumerable].of(strings)
    .collect(BaseCollectors.toList().cast(List<String>.class));
```


##### `public static Collector toList(IFunction mapper)`

*Inherited*


Returns a `Collector` that accumulates the values returned by `mapper` into a new `List<Object>`. <p>The result container can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function that returns values to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
// Accumulates values returned by mapper into a List
List<Object> names = (List<Object>) [ObjectEnumerable].of(people)
    .collect(BaseCollectors.toList(getNameFunction));
List<String> names = (List<String>) [ObjectEnumerable].of(people)
    .collect(BaseCollectors.toList(getNameFunction).cast(List<String>.class));
```


##### `public static Collector averagingDouble(IFunction mapper)`

*Inherited*


Returns a `Collector` that returns the arithmetic mean of values returned by `mapper`. If no elements are present, the result is null.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function extracting the Double value to average|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Double averageBillingLatitude = (Double) [SObjectEnumerable].of(accounts)
    .collect(BaseCollectors.averagingLong(Functions.get('BillingLatitude')));
```


##### `public static Collector summingDouble(IFunction mapper)`

*Inherited*


Returns a `Collector` that returns the arithmetic sum of values returned by `mapper`. If no elements are present, the result is 0.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function extracting the Long value to sum|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Long sumOfBillingLatitude = (Long) [SObjectEnumerable].of(accounts)
    .collect(BaseCollectors.summingDouble(Functions.get('BillingLatitude')));
```


---
