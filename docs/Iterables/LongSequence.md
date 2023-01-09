# LongSequence

`APIVERSION: 56`

`STATUS: ACTIVE`

A sequence of `Long` elements supporting aggregate operations, a primitive specialization of [ObjectSequence](/docs/Iterables/ObjectSequence.md).


**See** [LongStream](/docs/Iterables/LongStream.md)


**See** [SObjectSequence](/docs/Iterables/SObjectSequence.md)


**See** [ObjectSequence](/docs/Iterables/ObjectSequence.md)


**See** [DoubleSequence](/docs/Iterables/DoubleSequence.md)


**See** [IntSequence](/docs/Iterables/IntSequence.md)


**Author** Oleh Berehovskyi


**Group** Iterables

## Methods
### Other
##### `iterator()`

Returns an internal iterator for the elements of this sequence. <p>Terminal Operation.</p>

###### Return

**Type**

Iterator<Long>

**Description**

the internal `Iterator<Long>`

---
### Conversion Operations
##### `toObjectIterable()`

Returns an `ObjectSequence` consisting of the elements of this sequence, converted to Object.

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectSequence`

---
### Sources
##### `static of(List<Long> longs)`

Returns a `LongSequence` created from `longs` list.

###### Parameters
|Param|Description|
|---|---|
|`longs`|the list of Longs|

###### Return

**Type**

ILongIterable

**Description**

the new `LongSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `longs` is null|

###### Example
```apex
ILongIterable longSeq = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 });
```

##### `static of(Set<Long> longs)`

Returns a `LongSequence` created from `longs` set.

###### Parameters
|Param|Description|
|---|---|
|`longs`|the set of Longs|

###### Return

**Type**

ILongIterable

**Description**

the new `LongSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `longs` is null|

###### Example
```apex
ILongIterable longSeq = LongSequence.of(new Set<Long>{ 0, 5L, 1L, -10 });
```

##### `static ofNullable(List<Long> longs)`

Returns a `LongSequence` created from `longs` list if non-null, otherwise returns an empty `LongSequence`.

###### Parameters
|Param|Description|
|---|---|
|`longs`|the list of Longs|

###### Return

**Type**

ILongIterable

**Description**

the new `LongSequence` if `longs` is non-null, otherwise an empty `LongSequence`

###### Example
```apex
ILongIterable longSeq = LongSequence.ofNullable(new List<Long>{ 0, 5L, 1L, -10 });
```

##### `static ofNullable(Set<Long> longs)`

Returns a `LongSequence` created from `longs` set if non-null, otherwise returns an empty `LongSequence`.

###### Parameters
|Param|Description|
|---|---|
|`longs`|the set of Longs|

###### Return

**Type**

ILongIterable

**Description**

the new `LongSequence` if `longs` is non-null, otherwise an empty `LongSequence`

###### Example
```apex
ILongIterable longSeq = LongSequence.ofNullable(new Set<Long>{ 0, 5L, 1L, -10 });
```

##### `static empty()`

Returns an empty `LongSequence`.

###### Return

**Type**

ILongIterable

**Description**

the empty `LongSequence`

##### `static range(Long fromLong, Long toLong)`

Returns an ordered `LongSequence` from `fromLong` (inclusive) to `toLong` (inclusive) by an incremental step of 1.

###### Parameters
|Param|Description|
|---|---|
|`fromLong`|the inclusive initial value|
|`toLong`|the inclusive upper bound|

###### Return

**Type**

ILongIterable

**Description**

the new `LongSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fromLong` or `toLong` is null|

###### Example
```apex
ILongIterable longSeqFrom0To100 = LongSequence.range(0, 100);
```

##### `static concat(Iterable<Long> iterable1, Iterable<Long> iterable2)`

Returns eagerly concatenated `LongSequence` whose elements are all the elements of the first `Iterable<Long>` followed by all the elements of the second `Iterable<Long>`.

###### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Long>`|
|`iterable2`|the second `Iterable<Long>`|

###### Return

**Type**

ILongIterable

**Description**

