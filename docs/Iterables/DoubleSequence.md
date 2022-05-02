# DoubleSequence

`APIVERSION: 54`

`STATUS: ACTIVE`

A sequence of `Double` elements supporting aggregate operations, a primitive specialization of [ObjectSequence](/docs/Iterables/ObjectSequence.md). <p><a href=&quot;https://en.wikipedia.org/wiki/Monte_Carlo_method&quot;>Monte Carlo method</a></p>


**Author** O. Berehovskyi


**Group** Iterables


**See** [DoubleStream](/docs/Iterables/DoubleStream.md)


**See** [SObjectSequence](/docs/Iterables/SObjectSequence.md)


**See** [ObjectSequence](/docs/Iterables/ObjectSequence.md)


**See** [IntSequence](/docs/Iterables/IntSequence.md)


**See** [LongSequence](/docs/Iterables/LongSequence.md)

## Methods
### `iterator()`

Returns an internal iterator for the elements of this sequence. <p>Terminal Operation.</p>

#### Return

**Type**

Iterator<Double>

**Description**

the internal `Iterator<Long>`

### `toObjectIterable()`

Returns an `ObjectSequence` consisting of the elements of this sequence, converted to Object.

#### Return

**Type**

IObjectIterable

**Description**

the `ObjectSequence`

### `static of(List<Double> doubles)`

Returns a `DoubleSequence` created from `doubles` list.

#### Parameters
|Param|Description|
|---|---|
|`doubles`|the list of Doubles|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `doubles` is null|

#### Example
```apex
IDoubleIterable doubleSeq = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI });
```

### `static of(Set<Double> doubles)`

Returns a `DoubleSequence` created from `doubles` set.

#### Parameters
|Param|Description|
|---|---|
|`doubles`|the set of Doubles|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `doubles` is null|

#### Example
```apex
IDoubleIterable doubleSeq = DoubleSequence.of(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
```

### `static ofNullable(List<Double> doubles)`

Returns a `DoubleSequence` created from `doubles` list if non-null, otherwise returns an empty `DoubleSequence`.

#### Parameters
|Param|Description|
|---|---|
|`doubles`|the list of Doubles|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleSequence` if `doubles` is non-null, otherwise an empty `DoubleSequence`

#### Example
```apex
IDoubleIterable doubleSeq = DoubleSequence.ofNullable(new Set<Double>{ 0, 5L, 1L, -10 });
```

### `static ofNullable(Set<Double> doubles)`

Returns a `DoubleSequence` created from `doubles` set if non-null, otherwise returns an empty `DoubleSequence`.

#### Parameters
|Param|Description|
|---|---|
|`doubles`|the set of Doubles|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleSequence` if `doubles` is non-null, otherwise an empty `DoubleSequence`

#### Example
```apex
IDoubleIterable doubleSeq = DoubleSequence.ofNullable(new Set<Double>{ 0, 5L, 1L, -10 });
```

### `static empty()`

Returns an empty `DoubleSequence`.

#### Return

**Type**

IDoubleIterable

**Description**

the empty `DoubleSequence`

### `static concat(IDoubleIterable iterable1, IDoubleIterable iterable2)`

Returns eagerly concatenated `DoubleSequence` whose elements are all the elements of the first `IDoubleIterable` followed by all the elements of the second `IDoubleIterable`.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `IDoubleIterable`|
|`iterable2`|the second `IDoubleIterable`|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

#### Example
```apex
IDoubleIterable doubleSeq = LongSequence.concat(seq1, seq2);
```

### `static concat(List<IDoubleIterable> iterables)`

Returns eagerly concatenates `List<IDoubleIterable>`.

#### Parameters
|Param|Description|
|---|---|
|`iterables`|the list of `IDoubleIterable`|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some of `IDoubleIterable` in a list is null|

#### Example
```apex
IDoubleIterable doubleSeq = DoubleSequence.concat(seqs);
```

### `static zip(IDoubleIterable iterable1, IDoubleIterable iterable2, IDoubleBinaryOperator combiner)`

Returns a combined `DoubleSequence` by applying `combiner` function to each element at the same position.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `IDoubleIterable`|
|`iterable2`|the second `IDoubleIterable`|
|`combiner`|the binary operator to be applied to each element at the same position|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

### `append(IDoubleIterable iterable)`

Returns new `DoubleSequence` by appending `iterable` to the current sequence.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the `IDoubleIterable` to append to the current sequence|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
```apex
IDoubleIterable doubleSeq = seq1.append(seq2);
```

### `prepend(IDoubleIterable iterable)`

Returns new `DoubleSequence` by prepending `iterable` to the current sequence.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the `IDoubleIterable` to prepend to the current sequence|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
```apex
DoubleIterable doubleSeq = seq1.prepend(seq2);
```

### `stream()`

Returns new `DoubleStream` from the current sequence. <p>Stateful Intermediate Operation.</p>

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleStream`

#### Example
```apex
IDoubleIterable doubleStream = DoubleSequence.of(new Set<Double>{ 0, 5L, 1L, -10 }).stream();
```

### `override filter(IDoublePredicate predicate)`

Returns a `DoubleSequence` with elements that match `predicate`. <p>Stateless Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

#### Return

**Type**

IDoubleIterable

**Description**

the `DoubleSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
List<Double> filtered = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .filter(DoublePredicate.isGreater(0))
    .toList();
