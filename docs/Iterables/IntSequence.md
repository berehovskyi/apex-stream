# IntSequence

`APIVERSION: 54`

`STATUS: ACTIVE`

A sequence of `Integer` elements supporting aggregate operations, a primitive specialization of [ObjectSequence](/docs/Iterables/ObjectSequence.md).


**Author** O. Berehovskyi


**Group** Iterables


**See** [IntStream](/docs/Iterables/IntStream.md)


**See** [SObjectSequence](/docs/Iterables/SObjectSequence.md)


**See** [ObjectSequence](/docs/Iterables/ObjectSequence.md)


**See** [DoubleSequence](/docs/Iterables/DoubleSequence.md)


**See** [LongSequence](/docs/Iterables/LongSequence.md)

## Methods
### Other
##### `iterator()`

Returns an internal iterator for the elements of this sequence. <p>Terminal Operation.</p>

###### Return

**Type**

Iterator<Integer>

**Description**

the internal `Iterator<Integer>`

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
##### `static of(List<Integer> integers)`

Returns a `IntSequence` created from `integers` list.

###### Parameters
|Param|Description|
|---|---|
|`integers`|the list of Longs|

###### Return

**Type**

IIntIterable

**Description**

the new `IntSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `integers` is null|

###### Example
```apex
IIntIterable intSeq = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 });
```

##### `static of(Set<Integer> integers)`

Returns a `IntSequence` created from `integers` set.

###### Parameters
|Param|Description|
|---|---|
|`integers`|the set of Integers|

###### Return

**Type**

IIntIterable

**Description**

the new `IntSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `integers` is null|

###### Example
```apex
IIntIterable intSeq = IntSequence.of(new Set<Integer>{ 0, 5, 1, -10 });
```

##### `static ofNullable(List<Integer> integers)`

Returns a `IntSequence` created from `integers` list if non-null, otherwise returns an empty `IntSequence`.

###### Parameters
|Param|Description|
|---|---|
|`integers`|the list of Integers|

###### Return

**Type**

IIntIterable

**Description**

the new `IntSequence` if `integers` is non-null, otherwise an empty `IntSequence`

###### Example
```apex
IIntIterable intSeq = IntSequence.ofNullable(new List<Integer>{ 0, 5, 1, -10 });
```

##### `static ofNullable(Set<Integer> integers)`

Returns a `IntSequence` created from `integers` set if non-null, otherwise returns an empty `IntSequence`.

###### Parameters
|Param|Description|
|---|---|
|`integers`|the set of Integers|

###### Return

**Type**

IIntIterable

**Description**

the new `IntSequence` if `integers` is non-null, otherwise an empty `IntSequence`

###### Example
```apex
IIntIterable intSeq = IntSequence.ofNullable(new Set<Integer>{ 0, 5, 1, -10 });
```

##### `static empty()`

Returns an empty `IntSequence`.

###### Return

**Type**

IIntIterable

**Description**

the empty `IntSequence`

##### `static range(Integer fromInt, Integer toInt)`

Returns an ordered `IntSequence` from `fromInt` (inclusive) to `toInt` (inclusive) by an incremental step of 1.

###### Parameters
|Param|Description|
|---|---|
|`fromInt`|the inclusive initial value|
|`toInt`|the inclusive upper bound|

###### Return

**Type**

IIntIterable

**Description**

the new `IntSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fromInt` or `toInt` is null|

###### Example
```apex
IIntIterable intSeqFrom0To100 = IntSequence.range(0, 100);
```

##### `static concat(Iterable<Integer> iterable1, Iterable<Integer> iterable2)`

Returns eagerly concatenated `IntSequence` whose elements are all the elements of the first `Iterable<Integer>` followed by all the elements of the second `Iterable<Integer>`.

###### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Integer>`|
|`iterable2`|the second `Iterable<Integer>`|

###### Return

**Type**

IIntIterable

**Description**

the new `IntSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

###### Example
```apex
IIntIterable intSeq = IntSequence.concat(seq1, seq2);
```

##### `static concat(List<Iterable<Integer>> iterables)`

Returns eagerly concatenates `List<Iterable<Integer>>`.

###### Parameters
|Param|Description|
|---|---|
|`iterables`|the list of `Iterable<Integer>`|

###### Return

**Type**

IIntIterable

**Description**

the new `IntSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some element in a list is null|

###### Example
```apex
IIntIterable intSeq = IntSequence.concat(seqs);
```

##### `static zip(Iterable<Integer> iterable1, Iterable<Integer> iterable2, IIntBinaryOperator combiner)`

Returns a combined `IntSequence` by applying `combiner` function to each element at the same position.

###### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Integer>`|
|`iterable2`|the second `Iterable<Integer>`|
|`combiner`|the binary operator to be applied to each element at the same position|

###### Return

**Type**

IIntIterable

**Description**