the new `LongSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

###### Example
```apex
ILongIterable longSeq = LongSequence.concat(seq1, seq2);
```

##### `static concat(List<Iterable<Long>> iterables)`

Returns eagerly concatenates `List<Iterable<Long>>`.

###### Parameters
|Param|Description|
|---|---|
|`iterables`|the list of `Iterable<Long>`|

###### Return

**Type**

ILongIterable

**Description**

the new `LongSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some element in a list is null|

###### Example
```apex
ILongIterable longSeq = LongStream.concat(seqs);
```

##### `static zip(Iterable<Long> iterable1, Iterable<Long> iterable2, ILongBinaryOperator combiner)`

Returns a combined `LongSequence` by applying `combiner` function to each element at the same position.

###### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Long>`|
|`iterable2`|the second `Iterable<Long>`|
|`combiner`|the binary operator to be applied to each element at the same position|

###### Return

**Type**

ILongIterable

**Description**

the new `LongSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

##### `override append(Iterable<Long> iterable)`

Returns new `LongSequence` by appending `iterable` to the current sequence.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the `Iterable<Long>` to append to the current sequence|

###### Return

**Type**

ILongIterable

**Description**

the new `LongSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
ILongIterable longSeq = seq1.append(seq2);
```

##### `prepend(Iterable<Long> iterable)`

Returns new `LongSequence` by prepending `iterable` to the current sequence.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the `Iterable<Long>` to prepend to the current sequence|

###### Return

**Type**

ILongIterable

**Description**

the new `LongSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
ILongIterable longSeq = seq1.prepend(seq2);
```

---
### Intermediate Operations
##### `stream()`

Returns new `LongStream` from the current sequence. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

ILongIterable

**Description**

the new `LongStream`

###### Example
```apex
ILongIterable longStream = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 }).stream();
```

##### `override filter(ILongPredicate predicate)`

Returns a `LongSequence` with elements that match `predicate`. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

ILongIterable

**Description**

the `LongSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Long> filtered = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
    .filter(LongPredicates.isGreater(0))
    .toList();
```

##### `take(ILongPredicate predicate)`

Returns a `LongSequence` which takes elements while elements match `predicate`. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

ILongIterable

**Description**

the `LongSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Long> firstFiltered = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
    .take(LongPredicates.isGreater(0))
    .toList();
```

##### `drop(ILongPredicate predicate)`

Returns a `LongSequence` which drops elements while elements match `predicate`, then takes the rest. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

ILongIterable

**Description**

the `LongSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Long> rest = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
    .drop(LongPredicates.isGreater(0))
    .toList();
```

##### `mapTo(ILongUnaryOperator mapper)`

Returns a `LongSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

ILongIterable

**Description**

the `LongSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Long> incrementedLongs = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
    .mapTo(LongUnaryOperators.add(1L))
    .toList();
```

##### `override mapToInt(ILongToIntFunction mapper)`

Returns a `IntSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IIntIterable

**Description**

the `IntSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

##### `override mapToDouble(ILongToDoubleFunction mapper)`

Returns a `DoubleSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IDoubleIterable

**Description**

the `DoubleSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

##### `mapToSObject(ILongToSObjectFunction mapper)`

Returns a `SObjectSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

##### `mapToObject(ILongFunction mapper)`

Returns a `ObjectSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

##### `forEach(ILongConsumer consumer)`

Returns a `LongSequence` after performing `consumer` action on each element. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`consumer`|the non-interfering, stateless action to be performed on each element. Expected to operate via side effects.|

###### Return

**Type**

ILongIterable

**Description**

this `LongSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

##### `override distinct()`

Returns a `LongSequence` with distinct elements. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

ILongIterable

**Description**

the `LongSequence`

###### Example
```apex
List<Long> distinct = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
    .distinct()
    .toList();
```

##### `sort()`

Returns a `LongSequence` with sorted elements in ascending order. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

ILongIterable

**Description**

the `LongSequence`

###### Example
```apex
List<Long> sorted = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
    .sort()
    .toList();
