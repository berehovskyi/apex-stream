# ILongEnumerable

`APIVERSION: 67`

`STATUS: ACTIVE`

A sequence of `Long` elements supporting aggregate operations.


**Extended types**

[Iterable<Long>](Iterable<Long>)

**See** [IObjectEnumerable](/docs/Enumerables/IObjectEnumerable.md)


**See** [ISObjectEnumerable](/docs/Enumerables/ISObjectEnumerable.md)


**See** [IIntEnumerable](/docs/Enumerables/IIntEnumerable.md)


**See** [IDoubleEnumerable](/docs/Enumerables/IDoubleEnumerable.md)


**Author** Oleh Berehovskyi


**Group** Enumerables

## Methods
### `public Iterator<Long> iterator()`

Returns an instance of an iterator for this enumerable. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Iterator<Long>`|the iterator|

### `public ILongEnumerable append(Iterable<Long> iterable)`

Returns a new `ILongEnumerable` from the current to which another `iterable` is appended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public ILongEnumerable prepend(Iterable<Long> iterable)`

Returns a new `ILongEnumerable` from the current to which another `iterable` is prepended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public ILongEnumerable union(Iterable<Long> iterable)`

Returns a new `ILongEnumerable` as a set union of the current and another `iterable`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public ILongEnumerable intersect(Iterable<Long> iterable)`

Returns a new `ILongEnumerable` as a set intersection of the current and another `iterable`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public ILongEnumerable except(Iterable<Long> iterable)`

Returns a new `ILongEnumerable` as a set difference of the current and another `iterable`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public ILongEnumerable distinct()`

Returns a new `ILongEnumerable` with distinct elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public ILongEnumerable filter(IPredicate predicate)`

Returns a new `ILongEnumerable` with elements that match `predicate`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public ILongEnumerable take(IPredicate predicate)`

Returns a new `ILongEnumerable` that takes elements while `predicate` returns `true`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public ILongEnumerable drop(IPredicate predicate)`

Returns a new `ILongEnumerable` that drops elements while `predicate` returns `true`, then takes the rest. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public ILongEnumerable withoutNulls()`

Returns a new `ILongEnumerable` without null elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public ILongEnumerable mapTo(IOperator mapper)`

Returns a new `ILongEnumerable` with elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public IIntEnumerable mapToInt(IFunction mapper)`

Returns a new `IIntIterable` with elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntIterable`|

### `public IDoubleEnumerable mapToDouble(IFunction mapper)`

Returns a new `IDoubleIterable` with `Double` elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleIterable`|

### `public ISObjectEnumerable mapToSObject(IFunction mapper)`

Returns a new `ISObjectIterable` with `SObject` elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping operator|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectIterable`|

### `public IObjectEnumerable mapToObject(IFunction mapper)`

Returns a new `IObjectIterable` with `Object` elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectIterable`|

### `public ILongEnumerable flatMapTo(IFunction mapper)`

Returns a new `ILongEnumerable` with elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Long>`|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public ILongEnumerable forEach(IConsumer consumer)`

Returns an `ILongEnumerable` after performing the `consumer` action on each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`consumer`|the action|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the `ILongEnumerable`|

### `public ILongEnumerable sort()`

Returns a new `ILongEnumerable` with sorted elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public ILongEnumerable sort(SortOrder order)`

Returns a new `ILongEnumerable` with sorted elements considering `order`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`order`|the sort order|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public ILongEnumerable lim(Integer lim)`

Returns a new `ILongEnumerable` with the first `lim` elements. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public ILongEnumerable skip(Integer n)`

Returns a new `ILongEnumerable` that skips the first `n` elements and returns the remaining elements. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`n`|the number of elements to skip|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public Long fold(Long identity, IBiOperator accumulator)`

Performs a reduction on `Long` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`identity`|the initial value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`Long`|the `Long` result of the reduction|

### `public Long reduce(Long identity, IBiOperator accumulator)`

Performs a reduction on `Long` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`identity`|the initial value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`Long`|the `Long` result of the reduction|


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
|`IOptional`|the `IOptional` containing the result|

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

### `public Boolean every(IPredicate predicate)`

Returns whether all elements match `predicate`. If `ILongEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean some(IPredicate predicate)`

Returns whether some element matches `predicate`. If `ILongEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean none(IPredicate predicate)`

Returns whether no elements match `predicate`. If `ILongEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public IOptional max()`

Returns an `IOptional` describing the maximum element. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the `IOptional` containing the result|

### `public IOptional min()`

Returns an `IOptional` describing the minimum element. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the `IOptional` containing the result|

### `public Long sum()`

Returns the arithmetic sum of values. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Long`|the sum of values|

### `public IOptional avg()`

Returns the arithmetic mean of values. <p>Terminal Operation.</p>

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

### `public List<Long> toList()`

Accumulates elements into a `List<Long>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`List<Long>`|the `List<Long>` containing the collected elements|

### `public Set<Long> toSet()`

Accumulates elements into a `Set<Long>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Set<Long>`|the `Set<Long>` containing the collected elements|

---
