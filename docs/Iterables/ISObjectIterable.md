# ISObjectIterable

`APIVERSION: 54`

`STATUS: ACTIVE`

A sequence of `SObject` elements supporting aggregate operations.


**Author** O. Berehovskyi


**Group** Iterables


**See** [IObjectIterable](/docs/Iterables/IObjectIterable.md)


**See** [IIntIterable](/docs/Iterables/IIntIterable.md)


**See** [ILongIterable](/docs/Iterables/ILongIterable.md)


**See** [IDoubleIterable](/docs/Iterables/IDoubleIterable.md)

## Methods
### `union(Iterable<SObject> iterable, String fieldName)`

Returns a new `ISObjectIterable` as a set union of the current and another iterables according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`fieldName`|the field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `union(Iterable<SObject> iterable, SObjectField field)`

Returns a new `ISObjectIterable` as a set union of the current and another iterables according to `field`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `intersect(Iterable<SObject> iterable, String fieldName)`

Returns a new `ISObjectIterable` as a set intersection of the current and another iterables according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`fieldName`|the field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `intersect(Iterable<SObject> iterable, SObjectField field)`

Returns a new `ISObjectIterable` as a set intersection of the current and another iterables according to `field`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `except(Iterable<SObject> iterable, String fieldName)`

Returns a new `ISObjectIterable` as a set difference of the current and another iterables according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`fieldName`|the field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `except(Iterable<SObject> iterable, SObjectField field)`

Returns a new `ISObjectIterable` as a set difference of the current and another iterables according to `field`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `distinct(String fieldName)`

Returns a new `ISObjectIterable` with distinct `SObject` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `distinct(SObjectField field)`

Returns a new `ISObjectIterable` with distinct `SObject` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `filter(String fieldName, Object value)`

Returns a new `ISObjectIterable` with `SObject` elements that have field&apos;s value. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the value|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `filter(SObjectField field, Object value)`

Returns a new `ISObjectIterable` with `SObject` elements that have field&apos;s value. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `take(String fieldName, Object value)`

Returns a new `ISObjectIterable` that takes `SObject` elements while `fieldName` equals to `value`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the value|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `take(SObjectField field, Object value)`

Returns a new `ISObjectIterable` that takes `SObject` elements while `field` equals to `value`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `drop(String fieldName, Object value)`

Returns a new `ISObjectIterable` that drops `SObject` elements while `fieldName` equals to `value`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the value|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `drop(SObjectField field, Object value)`

Returns a new `ISObjectIterable` that drops `SObject` elements while `field` equals to `value`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `mapTo(String fieldName)`

Returns a new `ISObjectIterable` with `SObject` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the parent reference field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `mapTo(SObjectField field)`

Returns a new `ISObjectIterable` with `SObject` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the parent reference field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `mapToInt(String fieldName)`

Returns a new `IIntIterable` with `Integer` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `mapToInt(SObjectField field)`

Returns a new `IIntIterable` with `Integer` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `mapToLong(String fieldName)`

Returns a new `ILongIterable` with `Long` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

### `mapToLong(SObjectField field)`

Returns a new `ILongIterable` with `Long` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

### `mapToDouble(String fieldName)`

Returns a new `IDoubleIterable` with `Double` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `mapToDouble(SObjectField field)`

Returns a new `ILongIterable` with `Double` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `mapToObject(String fieldName)`

Returns a new `IObjectIterable` with `Object` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `mapToObject(SObjectField field)`

Returns a new `IObjectIterable` with `Object` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `flatMapTo(String fieldName)`

Returns a new `IObjectIterable` with `SObject` elements as a result of replacing each element with the contents of a mapped iterable according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the child relationship field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `flatMapTo(SObjectField field)`

Returns a new `IObjectIterable` with `SObject` elements as a result of replacing each element with the contents of a mapped iterable according to `childRelationshipField`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the child relationship field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `forEach(String fieldName, Object value)`

Returns a new `ISObjectIterable` after setting `value` for `fieldName` on each `SObject` element. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the value|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `forEach(SObjectField field, Object value)`

Returns a new `ISObjectIterable` after setting `value` for `field` on each `SObject` element. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `sort(SortOrder order)`

Returns a new `ISObjectIterable` with sorted `SObject` elements considering `order`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `sort(String fieldName)`

Returns a new `ISObjectIterable` with sorted `SObject` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `sort(String fieldName, SortOrder order)`

