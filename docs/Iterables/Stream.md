# Stream

`APIVERSION: 57`

`STATUS: ACTIVE`

An entry point that returns a stream of a certain type, depending on the type of the parameter.


**See** [ObjectStream](/docs/Iterables/ObjectStream.md)


**See** [SObjectStream](/docs/Iterables/SObjectStream.md)


**See** [IntStream](/docs/Iterables/IntStream.md)


**See** [LongStream](/docs/Iterables/LongStream.md)


**See** [DoubleStream](/docs/Iterables/DoubleStream.md)


**Author** Oleh Berehovskyi


**Group** Iterables

## Methods
### `static of(List<Object> objects)`

Returns a `ObjectStream` created from `List<Object>`.

#### Parameters
|Param|Description|
|---|---|
|`objects`|the list|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
```apex
IObjectIterable peopleStream = Stream.of(new List<Person>(people));
```

### `static of(List<SObject> sObjects)`

Returns a `SObjectStream` created from `sObjects`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` is null|

#### Example
```apex
ISObjectIterable accStream = Stream.of(new List<Account>(accounts));
```

### `static of(List<Integer> integers)`

Returns a `IntStream` created from `integers`.

#### Parameters
|Param|Description|
|---|---|
|`integers`|the list|

#### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `integers` is null|

#### Example
```apex
IIntIterable intStream = Stream.of(new List<Integer>{ 0, 5, 1, -10 });
```

### `static of(List<Long> longs)`

Returns a `LongStream` created from `longs`.

#### Parameters
|Param|Description|
|---|---|
|`longs`|the list|

#### Return

**Type**

ILongIterable

**Description**

the new `LongStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

#### Example
```apex
ILongIterable longStream = Stream.of(new List<Long>{ 0, 5L, 1L, -10 });
```

### `static of(List<Double> doubles)`

Returns a `DoubleStream` created from `doubles`.

#### Parameters
|Param|Description|
|---|---|
|`doubles`|the list|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `doubles` is null|

#### Example
```apex
IDoubleIterable doubleStream = Stream.of(new List<Double>{ 0.1, 5, 1.5, Math.PI });
```

### `static of(Set<Object> objects)`

Returns a `ObjectStream` created from `Set<Object>`.

#### Parameters
|Param|Description|
|---|---|
|`objects`|the set|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `objects` is null|

#### Example
```apex
IObjectIterable peopleStream = Stream.of(new Set<Person>(people));
```

### `static of(Set<SObject> sObjects)`

Returns a `SObjectStream` created from `sObjects`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the set|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` is null|

#### Example
```apex
ISObjectIterable accStream = Stream.of(new Set<SObject>(accounts));
```

### `static of(Set<Integer> integers)`

Returns a `IntStream` created from `integers`.

#### Parameters
|Param|Description|
|---|---|
|`integers`|the set|

#### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `integers` is null|

#### Example
```apex
IIntIterable intStream = Stream.of(new Set<Integer>{ 0, 5, 1, -10 });
```

### `static of(Set<Long> longs)`

Returns a `LongStream` created from `longs`.

#### Parameters
|Param|Description|
|---|---|
|`longs`|the set|

#### Return

**Type**

ILongIterable

**Description**

the new `LongStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

#### Example
```apex
ILongIterable longStream = Stream.of(new Set<Long>{ 0, 5L, 1L, -10 });
```

### `static of(Set<Double> doubles)`

Returns a `DoubleStream` created from `doubles`.

#### Parameters
|Param|Description|
|---|---|
|`doubles`|the set|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `doubles` is null|

#### Example
```apex
IDoubleIterable doubleStream = Stream.of(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
```

### `static ofNullable(List<Object> objects)`

Returns a `ObjectStream` created from `objects` if non-null, otherwise returns an empty `ObjectStream`.

#### Parameters
|Param|Description|
|---|---|
|`objects`|the list|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream` if `objects` is non-null, otherwise an empty `ObjectStream`

#### Example
```apex
IObjectIterable peopleStream = Stream.ofNullable(new List<Person>(people));
```

### `static ofNullable(List<SObject> sObjects)`

Returns a `SObjectStream` created from `sObjects` if non-null, otherwise returns an empty `SObjectStream`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream` if `iterable` is non-null, otherwise an empty `SObjectStream`

