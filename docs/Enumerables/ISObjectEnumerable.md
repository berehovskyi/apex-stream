# ISObjectEnumerable

`APIVERSION: 58`

`STATUS: ACTIVE`

A sequence of `SObject` elements supporting aggregate operations.


**Extended types**

[IEnumerable<SObject>](IEnumerable<SObject>)

**See** [IObjectEnumerable](/docs/Enumerables/IObjectEnumerable.md)


**See** [IIntEnumerable](/docs/Enumerables/IIntEnumerable.md)


**See** [ILongEnumerable](/docs/Enumerables/ILongEnumerable.md)


**See** [IDoubleEnumerable](/docs/Enumerables/IDoubleEnumerable.md)


**Author** Oleh Berehovskyi


**Group** Enumerables

## Methods
### `public Iterator<SObject> iterator()`

Returns an instance of an iterator for this enumerable. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Iterator<SObject>`|the iterator|

### `public ISObjectEnumerable union(Iterable<SObject> iterable, String fieldName)`

Returns a new `ISObjectIterable` as a set union of the current and another iterables according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable union(Iterable<SObject> iterable, SObjectField field)`

Returns a new `ISObjectIterable` as a set union of the current and another iterables according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable intersect(Iterable<SObject> iterable, String fieldName)`

Returns a new `ISObjectIterable` as a set intersection of the current and another iterables according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable intersect(Iterable<SObject> iterable, SObjectField field)`

Returns a new `ISObjectIterable` as a set intersection of the current and another iterables according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable except(Iterable<SObject> iterable, String fieldName)`

Returns a new `ISObjectIterable` as a set difference of the current and another iterables according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable except(Iterable<SObject> iterable, SObjectField field)`

Returns a new `ISObjectIterable` as a set difference of the current and another iterables according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable distinct(String fieldName)`

Returns a new `ISObjectIterable` with distinct `SObject` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable distinct(SObjectField field)`

Returns a new `ISObjectIterable` with distinct `SObject` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable filter(String fieldName, Object value)`

Returns a new `ISObjectIterable` with `SObject` elements that have field's value. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable filter(SObjectField field, Object value)`

Returns a new `ISObjectIterable` with `SObject` elements that have field's value. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable take(String fieldName, Object value)`

Returns a new `ISObjectIterable` that takes `SObject` elements while `fieldName` equals to `value`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable take(SObjectField field, Object value)`

Returns a new `ISObjectIterable` that takes `SObject` elements while `field` equals to `value`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable drop(String fieldName, Object value)`

Returns a new `ISObjectIterable` that drops `SObject` elements while `fieldName` equals to `value`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable drop(SObjectField field, Object value)`

Returns a new `ISObjectIterable` that drops `SObject` elements while `field` equals to `value`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable mapTo(String fieldName)`

Returns a new `ISObjectIterable` with `SObject` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the parent reference field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable mapTo(SObjectField field)`

Returns a new `ISObjectIterable` with `SObject` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the parent reference field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public IIntEnumerable mapToInt(IFunction mapper)`

Returns a new `IIntEnumerable` with `Integer` elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public IIntEnumerable mapToInt(String fieldName)`

Returns a new `IIntIterable` with `Integer` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntIterable`|

### `public IIntEnumerable mapToInt(SObjectField field)`

Returns a new `IIntIterable` with `Integer` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntIterable`|

### `public ILongEnumerable mapToLong(IFunction mapper)`

Returns a new `ILongEnumerable` with `Long` elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public ILongEnumerable mapToLong(String fieldName)`

Returns a new `ILongIterable` with `Long` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongIterable`|

### `public ILongEnumerable mapToLong(SObjectField field)`

Returns a new `ILongIterable` with `Long` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongIterable`|

### `public IDoubleEnumerable mapToDouble(IFunction mapper)`

Returns a new `IDoubleEnumerable` with `Double` elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IDoubleEnumerable mapToDouble(String fieldName)`

Returns a new `IDoubleIterable` with `Double` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleIterable`|

### `public IDoubleEnumerable mapToDouble(SObjectField field)`

Returns a new `ILongIterable` with `Double` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleIterable`|

### `public IObjectEnumerable mapToObject(IFunction mapper)`

Returns a new `IObjectEnumerable` with `Object` elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable mapToObject(String fieldName)`

Returns a new `IObjectIterable` with `Object` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectIterable`|

### `public IObjectEnumerable mapToObject(SObjectField field)`

Returns a new `IObjectIterable` with `Object` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectIterable`|

### `public ISObjectEnumerable flatMapTo(String fieldName)`

Returns a new `IObjectIterable` with `SObject` elements as a result of replacing each element with the contents of a mapped iterable according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the child relationship field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable flatMapTo(SObjectField field)`

Returns a new `IObjectIterable` with `SObject` elements as a result of replacing each element with the contents of a mapped iterable according to `childRelationshipField`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the child relationship field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public IIntEnumerable flatMapToInt(IFunction mapper)`