the new `IntSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

##### `override append(Iterable<Integer> iterable)`

Returns new `IntSequence` by appending `iterable` to the current sequence.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the `Iterable<Integer>` to append to the current sequence|

###### Return

**Type**

IIntIterable

**Description**

the new `IntSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
IIntIterable intSeq = seq1.append(seq2);
```

##### `prepend(Iterable<Integer> iterable)`

Returns new `IntSequence` by prepending `iterable` to the current sequence.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the `Iterable<Integer>` to prepend to the current sequence|

###### Return

**Type**

IIntIterable

**Description**

the new `IntSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
IIntIterable intSeq = seq1.prepend(seq2);
```

---
### Intermediate Operations
##### `stream()`

Returns new `IntStream` from the current sequence. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

###### Example
```apex
IIntIterable intStream = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 }).stream();
```

##### `override filter(IIntPredicate predicate)`

Returns a `IntSequence` with elements that match `predicate`. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

IIntIterable

**Description**

the `IntSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Integer> filtered = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .filter(IntPredicate.isGreater(0))
    .toList();
```

##### `take(IIntPredicate predicate)`

Returns a `IntSequence` which takes elements while elements match `predicate`. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

IIntIterable

**Description**

the `IntSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Integer> firstFiltered = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .take(IntPredicate.isGreater(0))
    .toList();
```

##### `drop(IIntPredicate predicate)`

Returns a `IntSequence` which drops elements while elements match `predicate`, then takes the rest. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

IIntIterable

**Description**

the `IntSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Integer> rest = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .drop(IntPredicate.isGreater(0))
    .toList();
```

##### `mapTo(IIntUnaryOperator mapper)`

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

###### Example
```apex
List<Integer> incrementedInts = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .mapTo(IntUnaryOperator.add(1))
    .toList();
```

##### `override mapToLong(IIntToLongFunction mapper)`

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

##### `override mapToDouble(IIntToDoubleFunction mapper)`

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

##### `mapToSObject(IIntToSObjectFunction mapper)`

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

##### `mapToObject(IIntFunction mapper)`

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

##### `forEach(IIntConsumer consumer)`

Returns a `IntSequence` after performing `consumer` action on each element. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`consumer`|the non-interfering, stateless action to be performed on each element. Expected to operate via side effects.|

###### Return

**Type**

IIntIterable

**Description**

this `IntSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

##### `override distinct()`

Returns a `IntSequence` with distinct elements. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

IIntIterable

**Description**

the `IntSequence`

###### Example
```apex
List<Integer> distinct = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .distinct()
    .toList();
```

##### `sort()`

Returns a `IntSequence` with sorted elements in ascending order. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

IIntIterable

**Description**

the `IntSequence`

###### Example
```apex
List<Integer> sorted = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .sort()
    .toList();
```

##### `lim(Integer lim)`

Returns a `IntSequence` with first `lim` elements. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

###### Return

**Type**

IIntIterable

**Description**

the `IntSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `lim` is null|
|`IllegalStateException`|if `lim` is less than 0|

###### Example
```apex
List<Integer> first3Ints = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .lim(3)
    .toList();
```

##### `skip(Integer n)`

Returns a new `IntSequence` that skips first `n` elements and returns remaining elements. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`n`|the number of elements to skip|

###### Return

**Type**

IIntIterable

**Description**

the `IntSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `n` is null|
|`IllegalStateException`|if `n` is less than 0|

###### Example
```apex
List<Integer> restInts = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .skip(1)
    .toList();
```

---
### Terminal Operations
##### `reduce(Integer identity, IIntBinaryOperator accumulator)`

Performs a reduction on `Integer` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Return

**Type**

Integer

**Description**

the `Integer` result of the reduction

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
Integer sum = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 }).reduce(0, IntBinaryOperator.sum());
Integer factorialOfN = IntSequence.range(1, n).reduce(1, IntBinaryOperator.product());
```

##### `override reduce(IIntBinaryOperator accumulator)`

Performs a reduction on `Integer` elements, using `identity` value and associative `accumulator` function, and returns an `OptionalInt` describing the reduced value. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Return

**Type**

OptionalInt

**Description**

the `OptionalInt` result of the reduction

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
Integer sum = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
     .reduce(IntBinaryOperator.sum())
     .get();
```

##### `collect(ISupplier supplier, IObjectIntConsumer accumulator)`

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

##### `find(IIntPredicate predicate)`

Returns an `OptionalInt` describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

OptionalInt

**Description**

the `OptionalInt`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Integer firstEvenInt = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .find(IntPredicate.isEven())
    .get();
```

##### `every(IIntPredicate predicate)`

Returns whether all elements match `predicate`. If `IntSequence` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

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
Boolean isEveryIntEven = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .every(IntPredicate.isEven())
    .get();
```

##### `override some(IIntPredicate predicate)`

Returns whether some element matches `predicate`. If `IntSequence` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

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
Boolean isSomeLongEven = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .some(IntPredicate.isEven())
    .get();
```

##### `sum()`

Returns the sum of elements. <p>Terminal Operation.</p>

###### Return

**Type**

Integer

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

Accumulates elements into a `List<Integer>`. <p>Terminal Operation.</p>

###### Return

**Type**

List<Integer>

**Description**

the `List<Integer>` containing the sequence elements

###### Example
```apex
List<Integer> restInts = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .lim(1)
    .toList();
```

##### `toSet()`

Accumulates elements into a `Set<Integer>`. <p>Terminal Operation.</p>

###### Return

**Type**

Set<Integer>

**Description**

the `Set<Integer>` containing the sequence elements

###### Example
```apex
Set<Integer> restInts = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .lim(1)
    .toSet();
```

---
