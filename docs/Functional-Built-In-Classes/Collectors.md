# Collectors

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides common implementations of [Collector](/docs/Functional-Abstract-Classes/Collector.md) and related utilities.


**See** [Collector](/docs/Functional-Abstract-Classes/Collector.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### List<?> Collectors
##### `static toList()`

Returns a `Collector` that accumulates SObject input arguments into a new `List<Object>`. <p>The result container can be cast to a specific `Type`.</p> <p>IObjectIterable.collect(Collectors.toList()) can be replaced with IObjectIterable.toList()</p>

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Example
```apex
// Accumulates Objects into a List
List<Object> strs = (List<Object>) Stream.of(strings)
    .collect(Collectors.toList());
List<String> strs = (List<String>) Stream.of(strings)
    .collect(Collectors.toList().cast(List<String>.class));
```

##### `static toList(IFunction mapper)`

Returns a `Collector` that accumulates the values returned by `mapper` into a new `List<Object>`. <p>The result container can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function that returns values to accumulate|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
// Accumulates values returned by mapper into a List
List<Object> names = (List<Object>) Stream.of(people)
    .collect(Collectors.toList(getNameFunction));
List<String> names = (List<String>) Stream.of(people)
    .collect(Collectors.toList(getNameFunction).cast(List<String>.class));
```

---
### Set<?> Collectors
##### `static toSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Object>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p> <p>IObjectIterable.collect(Collectors.toSet()) can be replaced with IObjectIterable.toSet()</p>

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Example
```apex
// Accumulates input arguments into a List
Set<Object> ppl = (Set<Object>) Stream.of(people).collect(Collectors.toSet());
```

##### `static toBoolSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Boolean>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Example
```apex
// Accumulates input arguments into a List
Set<Boolean> bools = (Set<Boolean>) Stream.of(booleans).collect(Collectors.toBoolSet());
```

##### `static toIdSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Id>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Example
```apex
// Accumulates input arguments into a List
Set<Boolean> ids = (Set<Boolean>) Stream.of(ids).collect(Collectors.toIdSet());
```

##### `static toStringSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<String>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Example
```apex
// Accumulates input arguments into a List
Set<String> strs = (Set<String>) Stream.of(strings).collect(Collectors.toStringSet());
```

##### `static toBlobSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Blob>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Example
```apex
// Accumulates input arguments into a List
Set<Blob> blbs = (Set<Blob>) Stream.of(blobs).collect(Collectors.toBlobSet());
```

##### `static toDateSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Date>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Example
```apex
// Accumulates input arguments into a List
Set<Date> dts = (Set<Date>) Stream.of(dates).collect(Collectors.toDateSet());
```

##### `static toDatetimeSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Datetime>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Example
```apex
// Accumulates input arguments into a List
Set<Datetime> dts = (Set<Datetime>) Stream.of(datetimes).collect(Collectors.toDatetimeSet());
```

##### `static toTimeSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Time>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Example
```apex
// Accumulates input arguments into a List
Set<Time> tms = (Set<Time>) Stream.of(times).collect(Collectors.toTimeSet());
```

##### `static toIntSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Integer>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Example
```apex
// Accumulates input arguments into a List
Set<Integer> ints = (Set<Integer>) Stream.of(integers).collect(Collectors.toIntSet());
```

##### `static toLongSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Long>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Example
```apex
// Accumulates input arguments into a List
Set<Long> ls = (Set<Long>) Stream.of(longs).collect(Collectors.toLongSet());
```

##### `static toDoubleSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<Double>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Example
```apex
// Accumulates input arguments into a List
Set<Double> ds = (Set<Double>) Stream.of(doubles).collect(Collectors.toDoubleSet());
```

##### `static toSObjectSet()`

Returns a `Collector` that accumulates input arguments into a new `Set<SObject>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Example
```apex
// Accumulates input arguments into a List
Set<SObject> sObjects = (Set<SObject>) Stream.of(accounts).collect(Collectors.toSObjectSet());
```

---
### Map<Boolean, Object> Collectors
##### `static toByBoolMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Boolean, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use Collectors.toByBoolMap(IFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<Boolean, Object> personByBoolProperty = (Map<Boolean, Object>) Stream.of(people)
    .collect(Collectors.toByBoolMap(getBoolProperty));
Map<Boolean, Comparable> personByBoolProperty = (Map<Boolean, Comparable>) Stream.of(people)
    .collect(Collectors.toByBoolMap(getBoolProperty).cast(Map<Boolean, Comparable>.class));
```

##### `static toByBoolMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use Collectors.toByBoolMap(IFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Boolean, Object> stringPropertyByBoolProperty = (Map<Boolean, Object>) Stream.of(people)
    .collect(Collectors.toByBoolMap(getBoolProperty, getStringProperty));
Map<Boolean, String> stringPropertyByBoolProperty = (Map<Boolean, String>) Stream.of(people)
    .collect(Collectors.toByBoolMap(getBoolProperty, getStringProperty).cast(Map<Boolean, String>.class));
```

##### `static toByBoolMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Boolean, Object> stringPropertyByBoolProperty = (Map<Boolean, Object>) Stream.of(people)
    .collect(Collectors.toByBoolMap(
        getBoolProperty,
        getStringProperty,
        BinaryOperator.right()
    ));
Map<Boolean, String> stringPropertyByBoolProperty = (Map<Boolean, String>) Stream.of(people)
    .collect(Collectors.toByBoolMap(
        getBoolProperty,
        getStringProperty,
        BinaryOperator.right()
    ).cast(Map<Boolean, String>.class));
```

##### `static toByBoolMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Boolean, ?>` into which the results are inserted|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Boolean, String> stringPropertyByBoolProperty = (Map<Boolean, String>) Stream.of(people)
    .collect(Collectors.toByBoolMap(
        getBoolProperty,
        getStringProperty,
        BinaryOperator.right(),
        Supplier.of(Map<Boolean, String>.class)
    ));
```

---
### Map<Id, Object> Collectors
##### `static toByIdMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Id, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use Collectors.toByIdMap(IFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Id, Object> personByIdProperty = (Map<Id, Object>) Stream.of(people)
    .collect(Collectors.toByIdMap(getIdProperty));
Map<Id, Comparable> personByIdProperty = (Map<Id, Comparable>) Stream.of(people)
    .collect(Collectors.toByBoolMap(getIdProperty).cast(Map<Id, Comparable>.class));
```

##### `static toByIdMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Id, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use Collectors.toByIdMap(IFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Id, Object> stringPropertyByIdProperty = (Map<Id, Object>) Stream.of(people)
    .collect(Collectors.toByIdMap(getIdProperty, getStringProperty));
Map<Id, String> stringPropertyByIdProperty = (Map<Id, String>) Stream.of(people)
    .collect(Collectors.toByIdMap(getIdProperty, getStringProperty).cast(Map<Id, String>.class));
```

##### `static toByIdMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Id, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Id, Object> stringPropertyByIdProperty = (Map<Id, Object>) Stream.of(people)
    .collect(Collectors.toByIdMap(
        getIdProperty,
        getStringProperty,
        BinaryOperator.right()
    ));
Map<Id, String> stringPropertyByIdProperty = (Map<Id, String>) Stream.of(people)
    .collect(Collectors.toByIdMap(
        getIdProperty,
        getStringProperty,
        BinaryOperator.right()
    ).cast(Map<Id, String>.class));
```

##### `static toByIdMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Id, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Id, ?>` into which the results are inserted|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Id, String> stringPropertyByIdProperty = (Map<Id, String>) Stream.of(people)
    .collect(Collectors.toByIdMap(
        getIdProperty,
        getStringProperty,
        BinaryOperator.right(),
        Supplier.of(Map<Id, String>.class)
    ));
```

---
### Map<String, Object> Collectors
##### `static toByStringMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<String, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use Collectors.toByStringMap(IFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<String, Object> personByStringProperty = (Map<String, Object>) Stream.of(people)
    .collect(Collectors.toByStringMap(getStringProperty));
Map<String, Comparable> personByStringProperty = (Map<String, Comparable>) Stream.of(people)
    .collect(Collectors.toByBoolMap(getStringProperty).cast(Map<String, Comparable>.class));
```

##### `static toByStringMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<String, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use Collectors.toByStringMap(IFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<String, Object> stringPropertyByStringProperty = (Map<String, Object>) Stream.of(people)
    .collect(Collectors.toByStringMap(getStringProperty, getStringProperty));
Map<String, String> stringPropertyByStringProperty = (Map<String, String>) Stream.of(people)
    .collect(Collectors.toByStringMap(getStringProperty, getStringProperty).cast(Map<String, String>.class));
```

##### `static toByStringMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<String, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<String, Object> stringPropertyByStringProperty = (Map<String, Object>) Stream.of(people)
    .collect(Collectors.toByStringMap(
        getStringProperty,
        getStringProperty,
        BinaryOperator.right()
    ));
Map<String, String> stringPropertyByStringProperty = (Map<String, String>) Stream.of(people)
    .collect(Collectors.toByStringMap(
        getStringProperty,
        getStringProperty,
        BinaryOperator.right()
    ).cast(Map<String, String>.class));
```

##### `static toByStringMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<String, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<String, ?>` into which the results are inserted|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<String, String> stringPropertyByStringProperty = (Map<String, String>) Stream.of(people)
    .collect(Collectors.toByStringMap(
        getStringProperty,
        getStringProperty,
        BinaryOperator.right(),
        Supplier.of(Map<String, String>.class)
    ));
```

---
### Map<Blob, Object> Collectors
##### `static toByBlobMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Blob, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use Collectors.toByBlobMap(IFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Blob, Object> personByBlobProperty = (Map<Blob, Object>) Stream.of(people)
    .collect(Collectors.toByBlobMap(getBlobProperty));
Map<Blob, Comparable> personByBlobProperty = (Map<Blob, Comparable>) Stream.of(people)
    .collect(Collectors.toByBoolMap(getBlobProperty).cast(Map<Blob, Comparable>.class));
```

##### `static toByBlobMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use Collectors.toByBlobMap(IFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Blob, Object> stringPropertyByBlobProperty = (Map<Blob, Object>) Stream.of(people)
    .collect(Collectors.toByBlobMap(getBlobProperty, getStringProperty));
Map<Blob, String> stringPropertyByBlobProperty = (Map<Blob, String>) Stream.of(people)
    .collect(Collectors.toByBlobMap(getBlobProperty, getStringProperty).cast(Map<Blob, String>.class));
```

##### `static toByBlobMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Blob, Object> stringPropertyByBlobProperty = (Map<Blob, Object>) Stream.of(people)
    .collect(Collectors.toByBlobMap(
        getBlobProperty,
        getStringProperty,
        BinaryOperator.right()
    ));
Map<Blob, String> stringPropertyByBlobProperty = (Map<Blob, String>) Stream.of(people)
    .collect(Collectors.toByBlobMap(
        getBlobProperty,
        getStringProperty,
        BinaryOperator.right()
    ).cast(Map<Blob, String>.class));
```

##### `static toByBlobMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Blob, ?>` into which the results are inserted|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Blob, String> stringPropertyByBlobProperty = (Map<Blob, String>) Stream.of(people)
    .collect(Collectors.toByBlobMap(
        getBlobProperty,
        getStringProperty,
        BinaryOperator.right(),
        Supplier.of(Map<Blob, String>.class)
    ));
```

---
### Map<Date, Object> Collectors
##### `static toByDateMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Date, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use Collectors.toByDateMap(IFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Date, Object> personByDateProperty = (Map<Date, Object>) Stream.of(people)
    .collect(Collectors.toByDateMap(getDateProperty));
Map<Date, Comparable> personByDateProperty = (Map<Date, Comparable>) Stream.of(people)
    .collect(Collectors.toByBoolMap(getDateProperty).cast(Map<Date, Comparable>.class));
```

##### `static toByDateMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Date, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use Collectors.toByDateMap(IFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Date, Object> stringPropertyByDateProperty = (Map<Date, Object>) Stream.of(people)
    .collect(Collectors.toByDateMap(getDateProperty, getStringProperty));
Map<Date, String> stringPropertyByDateProperty = (Map<Date, String>) Stream.of(people)
    .collect(Collectors.toByDateMap(getDateProperty, getStringProperty).cast(Map<Date, String>.class));
```

##### `static toByDateMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Date, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Date, Object> stringPropertyByDateProperty = (Map<Date, Object>) Stream.of(people)
    .collect(Collectors.toByDateMap(
        getDateProperty,
        getStringProperty,
        BinaryOperator.right()
    ));
Map<Date, String> stringPropertyByDateProperty = (Map<Date, String>) Stream.of(people)
    .collect(Collectors.toByDateMap(
        getDateProperty,
        getStringProperty,
        BinaryOperator.right()
    ).cast(Map<Date, String>.class));
```

##### `static toByDateMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Date, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Date, ?>` into which the results are inserted|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Date, String> stringPropertyByDateProperty = (Map<Date, String>) Stream.of(people)
    .collect(Collectors.toByDateMap(
        getDateProperty,
        getStringProperty,
        BinaryOperator.right(),
        Supplier.of(Map<Date, String>.class)
    ));
```

---
### Map<Datetime, Object> Collectors
##### `static toByDatetimeMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Datetime, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use Collectors.toByDatetimeMap(IFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Datetime, Object> personByDatetimeProperty = (Map<Datetime, Object>) Stream.of(people)
    .collect(Collectors.toByDatetimeMap(getDatetimeProperty));
Map<Datetime, Comparable> personByDatetimeProperty = (Map<Datetime, Comparable>) Stream.of(people)
    .collect(Collectors.toByBoolMap(getDatetimeProperty).cast(Map<Datetime, Comparable>.class));
```

##### `static toByDatetimeMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use Collectors.toByDatetimeMap(IFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Datetime, Object> stringPropertyByDatetimeProperty = (Map<Datetime, Object>) Stream.of(people)
    .collect(Collectors.toByDatetimeMap(getDatetimeProperty, getStringProperty));
Map<Datetime, String> stringPropertyByDatetimeProperty = (Map<Datetime, String>) Stream.of(people)
    .collect(Collectors.toByDatetimeMap(getDatetimeProperty, getStringProperty)
        .cast(Map<Datetime, String>.class)
    );
```

##### `static toByDatetimeMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Datetime, Object> stringPropertyByDatetimeProperty = (Map<Datetime, Object>) Stream.of(people)
    .collect(Collectors.toByDatetimeMap(
        getDatetimeProperty,
        getStringProperty,
        BinaryOperator.right()
    ));
Map<Datetime, String> stringPropertyByDatetimeProperty = (Map<Datetime, String>) Stream.of(people)
    .collect(Collectors.toByDatetimeMap(
        getDatetimeProperty,
        getStringProperty,
        BinaryOperator.right()
    ).cast(Map<Datetime, String>.class));
```

##### `static toByDatetimeMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Datetime, ?>` into which the results are inserted|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Datetime, String> stringPropertyByDatetimeProperty = (Map<Datetime, String>) Stream.of(people)
    .collect(Collectors.toByDatetimeMap(
        getDatetimeProperty,
        getStringProperty,
        BinaryOperator.right(),
        Supplier.of(Map<Datetime, String>.class)
    ));
```

---
### Map<Time, Object> Collectors
##### `static toByTimeMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Time, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use Collectors.toByTimeMap(IFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Time, Object> personByTimeProperty = (Map<Time, Object>) Stream.of(people)
    .collect(Collectors.toByTimeMap(getTimeProperty));
Map<Time, Comparable> personByTimeProperty = (Map<Time, Comparable>) Stream.of(people)
    .collect(Collectors.toByBoolMap(getTimeProperty).cast(Map<Time, Comparable>.class));
```

##### `static toByTimeMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Time, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use Collectors.toByTimeMap(IFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Time, Object> stringPropertyByTimeProperty = (Map<Time, Object>) Stream.of(people)
    .collect(Collectors.toByTimeMap(getTimeProperty, getStringProperty));
Map<Time, String> stringPropertyByTimeProperty = (Map<Time, String>) Stream.of(people)
    .collect(Collectors.toByTimeMap(getTimeProperty, getStringProperty).cast(Map<Time, String>.class));
```

##### `static toByTimeMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Time, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Time, Object> stringPropertyByTimeProperty = (Map<Time, Object>) Stream.of(people)
    .collect(Collectors.toByTimeMap(
        getTimeProperty,
        getStringProperty,
        BinaryOperator.right()
    ));
Map<Time, String> stringPropertyByTimeProperty = (Map<Time, String>) Stream.of(people)
    .collect(Collectors.toByTimeMap(
        getTimeProperty,
        getStringProperty,
        BinaryOperator.right()
    ).cast(Map<Time, String>.class));
```

##### `static toByTimeMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Time, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Time, ?>` into which the results are inserted|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Time, String> stringPropertyByTimeProperty = (Map<Time, String>) Stream.of(people)
    .collect(Collectors.toByTimeMap(
        getTimeProperty,
        getStringProperty,
        BinaryOperator.right(),
        Supplier.of(Map<Time, String>.class)
    ));
```

---
### Map<Integer, Object> Collectors
##### `static toByIntMap(IToIntFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Integer, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use Collectors.toByIntMap(IToIntFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Integer, Object> personByIntProperty = (Map<Integer, Object>) Stream.of(people)
    .collect(Collectors.toByIntMap(getIntProperty));
Map<Integer, Comparable> personByIntProperty = (Map<Integer, Comparable>) Stream.of(people)
    .collect(Collectors.toByIntMap(getIntProperty).cast(Map<Integer, Comparable>.class));
```

##### `static toByIntMap(IToIntFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use Collectors.toByIntMap(IToIntFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Integer, Object> stringPropertyByIntProperty = (Map<Integer, Object>) Stream.of(people)
    .collect(Collectors.toByIntMap(getIntProperty, getStringProperty));
Map<Integer, String> stringPropertyByIntProperty = (Map<Integer, String>) Stream.of(people)
    .collect(Collectors.toByIntMap(getIntProperty, getStringProperty).cast(Map<Integer, String>.class));
```

##### `static toByIntMap(IToIntFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Integer, Object> stringPropertyByTimeProperty = (Map<Integer, Object>) Stream.of(people)
    .collect(Collectors.toByIntMap(
        getIntProperty,
        getStringProperty,
        BinaryOperator.right()
    ));
Map<Integer, String> stringPropertyByTimeProperty = (Map<Integer, String>) Stream.of(people)
    .collect(Collectors.toByIntMap(
        getIntProperty,
        getStringProperty,
        BinaryOperator.right()
    ).cast(Map<Integer, String>.class));
```

##### `static toByIntMap(IToIntFunction keyMapper, IFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Integer, ?>` into which the results are inserted|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Integer, String> stringPropertyByIntProperty = (Map<Integer, String>) Stream.of(people)
    .collect(Collectors.toByIntMap(
        getIntProperty,
        getStringProperty,
        BinaryOperator.right(),
        Supplier.of(Map<Integer, String>.class)
    ));
```

---
### Map<Long, Object> Collectors
##### `static toByLongMap(IToLongFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Long, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use Collectors.toByLongMap(IToLongFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Long, Object> personByLongProperty = (Map<Long, Object>) Stream.of(people)
    .collect(Collectors.toByLongMap(getLongProperty));
Map<Long, Comparable> personByLongProperty = (Map<Long, Comparable>) Stream.of(people)
    .collect(Collectors.toByBoolMap(getLongProperty).cast(Map<Long, Comparable>.class));
```

##### `static toByLongMap(IToLongFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Long, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use Collectors.toByLongMap(IToLongFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Long, Object> stringPropertyByLongProperty = (Map<Long, Object>) Stream.of(people)
    .collect(Collectors.toByLongMap(getLongProperty, getStringProperty));
Map<Long, String> stringPropertyByLongProperty = (Map<Long, String>) Stream.of(people)
    .collect(Collectors.toByLongMap(getLongProperty, getStringProperty).cast(Map<Long, String>.class));
```

##### `static toByLongMap(IToLongFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Long, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Long, Object> stringPropertyByLongProperty = (Map<Long, Object>) Stream.of(people)
    .collect(Collectors.toByLongMap(
        getLongProperty,
        getStringProperty,
        BinaryOperator.right()
    ));
Map<Long, String> stringPropertyByLongProperty = (Map<Long, String>) Stream.of(people)
    .collect(Collectors.toByLongMap(
        getLongProperty,
        getStringProperty,
        BinaryOperator.right()
    ).cast(Map<Long, String>.class));
```

##### `static toByLongMap(IToLongFunction keyMapper, IFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Long, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Long, ?>` into which the results are inserted|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Long, String> stringPropertyByLongProperty = (Map<Long, String>) Stream.of(people)
    .collect(Collectors.toByLongMap(
        getLongProperty,
        getStringProperty,
        BinaryOperator.right(),
        Supplier.of(Map<Long, String>.class)
    ));
```

---
### Map<Double, Object> Collectors
##### `static toByDoubleMap(IToDoubleFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Double, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use Collectors.toByDoubleMap(IToDoubleFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Double, Object> personByDoubleProperty = (Map<Double, Object>) Stream.of(people)
    .collect(Collectors.toByDoubleMap(getDoubleProperty));
Map<Double, Comparable> personByDoubleProperty = (Map<Double, Comparable>) Stream.of(people)
    .collect(Collectors.toByBoolMap(getDoubleProperty).cast(Map<Double, Comparable>.class));
```

##### `static toByDoubleMap(IToDoubleFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Double, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use Collectors.toByDoubleMap(IToDoubleFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Double, Object> stringPropertyByDoubleProperty = (Map<Double, Object>) Stream.of(people)
    .collect(Collectors.toByDoubleMap(getDoubleProperty, getStringProperty));
Map<Double, String> stringPropertyByDoubleProperty = (Map<Double, String>) Stream.of(people)
    .collect(Collectors.toByDoubleMap(getDoubleProperty, getStringProperty).cast(Map<Double, String>.class));
```

##### `static toByDoubleMap(IToDoubleFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Double, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Double, Object> stringPropertyByDoubleProperty = (Map<Double, Object>) Stream.of(people)
    .collect(Collectors.toByDoubleMap(
        getDoubleProperty,
        getStringProperty,
        BinaryOperator.right()
    ));
Map<Double, String> stringPropertyByDoubleProperty = (Map<Double, String>) Stream.of(people)
    .collect(Collectors.toByDoubleMap(
        getDoubleProperty,
        getStringProperty,
        BinaryOperator.right()
    ).cast(Map<Double, String>.class));
```

##### `static toByDoubleMap(IToDoubleFunction keyMapper, IFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Double, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Double, ?>` into which the results are inserted|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Double, String> stringPropertyByDoubleProperty = (Map<Double, String>) Stream.of(people)
    .collect(Collectors.toByDoubleMap(
        getDoubleProperty,
        getStringProperty,
        BinaryOperator.right(),
        Supplier.of(Map<Double, String>.class)
    ));
```

---
### Map<Object, Object> Collectors
##### `static toMap(IFunction keyMapper)`

Returns a `Collector` that accumulates elements into a `Map<Object, Object>` whose keys are values returned by `keyMapper` and values are values of the input arguments. If the mapped keys might have duplicates, use Collectors.toMap(IFunction, IFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using Collector.cast.</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as Collectors.toByIdMap, Collectors.toByStringMap, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Object, Object> personByTimeProperty = (Map<Object, Object>) Stream.of(people)
    .collect(Collectors.toMap(getTimeProperty));
Map<Object, Comparable> personByTimeProperty = (Map<Object, Comparable>) Stream.of(people)
    .collect(Collectors.toMap(getTimeProperty).cast(Map<Object, Comparable>.class));
```

##### `static toMap(IFunction keyMapper, IFunction valueMapper)`

Returns a `Collector` that accumulates elements into a `Map<Object, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. If the mapped keys might have duplicates, use Collectors.toMap(IFunction, IFunction, IBinaryOperator) instead. <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as Collectors.toByIdMap, Collectors.toByStringMap, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Object, Object> stringPropertyByTimeProperty = (Map<Object, Object>) Stream.of(people)
    .collect(Collectors.toMap(getTimeProperty, getStringProperty));
Map<Object, String> stringPropertyByTimeProperty = (Map<Object, String>) Stream.of(people)
    .collect(Collectors.toMap(getTimeProperty, getStringProperty).cast(Map<Object, String>.class));
```

##### `static toMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger)`

Returns a `Collector` that accumulates elements into a `Map<Object, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as Collectors.toByIdMap, Collectors.toByStringMap, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Object, Object> stringPropertyByTimeProperty = (Map<Object, Object>) Stream.of(people)
    .collect(Collectors.toByTimeMap(
        getTimeProperty,
        getStringProperty,
        BinaryOperator.right()
    ));
Map<Object, String> stringPropertyByTimeProperty = (Map<Object, String>) Stream.of(people)
    .collect(Collectors.toByTimeMap(
        getTimeProperty,
        getStringProperty,
        BinaryOperator.right()
    ).cast(Map<Object, String>.class));
```

##### `static toMap(IFunction keyMapper, IFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `Collector` that accumulates elements into a `Map<Object, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the input arguments. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Object, ?>` into which the results are inserted|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper` or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Object, String> stringPropertyByTimeProperty = (Map<Object, String>) Stream.of(people)
    .collect(Collectors.toMap(
        getTimeProperty,
        getStringProperty,
        BinaryOperator.right(),
        Supplier.of(Map<Object, String>.class)
    ));
```

---
### Map<Boolean, ?> Collectors
##### `static groupingByBool(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Boolean, List<Object>>`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Boolean, List<Object>> personsByBoolProperty = (Map<Boolean, List<Object>>) Stream.of(people)
    .collect(Collectors.groupingByBool(getBoolProperty));
Map<Boolean, List<Comparable>> personsByBoolProperty = (Map<Boolean, List<Comparable>>) Stream.of(people)
    .collect(Collectors.groupingByBool(getBoolProperty).cast(Map<Boolean, List<Comparable>>.class));
```

##### `static groupingByBool(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Boolean, Object> personsByBoolProperty = (Map<Boolean, Object>) Stream.of(people)
    .collect(Collectors.groupingByBool(
        getBoolProperty,
        Collectors.toSet()
    ));
Map<Boolean, Set<Object>> personsByBoolProperty = (Map<Boolean, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByBool(
        getBoolProperty,
        Collectors.toSet()
    ).cast(Map<Boolean, Set<Object>>.class));
```

##### `static groupingByBool(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Boolean, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Boolean, Set<Object>> personsByBoolProperty = (Map<Boolean, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByBool(
        getBoolProperty,
        Supplier.of(Map<Boolean, Set<Object>>.class),
        Collectors.toSet()
    ));
```

---
### Grouping By Map<Id, ?> Collectors
##### `static groupingById(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Id, List<Object>>`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Id, List<Object>> personsByIdProperty = (Map<Id, List<Object>>) Stream.of(people)
    .collect(Collectors.groupingById(getIdProperty));
Map<Id, List<Comparable>> personsByIdProperty = (Map<Id, List<Comparable>>) Stream.of(people)
    .collect(Collectors.groupingById(getIdProperty).cast(Map<Id, List<Comparable>>.class));
```

##### `static groupingById(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Id, Object> personsByIdProperty = (Map<Id, Object>) Stream.of(people)
    .collect(Collectors.groupingById(
        getIdProperty,
        Collectors.toSet()
    ));
Map<Id, Set<Object>> personsByIdProperty = (Map<Id, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingById(
        getIdProperty,
        Collectors.toSet()
    ).cast(Map<Id, Set<Object>>.class));
```

##### `static groupingById(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Id, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Id, Set<Object>> personsByIdProperty = (Map<Id, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingById(
        getIdProperty,
        Supplier.of(Map<Id, Set<Object>>.class),
        Collectors.toSet()
    ));
```

---
### Grouping By Map<String, ?> Collectors
##### `static groupingByString(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<String, List<Object>>`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<String, List<Object>> personsByStringProperty = (Map<String, List<Object>>) Stream.of(people)
    .collect(Collectors.groupingByString(getStringProperty));
Map<String, List<Comparable>> personsByStringProperty = (Map<String, List<Comparable>>) Stream.of(people)
    .collect(Collectors.groupingByString(getStringProperty).cast(Map<String, List<Comparable>>.class));
```

##### `static groupingByString(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<String, Object> personsByStringProperty = (Map<String, Object>) Stream.of(people)
    .collect(Collectors.groupingByString(
        getStringProperty,
        Collectors.toSet()
    ));
Map<String, Set<Object>> personsByStringProperty = (Map<String, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByString(
        getStringProperty,
        Collectors.toSet()
    ).cast(Map<String, Set<Object>>.class));
```

##### `static groupingByString(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<String, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<String, Set<Object>> personsByStringProperty = (Map<String, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByString(
        getStringProperty,
        Supplier.of(Map<String, Set<Object>>.class),
        Collectors.toSet()
    ));
```

---
### Grouping By Map<Blob, ?> Collectors
##### `static groupingByBlob(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Blob, List<Object>>`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Blob, List<Object>> personsByBlobProperty = (Map<Blob, List<Object>>) Stream.of(people)
    .collect(Collectors.groupingByBlob(getBlobProperty));
Map<Blob, List<Comparable>> personsByBlobProperty = (Map<Blob, List<Comparable>>) Stream.of(people)
    .collect(Collectors.groupingByBlob(getBlobProperty).cast(Map<Blob, List<Comparable>>.class));
```

##### `static groupingByBlob(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Blob, Object> personsByBlobProperty = (Map<Blob, Object>) Stream.of(people)
    .collect(Collectors.groupingByBlob(
        getBlobProperty,
        Collectors.toSet()
    ));
Map<Blob, Set<Object>> personsByBlobProperty = (Map<Blob, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByBlob(
        getBlobProperty,
        Collectors.toSet()
    ).cast(Map<Blob, Set<Object>>.class));
```

##### `static groupingByBlob(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Blob, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Blob, Set<Object>> personsByBlobProperty = (Map<Blob, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByBlob(
        getBlobProperty,
        Supplier.of(Map<Blob, Set<Object>>.class),
        Collectors.toSet()
    ));
```

---
### Grouping By Map<Date, ?> Collectors
##### `static groupingByDate(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Date, List<Object>>`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Date, List<Object>> personsByDateProperty = (Map<Date, List<Object>>) Stream.of(people)
    .collect(Collectors.groupingByDate(getDateProperty));
Map<Date, List<Comparable>> personsByDateProperty = (Map<Date, List<Comparable>>) Stream.of(people)
    .collect(Collectors.groupingByDate(getDateProperty).cast(Map<Date, List<Comparable>>.class));
```

##### `static groupingByDate(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Date, Object> personsByDateProperty = (Map<Date, Object>) Stream.of(people)
    .collect(Collectors.groupingByDate(
        getDateProperty,
        Collectors.toSet()
    ));
Map<Date, Set<Object>> personsByDateProperty = (Map<Date, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByDate(
        getDateProperty,
        Collectors.toSet()
    ).cast(Map<Date, Set<Object>>.class));
```

##### `static groupingByDate(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Date, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Date, Set<Object>> personsByDateProperty = (Map<Date, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByDate(
        getDateProperty,
        Supplier.of(Map<Date, Set<Object>>.class),
        Collectors.toSet()
    ));
```

---
### Grouping By Map<Datetime, ?> Collectors
##### `static groupingByDatetime(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Datetime, List<Object>>`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Datetime, List<Object>> personsByDatetimeProperty = (Map<Datetime, List<Object>>) Stream.of(people)
    .collect(Collectors.groupingByDatetime(getDatetimeProperty));
Map<Datetime, List<Comparable>> personsByDatetimeProperty = (Map<Datetime, List<Comparable>>) Stream.of(people)
    .collect(Collectors.groupingByDatetime(getDatetimeProperty).cast(Map<Datetime, List<Comparable>>.class));
```

##### `static groupingByDatetime(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Datetime, Object> personsByDatetimeProperty = (Map<Datetime, Object>) Stream.of(people)
    .collect(Collectors.groupingByDatetime(
        getDatetimeProperty,
        Collectors.toSet()
    ));
Map<Datetime, Set<Object>> personsByDatetimeProperty = (Map<Datetime, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByDatetime(
        getDatetimeProperty,
        Collectors.toSet()
    ).cast(Map<Datetime, Set<Object>>.class));
```

##### `static groupingByDatetime(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Datetime, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Datetime, Set<Object>> personsByDatetimeProperty = (Map<Datetime, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByDatetime(
        getDatetimeProperty,
        Supplier.of(Map<Datetime, Set<Object>>.class),
        Collectors.toSet()
    ));
```

---
### Grouping By Map<Time, ?> Collectors
##### `static groupingByTime(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Time, List<Object>>`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Time, List<Object>> personsByTimeProperty = (Map<Time, List<Object>>) Stream.of(people)
    .collect(Collectors.groupingByTime(getTimeProperty));
Map<Time, List<Comparable>> personsByTimeProperty = (Map<Time, List<Comparable>>) Stream.of(people)
    .collect(Collectors.groupingByTime(getTimeProperty).cast(Map<Time, List<Comparable>>.class));
```

##### `static groupingByTime(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Time, Object> personsByTimeProperty = (Map<Time, Object>) Stream.of(people)
    .collect(Collectors.groupingByTime(
        getTimeProperty,
        Collectors.toSet()
    ));
Map<Time, Set<Object>> personsByTimeProperty = (Map<Time, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByTime(
        getTimeProperty,
        Collectors.toSet()
    ).cast(Map<Time, Set<Object>>.class));
```

##### `static groupingByTime(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Time, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Time, Set<Object>> personsByTimeProperty = (Map<Time, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByTime(
        getTimeProperty,
        Supplier.of(Map<Time, Set<Object>>.class),
        Collectors.toSet()
    ));
```

---
### Grouping By Map<Integer, ?> Collectors
##### `static groupingByInt(IToIntFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Integer, List<Object>>`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Integer, List<Object>> personsByIntProperty = (Map<Integer, List<Object>>) Stream.of(people)
    .collect(Collectors.groupingByInt(getIntProperty));
Map<Integer, List<Comparable>> personsByIntProperty = (Map<Integer, List<Comparable>>) Stream.of(people)
    .collect(Collectors.groupingByInt(getIntProperty).cast(Map<Integer, List<Comparable>>.class));
```

##### `static groupingByInt(IToIntFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Integer, Object> personsByIntProperty = (Map<Integer, Object>) Stream.of(people)
    .collect(Collectors.groupingByInt(
        getIntProperty,
        Collectors.toSet()
    ));
Map<Integer, Set<Object>> personsByTimeProperty = (Map<Integer, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByInt(
        getIntProperty,
        Collectors.toSet()
    ).cast(Map<Integer, Set<Object>>.class));
```

##### `static groupingByInt(IToIntFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Integer, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Integer, Set<Object>> personsByIntProperty = (Map<Integer, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByInt(
        getIntProperty,
        Supplier.of(Map<Integer, Set<Object>>.class),
        Collectors.toSet()
    ));
```

---
### Grouping By Map<Long, ?> Collectors
##### `static groupingByLong(IToLongFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Long, List<Object>>`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Long, List<Object>> personsByLongProperty = (Map<Long, List<Object>>) Stream.of(people)
    .collect(Collectors.groupingByLong(getLongProperty));
Map<Long, List<Comparable>> personsByLongProperty = (Map<Long, List<Comparable>>) Stream.of(people)
    .collect(Collectors.groupingByLong(getLongProperty).cast(Map<Long, List<Comparable>>.class));
```

##### `static groupingByLong(IToLongFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Long, Object> personsByLongProperty = (Map<Long, Object>) Stream.of(people)
    .collect(Collectors.groupingByLong(
        getLongProperty,
        Collectors.toSet()
    ));
Map<Long, Set<Object>> personsByLongProperty = (Map<Long, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByLong(
        getLongProperty,
        Collectors.toSet()
    ).cast(Map<Long, Set<Object>>.class));
```

##### `static groupingByLong(IToLongFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Long, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Long, Set<Object>> personsByLongProperty = (Map<Long, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByLong(
        getLongProperty,
        Supplier.of(Map<Long, Set<Object>>.class),
        Collectors.toSet()
    ));
```

---
### Grouping By Map<Double, ?> Collectors
##### `static groupingByDouble(IToDoubleFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Double, List<Object>>`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Double, List<Object>> personsByDoubleProperty = (Map<Double, List<Object>>) Stream.of(people)
    .collect(Collectors.groupingByDouble(getDoubleProperty));
Map<Double, List<Comparable>> personsByDoubleProperty = (Map<Double, List<Comparable>>) Stream.of(people)
    .collect(Collectors.groupingByDouble(getDoubleProperty).cast(Map<Double, List<Comparable>>.class));
```

##### `static groupingByDouble(IToDoubleFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Double, Object> personsByDoubleProperty = (Map<Double, Object>) Stream.of(people)
    .collect(Collectors.groupingByDouble(
        getDoubleProperty,
        Collectors.toSet()
    ));
Map<Double, Set<Object>> personsByDoubleProperty = (Map<Double, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByDouble(
        getDoubleProperty,
        Collectors.toSet()
    ).cast(Map<Double, Set<Object>>.class));
```

##### `static groupingByDouble(IToDoubleFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Double, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Double, Set<Object>> personsByDoubleProperty = (Map<Double, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingByDouble(
        getDoubleProperty,
        Supplier.of(Map<Double, Set<Object>>.class),
        Collectors.toSet()
    ));
```

##### `static groupingBy(IFunction classifier)`

Returns a `Collector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Object, List<Object>>`. <p>The result container values type can be cast to a specific type using Collector.cast.</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as Collectors.groupingById, Collectors.groupingByString, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Object, List<Object>> personsByTimeProperty = (Map<Object, List<Object>>) Stream.of(people)
    .collect(Collectors.groupingBy(getTimeProperty));
Map<Object, List<Comparable>> personsByTimeProperty = (Map<Object, List<Comparable>>) Stream.of(people)
    .collect(Collectors.groupingBy(getTimeProperty).cast(Map<Object, List<Comparable>>.class));
```

##### `static groupingBy(IFunction classifier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. <p>The result container values type can be cast to a specific type using Collector.cast.</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as Collectors.groupingById, Collectors.groupingByString, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Object, Object> personsByTimeProperty = (Map<Object, Object>) Stream.of(people)
    .collect(Collectors.groupingBy(
        getTimeProperty,
        Collectors.toSet()
    ));
Map<Object, Set<Object>> personsByTimeProperty = (Map<Object, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingBy(
        getTimeProperty,
        Collectors.toSet()
    ).cast(Map<Object, Set<Object>>.class));
```

##### `static groupingBy(IFunction classifier, ISupplier mapSupplier, ICollector downstream)`

Returns a `Collector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` Collector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Object, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Object, Set<Object>> personsByTimeProperty = (Map<Object, Set<Object>>) Stream.of(people)
    .collect(Collectors.groupingBy(
        getTimeProperty,
        Supplier.of(Map<Object, Set<Object>>.class),
        Collectors.toSet()
    ));
```

---
### Partitioning By Collectors
##### `static partitioningBy(IPredicate predicate)`

Returns a `Collector` that partitions the SObject input arguments according to `predicate` and organizes them into a `Map<Boolean, Object>`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate that classifies input arguments (true or false)|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Map<Boolean, Object> personsPartitionedByPredicate = (Map<Boolean, Object>)
    Stream.of(people)
        .collect(Collectors.partitioningBy(predicate));
Map<Boolean, List<Comparable>> personsPartitionedByPredicate = (Map<Boolean, List<Comparable>>)
    Stream.of(people)
        .collect(Collectors.partitioningBy(predicate).cast(Map<Boolean, List<Comparable>>.class));
```

##### `static partitioningBy(IPredicate predicate, ICollector downstream)`

Returns a `Collector` that partitions the SObject input arguments according to `predicate` and organizes them into a `Map<Boolean, Object>`. <p>The result container values type can be cast to a specific type using Collector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate that classifies input arguments (true or false)|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` or `downstream` is null|

###### Example
```apex
Map<Boolean, Set<String>> personNamesPartitionedByPredicate = (Map<Boolean, Set<String>>)
    Stream.of(people)
        .collect(Collectors.partitioningBy(
            predicate,
            Collectors.toStringSet(getStringProperty)
        ).cast(Map<Boolean, Set<String>>.class));
```

---
### Joining
##### `static joining()`

Returns a `Collector` that concatenates String input arguments.

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Example
```apex
String concatenatedStrings = (String) Stream.of(strings).collect(Collectors.joining());
```

##### `static joining(String delimiter)`

Returns a `Collector` that concatenates String input arguments, separated by `delimiter`.

###### Parameters
|Param|Description|
|---|---|
|`delimiter`|the delimiter between each element|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `delimiter` is null|

###### Example
```apex
String concatenatedStrings = (String) Stream.of(strings).collect(Collectors.joining('; '));
```

##### `static joining(String delimiter, String prefix, String suffix)`

Returns a `Collector` that concatenates String input arguments, separated by `delimiter`.

###### Parameters
|Param|Description|
|---|---|
|`delimiter`|the delimiter between each element|
|`prefix`|the prefix|
|`suffix`|the suffix|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `delimiter`, `prefix` or `suffix` is null|

###### Example
```apex
String concatenatedStrings = (String) Stream.of(strings)
    .collect(Collectors.joining('; ', 'prefix', 'suffix'));
```

---
### Int Collectors
##### `static averagingInt(IToIntFunction mapper)`

Returns a `Collector` that returns the arithmetic mean of values returned by `mapper`. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function extracting the Integer value to average|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Double averageOfIntProperties = (Double) Stream.of(people)
    .collect(Collectors.averagingInt(getIntProperty));
```

##### `static counting()`

Returns a `Collector` that counts the number of input elements. If no elements are present, the result is 0.

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Example
```apex
Integer numberOfPeople = (Integer) Stream.of(people).collect(Collectors.counting());
```

##### `static summingInt(IToIntFunction mapper)`

Returns a `Collector` that returns the arithmetic sum of values returned by `mapper`. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function extracting the Integer value to sum|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Integer sumOfIntProperties = (Integer) Stream.of(people)
    .collect(Collectors.summingInt(getIntProperty));
```

---
### Long Collectors
##### `static averagingLong(IToLongFunction mapper)`

Returns a `Collector` that returns the arithmetic mean of values returned by `mapper`. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function extracting the Long value to average|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Double averageOfLongProperties = (Double) Stream.of(people)
    .collect(Collectors.averagingLong(getLongProperty));
```

##### `static summingLong(IToLongFunction mapper)`

Returns a `Collector` that returns the arithmetic sum of values returned by `mapper`. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function extracting the Long value to sum|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Long sumOfLongProperties = (Long) Stream.of(people)
    .collect(Collectors.summingLong(getLongProperty));
```

---
### Double Collectors
##### `static averagingDouble(IToDoubleFunction mapper)`

Returns a `Collector` that returns the arithmetic mean of values returned by `mapper`. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function extracting the Double value to average|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Double averageOfDoubleProperties = (Double) Stream.of(people)
    .collect(Collectors.averagingDouble(getDoubleProperty));
```

##### `static summingDouble(IToDoubleFunction mapper)`

Returns a `Collector` that returns the arithmetic sum of values returned by `mapper`. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function extracting the Double value to sum|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Double sumOfDoubleProperties = (Double) Stream.of(people)
    .collect(Collectors.summingDouble(getDoubleProperty));
```

---
### Intermediate Collectors
##### `static filtering(IPredicate predicate)`

Adapts a `Collector` to one accepting elements by applying `predicate` to each input element and only accumulating if it returns true.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate to test input arguments|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
// Get people matched by predicate
List<Object> filteredPeople = (List<Object>) Stream.of(people)
    .collect(Collectors.filtering(predicate));
// Group people matched by predicate
Map<String, List<Comparable>> filteredPeopleByStringProperty =
    (Map<String, List<Comparable>>) Stream.of(people)
       .collect(
            Collectors.groupingByString(
                getStringProperty,
                Collectors.filtering(predicate)
       ).cast(Map<String, List<Comparable>>.class));
```

##### `static filtering(IPredicate predicate, ICollector downstream)`

Adapts a `Collector` to one accepting elements by applying `predicate` to each input element and only accumulating if it returns true.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate to test input arguments|
|`downstream`|the collector that accumulates only matched values|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
// Get people String properties matched by predicate
List<String> filteredStringProperties = (List<String>) Stream.of(people)
    .collect(Collectors.filtering(
        predicate,
        Collectors.toList(getStringProperty)
    ).cast(List<String>.class));
```

##### `static mapping(IFunction mapper)`

Adapts a `Collector` to one accepting elements by applying `mapper` function to each input element before accumulation.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function to return the value to accumulate|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<String> accountNames = (List<String>)
    Stream.of(people)
        .collect(Collectors.mapping(getStringProperty).cast(List<String>.class));
```

##### `static mapping(IFunction mapper, ICollector downstream)`

Adapts a `Collector` to one accepting elements by applying `mapper` function to each input element before accumulation.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function to return the value to accumulate|
|`downstream`|the collector which accepts mapped values|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `downstream` is null|

###### Example
```apex
Map<String, Set<String>> otherStringPropertiesByStringProperty = (Map<String, Set<String>>)
    Stream.of(people)
        .collect(Collectors.groupingByString(
            getStringProperty,
            Collectors.mapping(
                getOtherStringProperty,
                Collectors.toStringSet()
            )
        ).cast(Map<String, Set<String>>.class));
```

##### `static flatMapping(IFunction mapper)`

Adapts a `Collector` to one accepting elements as a result of replacing each input element with the contents of a mapped iterable created by applying the specified `mapper` function to each element before accumulation.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function which must produce `Iterable<Object>`|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `downstream` is null|

###### Example
```apex
List<String> flattenedStringProperties = (List<String>) Stream.of(people)
    .collect(Collectors.flatMapping(getStringListProperty).cast(List<String>.class));
Map<String, List<String>> flattenedStringPropertiesByOtherStringProperty
    = (Map<String, List<String>>) Stream.of(people)
        .collect(Collectors.groupingByString(
            getOtherStringProperty,
            Collectors.flatMapping(getStringListProperty)
        ).cast(Map<String, List<String>>.class));
```

##### `static flatMapping(IFunction mapper, ICollector downstream)`

Adapts a `Collector` to one accepting elements as a result of replacing each input element with the contents of a mapped iterable created by applying the specified `mapper` function to each element before accumulation.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function which must produce `Iterable<Object>`|
|`downstream`|the collector which accepts mapped values|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `downstream` is null|

###### Example
```apex
Set<String> contacts = (Set<String>) Stream.of(people)
    .collect(Collectors.flatMapping(
        getStringListProperty,
        Collectors.toStringSet()
    ));
Map<String, Set<String>> flattenedStringPropertiesByOtherStringProperty
   = (Map<String, Set<String>>) Stream.of(people)
        .collect(Collectors.groupingByString(
            getOtherStringProperty,
            Collectors.flatMapping(
                getStringListProperty,
                Collectors.toStringSet()
        )).cast(Map<String, Set<String>>.class));
```

##### `static reducing(Object identity, IBinaryOperator accumulator)`

Returns a `Collector` which performs a reduction of its input elements under `accumulator` using `identity`.

###### Parameters
|Param|Description|
|---|---|
|`identity`|the identity value for the reduction|
|`accumulator`|the input arguments reducer|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
Person personWithSummedIntProperties = (Person) Stream.of(people)
    .collect(Collectors.reducing(
        new Person(IntProperty = 0),
        sumIntPropertyReducer
     ));
```

##### `static reducing(Object identity, IFunction mapper, IBinaryOperator accumulator)`

Returns a `Collector` which performs a reduction of its input elements under `mapper` function and `accumulator`.

###### Parameters
|Param|Description|
|---|---|
|`identity`|the identity value for the reduction|
|`mapper`|the function to return the value to accumulate|
|`accumulator`|the input arguments reducer|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `accumulator` is null|

###### Example
```apex
Person personWithSummedIntProperties = (Person) Stream.of(people)
    .collect(Collectors.reducing(
        new Person(IntProperty = 0),
        Function.identity(),
        sumIntPropertyReducer
     ));
```

---
### Optional Collectors
##### `static reducing(IBinaryOperator accumulator)`

Returns a `Collector` which performs a reduction of its input elements under `accumulator`. The result is described as an `Optional`. <p>The result container <strong>cannot</strong> be cast to a specific `Optional`.</p>

###### Parameters
|Param|Description|
|---|---|
|`accumulator`|the input arguments reducer|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
Map<String, Object> optionalPersonWithMaxIntPropertyByStringProperty = (Map<String, Object>)
    Stream.of(people)
        .collect(Collectors.groupingByString(
            getStringProperty,
            Collectors.reducing(BinaryOperator.maxBy(Comparator.comparing(getIntProperty)))
        ));
Person personWithMaxIntProperty = (Person)
    optionalPersonWithMaxIntPropertyByStringProperty.get('SomePropertyValues').get();
```

##### `static maximizing(IComparator comparator)`

Returns a `Collector` which produces the maximal element according to `comparator`. The result is described as an `Optional`. <p>The result container <strong>cannot</strong> be cast to a specific `Optional`.</p>

###### Parameters
|Param|Description|
|---|---|
|`comparator`|the comparator|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `comparator` is null|

###### Example
```apex
Map<String, Object> optionalPersonWithMaxIntPropertyByStringProperty = (Map<String, Object>)
    Stream.of(people)
        .collect(Collectors.groupingByString(
            getStringProperty,
            Collectors.maximizing(Comparator.comparing(getIntProperty))
        ));
Person personWithMaxIntProperty = (Person)
    optionalPersonWithMaxIntPropertyByStringProperty.get('SomePropertyValues').get();
```

##### `static minimizing(IComparator comparator)`

Returns a `Collector` which produces the minimal element according to `comparator`. The result is described as an `Optional`. <p>The result container <strong>cannot</strong> be cast to a specific `Optional`.</p>

###### Parameters
|Param|Description|
|---|---|
|`comparator`|the comparator|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `comparator` is null|

###### Example
```apex
Map<String, Object> optionalPersonWithMinIntPropertyByStringProperty = (Map<String, Object>)
    Stream.of(people)
        .collect(Collectors.groupingByString(
            getStringProperty,
            Collectors.minimizing(Comparator.comparing(getIntProperty))
        ));
Person personWithMaxIntProperty = (Person)
    optionalPersonWithMinIntPropertyByStringProperty.get('SomePropertyValues').get();
```

---
