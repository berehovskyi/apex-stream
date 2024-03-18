# virtual SObjectCollectors

`SUPPRESSWARNINGS`

`APIVERSION: 60`

`STATUS: ACTIVE`

Provides common implementations of SObject [Collector](/docs/Functional-Abstract-Classes/Collector.md)
and related utilities.


**Inheritance**

[BaseCollectors](/docs/Functional-Built-In-Classes/BaseCollectors.md)
 > 
[Collectors](/docs/Functional-Built-In-Classes/Collectors.md)
 > 
SObjectCollectors


**See** [Collector](/docs/Functional-Abstract-Classes/Collector.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### List<?> Collectors
##### `public static Collector toList(String fieldName)`

Returns a `Collector` that accumulates the values of `fieldName` into a new `List<Object>`. Cross-reference fields and safe navigation are supported. <p>The result container can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Accumulates values of fieldName into a List
List<Object> accountNames = (List<Object>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toList('Name'));
List<String> parentAccountNames = (List<String>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toList('Parent?.Name').cast(List<String>.class));
```


##### `public static Collector toList(SObjectField field)`

Returns a `Collector` that accumulates the values of `field` into a new `List<Object>`. <p>The result container can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
List<Object> accountNames = (List<Object>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toList(Account.Name));
List<String> accountNames = (List<String>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toList(Account.Name).cast(List<String>.class));
```


---
### Set<?> Collectors
##### `public static Collector toBoolSet(String fieldName)`

Returns a `Collector` that accumulates the Boolean values of `fieldName` into a new `Set<Boolean>`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Boolean> doNotCalls = (Set<Boolean>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toBoolSet('DoNotCall'));
Set<Boolean> parentDoNotCalls = (Set<Boolean>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toBoolSet('Parent?.DoNotCall'));
```


##### `public static Collector toBoolSet(SObjectField field)`

Returns a `Collector` that accumulates the Boolean values of `field` into a new `Set<Boolean>`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
List<Boolean> accountNames = (List<Boolean>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toBoolSet(Contact.DoNotCall));
```


##### `public static Collector toIdSet(String fieldName)`

Returns a `Collector` that accumulates the Boolean values of `fieldName` into a new `Set<Boolean>`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Id> ids = (Set<Id>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toIdSet('Id'));
Set<Id> parentOwnerIds = (Set<Id>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toIdSet('Parent?.OwnerId'));
```


##### `public static Collector toIdSet(SObjectField field)`

Returns a `Collector` that accumulates the Id values of `field` into a new `Set<Id>`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Id> ids = (Set<Id>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toIdSet(Account.Id));
```


##### `public static Collector toStringSet(String fieldName)`

Returns a `Collector` that accumulates the String values of `fieldName` into a new `Set<String>`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<String> names = (Set<String>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toStringSet('Name'));
Set<String> parentNames = (Set<String>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toStringSet('Parent?.Name'));
```


##### `public static Collector toStringSet(SObjectField field)`

Returns a `Collector` that accumulates the String values of `field` into a new `Set<String>`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<String> names = (Set<String>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toStringSet(Account.Name));
```


##### `public static Collector toBlobSet(String fieldName)`

Returns a `Collector` that accumulates the Blob values of `fieldName` into a new `Set<Blob>`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Blob> bodies = (Set<Blob>) [SObjectEnumerable].of(attachments)
    .collect(SObjectCollectors.toBlobSet('Body'));
Set<Blob> parentBodies = (Set<Blob>) [SObjectEnumerable].of(attachments)
    .collect(SObjectCollectors.toBlobSet('Parent?.Body'));
```


##### `public static Collector toBlobSet(SObjectField field)`

Returns a `Collector` that accumulates the Blob values of `field` into a new `Set<Blob>`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Blob> bodies = (Set<Blob>) [SObjectEnumerable].of(attachments)
    .collect(SObjectCollectors.toBlobSet(Attachment.Body));
```


##### `public static Collector toDateSet(String fieldName)`

Returns a `Collector` that accumulates the Date values of `fieldName` into a new `Set<Date>`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Date> birthdates = (Set<Date>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toDateSet('Birthdate'));
Set<Date> parentBirthdates = (Set<Date>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toDateSet('Parent?.Birthdate'));
```


##### `public static Collector toDateSet(SObjectField field)`

Returns a `Collector` that accumulates the Date values of `field` into a new `Set<Date>`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Date> birthdates = (Set<Date>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toDateSet(Contact.Birthdate));
```


##### `public static Collector toDatetimeSet(String fieldName)`

Returns a `Collector` that accumulates the Datetime values of `fieldName` into a new `Set<Datetime>`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Datetime> activityDateTimes = (Set<Datetime>) [SObjectEnumerable].of(events)
    .collect(SObjectCollectors.toDatetimeSet('ActivityDateTime'));
Set<Datetime> activityDateTimes = (Set<Datetime>) [SObjectEnumerable].of(events)
    .collect(SObjectCollectors.toDatetimeSet('Parent?.ActivityDateTime'));
```


##### `public static Collector toDatetimeSet(SObjectField field)`

Returns a `Collector` that accumulates the Datetime values of `field` into a new `Set<Datetime>`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Datetime> activityDateTimes = (Set<Datetime>) [SObjectEnumerable].of(events)
    .collect(SObjectCollectors.toDatetimeSet(Event.ActivityDateTime));
```


##### `public static Collector toTimeSet(IFunction mapper)`

Returns a `Collector` that accumulates the Time values returned by `mapper` into a new `Set<Time>`.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function that returns values to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
// Accumulates values returned by mapper into a Set
Set<Time> startTimes = (Set<Time>) [SObjectEnumerable].of(slots)
    .collect(SObjectCollectors.toTimeSet(SObjectFunctions.get('StartTime')));
```


##### `public static Collector toTimeSet(String fieldName)`

Returns a `Collector` that accumulates the Time values of `fieldName` into a new `Set<Time>`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Time> startTimes = (Set<Time>) [SObjectEnumerable].of(slots)
    .collect(SObjectCollectors.toTimeSet('StartTime'));
Set<Time> parentStartTimes = (Set<Time>) [SObjectEnumerable].of(slots)
    .collect(SObjectCollectors.toTimeSet('Parent?.StartTime'));
```


##### `public static Collector toTimeSet(SObjectField field)`

Returns a `Collector` that accumulates the Time values of `field` into a new `Set<Time>`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Time> startTimes = (Set<Time>) [SObjectEnumerable].of(slots)
    .collect(SObjectCollectors.toTimeSet(TimeSlot.StartTime));
```


##### `public static Collector toIntSet(String fieldName)`

Returns a `Collector` that accumulates the Integer values of `fieldName` into a new `Set<Integer>`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Integer> numberOfEmployees = (Set<Integer>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toIntSet('NumberOfEmployees'));
Set<Integer> parentNumberOfEmployees = (Set<Integer>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toIntSet('Parent?.NumberOfEmployees'));
```


##### `public static Collector toIntSet(SObjectField field)`

Returns a `Collector` that accumulates the Integer values of `field` into a new `Set<Integer>`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Integer> numberOfEmployees = (Set<Integer>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toIntSet(Account.NumberOfEmployees));
```


##### `public static Collector toLongSet(String fieldName)`

Returns a `Collector` that accumulates the Long values of `fieldName` into a new `Set<Long>`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Long> numberOfEmployees = (Set<Long>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toLongSet('NumberOfEmployees'));
Set<Long> parentNumberOfEmployees = (Set<Long>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toLongSet('Parent?.NumberOfEmployees'));
```


##### `public static Collector toLongSet(SObjectField field)`

Returns a `Collector` that accumulates the Long values of `field` into a new `Set<Long>`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Long> numberOfEmployees = (Set<Long>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toLongSet(Account.NumberOfEmployees));
```


##### `public static Collector toDoubleSet(String fieldName)`

Returns a `Collector` that accumulates the Double values of `fieldName` into a new `Set<Double>`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Double> billingLatitudes = (Set<Double>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toDoubleSet('BillingLatitude'));
Set<Double> parentBillingLatitudes = (Set<Double>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toDoubleSet('Parent?.BillingLatitude'));
```


##### `public static Collector toDoubleSet(SObjectField field)`

Returns a `Collector` that accumulates the Double values of `field` into a new `Set<Double>`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Double> billingLatitudes = (Set<Double>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toDoubleSet(Account.BillingLatitude));
```


##### `public static Collector toObjectSet(String fieldName)`

Returns a `Collector` that accumulates the Object values of `fieldName` into a new `Set<Double>`. Cross-reference fields and safe navigation are supported. <p>The result container <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Set()` collectors such as [SObjectCollectors.toIdSet](SObjectCollectors.toIdSet), [SObjectCollectors.toStringSet](SObjectCollectors.toStringSet), etc.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Object> birthdates = (Set<Object>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toObjectSet('Birthdate'));
Set<Object> parentBirthdates = (Set<Object>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toObjectSet('Parent?.Birthdate'));
```


##### `public static Collector toObjectSet(SObjectField field)`

Returns a `Collector` that accumulates the Object values of `field` into a new `Set<Object>`. <p>The result container <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Set()` collectors such as [SObjectCollectors.toIdSet](SObjectCollectors.toIdSet), [SObjectCollectors.toStringSet](SObjectCollectors.toStringSet), etc.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Object> birthdates = (Set<Object>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toObjectSet(Contact.Birthdate));
```


##### `public static Collector toSObjectSet()`

*Inherited*


Returns a `Collector` that accumulates input arguments into a new `Set<SObject>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<SObject> sObjects = (Set<SObject>) [ObjectEnumerable].of(accounts).collect(Collectors.toSObjectSet());
```


##### `public static Collector toSObjectSet(IFunction mapper)`

*Inherited*


Returns a `Collector` that accumulates elements returned by `mapper` function into a new `Set<SObject>`. <p>The result container <strong>cannot</strong> be cast to a specific `Type`.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
// Accumulates input arguments into a List
Set<SObject> sObjects = (Set<SObject>) [ObjectEnumerable].of(accounts).collect(Collectors.toSObjectSet(mapper));
```


---
### Map<Id, SObject> Collectors
##### `public static Collector toByIdMap()`

Returns a `Collector` that accumulates the SObject values into a `Map<Id, SObject>` <p>The result container value type can be cast to a specific `SObjectType` using [Collector.cast](Collector.cast).</p> <p>[SObjectEnumerable.collect(SObjectCollectors.toByIdMap())](SObjectEnumerable.collect(SObjectCollectors.toByIdMap())) can be replaced with [ISObjectEnumerable.toByIdMap()](ISObjectEnumerable.toByIdMap())</p>

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|


**See** [SObjectCollectors.toByIdMap](SObjectCollectors.toByIdMap)

###### Example
```apex
// Accumulates SObjects into a List
Map<Id, SObject> sObjs = (Map<Id, SObject>) [SObjectEnumerable].of(sObjects)
    .collect(SObjectCollectors.toByIdMap());
Map<Id, Account> accs = (Map<Id, Account>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByIdMap().cast(Map<Id, Account));
```


##### `public static Collector toByIdMap(String keyFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Id, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByIdMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByIdMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Id, SObject> contactByAccountId = (Map<Id, SObject>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByIdMap('AccountId'));
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByIdMap('AccountId').cast(Map<Id, Contact>.class));
```


##### `public static Collector toByIdMap(SObjectField keyField)`

Returns a `Collector` that accumulates elements into a `Map<Id, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByIdMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByIdMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Id, SObject> contactByAccountId = (Map<Id, SObject>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByIdMap(Contact.AccountId));
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByIdMap(Contact.AccountId).cast(Map<Id, Contact>.class));
```


---
### Map<Boolean, Object> Collectors
##### `public static Collector toByBoolMap(String keyFieldName, String valueFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByBoolMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByBoolMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByBoolMap('DoNotCall', 'LastName').cast(Map<Boolean, String>.class));
```


##### `public static Collector toByBoolMap(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByBoolMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByBoolMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByBoolMap(
        Contact.DoNotCall,
        Contact.LastName
   ).cast(Map<Boolean, String>.class));
