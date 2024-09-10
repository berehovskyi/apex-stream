# virtual BaseCollectors

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides base implementations of [Collector](/docs/Functional-Abstract-Classes/Collector.md)
and related utilities that are used by [IEnumerable](IEnumerable).


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static Collector toList()`

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
