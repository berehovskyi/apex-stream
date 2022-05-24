# IObjectIterable

`APIVERSION: 54`

`STATUS: ACTIVE`

A sequence of `SObject` elements supporting aggregate operations.


**Author** O. Berehovskyi


**Group** Iterables


**See** [ISObjectIterable](/docs/Iterables/ISObjectIterable.md)


**See** [IIntIterable](/docs/Iterables/IIntIterable.md)


**See** [ILongIterable](/docs/Iterables/ILongIterable.md)


**See** [IDoubleIterable](/docs/Iterables/IDoubleIterable.md)

## Methods
### `append(Iterable<Object> iterable)`

Returns a new `IObjectIterable` from the current to which another `iterable` is appended. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `prepend(Iterable<Object> iterable)`

Returns a new `IObjectIterable` from the current to which another `iterable` is prepended. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `filter(IPredicate predicate)`

Returns a new `IObjectIterable` with `Object` elements that match `predicate`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `take(IPredicate predicate)`

Returns a new `IObjectIterable` that takes `Object` elements while `predicate` returns `true`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `drop(IPredicate predicate)`

Returns a new `IObjectIterable` that drops `Object` elements while `predicate` returns `true`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `withoutNulls()`

Returns a new `IObjectIterable` without null elements. <p>Intermediate Operation.</p>

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `mapTo(IFunction mapper)`

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

### `mapToInt(IToIntFunction mapper)`

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

### `mapToLong(IToLongFunction mapper)`

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

### `mapToDouble(IToDoubleFunction mapper)`

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

### `mapToSObject(IToSObjectFunction mapper)`

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

### `forEach(IConsumer consumer)`

Returns a new `IObjectIterable` after performing `consumer` action on each `SObject` element. <p>Intermediate Interfering Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`consumer`|the action|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `distinct()`

Returns a new `IObjectIterable` with distinct `Object` elements. <p>Intermediate Operation.</p>

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `distinct(IFunction classifier)`

Returns a new `IObjectIterable` with distinct `Object` elements according to `classifier` function. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`classifier`|the classifier function|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `sort()`

Returns a new `IObjectIterable` with sorted `Object` elements. <p>Intermediate Operation.</p>

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `sort(SortOrder order)`

Returns a new `IObjectIterable` with sorted `Object` elements considering `order`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `sort(IComparator comparator)`

Returns a new `IObjectIterable` with sorted `Object` elements according to `comparator`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`comparator`|the comparator|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `lim(Integer lim)`

Returns a new `IObjectIterable` with first `lim` `Object` elements. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `skip(Integer n)`

Returns a new `IObjectIterable` that skips first `n` `Object` elements and returns remaining elements. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`n`|the number of elements to skip|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

### `reduce(Object identity, IBinaryOperator accumulator)`

Performs a reduction on `Object` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Return

**Type**

Object

**Description**

the `Object` result of the reduction

### `reduce(IBinaryOperator accumulator)`

Performs a reduction on `Object` elements, using `identity` value and associative `accumulator` function, and returns an `Optional` describing the reduced value. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Return

**Type**

Optional

**Description**

the `Optional` result of the reduction

### `collect(ISupplier supplier, IBiConsumer accumulator)`

Performs a mutable reduction operation on `Object` elements, collecting elements to a container returned by `supplier` by applying `accumulator` function. <p>Terminal Operation.</p>

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

### `collect(ICollector collector)`

Performs a mutable reduction operation on `Object` elements, collecting elements to a container using `collector`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`collector`|the collector|

#### Return

**Type**

Object

**Description**

the `Object` result of the collection

### `find(IPredicate predicate)`

Returns an `Optional` describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

Optional

**Description**

the `Optional`

### `every(IPredicate predicate)`

Returns whether all `Object` elements match `predicate`. If `IObjectIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `some(IPredicate predicate)`

Returns whether some `Object` element matches `predicate`. If `IObjectIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `none(IPredicate predicate)`

Returns whether no `Object` elements match `predicate`. If `IObjectIterable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `max(IComparator comparator)`

Returns an `Optional` describing the maximum `Object` element according to `comparator`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`comparator`|the comparator|

#### Return

**Type**

Optional

**Description**

the `Optional` describing the result

### `min(IComparator comparator)`

Returns an `Optional` describing the minimum `Object` element according to `comparator`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`comparator`|the comparator|

#### Return

**Type**

Optional

**Description**

the `Optional` describing the result

### `count()`

Returns the count of `Object` elements. <p>Terminal Operation.</p>

#### Return

**Type**

Integer

**Description**

the count of `Object` elements

### `isEmpty()`

Returns the count of `Object` elements is 0. <p>Terminal Operation.</p>

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `toList()`

Accumulates `SObject` elements into a `List<Object>`. <p>Terminal Operation.</p>

#### Return

**Type**

List<Object>

**Description**

the List<Object> containing the iterable elements

### `toList(Type t)`

Accumulates `SObject` elements into a `List<T>`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`t`|the type argument of List|

#### Return

**Type**

List<Object>

**Description**

the List<T> containing the iterable elements

### `toSet()`

Accumulates `SObject` elements into a `Set<Object>`. <p>Terminal Operation.</p>

#### Return

**Type**

Set<Object>

**Description**

the Set<Object> containing the iterable elements

---