```

### `take(IDoublePredicate predicate)`

Returns a `DoubleSequence` which takes elements while elements match `predicate`. <p>Short-circuiting Stateful Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

#### Return

**Type**

IDoubleIterable

**Description**

the `DoubleSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
List<Double> firstFiltered = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .take(DoublePredicate.isGreater(0))
    .toList();
```

### `drop(IDoublePredicate predicate)`

Returns a `DoubleSequence` which drops elements while elements match `predicate`, then takes the rest. <p>Stateful Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

#### Return

**Type**

IDoubleIterable

**Description**

the `DoubleSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
List<Double> rest = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .drop(DoublePredicate.isGreater(0))
    .toList();
```

### `mapTo(IDoubleUnaryOperator mapper)`

Returns a `DoubleSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Return

**Type**

IDoubleIterable

**Description**

the `DoubleSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
List<Double> incrementedDoubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .mapTo(DoubleUnaryOperator.add(1.5))
    .toList();
```

### `mapToInt(IDoubleToIntFunction mapper)`

Returns a `IntSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Return

**Type**

IIntIterable

**Description**

the `IntSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

### `mapToLong(IDoubleToLongFunction mapper)`

Returns a `LongSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Return

**Type**

ILongIterable

**Description**

the `LongSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

### `mapToSObject(IDoubleToSObjectFunction mapper)`

Returns a `SObjectSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Return

**Type**

ISObjectIterable

**Description**

the `SObjectSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

### `mapToObject(IDoubleFunction mapper)`

Returns a `ObjectSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Return

**Type**

IObjectIterable

**Description**

the `ObjectSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

### `forEach(IDoubleConsumer consumer)`

Returns a `DoubleSequence` after performing `consumer` action on each element. <p>Stateful Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`consumer`|the non-interfering, stateless action to be performed on each element. Expected to operate via side effects.|

#### Return

**Type**

IDoubleIterable

**Description**

this `DoubleSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

### `distinct()`

Returns a `DoubleSequence` with distinct elements. <p>Stateful Intermediate Operation.</p>

#### Return

**Type**

IDoubleIterable

**Description**

the `DoubleSequence`

#### Example
```apex
List<Double> distinct = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .distinct()
    .toList();
```

### `sort()`

Returns a `DoubleSequence` with sorted elements in ascending order. <p>Stateful Intermediate Operation.</p>

#### Return

**Type**

IDoubleIterable

**Description**

the `DoubleSequence`

#### Example
```apex
List<Double> sorted = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .sort()
    .toList();
```

### `lim(Integer lim)`

Returns a `DoubleSequence` with first `lim` elements. <p>Short-circuiting Stateful Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

#### Return

**Type**

IDoubleIterable

**Description**

the `DoubleSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `lim` is null|
|`IllegalStateException`|if `lim` is less than 0|

#### Example
```apex
List<Double> first3Doubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .lim(3)
    .toList();
```

### `skip(Integer n)`

Returns a new `DoubleSequence` that skips first `n` elements and returns remaining elements. <p>Stateful Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`n`|the number of elements to skip|

#### Return

**Type**

IDoubleIterable

**Description**

the `DoubleSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `n` is null|
|`IllegalStateException`|if `n` is less than 0|

#### Example
```apex
List<Double> restDoubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .skip(1)
    .toList();
```

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

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

#### Example
```apex
Double naiveSum = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI }).reduce(0.0, DoubleBinaryOperator.sum());
```

### `override reduce(IDoubleBinaryOperator accumulator)`

Performs a reduction on `Double` elements, using `identity` value and associative `accumulator` function, and returns an `OptionalDouble` describing the reduced value. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Return

**Type**

OptionalDouble

**Description**

the `OptionalDouble` result of the reduction

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

#### Example
```apex
Double naiveSum = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
     .reduce(DoubleBinaryOperator.sum())
     .get();
```

### `override collect(ISupplier supplier, IObjectDoubleConsumer accumulator)`

Performs a mutable reduction operation on elements, collecting elements to a container returned by `supplier` by applying `accumulator` function. <p>Terminal Operation.</p>

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

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `accumulator` is null|

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

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
Double firstGreaterDouble = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .find(DoublePredicate.isGreater(1.5))
    .get();
```

### `every(IDoublePredicate predicate)`

Returns whether all elements match `predicate`. If `DoubleSequence` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
Boolean isEveryDoubleGreater = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .every(DoublePredicate.isGreater(1.5))
    .get();
```

### `override some(IDoublePredicate predicate)`

Returns whether some element matches `predicate`. If `DoubleSequence` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
Boolean isSomeDoubleGreater = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .some(DoublePredicate.isGreater(1.5))
    .get();
```

### `count()`

Returns the count of elements. <p>Terminal Operation.</p>

#### Return

**Type**

Integer

**Description**

the count of elements

### `isEmpty()`

Returns whether the count of elements is 0. <p>Terminal Operation.</p>

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `toList()`

Accumulates elements into a `List<Double>`. <p>Terminal Operation.</p>

#### Return

**Type**

List<Double>

**Description**

the `List<Double>` containing the sequence elements

#### Example
```apex
List<Double> restDoubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .skip(1)
    .toList();
```

### `toSet()`

Accumulates elements into a `Set<Double>`. <p>Terminal Operation.</p>

#### Return

**Type**

Set<Double>

**Description**

the `Set<Double>` containing the sequence elements

#### Example
```apex
Set<Double> restDoubles = DoubleSequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .skip(1)
    .toSett();
```

---
