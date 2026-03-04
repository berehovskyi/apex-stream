# ISObjectEnumerable

`APIVERSION: 66`

`STATUS: ACTIVE`

A sequence of `SObject` elements supporting aggregate operations.


**Extended types**

[Iterable<SObject>](Iterable<SObject>)

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

### `public ISObjectEnumerable append(Iterable<SObject> iterable)`

Returns a new `ISObjectEnumerable` from the current to which another `iterable` is appended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable prepend(Iterable<SObject> iterable)`

Returns a new `ISObjectEnumerable` from the current to which another `iterable` is prepended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable union(Iterable<SObject> iterable)`

Returns a new `ISObjectEnumerable` as a set union of the current and another `iterable`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable union(Iterable<SObject> iterable, IFunction classifier)`

Returns a new `ISObjectEnumerable` as a set union of the current and another `iterable` according to `classifier`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable union(Iterable<SObject> iterable, String field)`

Returns a new `ISObjectEnumerable` as a set union of the current and another `iterable` according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable union(Iterable<SObject> iterable, SObjectField field)`

Returns a new `ISObjectEnumerable` as a set union of the current and another `iterable` according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable intersect(Iterable<SObject> iterable)`

Returns a new `ISObjectEnumerable` as a set intersection of the current and another `iterable`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable intersect(Iterable<SObject> iterable, IFunction classifier)`

Returns a new `ISObjectEnumerable` as a set intersection of the current and another `iterable` according to `classifier`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable intersect(Iterable<SObject> iterable, String field)`

Returns a new `ISObjectEnumerable` as a set intersection of the current and another `iterable` according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable intersect(Iterable<SObject> iterable, SObjectField field)`

Returns a new `ISObjectEnumerable` as a set intersection of the current and another `iterable` according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable except(Iterable<SObject> iterable)`

Returns a new `ISObjectEnumerable` as a set difference of the current and another `iterable`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable except(Iterable<SObject> iterable, IFunction classifier)`

Returns a new `ISObjectEnumerable` as a set difference of the current and another `iterable` according to `classifier`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable except(Iterable<SObject> iterable, String field)`

Returns a new `ISObjectEnumerable` as a set difference of the current and another `iterable` according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable except(Iterable<SObject> iterable, SObjectField field)`

Returns a new `ISObjectEnumerable` as a set difference of the current and another `iterable` according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable distinct()`

Returns a new `ISObjectEnumerable` with distinct elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable distinct(IFunction classifier)`

Returns a new `ISObjectEnumerable` with distinct elements according to `classifier` function. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable distinct(String field)`

Returns a new `ISObjectEnumerable` with distinct elements according to `field`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable distinct(SObjectField field)`

Returns a new `ISObjectEnumerable` with distinct elements according to `field`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable filter(IPredicate predicate)`

Returns a new `ISObjectEnumerable` with elements that match `predicate`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable filter(String field, Object value)`

Returns a new `ISObjectEnumerable` with elements that have `field`'s value. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable filter(SObjectField field, Object value)`

Returns a new `ISObjectEnumerable` with elements that have `field`'s value. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable take(IPredicate predicate)`

Returns a new `ISObjectEnumerable` that takes elements while `predicate` returns `true`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable take(String field, Object value)`

Returns a new `ISObjectEnumerable` that takes elements while `field` equals `value`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable take(SObjectField field, Object value)`

Returns a new `ISObjectEnumerable` that takes elements while `field` equals `value`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable drop(IPredicate predicate)`

Returns a new `ISObjectEnumerable` that drops elements while `predicate` returns `true`, then takes the rest. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable drop(String field, Object value)`

Returns a new `ISObjectEnumerable` that drops elements while `field` equals `value`, then takes the rest. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable drop(SObjectField field, Object value)`

Returns a new `ISObjectEnumerable` that drops elements while `field` equals `value`, then takes the rest. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable withoutNulls()`

Returns a new `ISObjectEnumerable` without null elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable mapTo(IOperator mapper)`

Returns a new `ISObjectEnumerable` with elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable mapTo(String field)`

Returns a new `ISObjectEnumerable` with elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the parent reference field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable mapTo(SObjectField field)`

Returns a new `ISObjectEnumerable` with elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the parent reference field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public IIntEnumerable mapToInt(IFunction mapper)`

Returns a new `IIntEnumerable` with elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public IIntEnumerable mapToInt(String field)`

Returns a new `IIntEnumerable` with elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public IIntEnumerable mapToInt(SObjectField field)`

Returns a new `IIntEnumerable` with elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public ILongEnumerable mapToLong(IFunction mapper)`

Returns a new `ILongEnumerable` with elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public ILongEnumerable mapToLong(String field)`

