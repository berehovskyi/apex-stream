# Sequence

`APIVERSION: 54`

`STATUS: ACTIVE`

An entry point that returns a sequence of a certain type, depending on the type of the parameter.


**Author** O. Berehovskyi


**Group** Iterables


**See** [ObjectSequence](/docs/Iterables/ObjectSequence.md)


**See** [SObjectSequence](/docs/Iterables/SObjectSequence.md)


**See** [IntSequence](/docs/Iterables/IntSequence.md)


**See** [LongSequence](/docs/Iterables/LongSequence.md)


**See** [DoubleSequence](/docs/Iterables/DoubleSequence.md)

## Methods
### `static of(List<Object> objects)`

Returns a `ObjectSequence` created from `List<Object>`.

#### Parameters
|Param|Description|
|---|---|
|`objects`|the list|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
```apex
IObjectIterable peopleSeq = Sequence.of(new List<Person>(people));
```

### `static of(List<SObject> sObjects)`

Returns a `SObjectSequence` created from `sObjects`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` is null|

#### Example
```apex
ISObjectIterable accSeq = Sequence.of(new List<Account>(accounts));
```

### `static of(List<Integer> integers)`

Returns a `IntSequence` created from `integers`.

#### Parameters
|Param|Description|
|---|---|
|`integers`|the list|

#### Return

**Type**

IIntIterable

**Description**

the new `IntSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `integers` is null|

#### Example
```apex
IIntIterable intSeq = Sequence.of(new List<Integer>{ 0, 5, 1, -10 });
```

### `static of(List<Long> longs)`

Returns a `LongSequence` created from `longs`.

#### Parameters
|Param|Description|
|---|---|
|`longs`|the list|

#### Return

**Type**

ILongIterable

**Description**

the new `LongSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

#### Example
```apex
ILongIterable longSeq = Sequence.of(new List<Long>{ 0, 5L, 1L, -10 });
```

### `static of(List<Double> doubles)`

Returns a `DoubleSequence` created from `doubles`.

#### Parameters
|Param|Description|
|---|---|
|`doubles`|the list|

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
IDoubleIterable doubleSeq = Sequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI });
```

### `static of(Set<Object> objects)`

Returns a `ObjectSequence` created from `Set<Object>`.

#### Parameters
|Param|Description|
|---|---|
|`objects`|the set|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `objects` is null|

#### Example
```apex
IObjectIterable peopleSeq = Sequence.of(new Set<Person>(people));
```

### `static of(Set<SObject> sObjects)`

Returns a `SObjectSequence` created from `sObjects`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the set|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` is null|

#### Example
```apex
ISObjectIterable accSeq = Sequence.of(new Set<SObject>(accounts));
```

### `static of(Set<Integer> integers)`

Returns a `IntSequence` created from `integers`.

#### Parameters
|Param|Description|
|---|---|
|`integers`|the set|

#### Return

**Type**

IIntIterable

**Description**

the new `IntSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `integers` is null|

#### Example
```apex
IIntIterable intSeq = Sequence.of(new Set<Integer>{ 0, 5, 1, -10 });
```

### `static of(Set<Long> longs)`

Returns a `LongSequence` created from `longs`.

#### Parameters
|Param|Description|
|---|---|
|`longs`|the set|

#### Return

**Type**

ILongIterable

**Description**

the new `LongSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

#### Example
```apex
ILongIterable longSeq = Sequence.of(new Set<Long>{ 0, 5L, 1L, -10 });
```

### `static of(Set<Double> doubles)`

Returns a `DoubleSequence` created from `doubles`.

#### Parameters
|Param|Description|
|---|---|
|`doubles`|the set|

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
IDoubleIterable doubleSeq = Sequence.of(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
```

### `static ofNullable(List<Object> objects)`

Returns a `ObjectSequence` created from `objects` if non-null, otherwise returns an empty `ObjectSequence`.

#### Parameters
|Param|Description|
|---|---|
|`objects`|the list|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence` if `objects` is non-null, otherwise an empty `ObjectSequence`

#### Example
```apex
IObjectIterable peopleSeq = Sequence.ofNullable(new List<Person>(people));
```

### `static ofNullable(List<SObject> sObjects)`

Returns a `SObjectSequence` created from `sObjects` if non-null, otherwise returns an empty `SObjectSequence`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence` if `iterable` is non-null, otherwise an empty `SObjectSequence`

#### Example
```apex
ISObjectIterable accSeq = Sequence.ofNullable(new List<Account>(accounts));
```

### `static ofNullable(List<Integer> integers)`

Returns a `IntSequence` created from `integers` if non-null, otherwise returns an empty `IntSequence`.

#### Parameters
|Param|Description|
|---|---|
|`integers`|the list|

#### Return

**Type**

IIntIterable

**Description**

the new `IntSequence` if `integers` is non-null, otherwise an empty `IntSequence`