```

##### `lim(Integer lim)`

Returns a `LongSequence` with first `lim` elements. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

###### Return

**Type**

ILongIterable

**Description**

the `LongSequence`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `lim` is less than 0|
|`NullPointerException`|if `lim` is null|

###### Example
```apex
List<Long> first3Longs = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
    .lim(3)
    .toList();
```

##### `skip(Integer n)`

Returns a new `LongSequence` that skips first `n` elements and returns remaining elements. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`n`|the number of elements to skip|

###### Return

**Type**

ILongIterable

**Description**

the `LongSequence`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `n` is less than 0|
|`NullPointerException`|if `n` is null|

###### Example
```apex
List<Long> restLongs = LongStream.of(new List<Long>{ 0, 5L, 1L, -10 })
    .skip(1)
    .toList();
```

---
### Terminal Operations
##### `reduce(Long identity, ILongBinaryOperator accumulator)`

Performs a reduction on `Long` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Return

**Type**

Long

**Description**

the `Long` result of the reduction

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
Long sum = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 }).reduce(0L, LongBinaryOperators.sum());
Long factorialOfN = LongSequence.range(1, n).reduce(1, LongBinaryOperators.product());
```

##### `override reduce(ILongBinaryOperator accumulator)`

Performs a reduction on `Long` elements, using `identity` value and associative `accumulator` function, and returns an `OptionalLong` describing the reduced value. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Return

**Type**

OptionalLong

**Description**

the `OptionalLong` result of the reduction

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
Long sum = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
     .reduce(LongBinaryOperators.sum())
     .get();
```

##### `collect(ISupplier supplier, IObjectLongConsumer accumulator)`

Performs a mutable reduction operation on elements, collecting elements to a container returned by `supplier` by applying `accumulator` function. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the function that returns a mutable result container|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Return

**Type**

Object

**Description**

the `Object` result of the collection

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `accumulator` is null|

##### `find(ILongPredicate predicate)`

Returns an `OptionalLong` describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

OptionalLong

**Description**

the `OptionalLong`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Long firstEvenLong = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
    .find(LongPredicates.isEven())
    .get();
```

##### `every(ILongPredicate predicate)`

Returns whether all elements match `predicate`. If `LongSequence` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

Boolean

**Description**

`true` or `false`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Boolean isEveryLongEven = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
    .every(LongPredicates.isEven())
    .get();
```

##### `override some(ILongPredicate predicate)`

Returns whether some element matches `predicate`. If `LongSequence` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

Boolean

**Description**

`true` or `false`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Boolean isSomeLongEven = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
    .some(LongPredicates.isEven())
    .get();
```

##### `sum()`

Returns the sum of elements. <p>Terminal Operation.</p>

###### Return

**Type**

Long

**Description**

the sum of elements

##### `avg()`

Returns `OptionalDouble` describing the arithmetic mean of elements of this sequence, or an empty `OptionalDouble` if this sequence is empty. <p>Terminal Operation.</p>

###### Return

**Type**

OptionalDouble

**Description**

the arithmetic mean of elements

##### `count()`

Returns the count of elements. <p>Terminal Operation.</p>

###### Return

**Type**

Integer

**Description**

the count of elements

##### `isEmpty()`

Returns whether the count of elements is 0. <p>Terminal Operation.</p>

###### Return

**Type**

Boolean

**Description**

`true` or `false`

##### `toList()`

Accumulates elements into a `List<Long>`. <p>Terminal Operation.</p>

###### Return

**Type**

List<Long>

**Description**

the `List<Long>` containing the sequence elements

###### Example
```apex
List<Long> restLongs = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 })
    .lim(1)
    .toList();
```

##### `toSet()`

Accumulates elements into a `Set<Long>`. <p>Terminal Operation.</p>

###### Return

**Type**

Set<Long>

**Description**

the `Set<Long>` containing the sequence elements

###### Example
```apex
List<Long> restLongs = LongSequence.of(new Set<Long>{ 0, 5L, 1L, -10 })
    .lim(1)
    .toList();
```

---