Returns a new `ILongEnumerable` with elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public ILongEnumerable mapToLong(SObjectField field)`

Returns a new `ILongEnumerable` with elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public IDoubleEnumerable mapToDouble(IFunction mapper)`

Returns a new `IDoubleEnumerable` with elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IDoubleEnumerable mapToDouble(String field)`

Returns a new `IDoubleEnumerable` with elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IDoubleEnumerable mapToDouble(SObjectField field)`

Returns a new `IDoubleEnumerable` with elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IObjectEnumerable mapToObject(IFunction mapper)`

Returns a new `IObjectEnumerable` with elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable mapToObject(String field)`

Returns a new `IObjectEnumerable` with elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable mapToObject(SObjectField field)`

Returns a new `IObjectEnumerable` with elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public ISObjectEnumerable flatMapTo(IFunction mapper)`

Returns a new `ISObjectEnumerable` with elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<SObject>`|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable flatMapTo(String field)`

Returns a new `ISObjectEnumerable` with elements as a result of replacing each element with the contents of a mapped iterable according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the child relationship field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable flatMapTo(SObjectField field)`

Returns a new `ISObjectEnumerable` with elements as a result of replacing each element with the contents of a mapped iterable according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the child relationship field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public IIntEnumerable flatMapToInt(IFunction mapper)`

Returns a new `IIntEnumerable` with elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Integer>`|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public ILongEnumerable flatMapToLong(IFunction mapper)`

Returns a new `ILongEnumerable` with elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Long>`|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public IDoubleEnumerable flatMapToDouble(IFunction mapper)`

Returns a new `IDoubleEnumerable` with elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Double>`|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IObjectEnumerable flatMapToObject(IFunction mapper)`

Returns a new `IObjectEnumerable` with elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Object>`|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public ISObjectEnumerable forEach(IConsumer consumer)`

Returns an `ISObjectEnumerable` after performing `consumer` action on each element. <p>Intermediate Interfering Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`consumer`|the action|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the `ISObjectEnumerable`|

### `public ISObjectEnumerable forEach(String field, Object value)`

Returns an `ISObjectEnumerable` after setting the `value` for `field` on each element. <p>Intermediate Interfering Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the `ISObjectEnumerable`|

### `public ISObjectEnumerable forEach(SObjectField field, Object value)`

Returns an `ISObjectEnumerable` after setting the `value` for `field` on each element. <p>Intermediate Interfering Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the `ISObjectEnumerable`|

### `public ISObjectEnumerable sort()`

Returns a new `ISObjectEnumerable` with sorted elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable sort(IComparer comparer)`

Returns a new `ISObjectEnumerable` with sorted elements according to `comparer`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable sort(SortOrder order)`

Returns a new `ISObjectEnumerable` with sorted elements considering `order`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`order`|the sort order|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable sort(String field)`

Returns a new `ISObjectEnumerable` with sorted elements according to `field`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable sort(String field, SortOrder order)`

Returns a new `ISObjectEnumerable` with sorted elements taken from `field` values considering `order`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`order`|the sort order|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable sort(SObjectField field)`

Returns a new `ISObjectEnumerable` with sorted elements according to `field`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable sort(SObjectField field, SortOrder order)`

Returns a new `ISObjectEnumerable` with sorted elements taken from `field` values considering `order`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`order`|the sort order|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable lim(Integer lim)`

Returns a new `ISObjectEnumerable` with the first `lim` elements. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public ISObjectEnumerable skip(Integer n)`

