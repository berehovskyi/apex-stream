# IIntEnumerable

`APIVERSION: 65`

`STATUS: ACTIVE`

A sequence of `Integer` elements supporting aggregate operations.


**Extended types**

[Iterable<Integer>](Iterable<Integer>)

**See** [IObjectEnumerable](/docs/Enumerables/IObjectEnumerable.md)


**See** [ISObjectEnumerable](/docs/Enumerables/ISObjectEnumerable.md)


**See** [ILongEnumerable](/docs/Enumerables/ILongEnumerable.md)


**See** [IDoubleEnumerable](/docs/Enumerables/IDoubleEnumerable.md)


**Author** Oleh Berehovskyi


**Group** Enumerables

## Methods
### `public Iterator<Integer> iterator()`

Returns an instance of an iterator for this enumerable. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Iterator<Integer>`|the iterator|

### `public IIntEnumerable append(Iterable<Integer> iterable)`

Returns a new `IIntEnumerable` from the current to which another `iterable` is appended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public IIntEnumerable prepend(Iterable<Integer> iterable)`

Returns a new `IIntEnumerable` from the current to which another `iterable` is prepended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public IIntEnumerable union(Iterable<Integer> iterable)`

Returns a new `IIntEnumerable` as a set union of the current and another `iterable`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public IIntEnumerable intersect(Iterable<Integer> iterable)`

Returns a new `IIntEnumerable` as a set intersection of the current and another `iterable`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public IIntEnumerable except(Iterable<Integer> iterable)`

Returns a new `IIntEnumerable` as a set difference of the current and another `iterable`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public IIntEnumerable distinct()`

Returns a new `IIntEnumerable` with distinct elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public IIntEnumerable filter(IPredicate predicate)`

Returns a new `IIntEnumerable` with elements that match `predicate`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public IIntEnumerable take(IPredicate predicate)`

Returns a new `IIntEnumerable` that takes elements while `predicate` returns `true`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public IIntEnumerable drop(IPredicate predicate)`

Returns a new `IIntEnumerable` that drops elements while `predicate` returns `true`, then takes the rest. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public IIntEnumerable withoutNulls()`

Returns a new `IIntEnumerable` without null elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public IIntEnumerable mapTo(IOperator mapper)`

Returns a new `IIntEnumerable` with elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public ILongEnumerable mapToLong(IFunction mapper)`

Returns a new `ILongEnumerable` with `Long` elements returned by the `mapper` function. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public IDoubleEnumerable mapToDouble(IFunction mapper)`

Returns a new `IDoubleEnumerable` with `Double` elements returned by the `mapper` function. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public ISObjectEnumerable mapToSObject(IFunction mapper)`

Returns a new `ISObjectEnumerable` with `SObject` elements returned by the `mapper` function. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public IObjectEnumerable mapToObject(IFunction mapper)`

Returns a new `IObjectEnumerable` with `Object` elements returned by the `mapper` function. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IIntEnumerable flatMapTo(IFunction mapper)`

Returns a new `IIntEnumerable` with elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Integer>`|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public IIntEnumerable forEach(IConsumer consumer)`

Returns an `IIntEnumerable` after performing the `consumer` action on each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`consumer`|the action|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the `IIntEnumerable`|

### `public IIntEnumerable sort()`

Returns a new `IIntEnumerable` with sorted elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public IIntEnumerable sort(SortOrder order)`

Returns a new `IIntEnumerable` with sorted elements considering `order`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`order`|the sort order|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public IIntEnumerable lim(Integer lim)`

Returns a new `IIntEnumerable` with the first `lim` elements. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public IIntEnumerable skip(Integer n)`

Returns a new `IIntEnumerable` that skips the first `n` elements and returns the remaining elements. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`n`|the number of elements to skip|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public Integer fold(Integer identity, IBiOperator accumulator)`

Performs a reduction on elements, using the `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`identity`|the initial value for the `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`Integer`|the `Integer` result of the reduction|

### `public Integer reduce(Integer identity, IBiOperator accumulator)`

Performs a reduction on elements, using the `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`identity`|the initial value for the `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`Integer`|the `Integer` result of the reduction|


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

Returns whether all elements match `predicate`. If `IIntEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean some(IPredicate predicate)`

Returns whether some element matches `predicate`. If `IIntEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean none(IPredicate predicate)`

Returns whether no elements match `predicate`. If `IIntEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

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

### `public Integer sum()`

Returns the arithmetic sum of values. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Integer`|the sum of values|

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

### `public List<Integer> toList()`

Accumulates elements into a `List<Integer>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`List<Integer>`|the `List<Integer>` containing the collected elements|

### `public Set<Integer> toSet()`

Accumulates elements into a `Set<Integer>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Set<Integer>`|the `Set<Integer>` containing the collected elements|

---
