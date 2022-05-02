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
### `append(ISObjectIterable iterable)`

Returns a new `ISObjectIterable` from the current to which another `iterable` is appended. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `prepend(ISObjectIterable iterable)`

Returns a new `ISObjectIterable` from the current to which another `iterable` is prepended. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `filter(ISObjectPredicate predicate)`

Returns a new `ISObjectIterable` with `SObject` elements that match `predicate`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

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

### `take(ISObjectPredicate predicate)`

Returns a new `ISObjectIterable` that takes `SObject` elements while `predicate` returns `true`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

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

### `drop(ISObjectPredicate predicate)`

Returns a new `ISObjectIterable` that drops `SObject` elements while `predicate` returns `true`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

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

### `withoutNulls()`

Returns a new `ISObjectIterable` without null elements. <p>Intermediate Operation.</p>

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `mapTo(ISObjectUnaryOperator mapper)`

Returns a new `ISObjectIterable` with `SObject` elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping operator|

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
|`fieldName`|the field value to be set for new SObject|

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
|`field`|the field value to be set for new SObject|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `mapToInt(ISObjectToIntFunction mapper)`

Returns a new `IIntIterable` with `Integer` elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

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

### `mapToLong(ISObjectToLongFunction mapper)`

Returns a new `ILongIterable` with `Long` elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

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

### `mapToDouble(ISObjectToDoubleFunction mapper)`

Returns a new `IDoubleIterable` with `Double` elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

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

### `mapToObject(ISObjectFunction mapper)`

Returns a new `IObjectIterable` with `Object` elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

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

### `forEach(ISObjectConsumer consumer)`

Returns a new `ISObjectIterable` after performing `consumer` action on each `SObject` element. <p>Intermediate Interfering Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`consumer`|the action|

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

### `distinct()`

Returns a new `ISObjectIterable` with distinct `SObject` elements. <p>Intermediate Operation.</p>

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `distinct(ISObjectFunction classifier)`

Returns a new `ISObjectIterable` with distinct `SObject` elements according to `classifier` function. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`classifier`|the classifier function|

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

### `sort()`

Returns a new `ISObjectIterable` with sorted `SObject` elements in ascending order. <p>Intermediate Operation.</p>

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

### `sort(ISObjectComparator comparator)`

Returns a new `ISObjectIterable` with sorted `SObject` elements according to `comparator`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`comparator`|the comparator|

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

### `lim(Integer lim)`

Returns a new `ISObjectIterable` with first `lim` `SObject` elements. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `skip(Integer n)`

Returns a new `ISObjectIterable` that skips first `n` `SObject` elements and returns remaining elements. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`n`|the number of elements to skip|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `reduce(SObject identity, ISObjectBinaryOperator accumulator)`

Performs a reduction on `SObject` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Return

**Type**

SObject

**Description**

the `SObject` result of the reduction

### `reduce(ISObjectBinaryOperator accumulator)`

Performs a reduction on `SObject` elements, using `identity` value and associative `accumulator` function, and returns an `OptionalSObject` describing the reduced value. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject` result of the reduction

### `collect(ISupplier supplier, IObjectSObjectConsumer accumulator)`

Performs a mutable reduction operation on `SObject` elements, collecting elements to a container returned by `supplier` by applying `accumulator` function. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`supplier`|the function that returns a mutable result container|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Return

**Type**

Object

**Description**

the `Object` result of the collection

### `collect(ISObjectCollector collector)`

Performs a mutable reduction operation on `SObject` elements, collecting elements to a container using `collector`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`collector`|the collector|

#### Return

**Type**

Object

**Description**

the `Object` result of the collection

### `find(ISObjectPredicate predicate)`

Returns an `OptionalSObject` describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject`

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

### `every(ISObjectPredicate predicate)`

Returns whether all `SObject` elements match `predicate`. If `ISObjectIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

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

### `some(ISObjectPredicate predicate)`

Returns whether some `SObject` element matches `predicate`. If `ISObjectIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

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