Returns a new `IIntEnumerable` with `Integer` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Integer>`|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public ILongEnumerable flatMapToLong(IFunction mapper)`

Returns a new `ILongEnumerable` with `Long` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Long>`|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public IDoubleEnumerable flatMapToDouble(IFunction mapper)`

Returns a new `IDoubleEnumerable` with `Double` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Double>`|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IObjectEnumerable flatMapToObject(IFunction mapper)`

Returns a new `IObjectIterable` with `Object` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Object>`|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectIterable`|

### `public ISObjectEnumerable forEach(String fieldName, Object value)`

Returns a new `ISObjectIterable` after setting `value` for `fieldName` on each `SObject` element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable forEach(SObjectField field, Object value)`

Returns a new `ISObjectIterable` after setting `value` for `field` on each `SObject` element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable sort(String fieldName)`

Returns a new `ISObjectIterable` with sorted `SObject` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable sort(String fieldName, SortOrder order)`

Returns a new `ISObjectIterable` with sorted `SObject` elements taken from `fieldName` values considering `order`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`order`|the sort order|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable sort(SObjectField field)`

Returns a new `ISObjectIterable` with sorted `SObject` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public ISObjectEnumerable sort(SObjectField field, SortOrder order)`

Returns a new `ISObjectIterable` with sorted `SObject` elements taken from `field` values considering `order`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`order`|the sort order|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public SObject reduce(SObject identity, IBiOperator accumulator)`

Performs a reduction on `SObject` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`SObject`|the `SObject` result of the reduction|

### `public Optional find(String fieldName, Object value)`

Returns an `Optional` describing the first element which has `value` of `fieldName`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the field value|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional`|

### `public Optional find(SObjectField field, Object value)`

Returns an `Optional` describing the first element which has `value` of `field`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the field value|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional`|

### `public Boolean every(String fieldName, Object value)`

Returns whether all `SObject` elements have `field` `value`. If `ISObjectIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the field value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean every(SObjectField field, Object value)`

Returns whether all `SObject` elements have `field` `value`. If `ISObjectIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the field value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean some(String fieldName, Object value)`

Returns whether some `SObject` element has `field` `value`. If `ISObjectIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the field value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean some(SObjectField field, Object value)`

Returns whether some `SObject` element has `field` `value`. If `ISObjectIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the field value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean none(String fieldName, Object value)`

Returns whether no `SObject` elements have `field` `value`. If `ISObjectIterable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the field value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean none(SObjectField field, Object value)`

Returns whether no `SObject` elements have `field` `value`. If `ISObjectIterable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the field value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Optional max(String fieldName)`

Returns an `Optional` describing the maximum `SObject` element according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` describing the result|

### `public Optional max(SObjectField field)`

Returns an `Optional` describing the maximum `SObject` element according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` describing the result|

### `public Optional min(String fieldName)`

Returns an `Optional` describing the minimum `SObject` element according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` describing the result|

### `public Optional min(SObjectField field)`

Returns an `Optional` describing the minimum `SObject` element according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` describing the result|

### `public Double sum(String fieldName)`

Returns the arithmetic sum of field values of `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field to sum values|

#### Returns

|Type|Description|
|---|---|
|`Double`|the sum of field values|

### `public Double sum(SObjectField field)`

Returns the arithmetic sum of field values of `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field to sum values|

#### Returns

|Type|Description|
|---|---|
|`Double`|field sum of field values|

### `public Optional avg(String fieldName)`

Returns the arithmetic mean of field values of `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field to sum values|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the arithmetic mean of field values|

### `public Optional avg(SObjectField field)`

Returns the arithmetic mean of field values of `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field to sum values|

#### Returns

|Type|Description|
|---|---|
|`Optional`|field arithmetic mean of field values|

### `public List<Object> toList(IFunction mapper)`

Accumulates elements returned by `mapper` into a `List<Object>`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the collected elements|

### `public List<Object> toList(String fieldName)`

Accumulates `Object` elements into a `List<Object>` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the collected elements|

### `public List<Object> toList(SObjectField field)`

Accumulates `Object` elements into a `List<Object>` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the collected elements|

### `public List<Object> toList(IFunction mapper, Type elementType)`

Accumulates elements returned by `mapper` into a `List<?>` of specific `elementType`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|
|`elementType`|result type|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the collected elements, which can be cast to `elementType`|

### `public List<Object> toList(String fieldName, Type listType)`

Accumulates `Object` elements into a `List<?>` of specific `listType` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`listType`|result type|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the collected elements, which can be cast to `listType`|

### `public List<Object> toList(SObjectField field, Type listType)`

Accumulates `Object` elements into a `List<?>` of specific `listType` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`listType`|result type|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the collected elements, which can be cast to `listType`|

### `public Object toSet(IFunction mapper)`

Accumulates `Object` elements returned by `mapper` into a `Set<?>`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`Object`|the `Set<?>` containing the collected elements|

### `public Object toSet(String fieldName)`

Accumulates `Object` elements into a `Set<?>` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`Object`|the `Set<?>` containing the collected elements|

