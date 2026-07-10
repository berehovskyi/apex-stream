# IObjectEnumerable

`APIVERSION: 67`

`STATUS: ACTIVE`

A sequence of raw `Object` elements supporting aggregate operations.


**Extended types**

[Iterable<Object>](Iterable<Object>)

**See** [ISObjectEnumerable](/docs/Enumerables/ISObjectEnumerable.md)


**See** [IIntEnumerable](/docs/Enumerables/IIntEnumerable.md)


**See** [ILongEnumerable](/docs/Enumerables/ILongEnumerable.md)


**See** [IDoubleEnumerable](/docs/Enumerables/IDoubleEnumerable.md)


**Author** Oleh Berehovskyi


**Group** Enumerables

## Methods
### `public Iterator<Object> iterator()`

Returns an instance of an iterator for this enumerable. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Iterator<Object>`|the iterator|

### `public IObjectEnumerable append(Iterable<Object> iterable)`

Returns a new `IObjectEnumerable` from the current to which another `iterable` is appended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable prepend(Iterable<Object> iterable)`

Returns a new `IObjectEnumerable` from the current to which another `iterable` is prepended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable union(Iterable<Object> iterable)`

Returns a new `IObjectEnumerable` as a set union of the current and another `iterable`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable union(Iterable<Object> iterable, IFunction classifier)`

Returns a new `IObjectEnumerable` as a set union of the current and another `iterable` according to `classifier`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable intersect(Iterable<Object> iterable)`

Returns a new `IObjectEnumerable` as a set intersection of the current and another `iterable`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable intersect(Iterable<Object> iterable, IFunction classifier)`

Returns a new `IObjectEnumerable` as a set intersection of the current and another `iterable` according to `classifier`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable except(Iterable<Object> iterable)`

Returns a new `IObjectEnumerable` as a set difference of the current and another `iterable`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable except(Iterable<Object> iterable, IFunction classifier)`

Returns a new `IObjectEnumerable` as a set difference of the current and another `iterable` according to `classifier`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable distinct()`

Returns a new `IObjectEnumerable` with distinct elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable distinct(IFunction classifier)`

Returns a new `IObjectEnumerable` with distinct elements according to the `classifier` function. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable filter(IPredicate predicate)`

Returns a new `IObjectEnumerable` with elements that match `predicate`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable take(IPredicate predicate)`

Returns a new `IObjectEnumerable` that takes elements while `predicate` returns `true`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable drop(IPredicate predicate)`

Returns a new `IObjectEnumerable` that drops elements while `predicate` returns `true`, then takes the rest. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable withoutNulls()`

Returns a new `IObjectEnumerable` without null elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable mapTo(IOperator mapper)`

Returns a new `IObjectEnumerable` with elements returned by the `mapper` function. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IIntEnumerable mapToInt(IFunction mapper)`

Returns a new `IIntEnumerable` with elements returned by the `mapper` function. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public ILongEnumerable mapToLong(IFunction mapper)`

Returns a new `ILongEnumerable` with elements returned by the `mapper` function. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public IDoubleEnumerable mapToDouble(IFunction mapper)`

Returns a new `IDoubleEnumerable` with elements returned by the `mapper` function. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public ISObjectEnumerable mapToSObject(IFunction mapper)`

Returns a new `ISObjectEnumerable` with elements returned by the `mapper` function. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public IObjectEnumerable flatMapTo(IFunction mapper)`

Returns a new `IObjectEnumerable` with elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. Mapped `null` values are skipped. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Object>`|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

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

### `public ISObjectEnumerable flatMapToSObject(IFunction mapper)`

Returns a new `ISObjectEnumerable` with elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<SObject>`|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public IObjectEnumerable flat()`

Returns a new `IObjectEnumerable` with elements as a result of replacing each iterable element with the contents of the iterable. Unlike `flatMapTo(IFunction)`, non-iterable and `null` elements are kept as values. <p>Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable flat(Integer depth)`

Returns a new `IObjectEnumerable` with elements as a result of replacing each iterable element with the contents of the iterable, up to `depth` levels. Unlike `flatMapTo(IFunction)`, non-iterable and `null` elements are kept as values. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`depth`|the flattening depth|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable forEach(IConsumer consumer)`

Returns an `IObjectEnumerable` after performing the `consumer` action on each element. <p>Intermediate Interfering Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`consumer`|the action|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the `IObjectEnumerable`|

### `public IObjectEnumerable sort()`

Returns a new `IObjectEnumerable` with sorted elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable sort(SortOrder order)`

Returns a new `IObjectEnumerable` with sorted elements considering `order`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`order`|the sort order|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable sort(IComparer comparer)`

Returns a new `IObjectEnumerable` with sorted elements according to `comparer`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable lim(Integer lim)`

Returns a new `IObjectEnumerable` with the first `lim` elements. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public IObjectEnumerable skip(Integer n)`

Returns a new `IObjectEnumerable` that skips the first `n` elements and returns the remaining elements. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`n`|the number of elements to skip|

#### Returns

|Type|Description|
|---|---|
|`IObjectEnumerable`|the new `IObjectEnumerable`|

### `public Object fold(Object identity, IBiOperator accumulator)`

Performs a reduction on elements, using the `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`identity`|the initial value for the `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`Object`|the `Object` result of the reduction|

### `public Object reduce(Object identity, IBiOperator accumulator)`

Performs a reduction on elements, using the `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`identity`|the initial value for the `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`Object`|the `Object` result of the reduction|


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

Returns whether all elements match `predicate`. If `IObjectEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean some(IPredicate predicate)`

Returns whether some element matches `predicate`. If `IObjectEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean none(IPredicate predicate)`

Returns whether no elements match `predicate`. If `IObjectEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

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

### `public List<Object> toList()`

Accumulates elements into a `List<Object>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the collected elements|

### `public List<Object> toList(Type elementType)`

Accumulates elements into a `List<?>` according to `elementType`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`elementType`|the element type argument of a list|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the enumerable elements, which can be cast to `List<T>`|

### `public Set<Object> toSet()`

Accumulates elements into a `Set<Object>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Set<Object>`|the `Set<Object>` containing the collected elements|

---
