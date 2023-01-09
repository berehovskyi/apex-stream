# Iterators

`APIVERSION: 56`

`STATUS: ACTIVE`

Contains static utility methods that operate Iterators.


**Author** Oleh Berehovskyi


**Group** Utils

## Methods
### `static toSObjectList(Iterator<SObject> iterator)`

Returns a `List<SObject>` created from `iterator`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|

#### Return

**Type**

List<SObject>

**Description**

the `List<SObject>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

### `static toSObjectSet(Iterator<SObject> iterator)`

Returns a `Set<SObject>` created from `iterator`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|

#### Return

**Type**

Set<SObject>

**Description**

the `Set<SObject>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

### `static toSObjectMap(Iterator<SObject> iterator)`

Returns a `Map<Id, SObject>` created from `iterator`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|

#### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

### `static toObjectList(Iterator<Object> iterator)`

Returns a `List<Object>` created from `iterator`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|

#### Return

**Type**

List<Object>

**Description**

the `List<Object>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

### `static toObjectSet(Iterator<Object> iterator)`

Returns a `Set<Object>` created from `iterator`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|

#### Return

**Type**

Set<Object>

**Description**

the `Set<Object>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

### `static toIntList(Iterator<Integer> iterator)`

Returns a `List<Integer>` created from `iterator`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|

#### Return

**Type**

List<Integer>

**Description**

the `List<Integer>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

### `static toIntSet(Iterator<Integer> iterator)`

Returns a `Set<Integer>` created from `iterator`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|

#### Return

**Type**

Set<Integer>

**Description**

the `Set<Integer>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

### `static toLongList(Iterator<Long> iterator)`

Returns a `List<Long>` created from `iterator`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|

#### Return

**Type**

List<Long>

**Description**

the `List<Long>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

### `static toLongSet(Iterator<Long> iterator)`

Returns a `Set<Long>` created from `iterator`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|

#### Return

**Type**

Set<Long>

**Description**

the `Set<Long>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

### `static toDoubleList(Iterator<Double> iterator)`

Returns a `List<Double>` created from `iterator`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|

#### Return

**Type**

List<Double>

**Description**

the `List<Double>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

### `static toDoubleSet(Iterator<Double> iterator)`

Returns a `Set<Double>` created from `iterator`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|

#### Return

**Type**

Set<Double>

**Description**

the `Set<Double>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

### `static toList(Iterator<SObject> iterator, ISObjectFunction mapper, Type listType)`

Accumulates elements returned by `mapper` into a `List<?>` of specific `listType`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|
|`mapper`|the mapping function|
|`listType`|the result type|

#### Return

**Type**

List<Object>

**Description**

the `List<Object>` which can be cast into `listType`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator`, `mapper` or `listType` is null|

#### Example
```apex
List<String> accNames = (List<String>)
    Iterators.toList(accIterator, SObjectFunctions.get('Name'), List<String>.class);
```

### `static toObjectSet(Iterator<SObject> iterator, ISObjectFunction mapper)`

Accumulates values returned by `mapper` into a `Set<Object>`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|
|`mapper`|the mapping function|

#### Return

**Type**

Set<Object>

**Description**

the `Set<Object>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` or `mapper` is null|

#### Example
```apex
Set<Object> createdDates = Iterators.toObjectSet(accIterator, SObjectFunctions.get('CreatedDate'));
```

### `static toObjectSet(Iterator<Object> iterator, IFunction mapper)`

Accumulates values returned by `mapper` into a `Set<Object>`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|
|`mapper`|the mapping function|

#### Return

**Type**

Set<Object>

**Description**

the `Set<Object>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` or `mapper` is null|

### `static toIdSet(Iterator<SObject> iterator, ISObjectFunction mapper)`

Accumulates values returned by `mapper` into a `Set<Id>`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|
|`mapper`|the mapping function|

#### Return

**Type**

Set<Id>

**Description**

the `Set<Id>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` or `mapper` is null|

#### Example
```apex
Set<Id> parentIds = Iterators.toIdSet(accIterator, SObjectFunctions.get('ParentId'));
```

### `static toStringSet(Iterator<SObject> iterator, ISObjectFunction mapper)`

Accumulates values returned by `mapper` into a `Set<String>`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|
|`mapper`|the mapping function|

#### Return

**Type**

Set<String>

**Description**

the `Set<String>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` or `mapper` is null|

#### Example
```apex
Set<String> names = Iterators.toStringSet(accIterator, SObjectFunctions.get('Name'));
```

### `static toByIdMap(Iterator<SObject> iterator, ISObjectFunction keyMapper, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType` whose keys are produced by `keyMapper` and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|
|`keyMapper`|the mapping function producing keys|
|`mapType`|the type of map|

#### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>` which can be cast into `mapType`

#### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `iterator`, `keyMapper` or `listType` is null|

#### Example
```apex
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Iterators
    .toByIdMap(contIterator, SObjectFunctions.get('AccountId'), Map<Id, Contact>.class);
```

### `static toByStringMap(Iterator<SObject> iterator, ISObjectFunction keyMapper, Type mapType)`

Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType` whose keys are produced by `keyMapper` and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|
|`keyMapper`|the mapping function producing keys|
|`mapType`|the type of map|

#### Return

**Type**

Map<String,SObject>

**Description**

the `Map<String, SObject>` which can be cast into `mapType`

#### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `iterator`, `keyMapper` or `listType` is null|

#### Example
```apex
Map<String, Account> accountByName = (Map<String, Account>) Iterators
    .toByIdMap(accIterator, SObjectFunctions.get('Name'), Map<String, Account>.class);
```

### `static groupById(Iterator<SObject> iterator, ISObjectFunction keyMapper)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are values returned by `keyMapper` and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|
|`keyMapper`|the mapping function producing keys|

#### Return

**Type**

Map<Id,List<SObject>>

**Description**

the `Map<Id, List<SObject>>` containing the elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` or `keyMapper` is blank|

#### Example
```apex
Map<Id, List<Contact>> contactsByAccountId = Iterators.groupById(conIterator, SObjectFunctions.get('AccountId'));
```

### `static groupByString(Iterator<SObject> iterator, ISObjectFunction keyMapper)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are values returned by `keyMapper` and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|
|`keyMapper`|the mapping function producing keys|

#### Return

**Type**

Map<String,List<SObject>>

**Description**

the `Map<Id, List<SObject>>` containing the elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` or `keyMapper` is null|

#### Example
```apex
Map<String, List<Account>> accountsByRating = Iterators
    .groupByString(accIterator, SObjectFunctions.get('Rating'));
```

### `static partition(Iterator<SObject> iterator, ISObjectPredicate predicate)`

Partitions `SObject` elements by `predicate`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|
|`predicate`|the predicate|

#### Return

**Type**

Map<Boolean,List<SObject>>

**Description**

the `Map<Boolean, List<SObject>>` containing the elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` or `predicate` is null|

#### Example
```apex
Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
    = Iterators.partition(accIterator, SObjectPredicates.isEqual(Account.Rating, 'Hot'));
```

---
