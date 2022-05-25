# IIntIterable

`APIVERSION: 54`

`STATUS: ACTIVE`

A sequence of `Integer` elements supporting aggregate operations.


**Author** O. Berehovskyi


**Group** Iterables


**See** [IObjectIterable](/docs/Iterables/IObjectIterable.md)


**See** [ISObjectIterable](/docs/Iterables/ISObjectIterable.md)


**See** [ILongIterable](/docs/Iterables/ILongIterable.md)


**See** [IDoubleIterable](/docs/Iterables/IDoubleIterable.md)

## Methods
### `append(Iterable<Integer> iterable)`

Returns a new `IIntIterable` from the current to which another `iterable` is appended. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `prepend(Iterable<Integer> iterable)`

Returns a new `IIntIterable` from the current to which another `iterable` is prepended. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `union(Iterable<Integer> iterable)`

Returns a new `IIntIterable` as a set union of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `intersect(Iterable<Integer> iterable)`

Returns a new `IIntIterable` as a set intersection of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `except(Iterable<Integer> iterable)`

Returns a new `IIntIterable` as a set difference of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `toObjectIterable()`

Returns a new `IObjectIterable` from the current `iterable`. <p>Intermediate Operation.</p>

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `toLongIterable()`

Returns a new `ILongIterable` from the current `iterable`. <p>Intermediate Operation.</p>

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

### `toDoubleIterable()`

Returns a new `IDoubleIterable` from the current `iterable`. <p>Intermediate Operation.</p>

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

### `filter(IIntPredicate predicate)`

Returns a new `IIntIterable` with `Integer` elements that match `predicate`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `take(IIntPredicate predicate)`

Returns a new `IIntIterable` that takes `Integer` elements while `predicate` returns `true`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `drop(IIntPredicate predicate)`

Returns a new `IIntIterable` that drops `Integer` elements while `predicate` returns `true`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `withoutNulls()`

Returns a new `IIntIterable` without null elements. <p>Intermediate Operation.</p>

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `mapTo(IIntUnaryOperator mapper)`

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

### `mapToLong(IIntToLongFunction mapper)`

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

### `mapToDouble(IIntToDoubleFunction mapper)`

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

### `mapToSObject(IIntToSObjectFunction mapper)`

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

### `mapToObject(IIntFunction mapper)`

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

### `forEach(IIntConsumer consumer)`

Returns a new `IIntIterable` after performing `consumer` action on each `Long` element. <p>Intermediate Interfering Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`consumer`|the action|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `distinct()`

Returns a new `IIntIterable` with distinct `Integer` elements. <p>Intermediate Operation.</p>

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `sort()`

Returns a new `IIntIterable` with sorted `Integer` elements. <p>Intermediate Operation.</p>

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `lim(Integer lim)`

Returns a new `IIntIterable` with first `lim` `Integer` elements. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `skip(Integer n)`

Returns a new `IIntIterable` that skips first `n` `Integer` elements and returns remaining elements. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`n`|the number of elements to skip|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

### `reduce(Integer identity, IIntBinaryOperator accumulator)`

Performs a reduction on `Integer` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Return

**Type**

Integer

**Description**

the `Integer` result of the reduction

### `reduce(IIntBinaryOperator accumulator)`

Performs a reduction on `Integer` elements, using `identity` value and associative `accumulator` function, and returns an `OptionalInt` describing the reduced value. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Return

**Type**

OptionalInt

**Description**

the `OptionalInt` result of the reduction

### `collect(ISupplier supplier, IObjectIntConsumer accumulator)`

Performs a mutable reduction operation on `Integer` elements, collecting elements to a container returned by `supplier` by applying `accumulator` function. <p>Terminal Operation.</p>

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

### `find(IIntPredicate predicate)`

Returns an `OptionalInt` describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

OptionalInt

**Description**

the `OptionalInt`

### `every(IIntPredicate predicate)`

Returns whether all `Integer` elements match `predicate`. If `IIntIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `some(IIntPredicate predicate)`

Returns whether some `Integer` element matches `predicate`. If `IIntIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `none(IIntPredicate predicate)`

Returns whether no `Integer` elements match `predicate`. If `IIntIterable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

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

Returns an `OptionalInt` describing the maximum `Integer` element. <p>Terminal Operation.</p>

#### Return

**Type**

OptionalInt

**Description**

the `OptionalInt` describing the result

### `min()`

Returns an `OptionalInt` describing the minimum `Integer` element. <p>Terminal Operation.</p>

#### Return

**Type**

OptionalInt

**Description**

the `OptionalInt` describing the result

### `sum()`

Returns the arithmetic sum of `Integer` values. <p>Terminal Operation.</p>

#### Return

**Type**

Integer

**Description**

the sum of elements

### `avg()`

Returns the arithmetic mean of `Integer` values. <p>Terminal Operation.</p>

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

Accumulates `Integer` elements into a `List<Integer>`. <p>Terminal Operation.</p>

#### Return

**Type**

List<Integer>

**Description**

the List<Integer> containing the iterable elements

### `toSet()`

Accumulates `Integer` elements into a `Set<Integer>`. <p>Terminal Operation.</p>

#### Return

**Type**

Set<Integer>

**Description**

the Set<Integer> containing the iterable elements

---
