# ObjectIterable

`APIVERSION: 54`

`STATUS: ACTIVE`

Provides a skeletal implementation of [IObjectIterable](/docs/Iterables/IObjectIterable.md).


**Author** O. Berehovskyi


**Group** Iterables

## Methods
### `append(Iterable<Object> iterable)`
#### Parameters
|Param|Description|
|---|---|

### `union(Iterable<Object> iterable)`

Returns a new `IObjectIterable` as a set union of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

#### Example
```apex
List<Object> objects1 = new List<Object>{ obj5, obj3, obj9, obj7, obj5, obj9, obj3, obj7 };
List<Object> objects2 = new List<Object>{ obj8, obj3, obj6, obj4, obj4, obj9, obj1, obj0 };
List<Object> union = objectsIterable1.union(objects2).toList();
// [obj5, obj3, obj9, obj7, obj8, obj6, obj4, obj1, obj0]
```

### `intersect(Iterable<Object> iterable)`

Returns a new `IObjectIterable` as a set intersection of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

#### Example
```apex
List<Object> objects1 = new List<Object>{ obj5, obj3, obj9, obj7, obj5, obj9, obj3, obj7 };
List<Object> objects2 = new List<Object>{ obj8, obj3, obj6, obj4, obj4, obj9, obj1, obj0 };
List<Object> intersection = objectsIterable1.intersect(objects2).toList(); // [obj3, obj9]
```

### `except(Iterable<Object> iterable)`

Returns a new `IObjectIterable` as a set difference of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

#### Example
```apex
List<Object> objects1 = new List<Object>{ obj5, obj3, obj9, obj7, obj5, obj9, obj3, obj7 };
List<Object> objects2 = new List<Object>{ obj8, obj3, obj6, obj4, obj4, obj9, obj1, obj0 };
List<Object> diff = objectsIterable1.except(objects2).toList(); // [obj5, obj7]
```

### `filter(IPredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `withoutNulls()`
### `sort(IComparator comparator)`
#### Parameters
|Param|Description|
|---|---|

### `sort(SortOrder order)`
#### Parameters
|Param|Description|
|---|---|

### `distinct()`
### `reduce(IBinaryOperator accumulator)`
#### Parameters
|Param|Description|
|---|---|

### `collect(ICollector collector)`
#### Parameters
|Param|Description|
|---|---|

### `some(IPredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `none(IPredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `max(IComparator comparator)`
#### Parameters
|Param|Description|
|---|---|

### `min(IComparator comparator)`
#### Parameters
|Param|Description|
|---|---|

### `toList(Type t)`
#### Parameters
|Param|Description|
|---|---|

---
