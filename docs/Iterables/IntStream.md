# IntStream

`APIVERSION: 54`

`STATUS: ACTIVE`

A sequence of `Integer` elements supporting aggregate operations, a primitive specialization of [ObjectStream](/docs/Iterables/ObjectStream.md).


**Author** O. Berehovskyi


**Group** Iterables


**See** [IntSequence](/docs/Iterables/IntSequence.md)


**See** [SObjectStream](/docs/Iterables/SObjectStream.md)


**See** [ObjectStream](/docs/Iterables/ObjectStream.md)


**See** [DoubleStream](/docs/Iterables/DoubleStream.md)


**See** [LongStream](/docs/Iterables/LongStream.md)

## Properties

### `isOperated` → `Boolean`


A flag defining whether this stream has been linked or consumed.

---
## Methods
### Other
##### `iterator()`

Returns an internal iterator for the elements of this stream. <p>Terminal Operation.</p>

###### Return

**Type**

Iterator<Integer>

**Description**

the internal `Iterator<Integer>`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if this stream has been operated (linked or consumed)|

---
### Conversion Operations
##### `toObjectIterable()`

Returns an `ObjectStream` consisting of the elements of this stream, converted to Object.

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectStream`

---
### Sources
##### `static of(Iterator<Integer> iterator)`

Returns a `IntStream` created from `iterator`.

###### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|

###### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

###### Example
```apex
IIntIterable intStream = IntStream.of(new List<Integer>{ 0, 5, 1, -10 }.iterator());
IIntIterable intStream = IntStream.of(new Set<Integer>{ 0, 5, 1, -10 }.iterator());
IIntIterable intStream = IntStream.of(otherStream.iterator());
```

##### `static of(Iterable<Integer> integers)`

Returns a `IntStream` created from `integers`.

###### Parameters
|Param|Description|
|---|---|
|`integers`|the iterable|

###### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `integers` is null|

###### Example
```apex
IIntIterable intStream = IntStream.of(new List<Integer>{ 0, 5, 1, -10 });
IIntIterable intStream = IntStream.of((Iterable<Integer>) new Set<Integer>{ 0, 5, 1, -10 });
```

##### `static ofNullable(Iterable<Integer> integers)`

Returns a `IntStream` created from `integers` if non-null, otherwise returns an empty `IntStream`.

###### Parameters
|Param|Description|
|---|---|
|`integers`|the iterable|

###### Return

**Type**

IIntIterable

**Description**

the new `IntStream` if `integers` is non-null, otherwise an empty `IntStream`

###### Example
```apex
IIntIterable intStream = IntStream.ofNullable(new List<Integer>{ 0, 5, 1, -10 });
```

##### `static empty()`

Returns an empty `IntStream`.

###### Return

**Type**

IIntIterable

**Description**

the empty `IntStream`

##### `static range(Integer fromInt, Integer toInt)`

Returns an ordered `IntStream` from `fromInt` (inclusive) to `toInt` (inclusive) by an incremental step of 1.

###### Parameters
|Param|Description|
|---|---|
|`fromInt`|the inclusive initial value|
|`toInt`|the inclusive upper bound|

###### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fromInt` or `toInt` is null|

###### Example
```apex
IIntIterable intStreamFrom0To100 = IntStream.range(0, 100);
```

##### `static generate(IIntSupplier supplier)`

Returns an infinite `IntStream` where each element is generated by `supplier`.

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier of generated elements|

###### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

###### Example
```apex
IIntIterable fibonacciInfiniteStream = IntStream.generate(IntSupplier.fibonacci());
```

##### `static iterate(Integer seed, IIntUnaryOperator operator)`

Returns an infinite `IntStream` produced by iterative application of `operator` to an initial element `seed`, producing a `IntStream` consisting of `seed`, `operator(seed)`, `operator(operator(seed))`, etc.

###### Parameters
|Param|Description|
|---|---|
|`seed`|the initial element|
|`operator`|the operator to be applied to the previous element to produce a new element|

###### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

###### Example
```apex
IIntIterable intIncrementalStream = IntStream.iterate(0, IntUnaryOperator.add(1));
```

##### `static iterate(Integer seed, IIntPredicate predicate, IIntUnaryOperator operator)`

Returns an infinite `IntStream` produced by iterative application of `operator` to an initial element `seed`, conditioned on satisfying `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`seed`|the initial element|
|`predicate`|the predicate to determine when the stream must be terminated|
|`operator`|the operator to be applied to the previous element to produce a new element|

###### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `supplier` is null|

##### `static concat(Iterable<Integer> iterable1, Iterable<Integer> iterable2)`

Returns lazily concatenated `IntStream` whose elements are all the elements of the first `Iterable<Integer>` followed by all the elements of the second `Iterable<Integer>`.

###### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Integer>`|
|`iterable2`|the second `Iterable<Integer>`|

###### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

###### Example
```apex
IIntIterable intStream = IntStream.concat(stream1, stream2);
```

##### `static concat(List<Iterable<Integer>> iterables)`

Returns lazily concatenated `List<Iterable<Integer>>`.

###### Parameters
|Param|Description|
|---|---|
|`iterables`|the list of `Iterable<Integer>`|

###### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some element in a list is null|

###### Example
```apex
IIntIterable intStream = IntStream.concat(streams);
```

##### `static zip(Iterable<Integer> iterable1, Iterable<Integer> iterable2, IIntBinaryOperator combiner)`

Returns a combined `IntStream` by applying `combiner` function to each element at the same position.

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

the new `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

##### `override append(Iterable<Integer> iterable)`

Returns new `IntStream` by appending `iterable` to the current stream.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the `Iterable<Integer>` to append to the current stream|

###### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
IIntIterable intStream = stream1.append(stream2);
```

