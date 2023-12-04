# Stream

`SUPPRESSWARNINGS`

`APIVERSION: 59`

`STATUS: ACTIVE`

An entry point that returns a stream of a certain type,
depending on the type of the parameter.


**See** [ObjectStream](/docs/Enumerables/ObjectStream.md)


**See** [SObjectStream](/docs/Enumerables/SObjectStream.md)


**See** [IntStream](/docs/Enumerables/IntStream.md)


**See** [LongStream](/docs/Enumerables/LongStream.md)


**See** [DoubleStream](/docs/Enumerables/DoubleStream.md)


**Author** Oleh Berehovskyi


**Group** Enumerables

## Methods
### `public static ObjectEnumerable of(List<Object> objects)`

Returns a `ObjectEnumerable` created from `List<Object>`.

#### Parameters

|Param|Description|
|---|---|
|`objects`|the list|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
```apex
ObjectEnumerable peopleStream = Stream.of(new List<Person>(people));
```


### `public static SObjectEnumerable of(List<SObject> sObjects)`

Returns a `SObjectEnumerable` created from `sObjects`.

#### Parameters

|Param|Description|
|---|---|
|`sObjects`|the list|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` is null|

#### Example
```apex
SObjectEnumerable accStream = Stream.of(new List<Account>(accounts));
```


### `public static IntEnumerable of(List<Integer> integers)`

Returns a `IntEnumerable` created from `integers`.

#### Parameters

|Param|Description|
|---|---|
|`integers`|the list|

#### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `integers` is null|

#### Example
```apex
IntEnumerable intStream = Stream.of(new List<Integer>{ 0, 5, 1, -10 });
```


### `public static LongEnumerable of(List<Long> longs)`

Returns a `LongEnumerable` created from `longs`.

#### Parameters

|Param|Description|
|---|---|
|`longs`|the list|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

#### Example
```apex
LongEnumerable longStream = Stream.of(new List<Long>{ 0, 5L, 1L, -10 });
```


### `public static DoubleEnumerable of(List<Double> doubles)`

Returns a `DoubleEnumerable` created from `doubles`.

#### Parameters

|Param|Description|
|---|---|
|`doubles`|the list|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `doubles` is null|

#### Example
```apex
DoubleEnumerable doubleStream = Stream.of(new List<Double>{ 0.1, 5, 1.5, Math.PI });
```


### `public static ObjectEnumerable of(Set<Object> objects)`

Returns a `ObjectEnumerable` created from `Set<Object>`.

#### Parameters

|Param|Description|
|---|---|
|`objects`|the set|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `objects` is null|

#### Example
```apex
ObjectEnumerable peopleStream = Stream.of(new Set<Person>(people));
```


### `public static SObjectEnumerable of(Set<SObject> sObjects)`

Returns a `SObjectEnumerable` created from `sObjects`.

#### Parameters

|Param|Description|
|---|---|
|`sObjects`|the set|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` is null|

#### Example
```apex
SObjectEnumerable accStream = Stream.of(new Set<SObject>(accounts));
```


### `public static IntEnumerable of(Set<Integer> integers)`

Returns a `IntEnumerable` created from `integers`.

#### Parameters

|Param|Description|
|---|---|
|`integers`|the set|

#### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `integers` is null|

#### Example
```apex
IntEnumerable intStream = Stream.of(new Set<Integer>{ 0, 5, 1, -10 });
```


### `public static LongEnumerable of(Set<Long> longs)`

Returns a `LongEnumerable` created from `longs`.

#### Parameters

|Param|Description|
|---|---|
|`longs`|the set|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

#### Example
```apex
LongEnumerable longStream = Stream.of(new Set<Long>{ 0, 5L, 1L, -10 });
```


### `public static DoubleEnumerable of(Set<Double> doubles)`

Returns a `DoubleEnumerable` created from `doubles`.

#### Parameters

|Param|Description|
|---|---|
|`doubles`|the set|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `doubles` is null|

#### Example
```apex
DoubleEnumerable doubleStream = Stream.of(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
```


### `public static ObjectEnumerable ofNullable(List<Object> objects)`