```


---
### Map<Boolean, SObject> Collectors
##### `public static Collector toByBoolMap(String keyFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Boolean, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByBoolMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByBoolMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Boolean, SObject> contactByDoNotCall = (Map<Boolean, SObject>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByBoolMap('DoNotCall'));
Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByBoolMap('DoNotCall').cast(Map<Boolean, Contact>.class));
```


##### `public static Collector toByBoolMap(SObjectField keyField)`

Returns a `Collector` that accumulates elements into a `Map<Boolean, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByBoolMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByBoolMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Boolean, SObject> contactByDoNotCall = (Map<Boolean, SObject>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByBoolMap(Contact.DoNotCall));
Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByBoolMap(Contact.DoNotCall).cast(Map<Boolean, Contact>.class));
```


---
### Map<Id, Object> Collectors
##### `public static Collector toByIdMap(String keyFieldName, String valueFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Id, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByIdMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByIdMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Id, String> lastNameByAccountId = (Map<Id, String>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByIdMap(
        'AccountId',
        'LastName'
    ).cast(Map<Id, String>.class));
```


##### `public static Collector toByIdMap(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that accumulates elements into a `Map<Id, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByIdMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByIdMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Id, String> lastNameByAccountId = (Map<Id, String>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByIdMap(
        Contact.AccountId,
        Contact.LastName
    ).cast(Map<Id, String>.class));
```


---
### Map<String, Object> Collectors
##### `public static Collector toByStringMap(String keyFieldName, String valueFieldName)`

Returns a `Collector` that accumulates elements into a `Map<String, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByStringMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByStringMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<String, String> lastNameByFirstName = (Map<String, String>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByStringMap(
        'FirstName',
        'LastName'
    ).cast(Map<String, String>.class));
```


##### `public static Collector toByStringMap(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that accumulates elements into a `Map<String, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByStringMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByStringMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<String, String> lastNameByFirstName = (Map<String, String>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByStringMap(
        Contact.FirstName,
        Contact.LastName
    ).cast(Map<String, String>.class));