#### Example
```apex
ISObjectIterable accStream = Stream.ofNullable(new List<Account>(accounts));
```

### `static ofNullable(List<Integer> integers)`

Returns a `IntStream` created from `integers` if non-null, otherwise returns an empty `IntStream`.

#### Parameters
|Param|Description|
|---|---|
|`integers`|the list|

#### Return

**Type**

IIntIterable

**Description**

the new `IntStream` if `integers` is non-null, otherwise an empty `IntStream`

#### Example
```apex
IIntIterable intStream = Stream.ofNullable(new List<Integer>{ 0, 5, 1, -10 });
```

### `static ofNullable(List<Long> longs)`

Returns a `LongStream` created from `longs` if non-null, otherwise returns an empty `LongStream`.

#### Parameters
|Param|Description|
|---|---|
|`longs`|the list|

#### Return

**Type**

ILongIterable

**Description**

the new `LongStream` if `longs` is non-null, otherwise an empty `LongStream`

#### Example
```apex
ILongIterable longStream = LongStream.ofNullable(new List<Long>{ 0, 5L, 1L, -10 });
```

### `static ofNullable(List<Double> doubles)`

Returns a `DoubleStream` created from `doubles` if non-null, otherwise returns an empty `DoubleStream`.

#### Parameters
|Param|Description|
|---|---|
|`doubles`|the list|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleStream` if `doubles` is non-null, otherwise an empty `DoubleStream`

#### Example
```apex
IDoubleIterable doubleStream = Stream.ofNullable(new List<Double>{ 0.1, 5, 1.5, Math.PI });
```

### `static ofNullable(Set<Object> objects)`

Returns a `ObjectStream` created from `objects` if non-null, otherwise returns an empty `ObjectStream`.

#### Parameters
|Param|Description|
|---|---|
|`objects`|the set|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream` if `objects` is non-null, otherwise an empty `ObjectStream`

#### Example
```apex
IObjectIterable peopleStream = Stream.ofNullable(new Set<Object>(people));
```

### `static ofNullable(Set<SObject> sObjects)`

Returns a `SObjectStream` created from `sObjects` if non-null, otherwise returns an empty `SObjectStream`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the set|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream` if `iterable` is non-null, otherwise an empty `SObjectStream`

#### Example
```apex
ISObjectIterable accStream = Stream.ofNullable(new Set<SObject>(accounts));
```

### `static ofNullable(Set<Integer> integers)`

Returns a `IntStream` created from `integers` if non-null, otherwise returns an empty `IntStream`.

#### Parameters
|Param|Description|
|---|---|
|`integers`|the set|

#### Return

**Type**

IIntIterable

**Description**

the new `IntStream` if `integers` is non-null, otherwise an empty `IntStream`

#### Example
```apex
IIntIterable intStream = Stream.ofNullable(new Set<Integer>{ 0, 5, 1, -10 });
```

### `static ofNullable(Set<Long> longs)`

Returns a `LongStream` created from `longs` if non-null, otherwise returns an empty `LongStream`.

#### Parameters
|Param|Description|
|---|---|
|`longs`|the list|

#### Return

**Type**

ILongIterable

**Description**

the new `LongStream` if `longs` is non-null, otherwise an empty `LongStream`

#### Example
```apex
ILongIterable longStream = LongStream.ofNullable(new Set<Long>{ 0, 5L, 1L, -10 });
```

### `static ofNullable(Set<Double> doubles)`

Returns a `DoubleStream` created from `doubles` if non-null, otherwise returns an empty `DoubleStream`.

#### Parameters
|Param|Description|
|---|---|
|`doubles`|the set|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleStream` if `doubles` is non-null, otherwise an empty `DoubleStream`

#### Example
```apex
IDoubleIterable doubleStream = Stream.ofNullable(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
```

### `static generate(ISupplier supplier)`

Returns an infinite `ObjectStream` where each element is generated by `supplier`.

#### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier of generated elements|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

### `static generate(ISObjectSupplier supplier)`

Returns an infinite `SObjectStream` where each element is generated by `supplier`.

#### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier of generated elements|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

#### Example
```apex
ISObjectIterable accStream = Stream.generate(SObjectSupplier.of(Account.SObjectType));
```

### `static generate(IIntSupplier supplier)`

Returns an infinite `IntStream` where each element is generated by `supplier`.

#### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier of generated elements|

#### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

#### Example
```apex
IIntIterable fibonacciInfiniteStream = Stream.generate(IntSuppliers.fibonacci());
```

### `static generate(ILongSupplier supplier)`

Returns an infinite `LongStream` where each element is generated by `supplier`.

#### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier of generated elements|

#### Return

**Type**

ILongIterable

**Description**

the new `LongStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

#### Example
```apex
ILongIterable fibonacciInfiniteStream = Stream.generate(LongSuppliers.fibonacci());
```

### `static generate(IDoubleSupplier supplier)`

Returns an infinite `DoubleStream` where each element is generated by `supplier`.

#### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier of generated elements|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

#### Example
```apex
IDoubleIterable randomStream = Stream.generate(DoubleSupplier.random());
```

### `static iterate(Object seed, IUnaryOperator operator)`

Returns an infinite `ObjectStream` produced by iterative application of `operator` to an initial element `seed`, producing a `ObjectStream` consisting of `seed`, `operator(seed)`, `operator(operator(seed))`, etc.

#### Parameters
|Param|Description|
|---|---|
|`seed`|the initial element|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

### `static iterate(SObject seed, ISObjectUnaryOperator operator)`

Returns an infinite `SObjectStream` produced by iterative application of `operator` to an initial element `seed`, producing a `SObjectStream` consisting of `seed`, `operator(seed)`, `operator(operator(seed))`, etc.

#### Parameters
|Param|Description|
|---|---|
|`seed`|the initial element|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

### `static iterate(Integer seed, IIntUnaryOperator operator)`

Returns an infinite `IntStream` produced by iterative application of `operator` to an initial element `seed`, producing a `IntStream` consisting of `seed`, `operator(seed)`, `operator(operator(seed))`, etc.

#### Parameters
|Param|Description|
|---|---|
|`seed`|the initial element|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

#### Example
```apex
IIntIterable intIncrementalStream = Stream.iterate(0, IntUnaryOperators.add(1));
```

### `static iterate(Long seed, ILongUnaryOperator operator)`

Returns an infinite `LongStream` produced by iterative application of `operator` to an initial element `seed`, producing a `LongStream` consisting of `seed`, `operator(seed)`, `operator(operator(seed))`, etc.

#### Parameters
|Param|Description|
|---|---|
|`seed`|the initial element|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Return

**Type**

ILongIterable

**Description**

the new `LongStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

#### Example
```apex
ILongIterable longIncrementalStream = Stream.iterate(0L, LongUnaryOperators.add(1L));
```

### `static iterate(Double seed, IDoubleUnaryOperator operator)`

Returns an infinite `DoubleStream` produced by iterative application of `operator` to an initial element `seed`, producing a `DoubleStream` consisting of `seed`, `operator(seed)`, `operator(operator(seed))`, etc.

#### Parameters
|Param|Description|
|---|---|
|`seed`|the initial element|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

#### Example
```apex
IDoubleIterable doubleIncrementalStream = Stream.iterate(0, DoubleUnaryOperators.add(1));
```

### `static iterate(Object seed, IPredicate predicate, IUnaryOperator operator)`

Returns an infinite `ObjectStream` produced by iterative application of `operator` to an initial element `seed`, conditioned on satisfying `predicate`.

#### Parameters
|Param|Description|
|---|---|
|`seed`|the initial element|
|`predicate`|the predicate to determine when the stream must be terminated|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `supplier` is null|

### `static iterate(SObject seed, ISObjectPredicate predicate, ISObjectUnaryOperator operator)`

Returns an infinite `SObjectStream` produced by iterative application of `operator` to an initial element `seed`, conditioned on satisfying `predicate`.

#### Parameters
|Param|Description|
|---|---|
|`seed`|the initial element|
|`predicate`|the predicate to determine when the stream must be terminated|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `supplier` is null|

### `static iterate(Integer seed, IIntPredicate predicate, IIntUnaryOperator operator)`

Returns an infinite `IntStream` produced by iterative application of `operator` to an initial element `seed`, conditioned on satisfying `predicate`.

#### Parameters
|Param|Description|
|---|---|
|`seed`|the initial element|
|`predicate`|the predicate to determine when the stream must be terminated|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `supplier` is null|

