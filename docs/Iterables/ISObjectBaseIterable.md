# ISObjectBaseIterable

`APIVERSION: 55`

`STATUS: ACTIVE`

A sequence of `SObject` elements that supports core aggregate operations.


**See** [ISObjectIterable](/docs/Iterables/ISObjectIterable.md)


**Author** Oleh Berehovskyi


**Group** Iterables

## Methods
### `append(Iterable<SObject> iterable)`

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

### `prepend(Iterable<SObject> iterable)`

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

### `union(Iterable<SObject> iterable)`

Returns a new `ISObjectIterable` as a set union of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `union(Iterable<SObject> iterable, ISObjectFunction classifier)`

Returns a new `ISObjectIterable` as a set union of the current and another iterables according to `classifier` function.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `intersect(Iterable<SObject> iterable)`

Returns a new `ISObjectIterable` as a set intersection of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `intersect(Iterable<SObject> iterable, ISObjectFunction classifier)`

Returns a new `ISObjectIterable` as a set intersection of the current and another iterables according to `classifier` function.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `except(Iterable<SObject> iterable)`

Returns a new `ISObjectIterable` as a set difference of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `except(Iterable<SObject> iterable, ISObjectFunction classifier)`

Returns a new `ISObjectIterable` as a set difference of the current and another iterables according to `classifier` function.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

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

### `flatMapTo(ISObjectFunction mapper)`

Returns a new `ISObjectIterable` with `SObject` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<SObject>`|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `flatMapToInt(ISObjectFunction mapper)`

Returns a new `IIntIterable` with `Integer` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Integer>`|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `flatMapToLong(ISObjectFunction mapper)`

Returns a new `ILongIterable` with `Long` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Long>`|

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

### `flatMapToDouble(ISObjectFunction mapper)`

Returns a new `IDoubleIterable` with `Double` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Double>`|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `flatMapToObject(ISObjectFunction mapper)`

Returns a new `IObjectIterable` with `Object` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Object>`|

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

### `sort()`

Returns a new `ISObjectIterable` with sorted `SObject` elements in ascending order. <p>Intermediate Operation.</p>

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

### `toSet()`

Accumulates `SObject` elements into a `Set<SObject>`. <p>Terminal Operation.</p>

#### Return

**Type**

Set<SObject>

**Description**

the `Set<SObject>` containing the iterable elements

---