```


---
### Map<String, SObject> Collectors
##### `public static Collector toByStringMap(String keyFieldName)`

Returns a `Collector` that accumulates elements into a `Map<String, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByStringMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByStringMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<String, SObject> contactByFirstName = (Map<String, SObject>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByStringMap('FirstName'));
Map<String, Contact> contactByFirstName = (Map<String, Contact>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByStringMap('FirstName').cast(Map<String, Contact>.class));
```


##### `public static Collector toByStringMap(SObjectField keyField)`

Returns a `Collector` that accumulates elements into a `Map<String, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByStringMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByStringMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<String, SObject> contactByFirstName = (Map<String, SObject>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByStringMap(Contact.FirstName));
Map<String, Contact> contactByFirstName = (Map<String, Contact>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByStringMap(Contact.FirstName).cast(Map<String, Contact>.class));
```


---
### Map<Blob, Object> Collectors
##### `public static Collector toByBlobMap(String keyFieldName, String valueFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByBlobMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByBlobMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Blob, String> nameByBody = (Map<Blob, String>) [SObjectEnumerable].of(attachments)
    .collect(SObjectCollectors.toByBlobMap(
        'Body',
        'Name'
    ).cast(Map<Blob, String>.class));
```


##### `public static Collector toByBlobMap(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByBlobMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByBlobMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Blob, String> nameByBody = (Map<Blob, String>) [SObjectEnumerable].of(attachments)
    .collect(SObjectCollectors.toByBlobMap(
        Attachment.Body,
        Attachment.Name
    ).cast(Map<Blob, String>.class));
```


---
### Map<Blob, SObject> Collectors
##### `public static Collector toByBlobMap(String keyFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Blob, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByBlobMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByBlobMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Blob, SObject> attachmentByBody = (Map<Blob, SObject>) [SObjectEnumerable].of(attachments)
    .collect(SObjectCollectors.toByBlobMap('Body'));
Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) [SObjectEnumerable].of(attachments)
    .collect(SObjectCollectors.toByBlobMap('Body').cast(Map<Blob, Attachment>.class));
```


##### `public static Collector toByBlobMap(SObjectField keyField)`

Returns a `Collector` that accumulates elements into a `Map<Blob, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByBlobMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByBlobMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Blob, SObject> attachmentByBody = (Map<Blob, SObject>) [SObjectEnumerable].of(attachments)
    .collect(SObjectCollectors.toByBlobMap(Attachment.Body));
Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) [SObjectEnumerable].of(attachments)
    .collect(SObjectCollectors.toByBlobMap(Attachment.Body).cast(Map<Blob, Attachment>.class));
```


---
### Map<Date, Object> Collectors
##### `public static Collector toByDateMap(String keyFieldName, String valueFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Date, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByDateMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByDateMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Date, String> lastNameByBirthdate = (Map<Date, String>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByDateMap(
        'Birthdate',
        'LastName'
    ).cast(Map<Date, String>.class));
```


##### `public static Collector toByDateMap(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that accumulates elements into a `Map<Date, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByDateMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByDateMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Date, String> lastNameByBirthdate = (Map<Date, String>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByDateMap(
        Contact.Birthdate,
        Contact.LastName
    ).cast(Map<Date, String>.class));
```


---
### Map<Date, SObject> Collectors
##### `public static Collector toByDateMap(String keyFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Date, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByDateMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByDateMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Date, SObject> contactByBirthdate = (Map<Date, SObject>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByDateMap('Birthdate'));
Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByDateMap('Birthdate').cast(Map<Date, Contact>.class));
```


##### `public static Collector toByDateMap(SObjectField keyField)`

Returns a `Collector` that accumulates elements into a `Map<Date, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByDateMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByDateMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Date, SObject> contactByBirthdate = (Map<Date, SObject>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByDateMap(Contact.Birthdate));
Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByDateMap(Contact.Birthdate).cast(Map<Date, Contact>.class));
```


---
### Map<Datetime, Object> Collectors
##### `public static Collector toByDatetimeMap(String keyFieldName, String valueFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) [SObjectEnumerable].of(events)
    .collect(SObjectCollectors.toByDatetimeMap(
        'ActivityDateTime',
        'Description'
    ).cast(Map<Datetime, String>.class));
```


##### `public static Collector toByDatetimeMap(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) [SObjectEnumerable].of(events)
    .collect(SObjectCollectors.toByDatetimeMap(
        Event.ActivityDateTime,
        Event.Description
    ).cast(Map<Datetime, String>.class));
```


---
### Map<Datetime, SObject> Collectors
##### `public static Collector toByDatetimeMap(String keyFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Datetime, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Datetime, SObject> eventByActivityDateTime = (Map<Datetime, SObject>) [SObjectEnumerable].of(events)
    .collect(SObjectCollectors.toByDatetimeMap('ActivityDateTime'));
Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) [SObjectEnumerable].of(events)
    .collect(SObjectCollectors.toByDatetimeMap('ActivityDateTime').cast(Map<Datetime, Event>.class));
```


##### `public static Collector toByDatetimeMap(SObjectField keyField)`

Returns a `Collector` that accumulates elements into a `Map<Datetime, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Datetime, SObject> eventByActivityDateTime = (Map<Datetime, SObject>) [SObjectEnumerable].of(events)
    .collect(SObjectCollectors.toByDatetimeMap(Event.ActivityDateTime));
Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) [SObjectEnumerable].of(events)
    .collect(SObjectCollectors.toByDatetimeMap(Event.ActivityDateTime).cast(Map<Datetime, Event>.class));
```


---
### Map<Time, Object> Collectors
##### `public static Collector toByTimeMap(String keyFieldName, String valueFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Time, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByTimeMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByTimeMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) [SObjectEnumerable].of(slots)
    .collect(SObjectCollectors.toByTimeMap(
        'StartTime',
        'EndTime'
    ).cast(Map<Time, Time>.class));
```


##### `public static Collector toByTimeMap(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that accumulates elements into a `Map<Time, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByTimeMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByTimeMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) [SObjectEnumerable].of(slots)
    .collect(SObjectCollectors.toByTimeMap(
        TimeSlot.StartTime,
        TimeSlot.EndTime
    ).cast(Map<Time, Time>.class));
```


---
### Map<Time, SObject> Collectors
##### `public static Collector toByTimeMap(String keyFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Time, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByTimeMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByTimeMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Time, SObject> timeSlotByStartTime = (Map<Time, SObject>) [SObjectEnumerable].of(slots)
    .collect(SObjectCollectors.toByTimeMap('StartTime'));
Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) [SObjectEnumerable].of(slots)
    .collect(SObjectCollectors.toByTimeMap('StartTime').cast(Map<Time, TimeSlot>.class));
