# Iterators

`APIVERSION: 54`

`STATUS: ACTIVE`

Contains static utility methods that operate Iterators.


**Author** O. Berehovskyi


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

### `static toList(Iterator<SObject> iterator, String fieldName, Type listType)`

Accumulates `fieldName` values into a `List` of specific `listType`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|
|`fieldName`|the field name|
|`listType`|the type of list|

#### Return

**Type**

List<Object>

**Description**

the `List<Object>` which can be casted into `listType`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` or `listType` is null, and `fieldName` is blank|

#### Example
```apex
List<String> accNames = (List<String>) Iterators.toList(accIterator, 'Name', List<String>.class);
```

### `static toIdSet(Iterator<SObject> iterator, String fieldName)`

Accumulates `fieldName` values into a `Set<Id>`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|
|`fieldName`|the field name|

#### Return

**Type**

Set<Id>

**Description**

the `Set<Id>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null, and `fieldName` is blank|

#### Example
```apex
Set<Id> parentIds = Iterators.toIdSet(accIterator, 'ParentId');
```

### `static toStringSet(Iterator<SObject> iterator, String fieldName)`

Accumulates `fieldName` values into a `Set<String>`.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|
|`fieldName`|the field name|

#### Return

**Type**

Set<String>

**Description**

the `Set<String>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null, and `fieldName` is blank|

#### Example
```apex
Set<String> names = Iterators.toStringSet(accIterator, 'Name');
```

### `static toByIdMap(Iterator<SObject> iterator, String fieldName, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, SObject>` whose keys are `fieldName` values and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|
|`fieldName`|the field name|
|`mapType`|the type of map|

#### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>` which can be casted into `mapType`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` or `listType` is null, and `fieldName` is blank|
|`IllegalStateException`|if mapped keys contain duplicates|

#### Example
```apex
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Iterators
    .toByIdMap(conIterator, 'AccountId', Map<Id, Contact>.class);
```

### `static toByStringMap(Iterator<SObject> iterator, String fieldName, Type mapType)`

Accumulates `SObject` elements into a `Map<String, SObject>` whose keys are `fieldName` values and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|
|`fieldName`|the field name|
|`mapType`|the type of map|

#### Return

**Type**

Map<String,SObject>

**Description**

the `Map<String, SObject>` which can be casted into `mapType`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` or `listType` is null, and `fieldName` is blank|
|`IllegalStateException`|if mapped keys contain duplicates|

#### Example
```apex
Map<String, Account> accountByName = (Map<String, Account>) Iterators
    .toByIdMap(accIterator, 'Name', Map<String, Account>.class);
```

### `static groupById(Iterator<SObject> iterator, String fieldName)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are `fieldName` values and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|
|`fieldName`|the field|

#### Return

**Type**

Map<Id,List<SObject>>

**Description**

the `Map<Id, List<SObject>>` containing the elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null, and `fieldName` is blank|

#### Example
```apex
Map<Id, List<Contact>> contactsByAccountId = Iterators.groupById(conIterator, 'AccountId');
```

### `static groupByString(Iterator<SObject> iterator, String fieldName)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are `fieldName` values and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|
|`fieldName`|the field|

#### Return

**Type**

Map<String,List<SObject>>

**Description**

the `Map<Id, List<SObject>>` containing the elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null, and `fieldName` is blank|

#### Example
```apex
Map<String, List<Account>> accountsByRating = Iterators.groupByString(conIterator, 'Rating');
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
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
    = Iterators.partition(accIterator, SObjectPredicate.isEqual(Account.Rating, 'Hot'));
```

---
