# LongIterable

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides a skeletal implementation of [ILongIterable](/docs/Iterables/ILongIterable.md).


**Author** Oleh Berehovskyi


**Group** Iterables

## Methods
### `append(Iterable<Long> iterable)`
#### Parameters
|Param|Description|
|---|---|

### `toIntIterable()`
### `toDoubleIterable()`
### `union(Iterable<Long> iterable)`

Returns a new `ILongIterable` as a set union of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

#### Example
```apex
List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
List<Long> union = longsIterable1.union(longs2).toList(); // [5L, 3L, 9L, 7L, 8L, 6L, 4L, 1L, 0L]
```

### `intersect(Iterable<Long> iterable)`

Returns a new `ILongIterable` as a set intersection of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

#### Example
```apex
List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
List<Long> intersection = longsIterable1.intersect(longs2).toList(); // [3L, 9L]
```

### `except(Iterable<Long> iterable)`

Returns a new `ILongIterable` as a set difference of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

#### Example
```apex
List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
List<Long> diff = longsIterable1.except(longs2).toList(); // [5L, 7L]
```

### `distinct()`
### `filter(ILongPredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `withoutNulls()`
### `mapToInt(ILongToIntFunction mapper)`
#### Parameters
|Param|Description|
|---|---|

### `mapToDouble(ILongToDoubleFunction mapper)`
#### Parameters
|Param|Description|
|---|---|

### `reduce(ILongBinaryOperator operator)`
#### Parameters
|Param|Description|
|---|---|

### `some(ILongPredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `none(ILongPredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `max()`
### `min()`
---