```


##### `public static Collector toByTimeMap(SObjectField keyField)`

Returns a `Collector` that accumulates elements into a `Map<Datetime, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByDatetimeMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Time, SObject> timeSlotByStartTime = (Map<Time, SObject>) [SObjectEnumerable].of(slots)
    .collect(SObjectCollectors.toByTimeMap(TimeSlot.StartTime));
Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) [SObjectEnumerable].of(slots)
    .collect(SObjectCollectors.toByTimeMap(TimeSlot.StartTime).cast(Map<Time, TimeSlot>.class));
```


---
### Map<Integer, Object> Collectors
##### `public static Collector toByIntMap(String keyFieldName, String valueFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByIntMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByIntMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByIntMap(
        'NumberOfEmployees',
        'Name'
    ).cast(Map<Integer, String>.class));
```


##### `public static Collector toByIntMap(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByIntMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByIntMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByIntMap(
        Account.NumberOfEmployees,
        Account.Name
    ).cast(Map<Integer, String>.class));
```


---
### Map<Integer, SObject> Collectors
##### `public static Collector toByIntMap(String keyFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Integer, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByIntMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByIntMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Integer, SObject> accountByNumberOfEmployees = (Map<Integer, SObject>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByIntMap('NumberOfEmployees'));
Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByIntMap('NumberOfEmployees').cast(Map<Integer, Account>.class));
```


##### `public static Collector toByIntMap(SObjectField keyField)`

Returns a `Collector` that accumulates elements into a `Map<Integer, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByIntMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByIntMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Integer, SObject> accountByNumberOfEmployees = (Map<Integer, SObject>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByIntMap(Account.NumberOfEmployees));
Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByIntMap(Account.NumberOfEmployees).cast(Map<Integer, Account>.class));
```


---
### Map<Long, Object> Collectors
##### `public static Collector toByLongMap(String keyFieldName, String valueFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Long, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByLongMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByLongMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByIntMap(
        'NumberOfEmployees',
        'Name'
    ).cast(Map<Long, String>.class));
```


##### `public static Collector toByLongMap(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that accumulates elements into a `Map<Long, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByLongMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByLongMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByLongMap(
        Account.NumberOfEmployees,
        Account.Name
    ).cast(Map<Long, String>.class));
```


---
### Map<Long, SObject> Collectors
##### `public static Collector toByLongMap(String keyFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Long, SObject>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByLongMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByLongMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Long, SObject> accountByNumberOfEmployees = (Map<Long, SObject>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByLongMap('NumberOfEmployees'));
Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByLongMap('NumberOfEmployees').cast(Map<Long, Account>.class));
```


##### `public static Collector toByLongMap(SObjectField keyField)`

Returns a `Collector` that accumulates elements into a `Map<Long, SObject>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByLongMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByLongMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Long, SObject> accountByNumberOfEmployees = (Map<Long, SObject>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByLongMap(Account.NumberOfEmployees));
Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByLongMap(Account.NumberOfEmployees).cast(Map<Long, Account>.class));
```


---
### Map<Double, Object> Collectors
##### `public static Collector toByDoubleMap(String keyFieldName, String valueFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Double, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByDoubleMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByDoubleMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Double, String> nameByBillingLatitude = (Map<Double, String>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByDoubleMap(
        'BillingLatitude',
        'Name'
    ).cast(Map<Double, String>.class));
```


##### `public static Collector toByDoubleMap(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that accumulates elements into a `Map<Double, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByDoubleMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByDoubleMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Double, String> nameByBillingLatitude = (Map<Double, String>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByDoubleMap(
        Account.BillingLatitude,
        Account.Name
    ).cast(Map<Double, String>.class));
```


---
### Map<Double, SObject> Collectors
##### `public static Collector toByDoubleMap(String keyFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Double, SObject>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByDoubleMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByDoubleMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Double, SObject> accountByBillingLatitude = (Map<Double, SObject>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByDoubleMap('BillingLatitude'));
Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByDoubleMap('BillingLatitude').cast(Map<Double, Account>.class));
```


##### `public static Collector toByDoubleMap(SObjectField keyField)`

Returns a `Collector` that accumulates elements into a `Map<Double, SObject>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByDoubleMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByDoubleMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Double, SObject> accountByBillingLatitude = (Map<Double, SObject>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByDoubleMap(Account.BillingLatitude));
Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.toByDoubleMap(Account.BillingLatitude).cast(Map<Double, Account>.class));
```


---
### Map<Object, Object> Collectors
##### `public static Collector toByObjectMap(String keyFieldName, String valueFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Object, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByObjectMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByObjectMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as [SObjectCollectors.toByIdMap](SObjectCollectors.toByIdMap), [SObjectCollectors.toByStringMap](SObjectCollectors.toByStringMap), etc.</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Object, String> lastNameByBirthdate = (Map<Object, String>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByObjectMap(
        'Birthdate',
        'LastName'
    ).cast(Map<Object, String>.class));
```


##### `public static Collector toByObjectMap(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that accumulates elements into a `Map<Object, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByObjectMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByObjectMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as [SObjectCollectors.toByIdMap](SObjectCollectors.toByIdMap), [SObjectCollectors.toByStringMap](SObjectCollectors.toByStringMap), etc.</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Object, String> lastNameByBirthdate = (Map<Object, String>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByObjectMap(
        Contact.Birthdate,
        Contact.LastName
    ).cast(Map<Object, String>.class));
```


---
### Map<Object, SObject> Collectors
##### `public static Collector toByObjectMap(String keyFieldName)`

Returns a `Collector` that accumulates elements into a `Map<Object, SObject>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use [SObjectCollectors.toByObjectMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByObjectMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as [SObjectCollectors.toByIdMap](SObjectCollectors.toByIdMap), [SObjectCollectors.toByStringMap](SObjectCollectors.toByStringMap), etc.</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Object, SObject> contactByBirthdate = (Map<Object, SObject>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByObjectMap('Birthdate'));
Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByObjectMap('Birthdate').cast(Map<Double, Contact>.class));
```


##### `public static Collector toByObjectMap(SObjectField keyField)`

Returns a `Collector` that accumulates elements into a `Map<Object, SObject>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use [SObjectCollectors.toByObjectMap(IFunction, IFunction, IBiOperator)](SObjectCollectors.toByObjectMap(IFunction, IFunction, IBiOperator)) instead. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as [SObjectCollectors.toByIdMap](SObjectCollectors.toByIdMap), [SObjectCollectors.toByStringMap](SObjectCollectors.toByStringMap), etc.</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Object, SObject> contactByBirthdate = (Map<Object, SObject>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByObjectMap(Contact.Birthdate));
Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.toByObjectMap(Contact.Birthdate).cast(Map<Object, Contact>.class));
```


---
### Map<Boolean, ?> Collectors
##### `public static Collector groupingByBool(String keyFieldName, String valueFieldName)`

Returns a `Collector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Boolean, List<String>> lastNamesByDoNotCall = (Map<Boolean, List<String>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByBool(
            'DoNotCall',
            'LastName'
        ).cast(Map<Boolean, List<String>>.class));
```


##### `public static Collector groupingByBool(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Boolean, List<String>> lastNamesByDoNotCall = (Map<Boolean, List<String>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByBool(
            Contact.DoNotCall,
            Contact.LastName
        ).cast(Map<Boolean, List<String>>.class));