### `static iterate(Long seed, ILongPredicate predicate, ILongUnaryOperator operator)`

Returns an infinite `LongStream` produced by iterative application of `operator` to an initial element `seed`, conditioned on satisfying `predicate`.

#### Parameters
|Param|Description|
|---|---|
|`seed`|the initial element|
|`predicate`|the predicate to determine when the stream must be terminated|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Return

**Type**

ILongIterable

**Description**

the new `LongStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `supplier` is null|

### `static iterate(Double seed, IDoublePredicate predicate, IDoubleUnaryOperator operator)`

Returns an infinite `DoubleStream` produced by iterative application of `operator` to an initial element `seed`, conditioned on satisfying `predicate`.

#### Parameters
|Param|Description|
|---|---|
|`seed`|the initial element|
|`predicate`|the predicate to determine when the stream must be terminated|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `supplier` is null|

### `static concat(IObjectIterable iterable1, IObjectIterable iterable2)`

Returns lazily concatenated `ObjectStream` whose elements are all the elements of the first `IObjectIterable` followed by all the elements of the second `IObjectIterable`.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `IObjectIterable`|
|`iterable2`|the second `IObjectIterable`|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

#### Example
```apex
IObjectIterable peopleStream = Stream.concat(stream1, stream2);
```

### `static concat(ISObjectIterable iterable1, ISObjectIterable iterable2)`

Returns lazily concatenated `SObjectStream` whose elements are all the elements of the first `ISObjectIterable` followed by all the elements of the second `ISObjectIterable`.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `ISObjectIterable`|
|`iterable2`|the second `ISObjectIterable`|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

#### Example
```apex
ISObjectIterable accStream = Stream.concat(stream1, stream2);
```

### `static concat(IIntIterable iterable1, IIntIterable iterable2)`

Returns lazily concatenated `IntStream` whose elements are all the elements of the first `IIntIterable` followed by all the elements of the second `IIntIterable`.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `IIntIterable`|
|`iterable2`|the second `IIntIterable`|

#### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

#### Example
```apex
IIntIterable intStream = Stream.concat(stream1, stream2);
```

### `static concat(ILongIterable iterable1, ILongIterable iterable2)`

Returns lazily concatenated `LongStream` whose elements are all the elements of the first `ILongIterable` followed by all the elements of the second `ILongIterable`.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `ILongIterable`|
|`iterable2`|the second `ILongIterable`|

#### Return

**Type**

ILongIterable

**Description**

the new `LongStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

#### Example
```apex
ILongIterable longStream = Stream.concat(stream1, stream2);
```

### `static concat(IDoubleIterable iterable1, IDoubleIterable iterable2)`

Returns lazily concatenated `DoubleStream` whose elements are all the elements of the first `IDoubleIterable` followed by all the elements of the second `IDoubleIterable`.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `IDoubleIterable`|
|`iterable2`|the second `IDoubleIterable`|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

#### Example
```apex
IDoubleIterable doubleStream = Stream.concat(stream1, stream2);
```

### `static concat(List<Iterable<Object>> iterables)`

Returns lazily concatenated `List<Iterable<Object>>`.

#### Parameters
|Param|Description|
|---|---|
|`iterables`|the list of `Iterable<Object>`|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some element in a list is null|

#### Example
```apex
IObjectIterable peopleStream = Stream.concat(streams);
```

### `static concat(List<Iterable<SObject>> iterables)`

Returns lazily concatenated `List<Iterable<SObject>>`.

#### Parameters
|Param|Description|
|---|---|
|`iterables`|the list of `Iterable<SObject>`|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some element in a list is null|

#### Example
```apex
ISObjectIterable accStream = Stream.concat(streams);
```

### `static concat(List<Iterable<Integer>> iterables)`

Returns lazily concatenated `List<Iterable<Integer>>`.

#### Parameters
|Param|Description|
|---|---|
|`iterables`|the list of `Iterable<Integer>`|

#### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some element in a list is null|

#### Example
```apex
IIntIterable intStream = Stream.concat(streams);
```

### `static concat(List<Iterable<Long>> iterables)`

Returns lazily concatenated `List<Iterable<Long>>`.

#### Parameters
|Param|Description|
|---|---|
|`iterables`|the list of `Iterable<Long>`|

#### Return

**Type**

ILongIterable

**Description**