Returns a new `ISObjectIterable` with sorted `SObject` elements taken from `fieldName` values considering `order`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`order`|the sort order|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `sort(SObjectField field)`

Returns a new `ISObjectIterable` with sorted `SObject` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `sort(SObjectField field, SortOrder order)`

Returns a new `ISObjectIterable` with sorted `SObject` elements taken from `field` values considering `order`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`order`|the sort order|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `find(String fieldName, Object value)`

Returns an `OptionalSObject` describing the first element which has `value` of `fieldName`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the field value|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject`

### `find(SObjectField field, Object value)`

Returns an `OptionalSObject` describing the first element which has `value` of `field`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the field value|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject`

### `every(String fieldName, Object value)`

Returns whether all `SObject` elements have `field` `value`. If `ISObjectIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the field value|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `every(SObjectField field, Object value)`

Returns whether all `SObject` elements have `field` `value`. If `ISObjectIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the field value|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `some(String fieldName, Object value)`

Returns whether some `SObject` element has `field` `value`. If `ISObjectIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the field value|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `some(SObjectField field, Object value)`

Returns whether some `SObject` element has `field` `value`. If `ISObjectIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the field value|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `none(String fieldName, Object value)`

Returns whether no `SObject` elements have `field` `value`. If `ISObjectIterable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the field value|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `none(SObjectField field, Object value)`

Returns whether no `SObject` elements have `field` `value`. If `ISObjectIterable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the field value|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `max(String fieldName)`

Returns an `OptionalSObject` describing the maximum `SObject` element according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject` describing the result

### `max(SObjectField field)`

Returns an `OptionalSObject` describing the maximum `SObject` element according to `field`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject` describing the result

### `min(String fieldName)`

Returns an `OptionalSObject` describing the minimum `SObject` element according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject` describing the result

### `min(SObjectField field)`

Returns an `OptionalSObject` describing the minimum `SObject` element according to `field`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject` describing the result

### `sum(String fieldName)`

Returns the arithmetic sum of field values of `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field to sum values|

#### Return

**Type**

Double

**Description**

the sum of field values

### `sum(SObjectField field)`

Returns the arithmetic sum of field values of `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field to sum values|

#### Return

**Type**

Double

**Description**

field sum of field values

### `avg(String fieldName)`

Returns the arithmetic mean of field values of `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field to sum values|

#### Return

**Type**

OptionalDouble

**Description**

the arithmetic mean of field values

### `avg(SObjectField field)`

Returns the arithmetic mean of field values of `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field to sum values|

#### Return

**Type**

OptionalDouble

**Description**

field arithmetic mean of field values

### `toList(ISObjectFunction mapper)`

Accumulates elements returned by `mapper` into a `List<Object>`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Return

**Type**

List<Object>

**Description**

the `List<Object>` containing the collected elements

### `toList(String fieldName)`

Accumulates `Object` elements into a `List<Object>` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

List<Object>

**Description**

the `List<Object>` containing the collected elements

### `toList(SObjectField field)`

Accumulates `Object` elements into a `List<Object>` according to `field`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

List<Object>

**Description**

the `List<Object>` containing the collected elements

### `toList(ISObjectFunction mapper, Type listType)`

Accumulates elements returned by `mapper` into a `List<?>` of specific `listType`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|
|`listType`|result type|

#### Return

**Type**

List<Object>

**Description**

the `List<Object>` containing the collected elements, which can be cast to `listType`

### `toList(String fieldName, Type listType)`

Accumulates `Object` elements into a `List<?>` of specific `listType` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`listType`|result type|

#### Return

**Type**

List<Object>

**Description**

the `List<Object>` containing the collected elements, which can be cast to `listType`

### `toList(SObjectField field, Type listType)`

Accumulates `Object` elements into a `List<?>` of specific `listType` according to `field`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`listType`|result type|

#### Return

**Type**

List<Object>

**Description**

the `List<Object>` containing the collected elements, which can be cast to `listType`

### `toSet(ISObjectFunction mapper)`

Accumulates `Object` elements returned by `mapper` into a `Set<Object>`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Return

**Type**

Set<Object>

**Description**

the `Set<Object>` containing the collected elements

### `toSet(String fieldName)`

Accumulates `Object` elements into a `Set<Object>` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

Set<Object>

**Description**

the `Set<Object>` containing the collected elements

### `toSet(SObjectField field)`

Accumulates `Object` elements into a `Set<Object>` according to `field`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

Set<Object>

**Description**