```


##### `public static Collector groupingByBool(String fieldName)`

Returns a `Collector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Boolean, List<Contact>> contactsByDoNotCall = (Map<Boolean, List<Contact>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByBool('DoNotCall'));
```


##### `public static Collector groupingByBool(SObjectField field)`

Returns a `Collector` that performs grouping of SObject input arguments according to `field`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Boolean, List<Contact>> contactsByDoNotCall = (Map<Boolean, List<Contact>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByBool(Contact.DoNotCall));
```


---
### Map<Id, ?> Collectors
##### `public static Collector groupingById(String keyFieldName, String valueFieldName)`

Returns a `Collector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Id, List<String>> lastNamesByAccountId = (Map<Id, List<String>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingById(
            'AccountId',
            'LastName'
        ).cast(Map<Id, List<String>>.class));
```


##### `public static Collector groupingById(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Id, List<String>> lastNamesByAccountId = (Map<Id, List<String>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByBool(
            Contact.AccountId,
            Contact.LastName
        ).cast(Map<Id, List<String>>.class));
```


##### `public static Collector groupingById(String fieldName)`

Returns a `Collector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Id, List<Contact>> contactsByAccountId = (Map<Id, List<Contact>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingById('AccountId'));
```


##### `public static Collector groupingById(SObjectField field)`

Returns a `Collector` that performs grouping of SObject input arguments according to `field`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<String, List<Contact>> contactsByAccountId = (Map<String, List<Contact>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingById(Contact.AccountId));
```


---
### Map<String, ?> Collectors
##### `public static Collector groupingByString(String keyFieldName, String valueFieldName)`

Returns a `Collector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by field
Map<String, List<String>> lastNamesByOtherCity = (Map<String, List<String>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByString(
            'OtherCity',
            'LastName'
        ).cast(Map<String, List<String>>.class));
```


##### `public static Collector groupingByString(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<String, List<String>> lastNamesByOtherCity = (Map<String, List<String>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByString(
            Contact.OtherCity,
            Contact.LastName
        ).cast(Map<String, List<String>>.class));
```


##### `public static Collector groupingByString(String fieldName)`

Returns a `Collector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Group values by keys provided by field
Map<String, List<Contact>> contactsByOtherCity = (Map<String, List<Contact>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByString('OtherCity'));
```


##### `public static Collector groupingByString(SObjectField field)`

Returns a `Collector` that performs grouping of SObject input arguments according to `field`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<String, List<Contact>> contactsByOtherCity = (Map<String, List<Contact>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByString(Contact.OtherCity));
```


---
### Map<Blob, ?> Collectors
##### `public static Collector groupingByBlob(String keyFieldName, String valueFieldName)`

Returns a `Collector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Blob, List<String>> namesByBody = (Map<Blob, List<String>>)
    [SObjectEnumerable].of(attachments)
        .collect(SObjectCollectors.groupingByBlob(
            'Body',
            'Name'
        ).cast(Map<Blob, List<String>>.class));
```


##### `public static Collector groupingByBlob(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Blob, List<String>> namesByBody = (Map<Blob, List<String>>)
    [SObjectEnumerable].of(attachments)
        .collect(SObjectCollectors.groupingByString(
            Attachment.Body,
            Attachment.Name
        ).cast(Map<Blob, List<String>>.class));
```


##### `public static Collector groupingByBlob(String fieldName)`

Returns a `Collector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Blob, List<Attachment>> attachmentsByBody = (Map<Blob, List<Attachment>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByBlob('Body'));
```


##### `public static Collector groupingByBlob(SObjectField field)`

Returns a `Collector` that performs grouping of SObject input arguments according to `field`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Blob, List<Attachment>> attachmentsByBody = (Map<Blob, List<Attachment>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByBlob(Attachment.Body));
```


---
### Map<Date, ?> Collectors
##### `public static Collector groupingByDate(String keyFieldName, String valueFieldName)`

Returns a `Collector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Date, List<String>> lastNamesByBirthdate = (Map<Date, List<String>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByDate(
            'Birthdate',
            'LastName'
        ).cast(Map<Date, List<String>>.class));
```


##### `public static Collector groupingByDate(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Date, List<String>> lastNamesByBirthdate = (Map<Date, List<String>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByDate(
            Contact.Birthdate,
            Contact.LastName
        ).cast(Map<Date, List<String>>.class));
```


##### `public static Collector groupingByDate(String fieldName)`

Returns a `Collector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Date, List<Contact>> contactsByBody = (Map<Date, List<Contact>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByDate('Birthdate'));
```


##### `public static Collector groupingByDate(SObjectField field)`

Returns a `Collector` that performs grouping of SObject input arguments according to `field`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Date, List<Contact>> contactsByBody = (Map<Date, List<Contact>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByDate(Contact.Birthdate));
```


---
### Map<Datetime, ?> Collectors
##### `public static Collector groupingByDatetime(String keyFieldName, String valueFieldName)`

Returns a `Collector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Datetime, List<String>> descriptionsByActivityDateTime = (Map<Datetime, List<String>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByDatetime(
            'ActivityDateTime',
            'Description'
        ).cast(Map<Datetime, List<String>>.class));
```


##### `public static Collector groupingByDatetime(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Datetime, List<String>> descriptionsByActivityDateTime = (Map<Datetime, List<String>>)
    [SObjectEnumerable].of(events)
        .collect(SObjectCollectors.groupingByDatetime(
            Event.ActivityDateTime,
            Event.Description
        ).cast(Map<Datetime, List<String>>.class));
```


##### `public static Collector groupingByDatetime(String fieldName)`

Returns a `Collector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Datetime, List<Event>> eventsByActivityDateTime = (Map<Datetime, List<Event>>)
    [SObjectEnumerable].of(events)
        .collect(SObjectCollectors.groupingByDatetime('ActivityDateTime'));