### `none(ISObjectPredicate predicate)`

Returns whether no `SObject` elements match `predicate`. If `ISObjectIterable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

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

### `max(ISObjectComparator comparator)`

Returns an `OptionalSObject` describing the maximum `SObject` element according to `comparator`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`comparator`|the comparator|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject` describing the result

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

### `min(ISObjectComparator comparator)`

Returns an `OptionalSObject` describing the minimum `SObject` element according to `comparator`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`comparator`|the comparator|

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

### `sum(ISObjectToDoubleFunction classifier)`

Returns the arithmetic sum of values returned by `classifier` function. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`classifier`|the classifier function|

#### Return

**Type**

Double

**Description**

the sum of elements returned by function

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

### `avg(ISObjectToDoubleFunction classifier)`

Returns the arithmetic mean of values returned by `classifier` function. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`classifier`|the classifier function|

#### Return

**Type**

OptionalDouble

**Description**

the arithmetic mean of elements returned by function

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

### `count()`

Returns the count of `SObject` elements. <p>Terminal Operation.</p>

#### Return

**Type**

Integer

**Description**

the count of `SObject` elements

### `isEmpty()`

Returns the count of `SObject` elements is 0. <p>Terminal Operation.</p>

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `toList()`

Accumulates `SObject` elements into a `List<SObject>`. <p>Terminal Operation.</p>

#### Return

**Type**

List<SObject>

**Description**

the `List<SObject>` containing the iterable elements

### `toList(String fieldName, Type listType)`

Accumulates `Object` elements into a `List<Object>` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`listType`|result type|

#### Return

**Type**

List<Object>

**Description**

the `List<Object>` containing the iterable elements

### `toList(SObjectField field, Type listType)`

Accumulates `Object` elements into a `List<Object>` according to `field`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`listType`|result type|

#### Return

**Type**

List<Object>

**Description**

the `List<Object>` containing the iterable elements

### `toSet()`

Accumulates `SObject` elements into a `Set<SObject>`. <p>Terminal Operation.</p>

#### Return

**Type**

Set<SObject>

**Description**

the `Set<SObject>` containing the iterable elements

### `toIdSet()`

Accumulates `Id` elements into a `Set<Id>`. <p>Terminal Operation.</p>

#### Return

**Type**

Set<Id>

**Description**

the `Set<Id>` containing the iterable elements

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

the `Set<Id>` containing the iterable elements

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

the `Set<Id>` containing the iterable elements

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

the `Set<String>` containing the iterable elements

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

the `Set<String>`containing the iterable elements

### `toMap()`

Accumulates `SObject` elements into a `Map<Id, SObject>`. <p>Terminal Operation.</p>

#### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>` containing the iterable elements

### `toByIdMap(String fieldName, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, SObject>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`mapType`|result type|

#### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>` containing the iterable elements

### `toByIdMap(SObjectField field, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, SObject>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`mapType`|result type|

#### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>` containing the iterable elements

### `toByStringMap(String fieldName, Type mapType)`

Accumulates `SObject` elements into a `Map<String, SObject>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`mapType`|result type|

#### Return

**Type**

Map<String,SObject>

**Description**

the `Map<String, SObject>` containing the iterable elements

### `toByStringMap(SObjectField field, Type mapType)`

Accumulates `SObject` elements into a `Map<String, SObject>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`mapType`|result type|

#### Return

**Type**

Map<String,SObject>

**Description**

the `Map<String, SObject>` containing the iterable elements

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

the `Map<Id, List<SObject>>` containing the iterable elements

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

the `Map<Id, List<SObject>>` containing the iterable elements

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

the `Map<String, List<SObject>>` containing the iterable elements

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

the `Map<String, List<SObject>>` containing the iterable elements

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

the `Map<Boolean, List<SObject>>` containing the iterable elements

---