the `Set<Object>` containing the collected elements

### `toIdSet()`

Accumulates `Id` elements into a `Set<Id>`. <p>Terminal Operation.</p>

#### Return

**Type**

Set<Id>

**Description**

the `Set<Id>` containing the collected elements

### `toIdSet(ISObjectFunction mapper)`

Accumulates `Id` elements returned by `mapper` into a `Set<Id>`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Return

**Type**

Set<Id>

**Description**

the `Set<Id>` containing the collected elements

### `toIdSet(String fieldName)`

Accumulates `Id` elements into a `Set<Id>` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

Set<Id>

**Description**

the `Set<Id>` containing the collected elements

### `toIdSet(SObjectField field)`

Accumulates `Id` elements into a `Set<Id>` according to `field`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

Set<Id>

**Description**

the `Set<Id>` containing the collected elements

### `toStringSet(ISObjectFunction mapper)`

Accumulates `String` elements returned by `mapper` into a `Set<String>`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Return

**Type**

Set<String>

**Description**

the `Set<String>` containing the collected elements

### `toStringSet(String fieldName)`

Accumulates `String` elements into a `Set<String>` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

Set<String>

**Description**

the `Set<String>` containing the collected elements

### `toStringSet(SObjectField field)`

Accumulates `String` elements into a `Set<String>` according to `field`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

Set<String>

**Description**

the `Set<String>`containing the collected elements

### `toMap()`

Accumulates `SObject` elements into a `Map<Id, SObject>`. <p>Terminal Operation.</p>

#### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>` containing the iterable elements

### `toByIdMap(ISObjectFunction keyMapper, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType` whose keys are produced by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`mapType`|result type|

#### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>` containing the collected elements, which can be cast to `mapType`

### `toByIdMap(String fieldName, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`mapType`|result type|

#### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>` containing the collected elements, which can be cast to `mapType`

### `toByIdMap(SObjectField field, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`mapType`|result type|

#### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>` containing the collected elements, which can be cast to `mapType`

### `toByStringMap(ISObjectFunction keyMapper, Type mapType)`

Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType` whose keys are produced by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`mapType`|result type|

#### Return

**Type**

Map<String,SObject>

**Description**

the `Map<String, SObject>` containing the collected elements, which can be cast to `mapType`

### `toByStringMap(String fieldName, Type mapType)`

Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`mapType`|result type|

#### Return

**Type**

Map<String,SObject>

**Description**

the `Map<String, SObject>` containing the collected elements, which can be cast to `mapType`

### `toByStringMap(SObjectField field, Type mapType)`

Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`mapType`|result type|

#### Return

**Type**

Map<String,SObject>

**Description**

the `Map<String, SObject>` containing the collected elements, which can be cast to `mapType`

### `groupById(ISObjectFunction keyMapper)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are values returned by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|

#### Return

**Type**

Map<Id,List<SObject>>

**Description**

the `Map<Id, List<SObject>>` containing the iterable elements

### `groupById(String fieldName)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

Map<Id,List<SObject>>

**Description**

the `Map<Id, List<SObject>>` containing the collected elements

### `groupById(SObjectField field)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

Map<Id,List<SObject>>

**Description**

the `Map<Id, List<SObject>>` containing the grouped elements

### `groupByString(ISObjectFunction keyMapper)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are values returned by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|

#### Return

**Type**

Map<String,List<SObject>>

**Description**

the `Map<String, List<SObject>>` containing the grouped elements

### `groupByString(String fieldName)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

Map<String,List<SObject>>

**Description**

the `Map<String, List<SObject>>` containing the grouped elements

### `groupByString(SObjectField field)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

Map<String,List<SObject>>

**Description**

the `Map<String, List<SObject>>` containing the grouped elements

### `partition(ISObjectPredicate predicate)`

Partition `SObject` elements by `predicate`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

Map<Boolean,List<SObject>>

**Description**

the `Map<Boolean, List<SObject>>` containing the partitioned elements

### `partition(String fieldName, Object value)`

Partition `SObject` elements by `fieldName` having `value`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the satisfying value|

#### Return

**Type**

Map<Boolean,List<SObject>>

**Description**

the `Map<Boolean, List<SObject>>` containing the partitioned elements

### `partition(SObjectField field, Object value)`

Partition `SObject` elements by `field` having `value`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Return

**Type**

Map<Boolean,List<SObject>>

**Description**

the `Map<Boolean, List<SObject>>` containing the partitioned elements

---