### `public Object toSet(SObjectField field)`

Accumulates `Object` elements into a `Set<?>` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Object`|the `Set<?>` containing the collected elements|

### `public Set<Id> toIdSet()`

Accumulates `Id` elements into a `Set<Id>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Set<Id>`|the `Set<Id>` containing the collected elements|

### `public Set<Id> toIdSet(IFunction mapper)`

Accumulates `Id` elements returned by `mapper` into a `Set<Id>`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`Set<Id>`|the `Set<Id>` containing the collected elements|

### `public Set<Id> toIdSet(String fieldName)`

Accumulates `Id` elements into a `Set<Id>` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`Set<Id>`|the `Set<Id>` containing the collected elements|

### `public Set<Id> toIdSet(SObjectField field)`

Accumulates `Id` elements into a `Set<Id>` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Set<Id>`|the `Set<Id>` containing the collected elements|

### `public Set<String> toStringSet(IFunction mapper)`

Accumulates `String` elements returned by `mapper` into a `Set<String>`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`Set<String>`|the `Set<String>` containing the collected elements|

### `public Set<String> toStringSet(String fieldName)`

Accumulates `String` elements into a `Set<String>` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`Set<String>`|the `Set<String>` containing the collected elements|

### `public Set<String> toStringSet(SObjectField field)`

Accumulates `String` elements into a `Set<String>` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Set<String>`|the `Set<String>`containing the collected elements|

### `public Map<Id,SObject> toMap()`

Accumulates `SObject` elements into a `Map<Id, SObject>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Map<Id,SObject>`|the `Map<Id, SObject>` containing the iterable elements|

### `public Map<Id,SObject> toByIdMap(IFunction keyMapper, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType` whose keys are produced by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`mapType`|result type|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,SObject>`|the `Map<Id, SObject>` containing the collected elements, which can be cast to `mapType`|

### `public Map<Id,SObject> toByIdMap(String fieldName, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`mapType`|result type|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,SObject>`|the `Map<Id, SObject>` containing the collected elements, which can be cast to `mapType`|

### `public Map<Id,SObject> toByIdMap(SObjectField field, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`mapType`|result type|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,SObject>`|the `Map<Id, SObject>` containing the collected elements, which can be cast to `mapType`|

### `public Map<String,SObject> toByStringMap(IFunction keyMapper, Type mapType)`

Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType` whose keys are produced by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`mapType`|result type|

#### Returns

|Type|Description|
|---|---|
|`Map<String,SObject>`|the `Map<String, SObject>` containing the collected elements, which can be cast to `mapType`|

### `public Map<String,SObject> toByStringMap(String fieldName, Type mapType)`

Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`mapType`|result type|

#### Returns

|Type|Description|
|---|---|
|`Map<String,SObject>`|the `Map<String, SObject>` containing the collected elements, which can be cast to `mapType`|

### `public Map<String,SObject> toByStringMap(SObjectField field, Type mapType)`

Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`mapType`|result type|

#### Returns

|Type|Description|
|---|---|
|`Map<String,SObject>`|the `Map<String, SObject>` containing the collected elements, which can be cast to `mapType`|

### `public Map<Id,List<SObject>> groupById(IFunction keyMapper)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are values returned by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,List<SObject>>`|the `Map<Id, List<SObject>>` containing the iterable elements|

### `public Map<Id,List<SObject>> groupById(String fieldName)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,List<SObject>>`|the `Map<Id, List<SObject>>` containing the collected elements|

### `public Map<Id,List<SObject>> groupById(SObjectField field)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,List<SObject>>`|the `Map<Id, List<SObject>>` containing the grouped elements|

### `public Map<String,List<SObject>> groupByString(IFunction keyMapper)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are values returned by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|

#### Returns

|Type|Description|
|---|---|
|`Map<String,List<SObject>>`|the `Map<String, List<SObject>>` containing the grouped elements|

### `public Map<String,List<SObject>> groupByString(String fieldName)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`Map<String,List<SObject>>`|the `Map<String, List<SObject>>` containing the grouped elements|

### `public Map<String,List<SObject>> groupByString(SObjectField field)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Map<String,List<SObject>>`|the `Map<String, List<SObject>>` containing the grouped elements|

### `public Map<Boolean,List<SObject>> partition(IPredicate predicate)`

Partition `SObject` elements by `predicate`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Map<Boolean,List<SObject>>`|the `Map<Boolean, List<SObject>>` containing the partitioned elements|

### `public Map<Boolean,List<SObject>> partition(String fieldName, Object value)`

Partition `SObject` elements by `fieldName` having `value`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`Map<Boolean,List<SObject>>`|the `Map<Boolean, List<SObject>>` containing the partitioned elements|

### `public Map<Boolean,List<SObject>> partition(SObjectField field, Object value)`

Partition `SObject` elements by `field` having `value`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`Map<Boolean,List<SObject>>`|the `Map<Boolean, List<SObject>>` containing the partitioned elements|

---