the new `LongStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some element in a list is null|

#### Example
```apex
ILongIterable longStream = Stream.concat(streams);
```

### `static concat(List<Iterable<Double>> iterables)`

Returns lazily concatenated `List<Iterable<Double>>`.

#### Parameters
|Param|Description|
|---|---|
|`iterables`|the list of `Iterable<Double>`|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some element in a list is null|

#### Example
```apex
IDoubleIterable doubleStream = Stream.concat(streams);
```

### `static zip(Iterable<Object> iterable1, Iterable<Object> iterable2, IBinaryOperator combiner)`

Returns a combined `ObjectStream` by applying `combiner` function to each element at the same position.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Object>`|
|`iterable2`|the second `Iterable<Object>`|
|`combiner`|the binary operator to be applied to each element at the same position|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

### `static zip(Iterable<Object> iterable1, Iterable<Object> iterable2, IBiPredicate predicate, IBinaryOperator combiner)`

Returns a combined `ObjectStream` by applying `combiner` function to each element at the same position, conditioned on satisfying `predicate`.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Object>`|
|`iterable2`|the second `Iterable<Object>`|
|`predicate`|the binary predicate|
|`combiner`|the binary operator to be applied to each element at the same position|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2`, `predicate` or `combiner` is null|

### `static zip(Iterable<Integer> iterable1, Iterable<Integer> iterable2, IIntBinaryOperator combiner)`

Returns a combined `IntStream` by applying `combiner` function to each element at the same position.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Integer>`|
|`iterable2`|the second `Iterable<Integer>`|
|`combiner`|the binary operator to be applied to each element at the same position|

#### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

### `static zip(Iterable<Long> iterable1, Iterable<Long> iterable2, ILongBinaryOperator combiner)`

Returns a combined `LongStream` by applying `combiner` function to each element at the same position.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Long>`|
|`iterable2`|the second `Iterable<Long>`|
|`combiner`|the binary operator to be applied to each element at the same position|

#### Return

**Type**

ILongIterable

**Description**

the new `LongStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

### `static zip(Iterable<Double> iterable1, Iterable<Double> iterable2, IDoubleBinaryOperator combiner)`

Returns a combined `DoubleStream` by applying `combiner` function to each element at the same position.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Double>`|
|`iterable2`|the second `Iterable<Double>`|
|`combiner`|the binary operator to be applied to each element at the same position|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

### `static zip(Iterable<SObject> iterable1, Iterable<SObject> iterable2, ISObjectBinaryOperator combiner)`

Returns a combined `SObjectStream` by applying `combiner` function to each element at the same position.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<SObject>`|
|`iterable2`|the second `Iterable<SObject>`|
|`combiner`|the binary operator to be applied to each element at the same position|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

#### Example
```apex
ISObjectIterable accountsWithMinAnnualRevenueStream = Stream.zip(
    Trigger.old,
    Trigger.new,
    SObjectBinaryOperator.minBy(Account.AnnualRevenue)
);
ISObjectIterable accountsWithMinAnnualRevenueStream = Stream.zip(
    Stream.of(Trigger.old),
    Stream.of(Trigger.new),
    SObjectBinaryOperator.minBy(Account.AnnualRevenue)
);
```

### `static zip(Iterable<SObject> iterable1, Iterable<SObject> iterable2, ISObjectBiPredicate predicate, ISObjectBinaryOperator combiner)`

Returns a combined `SObjectStream` by applying `combiner` function to each element at the same position, conditioned on satisfying `predicate`.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<SObject>`|
|`iterable2`|the second `Iterable<SObject>`|
|`predicate`|the binary predicate|
|`combiner`|the binary operator to be applied to each element at the same position|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2`, `predicate` or `combiner` is null|

#### Example
```apex
ISObjectIterable newAccountsWithChangedAnnualRevenueStream = Stream.zip(
    Trigger.old,
    Trigger.new,
    SObjectBiPredicates.areEqual(Account.AnnualRevenue).negate(),
    SObjectBinaryOperator.right()
);
ISObjectIterable newAccountsWithChangedAnnualRevenueStream = Stream.zip(
    Stream.of(Trigger.old),
    Stream.of(Trigger.new),
    SObjectBiPredicates.areEqual(Account.AnnualRevenue).negate(),
    SObjectBinaryOperator.right()
);
```

---
