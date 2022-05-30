# DoubleIterable

`APIVERSION: 54`

`STATUS: ACTIVE`

Provides a skeletal implementation of [IDoubleIterable](/docs/Iterables/IDoubleIterable.md).


**Author** O. Berehovskyi


**Group** Iterables

## Methods
### `append(Iterable<Double> iterable)`
#### Parameters
|Param|Description|
|---|---|

### `union(Iterable<Double> iterable)`

Returns a new `IDoubleIterable` as a set union of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

#### Example
```apex
List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
List<Double> union = doublesIterable1.union(doubles2).toList();
// [5.0, 3.0, 9.0, 7.0, 8.0, 6.0, 4.0, 1.0, 0.0]
```

### `intersect(Iterable<Double> iterable)`

Returns a new `IDoubleIterable` as a set intersection of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

#### Example
```apex
List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
List<Double> intersection = doublesIterable1.intersect(doubles2).toList(); // [3.0, 9.0]
```

### `except(Iterable<Double> iterable)`

Returns a new `IDoubleIterable` as a set difference of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

#### Example
```apex
List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
List<Double> diff = doublesIterable1.except(doubles2).toList(); // [5.0, 7.0]
```

### `distinct()`
### `filter(IDoublePredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `withoutNulls()`
### `reduce(IDoubleBinaryOperator operator)`
#### Parameters
|Param|Description|
|---|---|

### `collect(ISupplier supplier, IObjectDoubleConsumer accumulator)`
#### Parameters
|Param|Description|
|---|---|

### `some(IDoublePredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `none(IDoublePredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `max()`
### `min()`
### `sum()`
### `avg()`
---