```


##### `public static Collector groupingByDatetime(SObjectField field)`

Returns a `Collector` that performs grouping of SObject input arguments according to `field`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Datetime, List<Event>> eventsByActivityDateTime = (Map<Datetime, List<Event>>)
    [SObjectEnumerable].of(events)
        .collect(SObjectCollectors.groupingByDatetime(Event.ActivityDateTime));
```


---
### Map<Time, ?> Collectors
##### `public static Collector groupingByTime(String keyFieldName, String valueFieldName)`

Returns a `Collector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Time, List<String>> namesByStartTime = (Map<Time, List<String>>)
    [SObjectEnumerable].of(slots)
        .collect(SObjectCollectors.groupingByDatetime(
            'StartTime',
            'Name'
        ).cast(Map<Time, List<String>>.class));
```


##### `public static Collector groupingByTime(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Time, List<String>> descriptionsByActivityDateTime = (Map<Time, List<String>>)
    [SObjectEnumerable].of(slots)
        .collect(SObjectCollectors.groupingByTime(
            TimeSlot.StartTime,
            TimeSlot.Description
        ).cast(Map<Time, List<String>>.class));
```


##### `public static Collector groupingByTime(String fieldName)`

Returns a `Collector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Time, List<TimeSlot>> slotsByStartTime = (Map<Time, List<TimeSlot>>)
    [SObjectEnumerable].of(slots)
        .collect(SObjectCollectors.groupingByTime('StartTime'));
```


##### `public static Collector groupingByTime(SObjectField field)`

Returns a `Collector` that performs grouping of SObject input arguments according to `field`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Time, List<TimeSlot>> slotsByStartTime = (Map<Time, List<TimeSlot>>)
    [SObjectEnumerable].of(slots)
        .collect(SObjectCollectors.groupingByTime(TimeSlot.StartTime));
```


---
### Map<Integer, ?> Collectors
##### `public static Collector groupingByInt(String keyFieldName, String valueFieldName)`

Returns a `Collector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Integer, List<String>> namesByNumberOfEmployees = (Map<Integer, List<String>>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByInt(
            'NumberOfEmployees',
            'Name'
        ).cast(Map<Integer, List<String>>.class));
```


##### `public static Collector groupingByInt(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Integer, List<String>> namesByNumberOfEmployees = (Map<Integer, List<String>>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByInt(
            Account.NumberOfEmployees,
            Account.Name
        ).cast(Map<Integer, List<String>>.class));
```


##### `public static Collector groupingByInt(String fieldName)`

Returns a `Collector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Integer, List<Account>> accountsByNumberOfEmployees = (Map<Integer, List<Account>>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByInt('NumberOfEmployees'));
```


##### `public static Collector groupingByInt(SObjectField field)`

Returns a `Collector` that performs grouping of SObject input arguments according to `field`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Integer, List<Account>> accountsByNumberOfEmployees = (Map<Integer, List<Account>>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByInt(Account.NumberOfEmployees));
```


---
### Map<Long, ?> Collectors
##### `public static Collector groupingByLong(String keyFieldName, String valueFieldName)`

Returns a `Collector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Long, List<String>> namesByNumberOfEmployees = (Map<Long, List<String>>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByLong(
            'NumberOfEmployees',
            'Name'
        ).cast(Map<Long, List<String>>.class));
```


##### `public static Collector groupingByLong(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Long, List<String>> namesByNumberOfEmployees = (Map<Long, List<String>>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByLong(
            Account.NumberOfEmployees,
            Account.Name
        ).cast(Map<Long, List<String>>.class));
```


##### `public static Collector groupingByLong(String fieldName)`

Returns a `Collector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Long, List<Account>> accountsByNumberOfEmployees = (Map<Long, List<Account>>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByLong('NumberOfEmployees'));
```


##### `public static Collector groupingByLong(SObjectField field)`

Returns a `Collector` that performs grouping of SObject input arguments according to `field`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Long, List<Account>> accountsByNumberOfEmployees = (Map<Long, List<Account>>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByLong(Account.NumberOfEmployees));
```


---
### Map<Double, ?> Collectors
##### `public static Collector groupingByDouble(String keyFieldName, String valueFieldName)`

Returns a `Collector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Double, List<String>> namesByBillingLatitude = (Map<Double, List<String>>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByDouble(
            'BillingLatitude',
            'Name'
        ).cast(Map<Double, List<String>>.class));
```


##### `public static Collector groupingByDouble(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Double, List<String>> namesByBillingLatitude = (Map<Double, List<String>>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByDouble(
            Account.BillingLatitude,
            Account.Name
        ).cast(Map<Double, List<String>>.class));
```


##### `public static Collector groupingByDouble(String fieldName)`

Returns a `Collector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Double, List<Account>> accountsByBillingLatitude = (Map<Double, List<Account>>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByDouble('BillingLatitude'));
```


##### `public static Collector groupingByDouble(SObjectField field)`

Returns a `Collector` that performs grouping of SObject input arguments according to `field`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Double, List<Account>> accountsByBillingLatitude = (Map<Double, List<Account>>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByDouble(Account.BillingLatitude));
```


---
### Map<Object, ?> Collectors
##### `public static Collector groupingByObject(String keyFieldName, String valueFieldName)`

Returns a `Collector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as [SObjectCollectors.groupingById](SObjectCollectors.groupingById), [SObjectCollectors.groupingByString](SObjectCollectors.groupingByString), etc.</p>

###### Parameters

|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Object, List<String>> lastNamesByBirthdate = (Map<Object, List<String>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByObject(
            'Birthdate',
            'LastName'
        ).cast(Map<Object, List<String>>.class));
```


##### `public static Collector groupingByObject(SObjectField keyField, SObjectField valueField)`

Returns a `Collector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using [Collector.cast](Collector.cast).</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as [SObjectCollectors.groupingById](SObjectCollectors.groupingById), [SObjectCollectors.groupingByString](SObjectCollectors.groupingByString), etc.</p>

###### Parameters

|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Object, List<String>> lastNamesByBirthdate = (Map<Object, List<String>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByObject(
            Contact.Birthdate,
            Contact.LastName
        ).cast(Map<Object, List<String>>.class));
```


##### `public static Collector groupingByObject(String fieldName)`

Returns a `Collector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported. <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as [SObjectCollectors.groupingById](SObjectCollectors.groupingById), [SObjectCollectors.groupingByString](SObjectCollectors.groupingByString), etc.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Object, List<Contact>> contactsByBody = (Map<Object, List<Contact>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByObject('Birthdate'));
```


##### `public static Collector groupingByObject(SObjectField field)`

Returns a `Collector` that performs grouping of SObject input arguments according to `field`. <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as [SObjectCollectors.groupingById](SObjectCollectors.groupingById), [SObjectCollectors.groupingByString](SObjectCollectors.groupingByString), etc.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Object, List<Contact>> contactsByBody = (Map<Object, List<Contact>>)
    [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.groupingByObject(Contact.Birthdate));
