# Lists

`APIVERSION: 55`

`STATUS: ACTIVE`

Contains static utility methods that operate Lists.


**Author** Oleh Berehovskyi


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

### `static toList(List<SObject> sObjects, ISObjectFunction mapper, Type listType)`

Accumulates elements returned by `mapper` into a `List<?>` of specific `listType`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
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
|`NullPointerException`|if `sObjects`, `mapper` or `listType` is null|

#### Example
```apex
List<String> accNames = (List<String>) Lists.toList(accounts, SObjectFunctions.get('Name'), List<String>.class);
```

### `static toObjectSet(List<SObject> sObjects, ISObjectFunction mapper)`

Accumulates values returned by `mapper` into a `Set<Object>`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`mapper`|the mapping function|

#### Return

**Type**

Set<Object>

**Description**

the `Set<Object>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` or `mapper` is null|

#### Example
```apex
Set<Object> createdDates = Lists.toObjectSet(accounts, SObjectFunctions.get('CreatedDate'));
```

### `static toIdSet(List<SObject> sObjects, ISObjectFunction mapper)`

Accumulates values returned by `mapper` into a `Set<Id>`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`mapper`|the mapping function|

#### Return

**Type**

Set<Id>

**Description**

the `Set<Id>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` or `mapper` is null|

#### Example
```apex
Set<Id> parentIds = Lists.toIdSet(accounts, SObjectFunctions.get('ParentId'));
```

### `static toStringSet(List<SObject> sObjects, ISObjectFunction mapper)`

Accumulates values returned by `mapper` into a `Set<String>`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`mapper`|the mapping function|

#### Return

**Type**

Set<String>

**Description**

the `Set<String>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` or `mapper` is null|

#### Example
```apex
Set<String> names = Lists.toStringSet(accounts, SObjectFunctions.get('Name'));
```

### `static toByIdMap(List<SObject> sObjects, ISObjectFunction keyMapper, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType` whose keys are produced by `keyMapper` and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
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
|`NullPointerException`|if `sObjects`, `keyMapper` or `listType` is null|

#### Example
```apex
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Lists
    .toByIdMap(contacts, SObjectFunctions.get('AccountId'), Map<Id, Contact>.class);
```

### `static toByStringMap(List<SObject> sObjects, ISObjectFunction keyMapper, Type mapType)`

Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType` whose keys are produced by `keyMapper` and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
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
|`NullPointerException`|if `sObjects`, `keyMapper` or `listType` is null|

#### Example
```apex
Map<String, Account> accountByName = (Map<String, Account>) Lists
    .toByIdMap(accounts, SObjectFunctions.get('Name'), Map<String, Account>.class);
```

### `static groupById(List<SObject> sObjects, ISObjectFunction keyMapper)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are values returned by `keyMapper` and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`keyMapper`|the mapping function producing keys|

#### Return

**Type**

Map<Id,List<SObject>>

**Description**

the `Map<Id, List<SObject>>` containing the elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` or `keyMapper` is blank|

#### Example
```apex
Map<Id, List<Contact>> contactsByAccountId = Lists.groupById(contacts, SObjectFunctions.get('AccountId'));
```

### `static groupByString(List<SObject> sObjects, ISObjectFunction keyMapper)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are values returned by `keyMapper` and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`keyMapper`|the mapping function producing keys|

#### Return

**Type**

Map<String,List<SObject>>

**Description**

the `Map<Id, List<SObject>>` containing the elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` or `keyMapper` is null|

#### Example
```apex
Map<String, List<Account>> accountsByRating = Lists.groupByString(accounts, SObjectFunctions.get('Rating'));
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
    = Lists.partition(accounts, SObjectPredicates.isEqual(Account.Rating, 'Hot'));
```

---
