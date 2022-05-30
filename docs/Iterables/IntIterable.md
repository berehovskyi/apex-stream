# IntIterable

`APIVERSION: 54`

`STATUS: ACTIVE`

Provides a skeletal implementation of [IIntIterable](/docs/Iterables/IIntIterable.md).


**Author** O. Berehovskyi


**Group** Iterables

## Methods
### `append(Iterable<Integer> iterable)`
#### Parameters
|Param|Description|
|---|---|

### `toLongIterable()`
### `toDoubleIterable()`
### `union(Iterable<Integer> iterable)`

Returns a new `IIntIterable` as a set union of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

#### Example
```apex
List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
List<Integer> union = intsIterable1.union(ints2).toList(); // [5, 3, 9, 7, 8, 6, 4, 1, 0]
```

### `intersect(Iterable<Integer> iterable)`

Returns a new `IIntIterable` as a set intersection of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

#### Example
```apex
List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
List<Integer> intersection = intsIterable1.intersect(ints2).toList(); // [3, 9]
```

### `except(Iterable<Integer> iterable)`

Returns a new `IIntIterable` as a set difference of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

#### Example
```apex
List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
List<Integer> diff = intsIterable1.except(ints2).toList(); // [5, 7]
```

### `distinct()`
### `filter(IIntPredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `withoutNulls()`
### `mapToLong(IIntToLongFunction mapper)`
#### Parameters
|Param|Description|
|---|---|

### `mapToDouble(IIntToDoubleFunction mapper)`
#### Parameters
|Param|Description|
|---|---|

### `reduce(IIntBinaryOperator operator)`
#### Parameters
|Param|Description|
|---|---|

### `some(IIntPredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `none(IIntPredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `max()`
### `min()`
---