```


---
### Partitioning By Collectors
##### `public static Collector partitioningBy(String fieldName, Object value)`

Returns a `Collector` that partitions the SObject input arguments according to whether `fieldName` is equal to `value` and organizes them into a `Map<Boolean, List<SObject>>`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to test|
|`value`|the expected value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
Map<Boolean, List<Account>> accountNamesPartitionedByHavingMoreThan100Employees =
    (Map<Boolean, List<Account>>) [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.partitioningBy('OtherCountry', 'UK'));
```


##### `public static Collector partitioningBy(SObjectField field, Object value)`

Returns a `Collector` that partitions the SObject input arguments according to whether `field` is equal to `value` and organizes them into a `Map<Boolean, List<SObject>>`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to test|
|`value`|the expected value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** [SObjectPredicates.isEqual](SObjectPredicates.isEqual)

###### Example
```apex
Map<Boolean, List<Account>> accountNamesPartitionedByHavingMoreThan100Employees =
    (Map<Boolean, List<Account>>) [SObjectEnumerable].of(contacts)
        .collect(SObjectCollectors.partitioningBy(Contact.OtherCountry, 'UK'));
```


---
### Joining
##### `public static Collector joining(String fieldName)`

Returns a `Collector` that concatenates `fieldName` String values of the SObject input arguments. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to concatenate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
String lastNames = (String) [SObjectEnumerable].of(contacts).collect(SObjectCollectors.joining('LastName'));
```


##### `public static Collector joining(SObjectField field)`

Returns a `Collector` that concatenates `fieldName` String values of the SObject input arguments.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to concatenate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
String lastNames = (String) [SObjectEnumerable].of(contacts).collect(SObjectCollectors.joining(Contact.LastName));
```


##### `public static Collector joining(String fieldName, String delimiter)`

Returns a `Collector` that concatenates `fieldName` String values of the SObject input arguments, separated by the `delimiter`.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to concatenate|
|`delimiter`|the delimiter between each element|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|`delimiter` is null|

###### Example
```apex
String lastNames = (String) [SObjectEnumerable].of(contacts)
     .collect(SObjectCollectors.joining('LastName', '; '));
```


##### `public static Collector joining(SObjectField field, String delimiter)`

Returns a `Collector` that concatenates `field` String values of the SObject input arguments, separated by the `delimiter`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to concatenate|
|`delimiter`|the delimiter between each element|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `delimiter` is null|

###### Example
```apex
String lastNames = (String) [SObjectEnumerable].of(contacts)
    .collect(SObjectCollectors.joining(Contact.LastName, '; '));
```


##### `public static Collector joining(String fieldName, String delimiter, String prefix, String suffix)`

Returns a `Collector` that concatenates `fieldName` String values of the SObject input arguments, separated by the `delimiter` with `prefix` and `suffix`.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to concatenate|
|`delimiter`|the delimiter between each element|
|`prefix`|the prefix|
|`suffix`|the suffix|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `delimiter`, `prefix` or `suffix` is null|

###### Example
```apex
String lastNames = (String) [SObjectEnumerable].of(contacts)
     .collect(SObjectCollectors.joining('LastName', '; ', 'prefix', 'suffix'));
```


##### `public static Collector joining(SObjectField field, String delimiter, String prefix, String suffix)`

Returns a `Collector` that concatenates `field` String values of the SObject input arguments, separated by the `delimiter` with `prefix` and `suffix`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to concatenate|
|`delimiter`|the delimiter between each element|
|`prefix`|the prefix|
|`suffix`|the suffix|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field`, `delimiter`, `prefix` or `suffix` is null|

###### Example
```apex
String lastNames = (String) [SObjectEnumerable].of(contacts)
     .collect(SObjectCollectors.joining(Contact.LastName, '; ', 'prefix', 'suffix'));
```


---
### Int Collectors
##### `public static Collector averagingInt(String fieldName)`

Returns a `Collector` that returns the arithmetic mean of `fieldName` values. If no elements are present, the result is 0.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to average|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
Double averageNumberOfEmployees = (Double) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.averagingInt('NumberOfEmployees'));
```


##### `public static Collector averagingInt(SObjectField field)`

Returns a `Collector` that returns the arithmetic mean of `field` values. If no elements are present, the result is null.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to average|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Double averageNumberOfEmployees = (Double) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.averagingInt(Account.NumberOfEmployees));
```


##### `public static Collector counting()`

Returns a `Collector` that counts the number of input elements. If no elements are present, the result is 0.

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Example
```apex
Double averageNumberOfEmployees = (Double) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.counting());
```


##### `public static Collector summingInt(String fieldName)`

Returns a `Collector` that returns the arithmetic sum of `fieldName` values. If no elements are present, the result is null.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to sum|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
Integer sumOfNumberOfEmployees = (Integer) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.summingInt('NumberOfEmployees'));
```


##### `public static Collector summingInt(SObjectField field)`

Returns a `Collector` that returns the arithmetic sum of `field` values. If no elements are present, the result is null.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to sum|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Integer sumOfNumberOfEmployees = (Integer) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.summingInt(Account.NumberOfEmployees));
```


---
### Long Collectors
##### `public static Collector averagingLong(String fieldName)`

Returns a `Collector` that returns the arithmetic mean of `fieldName` values. If no elements are present, the result is null.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to average|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
Double averageNumberOfEmployees = (Double) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.averagingLong('NumberOfEmployees'));
```


##### `public static Collector averagingLong(SObjectField field)`

Returns a `Collector` that returns the arithmetic mean of `field` values. If no elements are present, the result is null.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to average|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Double averageNumberOfEmployees = (Double) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.averagingLong(Account.NumberOfEmployees));
```


##### `public static Collector summingLong(String fieldName)`

Returns a `Collector` that returns the arithmetic sum of `fieldName` values. If no elements are present, the result is null.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to sum|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
Long sumOfNumberOfEmployees = (Long) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.summingLong('NumberOfEmployees'));
```


##### `public static Collector summingLong(SObjectField field)`

Returns a `Collector` that returns the arithmetic sum of `field` values. If no elements are present, the result is null.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to sum|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Long sumOfNumberOfEmployees = (Long) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.summingLong(Account.NumberOfEmployees));
```


---
### Double Collectors
##### `public static Collector averagingDouble(String fieldName)`

Returns a `Collector` that returns the arithmetic mean of `fieldName` values. If no elements are present, the result is null.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to average|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
Double averageBillingLatitude = (Double) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.averagingDouble('BillingLatitude'));
```


##### `public static Collector averagingDouble(SObjectField field)`

Returns a `Collector` that returns the arithmetic mean of `field` values. If no elements are present, the result is null.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to average|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Double averageBillingLatitude = (Double) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.averagingDouble(Account.BillingLatitude));
```


##### `public static Collector summingDouble(String fieldName)`

Returns a `Collector` that returns the arithmetic sum of `fieldName` values. If no elements are present, the result is null.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to sum|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
Double sumOfBillingLatitude = (Double) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.summingDouble('BillingLatitude'));
```