#### Example
```apex
IIntIterable intSeq = Sequence.ofNullable(new List<Integer>{ 0, 5, 1, -10 });
```

### `static ofNullable(List<Long> longs)`

Returns a `LongSequence` created from `longs` if non-null, otherwise returns an empty `LongSequence`.

#### Parameters
|Param|Description|
|---|---|
|`longs`|the list|

#### Return

**Type**

ILongIterable

**Description**

the new `LongSequence` if `longs` is non-null, otherwise an empty `LongSequence`

#### Example
```apex
ILongIterable longSeq = Sequence.ofNullable(new List<Long>{ 0, 5L, 1L, -10 });
```

### `static ofNullable(List<Double> doubles)`

Returns a `DoubleSequence` created from `doubles` if non-null, otherwise returns an empty `DoubleSequence`.

#### Parameters
|Param|Description|
|---|---|
|`doubles`|the list|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleSequence` if `doubles` is non-null, otherwise an empty `DoubleSequence`

#### Example
```apex
IDoubleIterable doubleSeq = Sequence.ofNullable(new List<Double>{ 0.1, 5, 1.5, Math.PI });
```

### `static ofNullable(Set<Object> objects)`

Returns a `ObjectSequence` created from `objects` if non-null, otherwise returns an empty `ObjectSequence`.

#### Parameters
|Param|Description|
|---|---|
|`objects`|the set|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence` if `objects` is non-null, otherwise an empty `ObjectSequence`

#### Example
```apex
IObjectIterable peopleSeq = Sequence.ofNullable(new Set<Object>(people));
```

### `static ofNullable(Set<SObject> sObjects)`

Returns a `SObjectSequence` created from `sObjects` if non-null, otherwise returns an empty `SObjectSequence`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the set|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence` if `iterable` is non-null, otherwise an empty `SObjectSequence`

#### Example
```apex
ISObjectIterable accSeq = Sequence.ofNullable(new Set<SObject>(accounts));
```

### `static ofNullable(Set<Integer> integers)`

Returns a `IntSequence` created from `integers` if non-null, otherwise returns an empty `IntSequence`.

#### Parameters
|Param|Description|
|---|---|
|`integers`|the set|

#### Return

**Type**

IIntIterable

**Description**

the new `IntSequence` if `integers` is non-null, otherwise an empty `IntSequence`

#### Example
```apex
IIntIterable intSeq = Sequence.ofNullable(new Set<Integer>{ 0, 5, 1, -10 });
```

### `static ofNullable(Set<Long> longs)`

Returns a `LongSequence` created from `longs` if non-null, otherwise returns an empty `LongSequence`.

#### Parameters
|Param|Description|
|---|---|
|`longs`|the list|

#### Return

**Type**

ILongIterable

**Description**

the new `LongSequence` if `longs` is non-null, otherwise an empty `LongSequence`

#### Example
```apex
ILongIterable longSeq = Sequence.ofNullable(new Set<Long>{ 0, 5L, 1L, -10 });
```

### `static ofNullable(Set<Double> doubles)`

Returns a `DoubleSequence` created from `doubles` if non-null, otherwise returns an empty `DoubleSequence`.

#### Parameters
|Param|Description|
|---|---|
|`doubles`|the set|

#### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleSequence` if `doubles` is non-null, otherwise an empty `DoubleSequence`

#### Example
```apex
IDoubleIterable doubleSeq = Sequence.ofNullable(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
```

### `static concat(IObjectIterable iterable1, IObjectIterable iterable2)`

Returns eagerly concatenated `ObjectSequence` whose elements are all the elements of the first `IObjectIterable` followed by all the elements of the second `IObjectIterable`.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `IObjectIterable`|
|`iterable2`|the second `IObjectIterable`|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

#### Example
```apex
IObjectIterable peopleSeq = Sequence.concat(stream1, stream2);
```

### `static concat(ISObjectIterable iterable1, ISObjectIterable iterable2)`

Returns eagerly concatenated `SObjectSequence` whose elements are all the elements of the first `ISObjectIterable` followed by all the elements of the second `ISObjectIterable`.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `ISObjectIterable`|
|`iterable2`|the second `ISObjectIterable`|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

#### Example
```apex
ISObjectIterable accSeq = Sequence.concat(stream1, stream2);
```

### `static concat(IIntIterable iterable1, IIntIterable iterable2)`

Returns eagerly concatenated `IntSequence` whose elements are all the elements of the first `IIntIterable` followed by all the elements of the second `IIntIterable`.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `IIntIterable`|
|`iterable2`|the second `IIntIterable`|

#### Return

**Type**

IIntIterable

**Description**

the new `IntSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

#### Example
```apex
IIntIterable intSeq = Sequence.concat(stream1, stream2);
```

### `static concat(ILongIterable iterable1, ILongIterable iterable2)`

Returns eagerly concatenated `LongSequence` whose elements are all the elements of the first `ILongIterable` followed by all the elements of the second `ILongIterable`.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `ILongIterable`|
|`iterable2`|the second `ILongIterable`|

#### Return

**Type**

ILongIterable

**Description**

the new `LongSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

