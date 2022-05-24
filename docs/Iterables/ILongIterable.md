# ILongIterable

`APIVERSION: 54`

`STATUS: ACTIVE`

A sequence of `Long` elements supporting aggregate operations.


**Author** O. Berehovskyi


**Group** Iterables


**See** [IObjectIterable](/docs/Iterables/IObjectIterable.md)


**See** [ISObjectIterable](/docs/Iterables/ISObjectIterable.md)


**See** [IIntIterable](/docs/Iterables/IIntIterable.md)


**See** [IDoubleIterable](/docs/Iterables/IDoubleIterable.md)

## Methods
### `append(Iterable<Long> iterable)`

Returns a new `ILongIterable` from the current to which another `iterable` is appended. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

### `prepend(Iterable<Long> iterable)`

Returns a new `ILongIterable` from the current to which another `iterable` is prepended. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

### `toObjectIterable()`

Returns a new `IObjectIterable` from the current `iterable`. <p>Intermediate Operation.</p>

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `toIntIterable()`

Returns a new `IIntIterable` from the current `iterable`. <p>Intermediate Operation.</p>

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `toDoubleIterable()`

Returns a new `IDoubleIterable` from the current `iterable`. <p>Intermediate Operation.</p>

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `filter(ILongPredicate predicate)`

Returns a new `ILongIterable` with `Long` elements that match `predicate`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

### `take(ILongPredicate predicate)`

Returns a new `ILongIterable` that takes `Long` elements while `predicate` returns `true`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

### `drop(ILongPredicate predicate)`

Returns a new `ILongIterable` that drops `Long` elements while `predicate` returns `true`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

### `withoutNulls()`

Returns a new `ILongIterable` without null elements. <p>Intermediate Operation.</p>

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

### `mapTo(ILongUnaryOperator mapper)`

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

### `mapToInt(ILongToIntFunction mapper)`

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

### `mapToDouble(ILongToDoubleFunction mapper)`

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

### `mapToSObject(ILongToSObjectFunction mapper)`

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

### `mapToObject(ILongFunction mapper)`

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

### `forEach(ILongConsumer consumer)`

Returns a new `ILongIterable` after performing `consumer` action on each `Long` element. <p>Intermediate Interfering Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`consumer`|the action|

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

### `distinct()`

Returns a new `ILongIterable` with distinct `Long` elements. <p>Intermediate Operation.</p>

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

### `sort()`

Returns a new `ILongIterable` with sorted `Long` elements. <p>Intermediate Operation.</p>

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

### `lim(Integer lim)`

Returns a new `ILongIterable` with first `lim` `Long` elements. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

### `skip(Integer n)`

Returns a new `ILongIterable` that skips first `n` `Long` elements and returns remaining elements. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`n`|the number of elements to skip|

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

### `reduce(Long identity, ILongBinaryOperator accumulator)`

Performs a reduction on `Long` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Return

**Type**

Long

**Description**

the `Long` result of the reduction

### `reduce(ILongBinaryOperator accumulator)`

Performs a reduction on `Long` elements, using `identity` value and associative `accumulator` function, and returns an `OptionalLong` describing the reduced value. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Return

**Type**

OptionalLong

**Description**

the `OptionalLong` result of the reduction

### `collect(ISupplier supplier, IObjectLongConsumer accumulator)`

Performs a mutable reduction operation on `Long` elements, collecting elements to a container returned by `supplier` by applying `accumulator` function. <p>Terminal Operation.</p>

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

### `find(ILongPredicate predicate)`

Returns an `OptionalLong` describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

OptionalLong

**Description**

the `OptionalLong`

### `every(ILongPredicate predicate)`

Returns whether all `Long` elements match `predicate`. If `ILongIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `some(ILongPredicate predicate)`

Returns whether some `Long` element matches `predicate`. If `ILongIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `none(ILongPredicate predicate)`

Returns whether no `Long` elements match `predicate`. If `ILongIterable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

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

Returns an `OptionalLong` describing the maximum `Long` element. <p>Terminal Operation.</p>

#### Return

**Type**

OptionalLong

**Description**

the `OptionalLong` describing the result

### `min()`

Returns an `OptionalLong` describing the minimum `Long` element. <p>Terminal Operation.</p>

#### Return

**Type**

OptionalLong

**Description**

the `OptionalLong` describing the result

### `sum()`

Returns the arithmetic sum of `Long` values. <p>Terminal Operation.</p>

#### Return

**Type**

Long

**Description**

the sum of elements

### `avg()`

Returns the arithmetic mean of `Long` values. <p>Terminal Operation.</p>

#### Return

**Type**

OptionalDouble

**Description**

the `OptionalDouble` describing the result

### `count()`

Returns the count of `Long` elements. <p>Terminal Operation.</p>

#### Return

**Type**

Integer

**Description**

the count of `Long` elements

### `isEmpty()`

Returns the count of `Long` elements is 0. <p>Terminal Operation.</p>

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `toList()`

Accumulates `Long` elements into a `List<Long>`. <p>Terminal Operation.</p>

#### Return

**Type**

List<Long>

**Description**

the List<Long> containing the iterable elements

### `toSet()`

Accumulates `Long` elements into a `Set<Long>`. <p>Terminal Operation.</p>

#### Return

**Type**

Set<Long>

**Description**

the Set<Long> containing the iterable elements

---