##### `public static Collector summingDouble(SObjectField field)`

Returns a `Collector` that returns the arithmetic sum of `field` values. If no elements are present, the result is null.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to BillingLatitude|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Double sumOfBillingLatitude = (Double) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.summingDouble(Account.NumberOfEmployees));
```


---
### Intermediate Collectors
##### `public static Collector filtering(String fieldName, Object value)`

Adapts a `Collector` to one accepting elements by testing of `fieldName` is equal to `value` to each input element and only accumulating if it is true.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to test input arguments|
|`value`|the expected value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|


**See** [SObjectPredicates.isEqual](SObjectPredicates.isEqual)

###### Example
```apex
// Get accounts with hot Rating
List<Account> accountsHavingMoreThan100Employees = (List<Account>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.filtering('Rating', 'Hot'));
// Group accounts with hot Rating by type
Map<String, List<Account>> accountNamesHavingMoreThan100EmployeesByType =
    (Map<String, List<Account>>) [SObjectEnumerable].of(accounts)
       .collect(
            SObjectCollectors.groupingByString(
                SObjectFunctions.get('Type'),
                SObjectCollectors.filtering('Rating', 'Hot')
       ).cast(Map<String, List<Account>>.class));
```


##### `public static Collector filtering(SObjectField field, Object value)`

Adapts a `Collector` to one accepting elements by testing of `field` is equal to `value` to each input element and only accumulating if it is true.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to test input arguments|
|`value`|the expected value|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Get accounts with hot Rating
List<Account> accountsHavingMoreThan100Employees = (List<Account>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.filtering(Account.Rating, 'Hot'));
// Group accounts with hot Rating by type
Map<String, List<Account>> accountNamesHavingMoreThan100EmployeesByType =
    (Map<String, List<Account>>) [SObjectEnumerable].of(accounts)
       .collect(
            SObjectCollectors.groupingByString(
                SObjectFunctions.get('Type'),
                SObjectCollectors.filtering(Account.Rating, 'Hot')
       ).cast(Map<String, List<Account>>.class));
```


##### `public static Collector mapping(String fieldName)`

Adapts a `Collector` to one accepting `fieldName` values to each input element before accumulation.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
List<String> accountNames = (List<String>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.mapping('Name').cast(List<String>.class));
```


##### `public static Collector mapping(SObjectField field)`

Adapts a `Collector` to one accepting `field` values to each input element before accumulation.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
List<String> accountNames = (List<String>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.mapping(Account.Name).cast(List<String>.class));
```


##### `public static Collector flatMapping(String fieldName)`

Adapts a `Collector` to one accepting elements as a result of replacing each input element with the contents of a mapped iterable according to child relationship `fieldName` before accumulation.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the child relationship field|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
List<Contact> contacts = (List<Contact>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.flatMapping('Contacts').cast(List<Contact>.class));
Map<String, List<Contact>> contactsByAccountType = (Map<String, List<Contact>>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('Type'),
            SObjectCollectors.flatMapping('Contacts')
        ).cast(Map<String, List<Contact>>.class));
```


##### `public static Collector flatMapping(SObjectField field)`

Adapts a `Collector` to one accepting elements as a result of replacing each input element with the contents of a mapped iterable according to child relationship `field` before accumulation.

###### Parameters

|Param|Description|
|---|---|
|`field`|the child relationship field|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
List<Contact> contacts = (List<Contact>) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.flatMapping(Contact.AccountId).cast(List<Contact>.class));
Map<String, List<Contact>> contactsByAccountType = (Map<String, List<Contact>>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('Type'),
            SObjectCollectors.flatMapping(Contact.AccountId)
        ).cast(Map<String, List<Contact>>.class));
```


##### `public static Collector reducing(SObject identity, IBiOperator accumulator)`

Returns a `Collector` which performs a reduction of its input elements under `accumulator` using `identity`.

###### Parameters

|Param|Description|
|---|---|
|`identity`|the identity value for the reduction|
|`accumulator`|the input arguments reducer|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
Account accountWithSummedNumberOfEmployees = (Account) [SObjectEnumerable].of(accounts)
    .collect(SObjectCollectors.reducing(
        new Account(NumberOfEmployees = 0),
        sumIntFieldReducer
    ));
```


---
### Optional Collectors
##### `public static Collector maximizing(String fieldName)`

Returns a `Collector` which produces the maximal element according to `fieldName`, described as an `Optional` SObject . <p>The result container <strong>cannot</strong> be cast to a specific `Optional` SObject.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to compare|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
Map<String, Object> accountOptionalWithMaxNumberOfEmployeesPerType = (Map<String, Object>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('Type'),
            SObjectCollectors.maximizing('NumberOfEmployees')
        ));
Account customerWithMaxNumberOfEmployees = (Account)
    ((Optional) accountOptionalWithMaxNumberOfEmployeesPerType).get('Customer').get();
```


##### `public static Collector maximizing(SObjectField field)`

Returns a `Collector` which produces the maximal element according to `field`, described as an `Optional` SObject . <p>The result container <strong>cannot</strong> be cast to a specific `Optional` SObject.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to compare|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Map<String, Object> accountOptionalWithMaxNumberOfEmployeesPerType = (Map<String, Object>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get(Account.Type),
            SObjectCollectors.maximizing(Account.NumberOfEmployees)
        ));
Account customerWithMaxNumberOfEmployees = (Account)
    ((Optional) accountOptionalWithMaxNumberOfEmployeesPerType).get('Customer').get();
```


##### `public static Collector minimizing(String fieldName)`

Returns a `Collector` which produces the minimal element according to `fieldName`, described as an `Optional` SObject . <p>The result container <strong>cannot</strong> be cast to a specific `Optional` SObject.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field value to compare|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
Map<String, Object> accountOptionalWithMinNumberOfEmployeesPerType = (Map<String, Object>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('Type'),
            SObjectCollectors.maximizing('NumberOfEmployees')
        ));
Account customerWithMinNumberOfEmployees = (Account)
    ((Optional) accountOptionalWithMinNumberOfEmployeesPerType).get('Customer').get();
```


##### `public static Collector minimizing(SObjectField field)`

Returns a `Collector` which produces the maximal element according to `field`, described as an `Optional` SObject . <p>The result container <strong>cannot</strong> be cast to a specific `Optional` SObject.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|the field value to compare|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Map<String, Object> accountOptionalWithMinNumberOfEmployeesPerType = (Map<String, Object>)
    [SObjectEnumerable].of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get(Account.Type),
            SObjectCollectors.maximizing(Account.NumberOfEmployees)
        ));
Account customerWithMinNumberOfEmployees = (Account)
    ((Optional) accountOptionalWithMinNumberOfEmployeesPerType).get('Customer').get();
```


---
