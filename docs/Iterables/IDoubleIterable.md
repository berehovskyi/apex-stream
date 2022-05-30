# IDoubleIterable

`APIVERSION: 54`

`STATUS: ACTIVE`

A sequence of `Double` elements supporting aggregate operations.


**Author** O. Berehovskyi


**Group** Iterables


**See** [IObjectIterable](/docs/Iterables/IObjectIterable.md)


**See** [ISObjectIterable](/docs/Iterables/ISObjectIterable.md)


**See** [IIntIterable](/docs/Iterables/IIntIterable.md)


**See** [ILongIterable](/docs/Iterables/ILongIterable.md)

## Methods
### `append(Iterable<Double> iterable)`

Returns a new `IDoubleIterable` from the current to which another `iterable` is appended. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `prepend(Iterable<Double> iterable)`

Returns a new `IDoubleIterable` from the current to which another `iterable` is prepended. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `toObjectIterable()`

Returns a new `IObjectIterable` from the current `iterable`. <p>Intermediate Operation.</p>

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `union(Iterable<Double> iterable)`

Returns a new `IDoubleIterable` as a set union of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `intersect(Iterable<Double> iterable)`

Returns a new `IDoubleIterable` as a set intersection of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `except(Iterable<Double> iterable)`

Returns a new `IDoubleIterable` as a set difference of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `distinct()`

Returns a new `IDoubleIterable` with distinct `Double` elements. <p>Intermediate Operation.</p>

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `filter(IDoublePredicate predicate)`

Returns a new `IDoubleIterable` with `Double` elements that match `predicate`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `take(IDoublePredicate predicate)`

Returns a new `IDoubleIterable` that takes `Double` elements while `predicate` returns `true`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `drop(IDoublePredicate predicate)`

Returns a new `IDoublePredicate` that drops `Double` elements while `predicate` returns `true`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoublePredicate`

### `withoutNulls()`

Returns a new `IDoubleIterable` without null elements. <p>Intermediate Operation.</p>

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `mapTo(IDoubleUnaryOperator mapper)`

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

### `mapToInt(IDoubleToIntFunction mapper)`

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

### `mapToLong(IDoubleToLongFunction mapper)`

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

### `mapToSObject(IDoubleToSObjectFunction mapper)`

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

### `mapToObject(IDoubleFunction mapper)`

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

### `forEach(IDoubleConsumer consumer)`

Returns a new `IDoubleIterable` after performing `consumer` action on each `Double` element. <p>Intermediate Interfering Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`consumer`|the action|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `sort()`

Returns a new `IDoubleIterable` with sorted `Double` elements. <p>Intermediate Operation.</p>

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `lim(Integer lim)`

Returns a new `IDoubleIterable` with first `lim` `Double` elements. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `skip(Integer n)`

Returns a new `IDoubleIterable` that skips first `n` `Double` elements and returns remaining elements. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`n`|the number of elements to skip|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `reduce(Double identity, IDoubleBinaryOperator accumulator)`

Performs a reduction on `Double` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Return

**Type**

Double

**Description**

the `Double` result of the reduction

### `reduce(IDoubleBinaryOperator accumulator)`

Performs a reduction on `Double` elements, using `identity` value and associative `accumulator` function, and returns an `OptionalLong` describing the reduced value. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Return

**Type**

OptionalDouble

**Description**

the `OptionalDouble` result of the reduction

### `collect(ISupplier supplier, IObjectDoubleConsumer accumulator)`

Performs a mutable reduction operation on `Double` elements, collecting elements to a container returned by `supplier` by applying `accumulator` function. <p>Terminal Operation.</p>

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

### `find(IDoublePredicate predicate)`

Returns an `OptionalDouble` describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

OptionalDouble

**Description**

the `OptionalDouble`

### `every(IDoublePredicate predicate)`

Returns whether all `Double` elements match `predicate`. If `IDoubleIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `some(IDoublePredicate predicate)`

Returns whether some `Double` element matches `predicate`. If `IDoubleIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `none(IDoublePredicate predicate)`

Returns whether no `Double` elements match `predicate`. If `IDoubleIterable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `max()`

Returns an `OptionalDouble` describing the maximum `Double` element. <p>Terminal Operation.</p>

#### Return

**Type**

OptionalDouble

**Description**

the `OptionalDouble` describing the result

### `min()`

Returns an `OptionalDouble` describing the minimum `Double` element. <p>Terminal Operation.</p>

#### Return

**Type**

OptionalDouble

**Description**

the `OptionalDouble` describing the result

### `sum()`

Returns the arithmetic sum of `Double` values. <p>Terminal Operation.</p>

#### Return

**Type**

Double

**Description**

the sum of elements

### `avg()`

Returns the arithmetic mean of `Double` values. <p>Terminal Operation.</p>

#### Return

**Type**

OptionalDouble

**Description**

the `OptionalDouble` describing the result

### `count()`

Returns the count of `Integer` elements. <p>Terminal Operation.</p>

#### Return

**Type**

Integer

**Description**

the count of `Integer` elements

### `isEmpty()`

Returns the count of `Integer` elements is 0. <p>Terminal Operation.</p>

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `toList()`

Accumulates `Double` elements into a `List<Double>`. <p>Terminal Operation.</p>

#### Return

**Type**

List<Double>

**Description**

the List<Double> containing the iterable elements

### `toSet()`

Accumulates `Double` elements into a `Set<Double>`. <p>Terminal Operation.</p>

#### Return

**Type**

Set<Double>

**Description**

the Set<Double> containing the iterable elements

---
