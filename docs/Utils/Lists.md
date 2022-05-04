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

the `List<Object>` which can be casted into `listType`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects`, `mapper` or `listType` is null|

#### Example
```apex
List<String> accNames = (List<String>) Lists.toList(accounts, SObjectFunction.get('Name'), List<String>.class);
```

### `static toList(List<SObject> sObjects, String fieldName, Type listType)`

Accumulates `fieldName` values into a `List<?>` of specific `listType`.

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
|`NullPointerException`|if `sObjects` or `listType` is null, or `fieldName` is blank|

#### Example
```apex
List<String> accNames = (List<String>) Lists.toList(accounts, 'Name', List<String>.class);
```

### `static toList(List<SObject> sObjects, SObjectField field, Type listType)`

Accumulates `field` values into a `List<?>` of specific `listType`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`field`|the field|
|`listType`|the type of list|

#### Return

**Type**

List<Object>

**Description**

the `List<Object>` which can be casted into `listType`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects`, `field` or `listType` is null|

#### Example
```apex
List<String> accNames = (List<String>) Lists.toList(accounts, Account.Name, List<String>.class);
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
Set<Id> parentIds = Lists.toIdSet(accounts, SObjectFunction.get('ParentId'));
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
|`NullPointerException`|if `sObjects` is null or `fieldName` is blank|

#### Example
```apex
Set<Id> parentIds = Lists.toIdSet(accounts, 'ParentId');
```

### `static toIdSet(List<SObject> sObjects, SObjectField field)`

Accumulates `field` values into a `Set<Id>`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`field`|the field|

#### Return

**Type**

Set<Id>

**Description**

the `Set<Id>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` or `field` is null|

#### Example
```apex
Set<Id> parentIds = Lists.toIdSet(accounts, Account.ParentId);
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
Set<String> names = Lists.toStringSet(accounts, SObjectFunction.get('Name'));
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

the `Set<Id>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` is null or `fieldName` is blank|

#### Example
```apex
Set<String> names = Lists.toStringSet(accounts, 'Name');
```

### `static toStringSet(List<SObject> sObjects, SObjectField field)`

Accumulates `field` values into a `Set<String>`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`field`|the field|

#### Return

**Type**

Set<String>

**Description**

the `Set<Id>`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` or `field` is null|

#### Example
```apex
Set<String> names = Lists.toStringSet(accounts, Account.Name);
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

the `Map<Id, SObject>` which can be casted into `mapType`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects`, `keyMapper` or `listType` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

#### Example
```apex
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Lists
    .toByIdMap(contacts, SObjectFunction.get('AccountId'), Map<Id, Contact>.class);
```

### `static toByIdMap(List<SObject> sObjects, String fieldName, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType` whose keys are `fieldName` values and values are `SObject` elements.

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
|`NullPointerException`|if `sObjects` or `listType` is null, or `fieldName` is blank|
|`IllegalStateException`|if mapped keys contain duplicates|

#### Example
```apex
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Lists
    .toByIdMap(contacts, 'AccountId', Map<Id, Contact>.class);
```

### `static toByIdMap(List<SObject> sObjects, SObjectField field, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType` whose keys are `field` values and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`field`|the field|
|`mapType`|the type of map|

#### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>` which can be casted into `mapType`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects`, `field` or `listType` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

#### Example
```apex
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Lists
    .toByIdMap(contacts, Contact.AccountId, Map<Id, Contact>.class);
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

the `Map<String, SObject>` which can be casted into `mapType`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects`, `keyMapper` or `listType` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

#### Example
```apex
Map<String, Account> accountByName = (Map<String, Account>) Lists
    .toByIdMap(accounts, SObjectFunction.get('Name'), Map<String, Account>.class);
```

### `static toByStringMap(List<SObject> sObjects, String fieldName, Type mapType)`

Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType` whose keys are `fieldName` values and values are `SObject` elements.

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
|`NullPointerException`|if `sObjects` or `listType` is null, or `fieldName` is blank|
|`IllegalStateException`|if mapped keys contain duplicates|

#### Example
```apex
Map<String, Account> accountByName = (Map<String, Account>) Lists
    .toByIdMap(accounts, 'Name', Map<String, Account>.class);
```

### `static toByStringMap(List<SObject> sObjects, SObjectField field, Type mapType)`

Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType` whose keys are `field` values and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`field`|the field|
|`mapType`|the type of map|

#### Return

**Type**

Map<String,SObject>

**Description**

the `Map<Id, SObject>` which can be casted into `mapType`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects`, `field` or `listType` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

#### Example
```apex
Map<String, Account> accountByName = (Map<String, Account>) Lists
    .toByIdMap(accounts, Account.Name, Map<String, Account>.class);
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
Map<Id, List<Contact>> contactsByAccountId = Lists.groupById(contacts, SObjectFunction.get('AccountId'));
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
|`NullPointerException`|if `sObjects` is null, or `fieldName` is blank|

#### Example
```apex
Map<Id, List<Contact>> contactsByAccountId = Lists.groupById(contacts, 'AccountId');
```

### `static groupById(List<SObject> sObjects, SObjectField field)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are `field` values and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`field`|the field|

#### Return

**Type**

Map<Id,List<SObject>>

**Description**

the `Map<Id, List<SObject>>` containing the elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` or `field` is null|

#### Example
```apex
Map<Id, List<Contact>> contactsByAccountId = Lists.groupById(contacts, Contact.AccountId);
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
Map<String, List<Account>> accountsByRating = Lists.groupByString(accounts, SObjectFunction.get('Rating'));
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

the `Map<String, List<SObject>>` containing the elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` is null, or `fieldName` is blank|

#### Example
```apex
Map<String, List<Account>> accountsByRating = Lists.groupByString(accounts, 'Rating');
```

### `static groupByString(List<SObject> sObjects, SObjectField field)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are `field` values and values are `SObject` elements.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`field`|the field|

#### Return

**Type**

Map<String,List<SObject>>

**Description**

the `Map<String, List<SObject>>` containing the elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` or `field` is null|

#### Example
```apex
Map<String, List<Account>> accountsByRating = Lists.groupByString(accounts, Account.Rating);
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

### `static partition(List<SObject> sObjects, String fieldName, Object value)`

Partition `SObject` elements by `fieldName` having `value`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`fieldName`|the field|
|`value`|the satisfying value|

#### Return

**Type**

Map<Boolean,List<SObject>>

**Description**

the `Map<Boolean, List<SObject>>` containing the partitioned elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` is null or `fieldName` is blank|

#### Example
```apex
Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
    = Lists.partition(accounts, 'Rating', 'Hot');
```

### `static partition(List<SObject> sObjects, SObjectField field, Object value)`

Partition `SObject` elements by `field` having `value`.

#### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list|
|`field`|the field name|
|`value`|the satisfying value|

#### Return

**Type**

Map<Boolean,List<SObject>>

**Description**

the `Map<Boolean, List<SObject>>` containing the partitioned elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` or `field` is null|

#### Example
```apex
Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
    = Lists.partition(accounts, Account.Rating, 'Hot');
```

---