#### Example
```apex
ILongIterable longSeq = Sequence.concat(stream1, stream2);
```

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
IDoubleIterable doubleSeq = Sequence.concat(stream1, stream2);
```

### `static concat(List<IObjectIterable> iterables)`

Returns eagerly concatenates `List<IObjectIterable>`.

#### Parameters
|Param|Description|
|---|---|
|`iterables`|the list of `IObjectIterable`|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some of `IObjectIterable` in a list is null|

#### Example
```apex
IObjectIterable peopleSeq = Sequence.concat(streams);
```

### `static concat(List<ISObjectIterable> iterables)`

Returns eagerly concatenates `List<ISObjectIterable>`.

#### Parameters
|Param|Description|
|---|---|
|`iterables`|the list of `ISObjectIterable`|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some of `ISObjectIterable` in a list is null|

#### Example
```apex
ISObjectIterable accSeq = Sequence.concat(streams);
```

### `static concat(List<IIntIterable> iterables)`

Returns eagerly concatenates `List<IIntIterable>`.

#### Parameters
|Param|Description|
|---|---|
|`iterables`|the list of `IIntIterable`|

#### Return

**Type**

IIntIterable

**Description**

the new `IntSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some of `ILongIterable` in a list is null|

#### Example
```apex
IIntIterable intSeq = Sequence.concat(streams);
```

### `static concat(List<ILongIterable> iterables)`

Returns eagerly concatenates `List<ILongIterable>`.

#### Parameters
|Param|Description|
|---|---|
|`iterables`|the list of `ILongIterable`|

#### Return

**Type**

ILongIterable

**Description**

the new `LongSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some of `ILongIterable` in a list is null|

#### Example
```apex
ILongIterable longSeq = Sequence.concat(streams);
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
IDoubleIterable doubleSeq = Sequence.concat(streams);
```

### `static zip(IObjectIterable iterable1, IObjectIterable iterable2, IBinaryOperator combiner)`

Returns a combined `ObjectSequence` by applying `combiner` function to each element at the same position.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `IObjectIterable`|
|`iterable2`|the second `IObjectIterable`|
|`combiner`|the binary operator to be applied to each element at the same position|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

### `static zip(ISObjectIterable iterable1, ISObjectIterable iterable2, ISObjectBinaryOperator combiner)`

Returns a combined `SObjectSequence` by applying `combiner` function to each element at the same position.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `ISObjectIterable`|
|`iterable2`|the second `ISObjectIterable`|
|`combiner`|the binary operator to be applied to each element at the same position|

#### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

#### Example
```apex
ISObjectIterable accountsWithMinAnnualRevenueStream = Sequence.zip(
    Sequence.of(Trigger.old),
    Sequence.of(Trigger.new),
    SObjectBinaryOperator.minBy(Account.AnnualRevenue)
);
```

### `static zip(IIntIterable iterable1, IIntIterable iterable2, IIntBinaryOperator combiner)`

Returns a combined `IntSequence` by applying `combiner` function to each element at the same position.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `IIntIterable`|
|`iterable2`|the second `IIntIterable`|
|`combiner`|the binary operator to be applied to each element at the same position|

#### Return

**Type**

IIntIterable

**Description**

the new `IntSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

### `static zip(ILongIterable iterable1, ILongIterable iterable2, ILongBinaryOperator combiner)`

Returns a combined `LongSequence` by applying `combiner` function to each element at the same position.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `ILongIterable`|
|`iterable2`|the second `ILongIterable`|
|`combiner`|the binary operator to be applied to each element at the same position|

#### Return

**Type**

ILongIterable

**Description**

the new `LongSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

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

### `static zip(IObjectIterable iterable1, IObjectIterable iterable2, IBiPredicate predicate, IBinaryOperator combiner)`

Returns a combined `ObjectSequence` by applying `combiner` function to each element at the same position, conditioned on satisfying `predicate`.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `IObjectIterable`|
|`iterable2`|the second `IObjectIterable`|
|`predicate`|the binary predicate|
|`combiner`|the binary operator to be applied to each element at the same position|

#### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2`, `predicate` or `combiner` is null|

### `static zip(ISObjectIterable iterable1, ISObjectIterable iterable2, ISObjectBiPredicate predicate, ISObjectBinaryOperator combiner)`

Returns a combined `SObjectStream` by applying `combiner` function to each element at the same position, conditioned on satisfying `predicate`.

#### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `ISObjectIterable`|
|`iterable2`|the second `ISObjectIterable`|
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
ISObjectIterable newAccountsWithChangedAnnualRevenueSeq = Sequence.zip(
    Sequence.of(Trigger.old),
    Sequence.of(Trigger.new),
    SObjectBiPredicate.areEqual(Account.AnnualRevenue).negate(),
    SObjectBinaryOperator.right()
);
```

---