Returns a `ObjectEnumerable` created from `objects` if non-null, otherwise returns an empty `ObjectEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`objects`|the list|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable` if `objects` is non-null, otherwise an empty `ObjectEnumerable`|

#### Example
```apex
ObjectEnumerable peopleStream = Stream.ofNullable(new List<Person>(people));
```


### `public static SObjectEnumerable ofNullable(List<SObject> sObjects)`

Returns a `SObjectEnumerable` created from `sObjects` if non-null, otherwise returns an empty `SObjectEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`sObjects`|the list|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable` if `iterable` is non-null, otherwise an empty `SObjectEnumerable`|

#### Example
```apex
SObjectEnumerable accStream = Stream.ofNullable(new List<Account>(accounts));
```


### `public static IntEnumerable ofNullable(List<Integer> integers)`

Returns a `IntEnumerable` created from `integers` if non-null, otherwise returns an empty `IntEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`integers`|the list|

#### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable` if `integers` is non-null, otherwise an empty `IntEnumerable`|

#### Example
```apex
IntEnumerable intStream = Stream.ofNullable(new List<Integer>{ 0, 5, 1, -10 });
```


### `public static LongEnumerable ofNullable(List<Long> longs)`

Returns a `LongEnumerable` created from `longs` if non-null, otherwise returns an empty `LongEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`longs`|the list|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable` if `longs` is non-null, otherwise an empty `LongEnumerable`|

#### Example
```apex
LongEnumerable longStream = LongStream.ofNullable(new List<Long>{ 0, 5L, 1L, -10 });
```


### `public static DoubleEnumerable ofNullable(List<Double> doubles)`

Returns a `DoubleEnumerable` created from `doubles` if non-null, otherwise returns an empty `DoubleEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`doubles`|the list|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable` if `doubles` is non-null, otherwise an empty `DoubleEnumerable`|

#### Example
```apex
DoubleEnumerable doubleStream = Stream.ofNullable(new List<Double>{ 0.1, 5, 1.5, Math.PI });
```


### `public static ObjectEnumerable ofNullable(Set<Object> objects)`

Returns a `ObjectEnumerable` created from `objects` if non-null, otherwise returns an empty `ObjectEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`objects`|the set|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable` if `objects` is non-null, otherwise an empty `ObjectEnumerable`|

#### Example
```apex
ObjectEnumerable peopleStream = Stream.ofNullable(new Set<Object>(people));
```


### `public static SObjectEnumerable ofNullable(Set<SObject> sObjects)`

Returns a `SObjectEnumerable` created from `sObjects` if non-null, otherwise returns an empty `SObjectEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`sObjects`|the set|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable` if `iterable` is non-null, otherwise an empty `SObjectEnumerable`|

#### Example
```apex
SObjectEnumerable accStream = Stream.ofNullable(new Set<SObject>(accounts));
```


### `public static IntEnumerable ofNullable(Set<Integer> integers)`

Returns a `IntEnumerable` created from `integers` if non-null, otherwise returns an empty `IntEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`integers`|the set|

#### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable` if `integers` is non-null, otherwise an empty `IntEnumerable`|

#### Example
```apex
IntEnumerable intStream = Stream.ofNullable(new Set<Integer>{ 0, 5, 1, -10 });
```


### `public static LongEnumerable ofNullable(Set<Long> longs)`

Returns a `LongEnumerable` created from `longs` if non-null, otherwise returns an empty `LongEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`longs`|the list|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable` if `longs` is non-null, otherwise an empty `LongEnumerable`|

#### Example
```apex
LongEnumerable longStream = LongStream.ofNullable(new Set<Long>{ 0, 5L, 1L, -10 });
```


### `public static DoubleEnumerable ofNullable(Set<Double> doubles)`

Returns a `DoubleEnumerable` created from `doubles` if non-null, otherwise returns an empty `DoubleEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`doubles`|the set|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable` if `doubles` is non-null, otherwise an empty `DoubleEnumerable`|

#### Example
```apex
DoubleEnumerable doubleStream = Stream.ofNullable(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
```


### `public static ObjectEnumerable iterate(Object seed, IOperator operator)`

Returns an infinite `ObjectEnumerable` produced by iterative application of `operator` to an initial element `seed`, producing a `ObjectEnumerable` consisting of `seed`, `operator(seed)`, `operator(operator(seed))`, etc.