Returns a new `ISObjectEnumerable` that skips the first `n` elements and returns the remaining elements. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`n`|the number of elements to skip|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public SObject fold(SObject identity, IBiOperator accumulator)`

Performs a reduction on elements, using the `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`identity`|the initial value for the `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`SObject`|the `SObject` result of the reduction|

### `public SObject reduce(SObject identity, IBiOperator accumulator)`

Performs a reduction on elements, using the `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`identity`|the initial value for the `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`SObject`|the `SObject` result of the reduction|


**Deprecated** Use [#fold()](#fold()) instead

### `public IOptional reduce(IBiOperator accumulator)`

Performs a reduction on elements, using an associative `accumulator` function, and returns an `IOptional` describing the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the `IOptional` result of the reduction|

### `public Object collect(ICollector collector)`

Performs a mutable reduction operation on elements, collecting elements to a container using `collector`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`collector`|the collector|

#### Returns

|Type|Description|
|---|---|
|`Object`|the `Object` result of the collection|

### `public IOptional find(IPredicate predicate)`

Returns an `IOptional` describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the `IOptional` containing the result|

### `public IOptional find(String field, Object value)`

Returns an `IOptional` describing the first element which has `value` of `field`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the `IOptional` containing the result|

### `public IOptional find(SObjectField field, Object value)`

Returns an `IOptional` describing the first element which has `value` of `field`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the `IOptional` containing the result|

### `public Boolean every(IPredicate predicate)`

Returns whether all elements match `predicate`. If `ISObjectEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean every(String field, Object value)`

Returns whether all elements have `field` `value`. If `ISObjectEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean every(SObjectField field, Object value)`

Returns whether all elements have `field` `value`. If `ISObjectEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean some(IPredicate predicate)`

Returns whether some element matches `predicate`. If `ISObjectEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean some(String field, Object value)`

Returns whether some element has `field` `value`. If `ISObjectEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean some(SObjectField field, Object value)`

Returns whether some element has `field` `value`. If `ISObjectEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean none(IPredicate predicate)`

Returns whether no elements match `predicate`. If `ISObjectEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean none(String field, Object value)`

Returns whether no elements have `field` `value`. If `ISObjectEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean none(SObjectField field, Object value)`

Returns whether no elements have `field` `value`. If `ISObjectEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public IOptional max(IComparer comparer)`

Returns an `IOptional` describing the maximum element according to `comparer`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer|

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the `IOptional` containing the result|

### `public IOptional max(String field)`

Returns an `IOptional` describing the maximum element according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the `IOptional` containing the result|

### `public IOptional max(SObjectField field)`

Returns an `IOptional` describing the maximum element according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the `IOptional` containing the result|

### `public IOptional min(IComparer comparer)`

Returns an `IOptional` describing the minimum element according to `comparer`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer|

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the `IOptional` containing the result|

### `public IOptional min(String field)`

Returns an `IOptional` describing the minimum element according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the `IOptional` containing the result|

### `public IOptional min(SObjectField field)`

Returns an `IOptional` describing the minimum element according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the `IOptional` containing the result|

### `public Double sum(IFunction classifier)`

Returns the arithmetic sum of values returned by `classifier` function. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`Double`|the sum of the values returned by the `classifier`|

### `public Double sum(String field)`

Returns the arithmetic sum of field values of elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field to sum the values|

#### Returns

|Type|Description|
|---|---|
|`Double`|the sum of field values|

### `public Double sum(SObjectField field)`

Returns the arithmetic sum of field values of elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field to sum the values|

#### Returns

|Type|Description|
|---|---|
|`Double`|the sum of field values|

### `public IOptional avg(IFunction classifier)`

Returns the arithmetic mean of values returned by `classifier` function. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the `IOptional` containing the result|

### `public IOptional avg(String field)`

Returns the arithmetic mean of field values of elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field to calculate the average|

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the `IOptional` containing the result|

### `public IOptional avg(SObjectField field)`

Returns the arithmetic mean of field values of elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field to calculate the average|

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the `IOptional` containing the result|

### `public Integer count()`

Returns the count of elements. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Integer`|the count of elements|

### `public Boolean isEmpty()`

Returns whether the count of elements is `0`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public List<SObject> toList()`

Accumulates elements into a `List<SObject>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`List<SObject>`|the `List<SObject>` containing the collected elements|

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

### `public List<Object> toList(String field)`

Accumulates elements into a `List<Object>` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the collected elements|

### `public List<Object> toList(SObjectField field)`

Accumulates elements into a `List<Object>` according to `field`. <p>Terminal Operation.</p>

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
|`elementType`|the result type|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the collected elements, which can be cast to `List<T>`|

### `public List<Object> toList(String field, Type elementType)`

Accumulates elements into a `List<?>` of specific `elementType` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`elementType`|the result type|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the collected elements, which can be cast to `List<T>`|

### `public List<Object> toList(SObjectField field, Type elementType)`

Accumulates elements into a `List<?>` of specific `elementType` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`elementType`|the result type|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the collected elements, which can be cast to `List<T>`|

### `public Set<SObject> toSet()`

Accumulates elements into a `Set<SObject>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Set<SObject>`|the `Set<SObject>` containing the collected elements|

### `public Set<Object> toSet(IFunction mapper)`

Accumulates elements returned by `mapper` into a `Set<Object>`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`Set<Object>`|the `Set<Object>` containing the collected elements|

### `public Set<Object> toSet(String field)`

Accumulates elements into a `Set<Object>` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Set<Object>`|the `Set<Object>` containing the collected elements|

### `public Set<Object> toSet(SObjectField field)`

Accumulates elements into a `Set<Object>` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Set<Object>`|the `Set<Object>` containing the collected elements|

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

### `public Set<Id> toIdSet(String field)`

