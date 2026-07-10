# IDoubleEnumerable

`APIVERSION: 67`

`STATUS: ACTIVE`

A sequence of `Double` elements supporting aggregate operations.


**Extended types**

[Iterable<Double>](Iterable<Double>)

**See** [IObjectEnumerable](/docs/Enumerables/IObjectEnumerable.md)


**See** [ISObjectEnumerable](/docs/Enumerables/ISObjectEnumerable.md)


**See** [IIntEnumerable](/docs/Enumerables/IIntEnumerable.md)


**See** [ILongEnumerable](/docs/Enumerables/ILongEnumerable.md)


**Author** Oleh Berehovskyi


**Group** Enumerables

## Methods
### `public Iterator<Double> iterator()`

Returns an instance of an iterator for this enumerable. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Iterator<Double>`|the iterator|

### `public IDoubleEnumerable append(Iterable<Double> iterable)`

Returns a new `IDoubleEnumerable` from the current to which another `iterable` is appended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IDoubleEnumerable prepend(Iterable<Double> iterable)`

Returns a new `IDoubleEnumerable` from the current to which another `iterable` is prepended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IDoubleEnumerable union(Iterable<Double> iterable)`

Returns a new `IDoubleEnumerable` as a set union of the current and another `iterable`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IDoubleEnumerable intersect(Iterable<Double> iterable)`

Returns a new `IDoubleEnumerable` as a set intersection of the current and another `iterable`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IDoubleEnumerable except(Iterable<Double> iterable)`

Returns a new `IDoubleEnumerable` as a set difference of the current and another `iterable`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IDoubleEnumerable distinct()`

Returns a new `IDoubleEnumerable` with distinct elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IDoubleEnumerable filter(IPredicate predicate)`

Returns a new `IDoubleEnumerable` with elements that match `predicate`. <p>Stateless Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IDoubleEnumerable take(IPredicate predicate)`

Returns a new `IDoubleEnumerable` that takes elements while `predicate` returns `true`. <p>Short-circuiting Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IDoubleEnumerable drop(IPredicate predicate)`

Returns a new `IDoubleEnumerable` that drops elements while `predicate` returns `true`, then takes the rest. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IDoubleEnumerable withoutNulls()`

Returns a new `IDoubleEnumerable` without null elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IDoubleEnumerable mapTo(IOperator mapper)`

Returns a new `IDoubleEnumerable` with elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

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

### `public ISObjectEnumerable mapToSObject(IFunction mapper)`

Returns a new `ISObjectEnumerable` with elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping operator|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

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

### `public IDoubleEnumerable flatMapTo(IFunction mapper)`

Returns a new `IDoubleEnumerable` with elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Double>`|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IDoubleEnumerable forEach(IConsumer consumer)`

Returns an `IDoubleEnumerable` after performing the `consumer` action on each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`consumer`|the action|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the `IDoubleEnumerable`|

### `public IDoubleEnumerable sort()`

Returns a new `IDoubleEnumerable` with sorted elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IDoubleEnumerable sort(SortOrder order)`

Returns a new `IDoubleEnumerable` with sorted elements considering `order`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`order`|the sort order|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IDoubleEnumerable lim(Integer lim)`

Returns a new `IDoubleEnumerable` with the first `lim` elements. <p>Short-circuiting Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public IDoubleEnumerable skip(Integer n)`

Returns a new `IDoubleEnumerable` that skips the first `n` elements and returns the remaining elements. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`n`|the number of elements to skip|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public Double fold(Double identity, IBiOperator accumulator)`

Performs a reduction on elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`identity`|the initial value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`Double`|the `Double` result of the reduction|

### `public Double reduce(Double identity, IBiOperator accumulator)`

Performs a reduction on elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`identity`|the initial value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`Double`|the `Double` result of the reduction|


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

Returns whether all elements match `predicate`. If `IDoubleEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean some(IPredicate predicate)`

Returns whether some element matches `predicate`. If `IDoubleEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean none(IPredicate predicate)`

Returns whether no elements match `predicate`. If `IDoubleEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

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

### `public Double sum()`

Returns the arithmetic sum of values. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Double`|the sum of values|

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

### `public List<Double> toList()`

Accumulates elements into a `List<Double>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`List<Double>`|the `List<Double>` containing the collected elements|

### `public Set<Double> toSet()`

Accumulates elements into a `Set<Double>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Set<Double>`|the `Set<Double>` containing the collected elements|

---