#### Parameters

|Param|Description|
|---|---|
|`seed`|the initial element|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

### `public static SObjectEnumerable iterate(SObject seed, IOperator operator)`

Returns an infinite `SObjectEnumerable` produced by iterative application of `operator` to an initial element `seed`, producing a `SObjectEnumerable` consisting of `seed`, `operator(seed)`, `operator(operator(seed))`, etc.

#### Parameters

|Param|Description|
|---|---|
|`seed`|the initial element|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

### `public static IntEnumerable iterate(Integer seed, IOperator operator)`

Returns an infinite `IntEnumerable` produced by iterative application of `operator` to an initial element `seed`, producing a `IntEnumerable` consisting of `seed`, `operator(seed)`, `operator(operator(seed))`, etc.

#### Parameters

|Param|Description|
|---|---|
|`seed`|the initial element|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

#### Example
```apex
IntEnumerable intIncrementalStream = Stream.iterate(0, IntUnaryOperators.add(1));
```


### `public static LongEnumerable iterate(Long seed, IOperator operator)`

Returns an infinite `LongEnumerable` produced by iterative application of `operator` to an initial element `seed`, producing a `LongEnumerable` consisting of `seed`, `operator(seed)`, `operator(operator(seed))`, etc.

#### Parameters

|Param|Description|
|---|---|
|`seed`|the initial element|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

#### Example
```apex
LongEnumerable longIncrementalStream = Stream.iterate(0L, LongUnaryOperators.add(1L));
```


### `public static DoubleEnumerable iterate(Double seed, IOperator operator)`

Returns an infinite `DoubleEnumerable` produced by iterative application of `operator` to an initial element `seed`, producing a `DoubleEnumerable` consisting of `seed`, `operator(seed)`, `operator(operator(seed))`, etc.

#### Parameters

|Param|Description|
|---|---|
|`seed`|the initial element|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

#### Example
```apex
DoubleEnumerable doubleIncrementalStream = Stream.iterate(0, DoubleUnaryOperators.add(1));
```


### `public static ObjectEnumerable iterate(Object seed, IPredicate predicate, IOperator operator)`

Returns an infinite `ObjectEnumerable` produced by iterative application of `operator` to an initial element `seed`, conditioned on satisfying `predicate`.

#### Parameters

|Param|Description|
|---|---|
|`seed`|the initial element|
|`predicate`|the predicate to determine when the stream must be terminated|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `supplier` is null|

### `public static SObjectEnumerable iterate(SObject seed, IPredicate predicate, IOperator operator)`

Returns an infinite `SObjectEnumerable` produced by iterative application of `operator` to an initial element `seed`, conditioned on satisfying `predicate`.

#### Parameters

|Param|Description|
|---|---|
|`seed`|the initial element|
|`predicate`|the predicate to determine when the stream must be terminated|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `supplier` is null|

### `public static IntEnumerable iterate(Integer seed, IPredicate predicate, IOperator operator)`

Returns an infinite `IntEnumerable` produced by iterative application of `operator` to an initial element `seed`, conditioned on satisfying `predicate`.

#### Parameters

|Param|Description|
|---|---|
|`seed`|the initial element|
|`predicate`|the predicate to determine when the stream must be terminated|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `supplier` is null|

### `public static LongEnumerable iterate(Long seed, IPredicate predicate, IOperator operator)`

Returns an infinite `LongEnumerable` produced by iterative application of `operator` to an initial element `seed`, conditioned on satisfying `predicate`.

#### Parameters

|Param|Description|
|---|---|
|`seed`|the initial element|
|`predicate`|the predicate to determine when the stream must be terminated|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `supplier` is null|

### `public static DoubleEnumerable iterate(Double seed, IPredicate predicate, IOperator operator)`

Returns an infinite `DoubleEnumerable` produced by iterative application of `operator` to an initial element `seed`, conditioned on satisfying `predicate`.

#### Parameters

|Param|Description|
|---|---|
|`seed`|the initial element|
|`predicate`|the predicate to determine when the stream must be terminated|
|`operator`|the operator to be applied to the previous element to produce a new element|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `supplier` is null|

---