Accumulates `Id` elements into a `Set<Id>` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

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

### `public Set<String> toStringSet(String field)`

Accumulates `String` elements into a `Set<String>` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

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
|`Set<String>`|the `Set<String>` containing the collected elements|

### `public Map<Id,SObject> toMap()`

Accumulates elements into a `Map<Id, SObject>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Map<Id,SObject>`|the `Map<Id, SObject>` containing the collected elements|

### `public Map<Id,SObject> toByIdMap(IFunction keyMapper, Type valueType)`

Accumulates elements into a `Map<Id, ? extends SObject>` of specific `valueType` whose keys are produced by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueType`|the value type|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,SObject>`|the `Map<Id, SObject>` containing the collected elements, which can be cast to `Map<Id, T>`|

### `public Map<Id,SObject> toByIdMap(String field, Type valueType)`

Accumulates elements into a `Map<Id, ? extends SObject>` of specific `valueType` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`valueType`|the value type|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,SObject>`|the `Map<Id, SObject>` containing the collected elements, which can be cast to `Map<Id, T>`|

### `public Map<Id,SObject> toByIdMap(SObjectField field, Type valueType)`

Accumulates elements into a `Map<Id, ? extends SObject>` of specific `valueType` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`valueType`|the value type|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,SObject>`|the `Map<Id, SObject>` containing the collected elements, which can be cast to `Map<Id, T>`|

### `public Map<String,SObject> toByStringMap(IFunction keyMapper, Type valueType)`

Accumulates elements into a `Map<String, ? extends SObject>` of specific `valueType` whose keys are produced by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueType`|the value type|

#### Returns

|Type|Description|
|---|---|
|`Map<String,SObject>`|the `Map<String, SObject>` containing the collected elements, which can be cast to `Map<String, T>`|

### `public Map<String,SObject> toByStringMap(String field, Type valueType)`

Accumulates elements into a `Map<String, ? extends SObject>` of specific `valueType` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`valueType`|the value type|

#### Returns

|Type|Description|
|---|---|
|`Map<String,SObject>`|the `Map<String, SObject>` containing the collected elements, which can be cast to `Map<String, T>`|

### `public Map<String,SObject> toByStringMap(SObjectField field, Type valueType)`

Accumulates elements into a `Map<String, ? extends SObject>` of specific `valueType` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`valueType`|the value type|

#### Returns

|Type|Description|
|---|---|
|`Map<String,SObject>`|the `Map<String, SObject>` containing the collected elements, which can be cast to `Map<String, T>`|

### `public Map<Id,List<SObject>> groupById(IFunction keyMapper)`

Groups elements into a `Map<Id, List<SObject>>` whose keys are values returned by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,List<SObject>>`|the `Map<Id, List<SObject>>` containing the collected elements|

### `public Map<Id,List<SObject>> groupById(String field)`

Groups elements into a `Map<Id, List<SObject>>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,List<SObject>>`|the `Map<Id, List<SObject>>` containing the collected elements|

### `public Map<Id,List<SObject>> groupById(SObjectField field)`

Groups elements into a `Map<Id, List<SObject>>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,List<SObject>>`|the `Map<Id, List<SObject>>` containing the collected elements|

### `public Map<String,List<SObject>> groupByString(IFunction keyMapper)`

Groups elements into a `Map<String, List<SObject>>` whose keys are values returned by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|

#### Returns

|Type|Description|
|---|---|
|`Map<String,List<SObject>>`|the `Map<String, List<SObject>>` containing the collected elements|

### `public Map<String,List<SObject>> groupByString(String field)`

Groups elements into a `Map<String, List<SObject>>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Map<String,List<SObject>>`|the `Map<String, List<SObject>>` containing the collected elements|

### `public Map<String,List<SObject>> groupByString(SObjectField field)`

Groups elements into a `Map<String, List<SObject>>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Map<String,List<SObject>>`|the `Map<String, List<SObject>>` containing the collected elements|

### `public Map<Boolean,List<SObject>> partition(IPredicate predicate)`

Partitions elements by `predicate`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Map<Boolean,List<SObject>>`|the `Map<Boolean, List<SObject>>` containing the collected elements|

### `public Map<Boolean,List<SObject>> partition(String field, Object value)`

Partitions elements by `field` having `value`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`Map<Boolean,List<SObject>>`|the `Map<Boolean, List<SObject>>` containing the collected elements|

### `public Map<Boolean,List<SObject>> partition(SObjectField field, Object value)`

Partitions elements by `field` having `value`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`Map<Boolean,List<SObject>>`|the `Map<Boolean, List<SObject>>` containing the collected elements|

---