##### `prepend(Iterable<Integer> iterable)`

Returns new `IntStream` by prepending `iterable` to the current stream.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the `Iterable<Integer>` to prepend to the current stream|

###### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
IIntIterable intStream = stream1.prepend(stream2);
```

---
### Intermediate Operations
##### `sequence()`

Returns new `IntSequence` from the current stream. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

IIntIterable

**Description**

the new `IntSequence`

###### Example
```apex
IIntIterable intSeq = IntStream.of(new List<Integer>{ 0, 5, 1, -10 }).sequence();
```

##### `override filter(IIntPredicate predicate)`

Returns a `IntStream` with elements that match `predicate`. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

IIntIterable

**Description**

the `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Integer> filtered = IntStream.of(new List<Integer>{ 0, 5, 1, -10 })
    .filter(IntPredicate.isGreater(0))
    .toList();
```

##### `take(IIntPredicate predicate)`

Returns a `IntStream` which takes elements while elements match `predicate`. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

IIntIterable

**Description**

the `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Integer> firstFiltered = IntStream.of(new List<Integer>{ 0, 5, 1, -10 })
    .take(IntPredicate.isGreater(0))
    .toList();
```

##### `drop(IIntPredicate predicate)`

Returns a `IntStream` which drops elements while elements match `predicate`, then takes the rest. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

IIntIterable

**Description**

the `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Integer> rest = IntStream.of(new List<Integer>{ 0, 5, 1, -10 })
    .drop(IntPredicate.isGreater(0))
    .toList();
```

##### `mapTo(IIntUnaryOperator mapper)`

Returns a `IntStream` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IIntIterable

**Description**

the `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Integer> incrementedInts = IntStream.of(new List<Integer>{ 0, 5, 1, -10 })
    .mapTo(IntUnaryOperator.add(1))
    .toList();
```

##### `override mapToLong(IIntToLongFunction mapper)`

Returns a `LongStream` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

ILongIterable

**Description**

the `LongStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

##### `override mapToDouble(IIntToDoubleFunction mapper)`

Returns a `DoubleStream` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IDoubleIterable

**Description**

the `DoubleStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

##### `mapToSObject(IIntToSObjectFunction mapper)`

Returns a `SObjectStream` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

##### `mapToObject(IIntFunction mapper)`

Returns a `ObjectStream` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

##### `forEach(IIntConsumer consumer)`

Returns a `IntStream` after performing `consumer` action on each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`consumer`|the non-interfering, stateless action to be performed on each element. Expected to operate via side effects.|

###### Return

**Type**

IIntIterable

**Description**

the `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

##### `override distinct()`

Returns a `IntStream` with distinct elements. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

IIntIterable

**Description**

the `IntStream`

###### Example
```apex
List<Integer> distinct = IntStream.of(new List<Integer>{ 0, 5, 1, -10 })
    .distinct()
    .toList();
```

##### `sort()`

Returns a `IntStream` with sorted elements in ascending order. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

IIntIterable

**Description**

the `IntStream`

###### Example
```apex
List<Integer> sorted = IntStream.of(new List<Integer>{ 0, 5, 1, -10 })
    .sort()
    .toList();
```

##### `lim(Integer lim)`

Returns a `IntStream` with first `lim` elements. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

###### Return

**Type**

IIntIterable

**Description**

the `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `lim` is null|
|`IllegalStateException`|if `lim` is less than 0|

###### Example
```apex
List<Integer> first3Ints = IntStream.of(new List<Integer>{ 0, 5, 1, -10 })
    .lim(3)
    .toList();
```

##### `skip(Integer n)`

Returns a new `IntStream` that skips first `n` elements and returns remaining elements. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`n`|the number of elements to skip|

###### Return

**Type**

IIntIterable

**Description**

the `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `n` is null|
|`IllegalStateException`|if `n` is less than 0|

###### Example
```apex
List<Integer> restLongs = IntStream.of(new List<Integer>{ 0, 5, 1, -10 })
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
Integer sum = IntStream.of(new List<Integer>{ 0, 5, 1, -10 }).reduce(0, IntBinaryOperator.sum());
Integer factorialOfN = IntStream.range(1, n).reduce(1, IntBinaryOperator.product());
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
Integer sum = IntStream.of(new List<Integer>{ 0, 5, 1, -10 })
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
Integer firstEvenInt = IntStream.of(new List<Integer>{ 0, 5, 1, -10 })
    .find(IntPredicate.isEven())
    .get();
```

##### `every(IIntPredicate predicate)`

Returns whether all elements match `predicate`. If `IntStream` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

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
Boolean isEveryIntEven = IntStream.of(new List<Integer>{ 0, 5, 1, -10 })
    .every(IntPredicate.isEven())
    .get();
```

##### `override some(IIntPredicate predicate)`

Returns whether some element matches `predicate`. If `IntStream` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

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
Boolean isSomeLongEven = IntStream.of(new List<Integer>{ 0, 5, 1, -10 })
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

Returns `OptionalDouble` describing the arithmetic mean of elements of this stream, or an empty `OptionalDouble` if this stream is empty. <p>Terminal Operation.</p>

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

the `List<Integer>` containing the stream elements

###### Example
```apex
List<Integer> restInts = IntStream.of(new List<Integer>{ 0, 5, 1, -10 })
    .skip(1)
    .toList();
```

##### `toSet()`

Accumulates elements into a `Set<Integer>`. <p>Terminal Operation.</p>

###### Return

**Type**

Set<Integer>

**Description**

the `Set<Integer>` containing the stream elements

###### Example
```apex
Set<Integer> restInts = IntStream.of(new List<Integer>{ 0, 5, 1, -10 })
    .skip(1)
    .toSet();
```

---
