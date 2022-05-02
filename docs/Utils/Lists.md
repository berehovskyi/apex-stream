# Lists

`APIVERSION: 54`

`STATUS: ACTIVE`

Contains static utility methods that operate Lists.


**Author** O. Berehovskyi


**Group** Utils

## Methods
### `static sort(List<SObject> sObjects, ISObjectComparator comparator)`

Returns a sorted `List<SObject>` with sorted elements according to `comparator`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the elements to sort|
|`comparator`|the comparator to compare elements|

#### Return

**Type**

List<SObject>

**Description**

the sorted `List<SObject>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` or `comparator` is null|

#### Example
```apex
List<Account> sortedAccountsByName = Lists.sort(accounts, SObjectComparator.comparing(Account.Name));
```

### `static sort(List<Object> objects, IComparator comparator)`

Returns a sorted `List<Object>` with sorted elements according to `comparator`.

#### Parameters
|Param|Description|
|---|---|
|`objects`|the elements to sort|
|`comparator`|the comparator to compare elements|

#### Return

**Type**

List<Object>

**Description**

the sorted `List<Object>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `objects` or `comparator` is null|

#### Example
```apex
List<Person> sortedPeopleByName = (List<Person>) Lists.sort(people, Comparator.comparing(getName));
```

### `static toList(List<SObject> sObjects, String fieldName, Type listType)`

Accumulates `fieldName` values into a `List` of specific `listType`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
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
|`NullPointerException`|if `sObjects` or `listType` is null, and `fieldName` is blank|

#### Example
```apex
List<String> accNames = (List<String>) Lists.toList(accounts, 'Name', List<String>.class);
```

### `static toIdSet(List<SObject> sObjects, String fieldName)`

Accumulates `fieldName` values into a `Set<Id>`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`fieldName`|the field name|

#### Return

**Type**

Set<Id>

**Description**

the `Set<Id>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` is null, and `fieldName` is blank|

#### Example
```apex
Set<Id> parentIds = Lists.toIdSet(accounts, 'ParentId');
```

### `static toStringSet(List<SObject> sObjects, String fieldName)`

Accumulates `fieldName` values into a `Set<String>`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`fieldName`|the field name|

#### Return

**Type**

Set<String>

**Description**

the `Set<String>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` is null, and `fieldName` is blank|

#### Example
```apex
Set<String> names = Lists.toStringSet(accounts, 'Name');
```

### `static toByIdMap(List<SObject> sObjects, String fieldName, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, SObject>` whose keys are `fieldName` values and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
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
|`NullPointerException`|if `sObjects` or `listType` is null, and `fieldName` is blank|
|`IllegalStateException`|if mapped keys contain duplicates|

#### Example
```apex
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Lists
    .toByIdMap(contacts, 'AccountId', Map<Id, Contact>.class);
```

### `static toByStringMap(List<SObject> sObjects, String fieldName, Type mapType)`

Accumulates `SObject` elements into a `Map<String, SObject>` whose keys are `fieldName` values and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
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
|`NullPointerException`|if `sObjects` or `listType` is null, and `fieldName` is blank|
|`IllegalStateException`|if mapped keys contain duplicates|

#### Example
```apex
Map<String, Account> accountByName = (Map<String, Account>) Lists
    .toByIdMap(accounts, 'Name', Map<String, Account>.class);
```

### `static groupById(List<SObject> sObjects, String fieldName)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are `fieldName` values and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`fieldName`|the field|

#### Return

**Type**

Map<Id,List<SObject>>

**Description**

the `Map<Id, List<SObject>>` containing the elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` is null, and `fieldName` is blank|

#### Example
```apex
Map<Id, List<Contact>> contactsByAccountId = Lists.groupById(contacts, 'AccountId');
```

### `static groupByString(List<SObject> sObjects, String fieldName)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are `fieldName` values and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`fieldName`|the field|

#### Return

**Type**

Map<String,List<SObject>>

**Description**

the `Map<Id, List<SObject>>` containing the elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` is null, and `fieldName` is blank|

#### Example
```apex
Map<String, List<Account>> accountsByRating = Iterators.groupByString(conIterator, 'Rating');
```

### `static partition(List<SObject> sObjects, ISObjectPredicate predicate)`

Partitions `SObject` elements by `predicate`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
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
    = Lists.partition(accounts, SObjectPredicate.isEqual(Account.Rating, 'Hot'));
```

---
