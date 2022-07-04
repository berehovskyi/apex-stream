# SObjectCollectors

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides common implementations of [SObjectCollector](/docs/Functional-Abstract-Classes/SObjectCollector.md) and related utilities.


**See** [SObjectCollector](/docs/Functional-Abstract-Classes/SObjectCollector.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### List<?> Collectors
##### `static toList()`

Returns a `SObjectCollector` that accumulates SObject input arguments into a new `List<SObject>`. <p>The result container can be cast to a specific `SObjectType`.</p> <p>ISObjectBaseIterable.collect(SObjectCollectors.toList()) can be replaced with ISObjectIterable.toList()</p>

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Example
```apex
// Accumulates SObjects into a List
List<SObject> sObjs = (List<SObject>) Stream.of(sObjects).collect(SObjectCollectors.toList());
List<Account> accs = (List<Account>) Stream.of(accounts).collect(SObjectCollectors.toList());
```

##### `static toList(ISObjectFunction mapper)`

Returns a `SObjectCollector` that accumulates the values returned by `mapper` into a new `List<Object>`. <p>The result container can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function that returns values to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
// Accumulates values returned by mapper into a List
List<Object> accountNames = (List<Object>) Stream.of(accounts)
    .collect(SObjectCollectors.toList(SObjectFunctions.get('Name')));
List<String> accountNames = (List<String>) Stream.of(accounts)
    .collect(SObjectCollectors.toList(SObjectFunctions.get('Name')).cast(List<String>.class));
```

##### `static toList(String fieldName)`

Returns a `SObjectCollector` that accumulates the values of `fieldName` into a new `List<Object>`. Cross-reference fields and safe navigation are supported. <p>The result container can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Accumulates values of fieldName into a List
List<Object> accountNames = (List<Object>) Stream.of(accounts)
    .collect(SObjectCollectors.toList('Name'));
List<String> parentAccountNames = (List<String>) Stream.of(accounts)
    .collect(SObjectCollectors.toList('Parent?.Name')).cast(List<String>.class));
```

##### `static toList(SObjectField field)`

Returns a `SObjectCollector` that accumulates the values of `field` into a new `List<Object>`. <p>The result container can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
List<Object> accountNames = (List<Object>) Stream.of(accounts)
    .collect(SObjectCollectors.toList(Account.Name));
List<String> accountNames = (List<String>) Stream.of(accounts)
    .collect(SObjectCollectors.toList(Account.Name)).cast(List<String>.class));
```

---
### Set<?> Collectors
##### `static toSet()`

Returns a `SObjectCollector` that accumulates SObject input arguments into a new `Set<SObject>`. <p>The result container <strong>cannot</strong> be cast to a specific `SObjectType`.</p> <p>ISObjectBaseIterable.collect(SObjectCollectors.toSet()) can be replaced with ISObjectIterable.toSet()</p>

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Example
```apex
// Accumulates SObjects into a List
Set<SObject> sObjs = (Set<SObject>) Stream.of(sObjects).collect(SObjectCollectors.toSet());
```

##### `static toBoolSet(ISObjectFunction mapper)`

Returns a `SObjectCollector` that accumulates the Boolean values returned by `mapper` into a new `Set<Boolean>`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function that returns values to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
// Accumulates values returned by mapper into a Set
Set<Boolean> doNotCalls = (Set<Boolean>) Stream.of(contacts)
    .collect(SObjectCollectors.toBoolSet(SObjectFunctions.get('DoNotCall')));
```

##### `static toBoolSet(String fieldName)`

Returns a `SObjectCollector` that accumulates the Boolean values of `fieldName` into a new `Set<Boolean>`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Boolean> doNotCalls = (Set<Boolean>) Stream.of(contacts)
    .collect(SObjectCollectors.toBoolSet('DoNotCall'));
Set<Boolean> parentDoNotCalls = (Set<Boolean>) Stream.of(contacts)
    .collect(SObjectCollectors.toBoolSet('Parent?.DoNotCall'));
```

##### `static toBoolSet(SObjectField field)`

Returns a `SObjectCollector` that accumulates the Boolean values of `field` into a new `Set<Boolean>`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
List<Boolean> accountNames = (List<Boolean>) Stream.of(contacts)
    .collect(SObjectCollectors.toBoolSet(Contact.DoNotCall));
```

##### `static toIdSet(ISObjectFunction mapper)`

Returns a `SObjectCollector` that accumulates the Id values returned by `mapper` into a new `Set<Id>`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function that returns values to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
// Accumulates values returned by mapper into a Set
Set<Id> ids = (Set<Id>) Stream.of(accounts)
    .collect(SObjectCollectors.toIdSet(SObjectFunctions.get('Id')));
```

##### `static toIdSet(String fieldName)`

Returns a `SObjectCollector` that accumulates the Boolean values of `fieldName` into a new `Set<Boolean>`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Id> ids = (Set<Id>) Stream.of(accounts)
    .collect(SObjectCollectors.toIdSet('Id'));
Set<Id> parentOwnerIds = (Set<Id>) Stream.of(accounts)
    .collect(SObjectCollectors.toIdSet('Parent?.OwnerId'));
```

##### `static toIdSet(SObjectField field)`

Returns a `SObjectCollector` that accumulates the Id values of `field` into a new `Set<Id>`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Id> ids = (Set<Id>) Stream.of(accounts)
    .collect(SObjectCollectors.toIdSet(Account.Id)));
```

##### `static toStringSet(ISObjectFunction mapper)`

Returns a `SObjectCollector` that accumulates the String values returned by `mapper` into a new `Set<String>`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function that returns values to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
// Accumulates values returned by mapper into a Set
Set<String> names = (Set<String>) Stream.of(accounts)
    .collect(SObjectCollectors.toStringSet(SObjectFunctions.get('Name')));
```

##### `static toStringSet(String fieldName)`

Returns a `SObjectCollector` that accumulates the String values of `fieldName` into a new `Set<String>`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<String> names = (Set<String>) Stream.of(accounts)
    .collect(SObjectCollectors.toStringSet('Name'));
Set<String> parentNames = (Set<String>) Stream.of(accounts)
    .collect(SObjectCollectors.toStringSet('Parent?.Name'));
```

##### `static toStringSet(SObjectField field)`

Returns a `SObjectCollector` that accumulates the String values of `field` into a new `Set<String>`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<String> names = (Set<String>) Stream.of(accounts)
    .collect(SObjectCollectors.toStringSet(Account.Name)));
```

##### `static toBlobSet(ISObjectFunction mapper)`

Returns a `SObjectCollector` that accumulates the Blob values returned by `mapper` into a new `Set<Blob>`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function that returns values to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
// Accumulates values returned by mapper into a Set
Set<Blob> bodies = (Set<Blob>) Stream.of(attachments)
    .collect(SObjectCollectors.toBlobSet(SObjectFunctions.get('Body')));
```

##### `static toBlobSet(String fieldName)`

Returns a `SObjectCollector` that accumulates the Blob values of `fieldName` into a new `Set<Blob>`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Blob> bodies = (Set<Blob>) Stream.of(attachments)
    .collect(SObjectCollectors.toBlobSet('Body'));
Set<Blob> parentBodies = (Set<Blob>) Stream.of(attachments)
    .collect(SObjectCollectors.toBlobSet('Parent?.Body'));
```

##### `static toBlobSet(SObjectField field)`

Returns a `SObjectCollector` that accumulates the Blob values of `field` into a new `Set<Blob>`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Blob> bodies = (Set<Blob>) Stream.of(attachments)
    .collect(SObjectCollectors.toBlobSet(Attachment.Body)));
```

##### `static toDateSet(ISObjectFunction mapper)`

Returns a `SObjectCollector` that accumulates the Date values returned by `mapper` into a new `Set<Date>`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function that returns values to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
// Accumulates values returned by mapper into a Set
Set<Date> birthdates = (Set<Date>) Stream.of(contacts)
    .collect(SObjectCollectors.toDateSet(SObjectFunctions.get('Birthdate')));
```

##### `static toDateSet(String fieldName)`

Returns a `SObjectCollector` that accumulates the Date values of `fieldName` into a new `Set<Date>`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Date> birthdates = (Set<Date>) Stream.of(contacts)
    .collect(SObjectCollectors.toDateSet('Birthdate'));
Set<Date> parentBirthdates = (Set<Date>) Stream.of(contacts)
    .collect(SObjectCollectors.toDateSet('Parent?.Birthdate'));
```

##### `static toDateSet(SObjectField field)`

Returns a `SObjectCollector` that accumulates the Date values of `field` into a new `Set<Date>`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Date> birthdates = (Set<Date>) Stream.of(contacts)
    .collect(SObjectCollectors.toDateSet(Contact.Birthdate)));
```

##### `static toDatetimeSet(ISObjectFunction mapper)`

Returns a `SObjectCollector` that accumulates the Datetime values returned by `mapper` into a new `Set<Datetime>`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function that returns values to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
// Accumulates values returned by mapper into a Set
Set<Datetime> activityDateTimes = (Set<Datetime>) Stream.of(events)
    .collect(SObjectCollectors.toDatetimeSet(SObjectFunctions.get('ActivityDateTime')));
```

##### `static toDatetimeSet(String fieldName)`

Returns a `SObjectCollector` that accumulates the Datetime values of `fieldName` into a new `Set<Datetime>`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Datetime> activityDateTimes = (Set<Datetime>) Stream.of(events)
    .collect(SObjectCollectors.toDatetimeSet('ActivityDateTime'));
Set<Datetime> activityDateTimes = (Set<Datetime>) Stream.of(events)
    .collect(SObjectCollectors.toDatetimeSet('Parent?.ActivityDateTime'));
```

##### `static toDatetimeSet(SObjectField field)`

Returns a `SObjectCollector` that accumulates the Datetime values of `field` into a new `Set<Datetime>`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Datetime> activityDateTimes = (Set<Datetime>) Stream.of(events)
    .collect(SObjectCollectors.toDatetimeSet(Event.ActivityDateTime)));
```

##### `static toTimeSet(ISObjectFunction mapper)`

Returns a `SObjectCollector` that accumulates the Time values returned by `mapper` into a new `Set<Time>`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function that returns values to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
// Accumulates values returned by mapper into a Set
Set<Time> startTimes = (Set<Time>) Stream.of(slots)
    .collect(SObjectCollectors.toTimeSet(SObjectFunctions.get('StartTime')));
```

##### `static toTimeSet(String fieldName)`

Returns a `SObjectCollector` that accumulates the Time values of `fieldName` into a new `Set<Time>`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Time> startTimes = (Set<Time>) Stream.of(slots)
    .collect(SObjectCollectors.toTimeSet('StartTime'));
Set<Time> parentStartTimes = (Set<Time>) Stream.of(slots)
    .collect(SObjectCollectors.toTimeSet('Parent?.StartTime'));
```

##### `static toTimeSet(SObjectField field)`

Returns a `SObjectCollector` that accumulates the Time values of `field` into a new `Set<Time>`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Time> startTimes = (Set<Time>) Stream.of(slots)
    .collect(SObjectCollectors.toTimeSet(TimeSlot.StartTime)));
```

##### `static toIntSet(ISObjectToIntFunction mapper)`

Returns a `SObjectCollector` that accumulates the Integer values returned by `mapper` into a new `Set<Integer>`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function that returns values to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
// Accumulates values returned by mapper into a Set
Set<Integer> numberOfEmployees = (Set<Integer>) Stream.of(accounts)
    .collect(SObjectCollectors.toIntSet(SObjectToIntFunctions.get('NumberOfEmployees')));
```

##### `static toIntSet(String fieldName)`

Returns a `SObjectCollector` that accumulates the Integer values of `fieldName` into a new `Set<Integer>`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Integer> numberOfEmployees = (Set<Integer>) Stream.of(accounts)
    .collect(SObjectCollectors.toIntSet('NumberOfEmployees'));
Set<Integer> parentNumberOfEmployees = (Set<Integer>) Stream.of(accounts)
    .collect(SObjectCollectors.toIntSet('Parent?.NumberOfEmployees'));
```

##### `static toIntSet(SObjectField field)`

Returns a `SObjectCollector` that accumulates the Integer values of `field` into a new `Set<Integer>`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Integer> numberOfEmployees = (Set<Integer>) Stream.of(accounts)
    .collect(SObjectCollectors.toIntSet(Account.NumberOfEmployees)));
```

##### `static toLongSet(ISObjectToLongFunction mapper)`

Returns a `SObjectCollector` that accumulates the Long values returned by `mapper` into a new `Set<Long>`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function that returns values to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
// Accumulates values returned by mapper into a Set
Set<Long> numberOfEmployees = (Set<Long>) Stream.of(accounts)
    .collect(SObjectCollectors.toLongSet(SObjectToLongFunctions.get('NumberOfEmployees')));
```

##### `static toLongSet(String fieldName)`

Returns a `SObjectCollector` that accumulates the Long values of `fieldName` into a new `Set<Long>`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Long> numberOfEmployees = (Set<Long>) Stream.of(accounts)
    .collect(SObjectCollectors.toLongSet('NumberOfEmployees'));
Set<Long> parentNumberOfEmployees = (Set<Long>) Stream.of(accounts)
    .collect(SObjectCollectors.toLongSet('Parent?.NumberOfEmployees'));
```

##### `static toLongSet(SObjectField field)`

Returns a `SObjectCollector` that accumulates the Long values of `field` into a new `Set<Long>`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Long> numberOfEmployees = (Set<Long>) Stream.of(accounts)
    .collect(SObjectCollectors.toLongSet(Account.NumberOfEmployees)));
```

##### `static toDoubleSet(ISObjectToDoubleFunction mapper)`

Returns a `SObjectCollector` that accumulates the Double values returned by `mapper` into a new `Set<Double>`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function that returns values to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
// Accumulates values returned by mapper into a Set
Set<Double> billingLatitudes = (Set<Double>) Stream.of(accounts)
    .collect(SObjectCollectors.toDoubleSet(SObjectToDoubleFunctions.get('BillingLatitude')));
```

##### `static toDoubleSet(String fieldName)`

Returns a `SObjectCollector` that accumulates the Double values of `fieldName` into a new `Set<Double>`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Double> billingLatitudes = (Set<Double>) Stream.of(accounts)
    .collect(SObjectCollectors.toDoubleSet('BillingLatitude'));
Set<Double> parentBillingLatitudes = (Set<Double>) Stream.of(accounts)
    .collect(SObjectCollectors.toDoubleSet('Parent?.BillingLatitude'));
```

##### `static toDoubleSet(SObjectField field)`

Returns a `SObjectCollector` that accumulates the Double values of `field` into a new `Set<Double>`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Double> billingLatitudes = (Set<Double>) Stream.of(accounts)
    .collect(SObjectCollectors.toDoubleSet(Account.BillingLatitude)));
```

##### `static toSet(ISObjectFunction mapper)`

Returns a `SObjectCollector` that accumulates the Object values returned by `mapper` into a new `Set<Object>`. <p>The result container <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Set()` collectors such as SObjectCollectors.toIdSet, SObjectCollectors.toStringSet, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function that returns values to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
// Accumulates values returned by mapper into a Set
Set<Object> birthdates = (Set<Object>) Stream.of(contacts)
    .collect(SObjectCollectors.toSet(SObjectFunctions.get('Birthdate')));
```

##### `static toSet(String fieldName)`

Returns a `SObjectCollector` that accumulates the Object values of `fieldName` into a new `Set<Double>`. Cross-reference fields and safe navigation are supported. <p>The result container <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Set()` collectors such as SObjectCollectors.toIdSet, SObjectCollectors.toStringSet, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Accumulates values of fieldName into a Set
Set<Object> birthdates = (Set<Object>) Stream.of(contacts)
    .collect(SObjectCollectors.toSet('Birthdate'));
Set<Object> parentBirthdates = (Set<Object>) Stream.of(contacts)
    .collect(SObjectCollectors.toSet('Parent?.Birthdate'));
```

##### `static toSet(SObjectField field)`

Returns a `SObjectCollector` that accumulates the Object values of `field` into a new `Set<Object>`. <p>The result container <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Set()` collectors such as SObjectCollectors.toIdSet, SObjectCollectors.toStringSet, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Accumulates values of field into a List
Set<Object> birthdates = (Set<Object>) Stream.of(contacts)
    .collect(SObjectCollectors.toSet(Contact.Birthdate)));
```

---
### Map<Id, SObject> Collectors
##### `static toMap()`

Returns a `SObjectCollector` that accumulates the SObject values into a `Map<Id, SObject>` <p>The result container value type can be cast to a specific `SObjectType` using SObjectCollector.cast.</p> <p>ISObjectBaseIterable.collect(SObjectCollectors.toMap()) can be replaced with ISObjectIterable.toMap()</p>

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`


**See** SObjectCollectors.toByIdMap

###### Example
```apex
// Accumulates SObjects into a List
Map<Id, SObject> sObjs = (Map<Id, SObject>) Stream.of(sObjects)
    .collect(SObjectCollectors.toMap());
Map<Id, Account> accs = (Map<Id, Account>) Stream.of(accounts)
    .collect(SObjectCollectors.toMap().cast(Map<Id, Account));
```

##### `static toByIdMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Id, SObject> contactByAccountId = (Map<Id, SObject>) Stream.of(contacts)
    .collect(SObjectCollectors.toByIdMap('AccountId'));
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByIdMap('AccountId').cast(Map<Id, Contact>.class));
```

##### `static toByIdMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Id, SObject> contactByAccountId = (Map<Id, SObject>) Stream.of(contacts)
    .collect(SObjectCollectors.toByIdMap(Contact.AccountId));
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByIdMap(Contact.AccountId).cast(Map<Id, Contact>.class));
```

##### `static toByIdMap(ISObjectFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<Id, SObject> contactByAccountId = (Map<Id, SObject>) Stream.of(contacts)
    .collect(SObjectCollectors.toByIdMap(SObjectFunctions.get('AccountId')));
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByIdMap(SObjectFunctions.get('AccountId')).cast(Map<Id, Contact>.class));
```

##### `static toByIdMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByIdMap(
        SObjectFunctions.get('AccountId'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Id, Contact>.class));
```

---
### Map<Boolean, Object> Collectors
##### `static toByBoolMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Boolean, Object> contactByDoNotCall = (Map<Boolean, Object>) Stream.of(contacts)
    .collect(SObjectCollectors.toByBoolMap(
        SObjectFunctions.get('DoNotCall'),
        SObjectFunction.identity()
    ));
Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByBoolMap(
        SObjectFunctions.get('DoNotCall'),
        SObjectFunction.identity()
    ).cast(Map<Boolean, Contact>.class));
Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByBoolMap(
        SObjectFunctions.get('DoNotCall'),
        SObjectFunctions.get('LastName')
    ).cast(Map<Boolean, String>.class));
```

##### `static toByBoolMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByBoolMap(
        SObjectFunctions.get('DoNotCall'),
        SObjectFunctions.get('LastName'),
        BinaryOperator.right()
    ).cast(Map<Boolean, String>.class));
```

##### `static toByBoolMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Boolean, ?>` into which the results will be inserted|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper`, or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByBoolMap(
        SObjectFunctions.get('DoNotCall'),
        SObjectFunctions.get('LastName'),
        BinaryOperator.right(),
        Supplier.of(Map<Boolean, String>.class),
    ));
```

##### `static toByBoolMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByBoolMap('DoNotCall', 'LastName').cast(Map<Boolean, String>.class));
```

##### `static toByBoolMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByBoolMap(
        Contact.DoNotCall,
       Contact.LastName
   ).cast(Map<Boolean, String>.class));
```

---
### Map<Boolean, SObject> Collectors
##### `static toByBoolMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Boolean, SObject> contactByDoNotCall = (Map<Boolean, SObject>) Stream.of(contacts)
    .collect(SObjectCollectors.toByBoolMap('DoNotCall'));
Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByBoolMap('DoNotCall').cast(Map<Boolean, Contact>.class));
```

##### `static toByBoolMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Boolean, SObject> contactByDoNotCall = (Map<Boolean, SObject>) Stream.of(contacts)
    .collect(SObjectCollectors.toByBoolMap(Contact.DoNotCall));
Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByBoolMap(Contact.DoNotCall).cast(Map<Boolean, Contact>.class));
```

##### `static toByBoolMap(ISObjectFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<Boolean, SObject> contactByDoNotCall = (Map<Boolean, SObject>) Stream.of(contacts)
    .collect(SObjectCollectors.toByBoolMap(
        SObjectFunctions.get('DoNotCall')
    ));
Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByBoolMap(
        SObjectFunctions.get('DoNotCall')
    ).cast(Map<Boolean, Contact>.class));
```

##### `static toByBoolMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByBoolMap(
        SObjectFunctions.get('DoNotCall'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Boolean, Contact>.class));
```

---
### Map<Id, Object> Collectors
##### `static toByIdMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Id, Object> contactByAccountId = (Map<Id, Object>) Stream.of(contacts)
    .collect(SObjectCollectors.toByIdMap(
        SObjectFunctions.get('AccountId'),
        SObjectFunction.identity()
    ));
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByIdMap(
        SObjectFunctions.get('AccountId'),
        SObjectFunction.identity()
    ).cast(Map<Id, Contact>.class));
Map<Id, String> lastNameByAccountId = (Map<Id, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByIdMap(
        SObjectFunctions.get('AccountId'),
        SObjectFunctions.get('LastName')
    ).cast(Map<Id, String>.class));
```

##### `static toByIdMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Id, String> lastNameByAccountId = (Map<Id, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByIdMap(
        SObjectFunctions.get('AccountId'),
        SObjectFunctions.get('LastName'),
        BinaryOperator.right()
    ).cast(Map<Id, String>.class));
```

##### `static toByIdMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Id, ?>` into which the results will be inserted|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper`, or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Id, String> lastNameByAccountId = (Map<Id, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByIdMap(
        SObjectFunctions.get('AccountId'),
        SObjectFunctions.get('LastName'),
        BinaryOperator.right(),
        Supplier.of(Map<Id, String>.class)
    ));
```

##### `static toByIdMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Id, String> lastNameByAccountId = (Map<Id, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByIdMap(
        'AccountId',
        'LastName'
    ).cast(Map<Id, String>.class));
```

##### `static toByIdMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Id, String> lastNameByAccountId = (Map<Id, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByIdMap(
        Contact.AccountId,
        Contact.LastName
    ).cast(Map<Id, String>.class));
```

---
### Map<String, Object> Collectors
##### `static toByStringMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<String, Object> contactByFirstName = (Map<String, Object>) Stream.of(contacts)
    .collect(SObjectCollectors.toByStringMap(
        SObjectFunctions.get('FirstName'),
        SObjectFunction.identity()
    ));
Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByStringMap(
        SObjectFunctions.get('FirstName'),
        SObjectFunction.identity()
    ).cast(Map<String, Contact>.class));
Map<String, String> lastNameByFirstName = (Map<String, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByStringMap(
        SObjectFunctions.get('FirstName'),
        SObjectFunctions.get('LastName')
    ).cast(Map<String, String>.class));
```

##### `static toByStringMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<String, String> lastNameByFirstName = (Map<String, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByStringMap(
        SObjectFunctions.get('FirstName'),
        SObjectFunctions.get('LastName'),
        BinaryOperator.right()
    ).cast(Map<String, String>.class));
```

##### `static toByStringMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<String, ?>` into which the results will be inserted|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper`, or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<String, String> lastNameByFirstName = (Map<String, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByStringMap(
        SObjectFunctions.get('FirstName'),
        SObjectFunctions.get('LastName'),
        BinaryOperator.right(),
        Supplier.of(Map<String, String>.class)
    ));
```

##### `static toByStringMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<String, String> lastNameByFirstName = (Map<String, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByStringMap(
        'FirstName',
        'LastName'
    ).cast(Map<String, String>.class));
```

##### `static toByStringMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<String, String> lastNameByFirstName = (Map<String, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByStringMap(
        Contact.FirstName,
        Contact.LastName
    ).cast(Map<String, String>.class));
```

---
### Map<String, SObject> Collectors
##### `static toByStringMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<String, SObject> contactByFirstName = (Map<String, SObject>) Stream.of(contacts)
    .collect(SObjectCollectors.toByStringMap('FirstName'));
Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByStringMap('FirstName').cast(Map<String, Contact>.class));
```

##### `static toByStringMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<String, SObject> contactByFirstName = (Map<String, SObject>) Stream.of(contacts)
    .collect(SObjectCollectors.toByStringMap(Contact.FirstName));
Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByStringMap(Contact.FirstName).cast(Map<String, Contact>.class));
```

##### `static toByStringMap(ISObjectFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<String, SObject> contactByFirstName = (Map<String, SObject>) Stream.of(contacts)
    .collect(SObjectCollectors.toByStringMap(
        SObjectFunctions.get('FirstName')
    ));
Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByStringMap(
        SObjectFunctions.get('FirstName')
    ).cast(Map<String, Contact>.class));
```

##### `static toByStringMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByStringMap(
        SObjectFunctions.get('FirstName'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<String, Contact>.class));
```

---
### Map<Blob, Object> Collectors
##### `static toByBlobMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Blob, Object> attachmentByBody = (Map<Blob, Object>) Stream.of(attachments)
    .collect(SObjectCollectors.toByBlobMap(
        SObjectFunctions.get('Body'),
        SObjectFunction.identity()
    ));
Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
    .collect(SObjectCollectors.toByBlobMap(
        SObjectFunctions.get('Body'),
        SObjectFunction.identity()
    ).cast(Map<Blob, Attachment>.class));
Map<Blob, String> nameByBody = (Map<Blob, String>) Stream.of(attachments)
    .collect(SObjectCollectors.toByBlobMap(
        SObjectFunctions.get('Body'),
        SObjectFunctions.get('Name')
    ).cast(Map<Blob, String>.class));
```

##### `static toByBlobMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Blob, String> nameByBody = (Map<Blob, String>) Stream.of(attachments)
    .collect(SObjectCollectors.toByBlobMap(
        SObjectFunctions.get('Body'),
        SObjectFunctions.get('Name'),
        BinaryOperator.right()
    ).cast(Map<Blob, String>.class));
```

##### `static toByBlobMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Blob, ?>` into which the results will be inserted|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper`, or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Blob, String> nameByBody = (Map<Blob, String>) Stream.of(attachments)
    .collect(SObjectCollectors.toByBlobMap(
        SObjectFunctions.get('Body'),
        SObjectFunctions.get('Name'),
        BinaryOperator.right(),
        Supplier.of(Map<Blob, String>.class)
    ));
```

##### `static toByBlobMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Blob, String> nameByBody = (Map<Blob, String>) Stream.of(attachments)
    .collect(SObjectCollectors.toByBlobMap(
        'Body',
        'Name'
    ).cast(Map<Blob, String>.class));
```

##### `static toByBlobMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Blob, String> nameByBody = (Map<Blob, String>) Stream.of(attachments)
    .collect(SObjectCollectors.toByBlobMap(
        Attachment.Body,
        Attachment.Name
    ).cast(Map<Blob, String>.class));
```

---
### Map<Blob, SObject> Collectors
##### `static toByBlobMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Blob, SObject> attachmentByBody = (Map<Blob, SObject>) Stream.of(attachments)
    .collect(SObjectCollectors.toByBlobMap('Body'));
Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
    .collect(SObjectCollectors.toByBlobMap('Body').cast(Map<Blob, Attachment>.class));
```

##### `static toByBlobMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Blob, SObject> attachmentByBody = (Map<Blob, SObject>) Stream.of(attachments)
    .collect(SObjectCollectors.toByBlobMap(Attachment.Body));
Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
    .collect(SObjectCollectors.toByBlobMap(Attachment.Body).cast(Map<Blob, Attachment>.class));
```

##### `static toByBlobMap(ISObjectFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<Blob, SObject> attachmentByBody = (Map<Blob, SObject>) Stream.of(attachments)
    .collect(SObjectCollectors.toByBlobMap(
        SObjectFunctions.get('Body')
    ));
Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
    .collect(SObjectCollectors.toByBlobMap(
        SObjectFunctions.get('Body')
    ).cast(Map<Blob, Attachment>.class));
```

##### `static toByBlobMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
    .collect(SObjectCollectors.toByBlobMap(
        SObjectFunctions.get('Body'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Blob, Attachment>.class));
```

---
### Map<Date, Object> Collectors
##### `static toByDateMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Date, Object> contactByBirthdate = (Map<Date, Object>) Stream.of(contacts)
    .collect(SObjectCollectors.toByDateMap(
        SObjectFunctions.get('Birthdate'),
        SObjectFunction.identity()
    ));
Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByDateMap(
        SObjectFunctions.get('Birthdate'),
        SObjectFunction.identity()
    ).cast(Map<Date, Contact>.class));
Map<Date, String> lastNameByBirthdate = (Map<Date, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByDateMap(
        SObjectFunctions.get('Birthdate'),
        SObjectFunctions.get('LastName')
    ).cast(Map<Date, String>.class));
```

##### `static toByDateMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Date, String> lastNameByBirthdate = (Map<Date, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByDateMap(
        SObjectFunctions.get('Birthdate'),
        SObjectFunctions.get('LastName'),
        BinaryOperator.right()
    ).cast(Map<Date, String>.class));
```

##### `static toByDateMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Date, ?>` into which the results will be inserted|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper`, or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Date, String> lastNameByBirthdate = (Map<Date, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByDateMap(
        SObjectFunctions.get('Birthdate'),
        SObjectFunctions.get('LastName'),
        BinaryOperator.right(),
        Supplier.of(Map<Date, String>.class)
    ));
```

##### `static toByDateMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Date, String> lastNameByBirthdate = (Map<Date, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByDateMap(
        'Birthdate',
        'LastName'
    ).cast(Map<Date, String>.class));
```

##### `static toByDateMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Date, String> lastNameByBirthdate = (Map<Date, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toByDateMap(
        Contact.Birthdate,
        Contact.LastName
    ).cast(Map<Date, String>.class));
```

---
### Map<Date, SObject> Collectors
##### `static toByDateMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Date, SObject> contactByBirthdate = (Map<Date, SObject>) Stream.of(contacts)
    .collect(SObjectCollectors.toByDateMap('Birthdate'));
Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByDateMap('Birthdate').cast(Map<Date, Contact>.class));
```

##### `static toByDateMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Date, SObject> contactByBirthdate = (Map<Date, SObject>) Stream.of(contacts)
    .collect(SObjectCollectors.toByDateMap(Contact.Birthdate));
Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByDateMap(Contact.Birthdate).cast(Map<Date, Contact>.class));
```

##### `static toByDateMap(ISObjectFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<Date, SObject> contactByBirthdate = (Map<Date, SObject>) Stream.of(contacts)
    .collect(SObjectCollectors.toByDateMap(
        SObjectFunctions.get('Birthdate')
    ));
Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByDateMap(
        SObjectFunctions.get('Birthdate')
    ).cast(Map<Date, Contact>.class));
```

##### `static toByDateMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toByDateMap(
        SObjectFunctions.get('Birthdate'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Date, Contact>.class));
```

---
### Map<Datetime, Object> Collectors
##### `static toByDatetimeMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Datetime, Object> eventByActivityDateTime = (Map<Datetime, Object>) Stream.of(events)
    .collect(SObjectCollectors.toByDatetimeMap(
        SObjectFunctions.get('ActivityDateTime'),
        SObjectFunction.identity()
    ));
Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
    .collect(SObjectCollectors.toByDatetimeMap(
        SObjectFunctions.get('ActivityDateTime'),
        SObjectFunction.identity()
    ).cast(Map<Datetime, Event>.class));
Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) Stream.of(events)
    .collect(SObjectCollectors.toByDatetimeMap(
        SObjectFunctions.get('ActivityDateTime'),
        SObjectFunctions.get('Description')
    ).cast(Map<Datetime, String>.class));
```

##### `static toByDatetimeMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) Stream.of(events)
    .collect(SObjectCollectors.toByDatetimeMap(
        SObjectFunctions.get('ActivityDateTime'),
        SObjectFunctions.get('Description'),
        BinaryOperator.right()
    ).cast(Map<Datetime, String>.class));
```

##### `static toByDatetimeMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Datetime, ?>` into which the results will be inserted|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper`, or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) Stream.of(events)
    .collect(SObjectCollectors.toByDatetimeMap(
        SObjectFunctions.get('ActivityDateTime'),
        SObjectFunctions.get('Description'),
        BinaryOperator.right(),
        Supplier.of(Map<Datetime, String>.class)
    ));
```

##### `static toByDatetimeMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) Stream.of(events)
    .collect(SObjectCollectors.toByDatetimeMap(
        'ActivityDateTime',
        'Description'
    ).cast(Map<Datetime, String>.class));
```

##### `static toByDatetimeMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) Stream.of(events)
    .collect(SObjectCollectors.toByDatetimeMap(
        Event.ActivityDateTime,
        Event.Description
    ).cast(Map<Datetime, String>.class));
```

---
### Map<Datetime, SObject> Collectors
##### `static toByDatetimeMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Datetime, SObject> eventByActivityDateTime = (Map<Datetime, SObject>) Stream.of(events)
    .collect(SObjectCollectors.toByDatetimeMap('ActivityDateTime'));
Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
    .collect(SObjectCollectors.toByDatetimeMap('ActivityDateTime').cast(Map<Datetime, Event>.class));
```

##### `static toByDatetimeMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Datetime, SObject> eventByActivityDateTime = (Map<Datetime, SObject>) Stream.of(events)
    .collect(SObjectCollectors.toByDatetimeMap(Event.ActivityDateTime));
Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
    .collect(SObjectCollectors.toByDatetimeMap(Event.ActivityDateTime).cast(Map<Datetime, Event>.class));
```

##### `static toByDatetimeMap(ISObjectFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<Datetime, SObject> eventByActivityDateTime = (Map<Datetime, SObject>) Stream.of(events)
    .collect(SObjectCollectors.toByDatetimeMap(
        SObjectFunctions.get('ActivityDateTime')
    ));
Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
    .collect(SObjectCollectors.toByDatetimeMap(
        SObjectFunctions.get('ActivityDateTime')
    ).cast(Map<Datetime, Event>.class));
```

##### `static toByDatetimeMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
    .collect(SObjectCollectors.toByDatetimeMap(
        SObjectFunctions.get('ActivityDateTime'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Datetime, Event>.class));
```

---
### Map<Time, Object> Collectors
##### `static toByTimeMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Time, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Time, Object> timeSlotByStartTime = (Map<Time, Object>) Stream.of(slots)
    .collect(SObjectCollectors.toByTimeMap(
        SObjectFunctions.get('StartTime'),
        SObjectFunction.identity()
    ));
Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
    .collect(SObjectCollectors.toByTimeMap(
        SObjectFunctions.get('StartTime'),
        SObjectFunction.identity()
    ).cast(Map<Time, TimeSlot>.class));
Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) Stream.of(slots)
    .collect(SObjectCollectors.toByTimeMap(
        SObjectFunctions.get('StartTime'),
        SObjectFunctions.get('EndTime')
    ).cast(Map<Time, Time>.class));
```

##### `static toByTimeMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Time, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) Stream.of(slots)
    .collect(SObjectCollectors.toByTimeMap(
        SObjectFunctions.get('StartTime'),
        SObjectFunctions.get('EndTime'),
        BinaryOperator.right()
    ).cast(Map<Time, Time>.class));
```

##### `static toByTimeMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Time, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Time, ?>` into which the results will be inserted|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper`, or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) Stream.of(slots)
    .collect(SObjectCollectors.toByTimeMap(
        SObjectFunctions.get('StartTime'),
        SObjectFunctions.get('EndTime'),
        BinaryOperator.right(),
        Supplier.of(Map<Time, Time>.class)
    ));
```

##### `static toByTimeMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Time, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) Stream.of(slots)
    .collect(SObjectCollectors.toByTimeMap(
        'StartTime',
        'EndTime'
    ).cast(Map<Time, Time>.class));
```

##### `static toByTimeMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Time, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) Stream.of(slots)
    .collect(SObjectCollectors.toByTimeMap(
        TimeSlot.StartTime,
        TimeSlot.EndTime
    ).cast(Map<Time, Time>.class));
```

---
### Map<Time, SObject> Collectors
##### `static toByTimeMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Time, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Time, SObject> timeSlotByStartTime = (Map<Time, SObject>) Stream.of(slots)
    .collect(SObjectCollectors.toByTimeMap('StartTime'));
Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
    .collect(SObjectCollectors.toByTimeMap('StartTime').cast(Map<Time, TimeSlot>.class));
```

##### `static toByTimeMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Time, SObject> timeSlotByStartTime = (Map<Time, SObject>) Stream.of(slots)
    .collect(SObjectCollectors.toByTimeMap(TimeSlot.StartTime));
Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
    .collect(SObjectCollectors.toByTimeMap(TimeSlot.StartTime).cast(Map<Time, TimeSlot>.class));
```

##### `static toByTimeMap(ISObjectFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Time, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<Time, SObject> timeSlotByStartTime = (Map<Time, SObject>) Stream.of(slots)
    .collect(SObjectCollectors.toByTimeMap(
        SObjectFunctions.get('StartTime')
    ));
Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
    .collect(SObjectCollectors.toByTimeMap(
        SObjectFunctions.get('StartTime')
    ).cast(Map<Time, TimeSlot>.class));
```

##### `static toByTimeMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Time, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
    .collect(SObjectCollectors.toByTimeMap(
        SObjectFunctions.get('StartTime'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Time, TimeSlot>.class));
```

---
### Map<Integer, Object> Collectors
##### `static toByIntMap(ISObjectToIntFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Integer, Object> accountByNumberOfEmployees = (Map<Integer, Object>) Stream.of(accounts)
    .collect(SObjectCollectors.toByIntMap(
        SObjectToIntFunctions.get('NumberOfEmployees'),
        SObjectFunction.identity()
    ));
Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
    .collect(SObjectCollectors.toByIntMap(
        SObjectToIntFunctions.get('NumberOfEmployees'),
        SObjectFunction.identity()
    ).cast(Map<Integer, Account>.class));
Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) Stream.of(accounts)
    .collect(SObjectCollectors.toByIntMap(
        SObjectToIntFunctions.get('NumberOfEmployees'),
        SObjectFunctions.get('Name')
    ).cast(Map<Integer, String>.class));
```

##### `static toByIntMap(ISObjectToIntFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) Stream.of(accounts)
    .collect(SObjectCollectors.toByIntMap(
        SObjectToIntFunctions.get('NumberOfEmployees'),
        SObjectFunctions.get('Name'),
        BinaryOperator.right()
    ).cast(Map<Integer, String>.class));
```

##### `static toByIntMap(ISObjectToIntFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Integer, ?>` into which the results will be inserted|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper`, or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) Stream.of(accounts)
    .collect(SObjectCollectors.toByIntMap(
        SObjectToIntFunctions.get('NumberOfEmployees'),
        SObjectFunctions.get('Name'),
        BinaryOperator.right(),
        Supplier.of(Map<Integer, String>.class)
    ));
```

##### `static toByIntMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) Stream.of(accounts)
    .collect(SObjectCollectors.toByIntMap(
        'NumberOfEmployees',
        'Name'
    ).cast(Map<Integer, String>.class));
```

##### `static toByIntMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) Stream.of(accounts)
    .collect(SObjectCollectors.toByIntMap(
        Account.NumberOfEmployees,
        Account.Name
    ).cast(Map<Integer, String>.class));
```

---
### Map<Integer, SObject> Collectors
##### `static toByIntMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Integer, SObject> accountByNumberOfEmployees = (Map<Integer, SObject>) Stream.of(accounts)
    .collect(SObjectCollectors.toByIntMap('NumberOfEmployees'));
Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
    .collect(SObjectCollectors.toByIntMap('NumberOfEmployees').cast(Map<Integer, Account>.class));
```

##### `static toByIntMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Integer, SObject> accountByNumberOfEmployees = (Map<Integer, SObject>) Stream.of(accounts)
    .collect(SObjectCollectors.toByIntMap(Account.NumberOfEmployees));
Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
    .collect(SObjectCollectors.toByIntMap(Account.NumberOfEmployees).cast(Map<Integer, Account>.class));
```

##### `static toByIntMap(ISObjectToIntFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Integer, SObject> accountByNumberOfEmployees = (Map<Integer, SObject>) Stream.of(accounts)
    .collect(SObjectCollectors.toByIntMap(
        SObjectToIntFunctions.get('NumberOfEmployees')
    ));
Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
    .collect(SObjectCollectors.toByIntMap(
        SObjectToIntFunctions.get('NumberOfEmployees')
    ).cast(Map<Integer, Account>.class));
```

##### `static toByIntMap(ISObjectToIntFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
    .collect(SObjectCollectors.toByIntMap(
        SObjectToIntFunctions.get('NumberOfEmployees'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Integer, Account>.class));
```

---
### Map<Long, Object> Collectors
##### `static toByLongMap(ISObjectToLongFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Long, Object> accountByNumberOfEmployees = (Map<Long, Object>) Stream.of(accounts)
    .collect(SObjectCollectors.toByLongMap(
        SObjectToLongFunctions.get('NumberOfEmployees'),
        SObjectFunction.identity()
    ));
Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
    .collect(SObjectCollectors.toByLongMap(
        SObjectToLongFunctions.get('NumberOfEmployees'),
        SObjectFunction.identity()
    ).cast(Map<Long, Account>.class));
Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) Stream.of(accounts)
    .collect(SObjectCollectors.toByLongMap(
        SObjectToLongFunctions.get('NumberOfEmployees'),
        SObjectFunctions.get('Name')
    ).cast(Map<Long, String>.class));
```

##### `static toByLongMap(ISObjectToLongFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) Stream.of(accounts)
    .collect(SObjectCollectors.toByLongMap(
        SObjectToLongFunctions.get('NumberOfEmployees'),
        SObjectFunctions.get('Name'),
        BinaryOperator.right()
    ).cast(Map<Long, String>.class));
```

##### `static toByLongMap(ISObjectToLongFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Long, ?>` into which the results will be inserted|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper`, or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) Stream.of(accounts)
    .collect(SObjectCollectors.toByLongMap(
        SObjectToLongFunctions.get('NumberOfEmployees'),
        SObjectFunctions.get('Name'),
        BinaryOperator.right(),
        Supplier.of(Map<Long, String>.class)
    ));
```

##### `static toByLongMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) Stream.of(accounts)
    .collect(SObjectCollectors.toByIntMap(
        'NumberOfEmployees',
        'Name'
    ).cast(Map<Long, String>.class));
```

##### `static toByLongMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) Stream.of(accounts)
    .collect(SObjectCollectors.toByLongMap(
        Account.NumberOfEmployees,
        Account.Name
    ).cast(Map<Long, String>.class));
```

---
### Map<Long, SObject> Collectors
##### `static toByLongMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, SObject>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Long, SObject> accountByNumberOfEmployees = (Map<Long, SObject>) Stream.of(accounts)
    .collect(SObjectCollectors.toByLongMap('NumberOfEmployees'));
Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
    .collect(SObjectCollectors.toByLongMap('NumberOfEmployees').cast(Map<Long, Account>.class));
```

##### `static toByLongMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, SObject>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Long, SObject> accountByNumberOfEmployees = (Map<Long, SObject>) Stream.of(accounts)
    .collect(SObjectCollectors.toByLongMap(Account.NumberOfEmployees));
Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
    .collect(SObjectCollectors.toByLongMap(Account.NumberOfEmployees).cast(Map<Long, Account>.class));
```

##### `static toByLongMap(ISObjectToLongFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByLongMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Long, SObject> accountByNumberOfEmployees = (Map<Long, SObject>) Stream.of(accounts)
    .collect(SObjectCollectors.toByLongMap(
        SObjectFunctions.get('NumberOfEmployees')
    ));
Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
    .collect(SObjectCollectors.toByLongMap(
        SObjectFunctions.get('NumberOfEmployees')
    ).cast(Map<Long, Account>.class));
```

##### `static toByLongMap(ISObjectToLongFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
    .collect(SObjectCollectors.toByLongMap(
        SObjectToLongFunctions.get('NumberOfEmployees'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Long, Account>.class));
```

---
### Map<Double, Object> Collectors
##### `static toByDoubleMap(ISObjectToDoubleFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Double, Object> accountByBillingLatitude = (Map<Double, Object>) Stream.of(accounts)
    .collect(SObjectCollectors.toByDoubleMap(
        SObjectToDoubleFunctions.get('BillingLatitude'),
        SObjectFunction.identity()
    ));
Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
    .collect(SObjectCollectors.toByDoubleMap(
        SObjectToDoubleFunctions.get('BillingLatitude'),
        SObjectFunction.identity()
    ).cast(Map<Double, Account>.class));
Map<Double, String> nameByBillingLatitude = (Map<Double, String>) Stream.of(accounts)
    .collect(SObjectCollectors.toByDoubleMap(
        SObjectToDoubleFunctions.get('BillingLatitude'),
        SObjectFunctions.get('Name')
    ).cast(Map<Double, String>.class));
```

##### `static toByDoubleMap(ISObjectToDoubleFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Double, String> nameByBillingLatitude = (Map<Double, String>) Stream.of(accounts)
    .collect(SObjectCollectors.toByDoubleMap(
        SObjectToDoubleFunctions.get('BillingLatitude'),
        SObjectFunctions.get('Name'),
        BinaryOperator.right()
    ).cast(Map<Double, String>.class));
```

##### `static toByDoubleMap(ISObjectToDoubleFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Double, ?>` into which the results will be inserted|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper`, or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Double, String> nameByBillingLatitude = (Map<Double, String>) Stream.of(accounts)
    .collect(SObjectCollectors.toByDoubleMap(
        SObjectToDoubleFunctions.get('BillingLatitude'),
        SObjectFunctions.get('Name'),
        BinaryOperator.right(),
        Supplier.of(Map<Double, String>.class)
    ));
```

##### `static toByDoubleMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Double, String> nameByBillingLatitude = (Map<Double, String>) Stream.of(accounts)
    .collect(SObjectCollectors.toByDoubleMap(
        'BillingLatitude',
        'Name'
    ).cast(Map<Double, String>.class));
```

##### `static toByDoubleMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Double, String> nameByBillingLatitude = (Map<Double, String>) Stream.of(accounts)
    .collect(SObjectCollectors.toByDoubleMap(
        Account.BillingLatitude,
        Account.Name
    ).cast(Map<Double, String>.class));
```

---
### Map<Double, SObject> Collectors
##### `static toByDoubleMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, SObject>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Double, SObject> accountByBillingLatitude = (Map<Double, SObject>) Stream.of(accounts)
    .collect(SObjectCollectors.toByDoubleMap('BillingLatitude'));
Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
    .collect(SObjectCollectors.toByDoubleMap('BillingLatitude').cast(Map<Double, Account>.class));
```

##### `static toByDoubleMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, SObject>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Double, SObject> accountByBillingLatitude = (Map<Double, SObject>) Stream.of(accounts)
    .collect(SObjectCollectors.toByDoubleMap(Account.BillingLatitude));
Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
    .collect(SObjectCollectors.toByDoubleMap(Account.BillingLatitude).cast(Map<Double, Account>.class));
```

##### `static toByDoubleMap(ISObjectToDoubleFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toByLongMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Double, SObject> accountByBillingLatitude = (Map<Double, SObject>) Stream.of(accounts)
    .collect(SObjectCollectors.toByDoubleMap(
        SObjectToDoubleFunctions.get('BillingLatitude')
    ));
Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
    .collect(SObjectCollectors.toByDoubleMap(
        SObjectToDoubleFunctions.get('BillingLatitude')
    ).cast(Map<Double, Account>.class));
```

##### `static toByDoubleMap(ISObjectToDoubleFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
    .collect(SObjectCollectors.toByDoubleMap(
        SObjectToDoubleFunctions.get('BillingLatitude'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Double, Account>.class));
```

---
### Map<Object, Object> Collectors
##### `static toMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollectors.toByIdMap, SObjectCollectors.toByStringMap, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Object, Object> contactByBirthdate = (Map<Object, Object>) Stream.of(contacts)
    .collect(SObjectCollectors.toMap(
        SObjectFunctions.get('Birthdate'),
        SObjectFunction.identity()
    ));
Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toMap(
        SObjectFunctions.get('Birthdate'),
        SObjectFunction.identity()
    ).cast(Map<Object, Contact>.class));
Map<Object, String> lastNameByBirthdate = (Map<Object, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toMap(
        SObjectFunctions.get('Birthdate'),
        SObjectFunctions.get('LastName')
    ).cast(Map<Object, String>.class));
```

##### `static toMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollectors.toByIdMap, SObjectCollectors.toByStringMap, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Object, String> lastNameByBirthdate = (Map<Object, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toMap(
        SObjectFunctions.get('Birthdate'),
        SObjectFunctions.get('LastName'),
        BinaryOperator.right()
    ).cast(Map<Object, String>.class));
```

##### `static toMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollectors.toByIdMap, SObjectCollectors.toByStringMap, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|
|`mapSupplier`|the function that returns a `Map<Object, ?>` into which the results will be inserted|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper`, `valueMapper`, or `mapSupplier` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Object, String> lastNameByBirthdate = (Map<Object, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toMap(
        SObjectFunctions.get('Birthdate'),
        SObjectFunctions.get('LastName'),
        BinaryOperator.right(),
        Supplier.of(Map<Object, String>.class)
    ));
```

##### `static toMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollectors.toByIdMap, SObjectCollectors.toByStringMap, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Object, String> lastNameByBirthdate = (Map<Object, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toMap(
        'Birtdate',
        'LastName'
    ).cast(Map<Object, String>.class));
```

##### `static toMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollectors.toByIdMap, SObjectCollectors.toByStringMap, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Maps values by keys provided by fields
Map<Object, String> lastNameByBirthdate = (Map<Object, String>) Stream.of(contacts)
    .collect(SObjectCollectors.toMap(
        Contact.Birthdate,
        Contact.LastName
    ).cast(Map<Object, String>.class));
```

---
### Map<Object, SObject> Collectors
##### `static toMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, SObject>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollectors.toMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollectors.toByIdMap, SObjectCollectors.toByStringMap, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyFieldName` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Object, SObject> contactByBirthdate = (Map<Object, SObject>) Stream.of(contacts)
    .collect(SObjectCollectors.toMap('Birthdate'));
Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toMap('Birthdate').cast(Map<Double, Contact>.class));
```

##### `static toMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, SObject>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollectors.toByIdMap, SObjectCollectors.toByStringMap, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyField` is null|

###### Example
```apex
// Maps values by keys provided by field
Map<Object, SObject> contactByBirthdate = (Map<Object, SObject>) Stream.of(contacts)
    .collect(SObjectCollectors.toMap(Contact.Birthdate));
Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toMap(Contact.Birthdate).cast(Map<Object, Contact>.class));
```

##### `static toMap(ISObjectFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollectors.toMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollectors.toByIdMap, SObjectCollectors.toByStringMap, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<Object, SObject> contactByBirthdate = (Map<Object, SObject>) Stream.of(contacts)
    .collect(SObjectCollectors.toMap(
        SObjectFunctions.get('Birthdate')
    ));
Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toMap(
        SObjectFunctions.get('Birthdate')
    ).cast(Map<Object, Contact>.class));
```

##### `static toMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollectors.toByIdMap, SObjectCollectors.toByStringMap, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the function that returns keys|
|`valueMapper`|the function that returns values|
|`merger`|the merge function to resolve collisions between values associated with the same key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
    .collect(SObjectCollectors.toMap(
        SObjectFunctions.get('Birthdate'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Object, Contact>.class));
```

---
### Map<Boolean, ?> Collectors
##### `static groupingByBool(ISObjectFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Boolean, List<Object>>`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Boolean, List<Object>> contactsByDoNotCall = (Map<Boolean, List<Object>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByBool(
            SObjectFunctions.get('DoNotCall')
        ));
Map<Boolean, List<Contact>> contactsByDoNotCall = (Map<Boolean, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByBool(
            SObjectFunctions.get('DoNotCall')
        ).cast(Map<Boolean, List<Contact>>.class));
```

##### `static groupingByBool(ISObjectFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Boolean, Object> contactsByDoNotCall = (Map<Boolean, Object>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByBool(
            SObjectFunctions.get('DoNotCall'),
            SObjectCollectors.toSet()
        ));
Map<Boolean, Set<SObject>> contactsByDoNotCall = (Map<Boolean, Set<SObject>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByBool(
            SObjectFunctions.get('DoNotCall'),
            SObjectCollectors.toSet()
        ).cast(Map<Boolean, Set<SObject>>.class));
```

##### `static groupingByBool(ISObjectFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Boolean, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Boolean, Set<SObject>> contactsByDoNotCall = (Map<Boolean, Set<SObject>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByBool(
            SObjectFunctions.get('DoNotCall'),
            Supplier.of(Map<Boolean, Set<SObject>>.class),
            SObjectCollectors.toSet()
        ));
```

##### `static groupingByBool(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Boolean, List<String>> lastNamesByDoNotCall = (Map<Boolean, List<String>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByBool(
            'DoNotCall',
            'LastName'
        ).cast(Map<Boolean, List<String>>.class));
```

##### `static groupingByBool(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Boolean, List<String>> lastNamesByDoNotCall = (Map<Boolean, List<String>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByBool(
            Contact.DoNotCall,
            Contact.LastName
        ).cast(Map<Boolean, List<String>>.class));
```

##### `static groupingByBool(String fieldName)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Group values by keys provided by field
Map<Boolean, List<Contact>> contactsByDoNotCall = (Map<Boolean, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByBool('DoNotCall'));
```

##### `static groupingByBool(SObjectField field)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Boolean, List<Contact>> contactsByDoNotCall = (Map<Boolean, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByBool(Contact.DoNotCall));
```

---
### Map<Id, ?> Collectors
##### `static groupingById(ISObjectFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Id, List<Object>>`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Id, List<Object>> contactsByAccountId = (Map<Id, List<Object>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingById(
            SObjectFunctions.get('AccountId')
        ));
Map<Id, List<Contact>> contactsByAccountId = (Map<Id, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingById(
            SObjectFunctions.get('AccountId')
        ).cast(Map<Id, List<Contact>>.class));
```

##### `static groupingById(ISObjectFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Id, Object> contactsByAccountId = (Map<Id, Object>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingById(
            SObjectFunctions.get('AccountId'),
            SObjectCollectors.toSet()
        ));
Map<Id, Set<SObject>> contactsByAccountId = (Map<Id, Set<SObject>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingById(
            SObjectFunctions.get('AccountId'),
            SObjectCollectors.toSet()
        ).cast(Map<Id, Set<SObject>>.class));
```

##### `static groupingById(ISObjectFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Id, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Id, Set<SObject>> contactsByAccountId = (Map<Id, Set<SObject>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingById(
            SObjectFunctions.get('AccountId'),
            Supplier.of(Map<Id, Set<SObject>>.class)
            SObjectCollectors.toSet()
        ));
```

##### `static groupingById(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Id, List<String>> lastNamesByAccountId = (Map<Id, List<String>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingById(
            'AccountId',
            'LastName'
        ).cast(Map<Id, List<String>>.class));
```

##### `static groupingById(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Id, List<String>> lastNamesByAccountId = (Map<Id, List<String>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByBool(
            Contact.AccountId,
            Contact.LastName
        ).cast(Map<Id, List<String>>.class));
```

##### `static groupingById(String fieldName)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Group values by keys provided by field
Map<Id, List<Contact>> contactsByAccountId = (Map<Id, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingById('AccountId'));
```

##### `static groupingById(SObjectField field)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<String, List<Contact>> contactsByAccountId = (Map<String, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingById(Contact.AccountId));
```

---
### Map<String, ?> Collectors
##### `static groupingByString(ISObjectFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<String, List<Object>>`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<String, List<Object>> contactsByOtherCity = (Map<String, List<Object>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('OtherCity')
        ));
Map<String, List<Contact>> contactsByOtherCity = (Map<String, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('OtherCity')
        ).cast(Map<String, List<Contact>>.class));
```

##### `static groupingByString(ISObjectFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<String, Object> contactsByOtherCity = (Map<String, Object>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('OtherCity'),
            SObjectCollectors.toSet()
        ));
Map<String, Set<SObject>> contactsByOtherCity = (Map<String, Set<SObject>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('OtherCity'),
            SObjectCollectors.toSet()
        ).cast(Map<String, Set<SObject>>.class));
```

##### `static groupingByString(ISObjectFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<String, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<String, Set<SObject>> contactsByOtherCity = (Map<String, Set<SObject>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('OtherCity'),
            Supplier.of(Map<String, Set<SObject>>.class),
            SObjectCollectors.toSet()
        ));
```

##### `static groupingByString(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by field
Map<String, List<String>> lastNamesByOtherCity = (Map<String, List<String>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByString(
            'OtherCity',
            'LastName'
        ).cast(Map<String, List<String>>.class));
```

##### `static groupingByString(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<String, List<String>> lastNamesByOtherCity = (Map<String, List<String>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByString(
            Contact.OtherCity,
            Contact.LastName
        ).cast(Map<String, List<String>>.class));
```

##### `static groupingByString(String fieldName)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Group values by keys provided by field
Map<String, List<Contact>> contactsByOtherCity = (Map<String, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByString('OtherCity'));
```

##### `static groupingByString(SObjectField field)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<String, List<Contact>> contactsByOtherCity = (Map<String, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByString(Contact.OtherCity));
```

---
### Map<Blob, ?> Collectors
##### `static groupingByBlob(ISObjectFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Blob, List<Object>>`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Blob, List<Object>> attachmentsByOtherCity = (Map<Blob, List<Object>>)
    Stream.of(attachments)
        .collect(SObjectCollectors.groupingByBlob(
            SObjectFunctions.get('Body')
        ));
Map<Blob, List<Attachment>> attachmentsByOtherCity = (Map<Blob, List<Attachment>>)
    Stream.of(attachments)
        .collect(SObjectCollectors.groupingByBlob(
            SObjectFunctions.get('Body')
        ).cast(Map<Blob, List<Attachment>>.class));
```

##### `static groupingByBlob(ISObjectFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Blob, Object> attachmentsByOtherCity = (Map<Blob, Object>)
    Stream.of(attachments)
        .collect(SObjectCollectors.groupingByBlob(
            SObjectFunctions.get('Body'),
            SObjectCollectors.toSet()
        ));
Map<Blob, Set<SObject>> attachmentsByOtherCity = (Map<Blob, Set<SObject>>)
    Stream.of(attachments)
        .collect(SObjectCollectors.groupingByBlob(
            SObjectFunctions.get('Body'),
            SObjectCollectors.toSet()
        ).cast(Map<Blob, Set<SObject>>.class));
```

##### `static groupingByBlob(ISObjectFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Blob, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Blob, Set<SObject>> attachmentsByOtherCity = (Map<Blob, Set<SObject>>)
    Stream.of(attachments)
        .collect(SObjectCollectors.groupingByBlob(
            SObjectFunctions.get('Body'),
            Supplier.of(Map<String, Set<SObject>>.class),
            SObjectCollectors.toSet()
        ));
```

##### `static groupingByBlob(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Blob, List<String>> namesByBody = (Map<Blob, List<String>>)
    Stream.of(attachments)
        .collect(SObjectCollectors.groupingByBlob(
            'Body',
            'Name'
        ).cast(Map<Blob, List<String>>.class));
```

##### `static groupingByBlob(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Blob, List<String>> namesByBody = (Map<Blob, List<String>>)
    Stream.of(attachments)
        .collect(SObjectCollectors.groupingByString(
            Attachment.Body,
            Attachment.Name
        ).cast(Map<Blob, List<String>>.class));
```

##### `static groupingByBlob(String fieldName)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Group values by keys provided by field
Map<Blob, List<Attachment>> attachmentsByBody = (Map<Blob, List<Attachment>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByBlob('Body'));
```

##### `static groupingByBlob(SObjectField field)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Blob, List<Attachment>> attachmentsByBody = (Map<Blob, List<Attachment>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByBlob(Attachment.Body));
```

---
### Map<Date, ?> Collectors
##### `static groupingByDate(ISObjectFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Date, List<Object>>`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Date, List<Object>> contactsByBirthdate = (Map<Date, List<Object>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByDate(
            SObjectFunctions.get('Birthdate')
        ));
Map<Date, List<Contact>> contactsByBirthdate = (Map<Date, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByDate(
            SObjectFunctions.get('Birthdate')
        ).cast(Map<Date, List<Contact>>.class));
```

##### `static groupingByDate(ISObjectFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Date, Object> contactsByBirthdate = (Map<Date, Object>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByDate(
            SObjectFunctions.get('Birthdate'),
            SObjectCollectors.toSet()
        ));
Map<Date, Set<SObject>> contactsByBirthdate = (Map<Date, Set<SObject>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByDate(
            SObjectFunctions.get('Birthdate'),
            SObjectCollectors.toSet()
        ).cast(Map<Date, Set<SObject>>.class));
```

##### `static groupingByDate(ISObjectFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Date, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Date, Set<SObject>> contactsByBirthdate = (Map<Date,Set<SObject>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByDate(
            SObjectFunctions.get('Birthdate'),
            Supplier.of(Map<Date, Set<SObject>>.class),
            SObjectCollectors.toSet()
        ));
```

##### `static groupingByDate(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Date, List<String>> lastNamesByBirthdate = (Map<Date, List<String>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByDate(
            'Birthdate',
            'LastName'
        ).cast(Map<Date, List<String>>.class));
```

##### `static groupingByDate(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Date, List<String>> lastNamesByBirthdate = (Map<Date, List<String>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByDate(
            Contact.Birthdate,
            Contact.LastName
        ).cast(Map<Date, List<String>>.class));
```

##### `static groupingByDate(String fieldName)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Group values by keys provided by field
Map<Date, List<Contact>> contactsByBody = (Map<Date, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByDate('Birthdate'));
```

##### `static groupingByDate(SObjectField field)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Date, List<Contact>> contactsByBody = (Map<Date, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByDate(Contact.Birthdate));
```

---
### Map<Datetime, ?> Collectors
##### `static groupingByDatetime(ISObjectFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Datetime, List<Object>>`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Datetime, List<Object>> eventsByActivityDateTime = (Map<Datetime, List<Object>>)
    Stream.of(events)
        .collect(SObjectCollectors.groupingByDatetime(
            SObjectFunctions.get('ActivityDateTime')
        ));
Map<Datetime, List<Event>> eventsByActivityDateTime = (Map<Datetime, List<Event>>)
    Stream.of(events)
        .collect(SObjectCollectors.groupingByDatetime(
            SObjectFunctions.get('ActivityDateTime')
        ).cast(Map<Datetime, List<Event>>.class));
```

##### `static groupingByDatetime(ISObjectFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Datetime, Object> eventsByActivityDateTime = (Map<Datetime, Object>)
    Stream.of(events)
        .collect(SObjectCollectors.groupingByDatetime(
            SObjectFunctions.get('ActivityDateTime'),
            SObjectCollectors.toSet()
        ));
Map<Datetime, Set<SObject>> eventsByActivityDateTime = (Map<Datetime, Set<SObject>>)
    Stream.of(events)
        .collect(SObjectCollectors.groupingByDatetime(
            SObjectFunctions.get('ActivityDateTime'),
            SObjectCollectors.toSet()
        ).cast(Map<Datetime, Set<SObject>>.class));
```

##### `static groupingByDatetime(ISObjectFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Datetime, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Datetime, Set<SObject>> eventsByActivityDateTime = (Map<Datetime, Set<SObject>>)
    Stream.of(events)
        .collect(SObjectCollectors.groupingByDatetime(
            SObjectFunctions.get('ActivityDateTime'),
            Supplier.of(Map<Datetime, Set<SObject>>.class),
            SObjectCollectors.toSet()
        ));
```

##### `static groupingByDatetime(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Datetime, List<String>> descriptionsByActivityDateTime = (Map<Datetime, List<String>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingByDatetime(
            'ActivityDateTime',
            'Description'
        ).cast(Map<Datetime, List<String>>.class));
```

##### `static groupingByDatetime(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Datetime, List<String>> descriptionsByActivityDateTime = (Map<Datetime, List<String>>)
    Stream.of(events)
        .collect(SObjectCollectors.groupingByDatetime(
            Event.ActivityDateTime,
            Event.Description
        ).cast(Map<Datetime, List<String>>.class));
```

##### `static groupingByDatetime(String fieldName)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Group values by keys provided by field
Map<Datetime, List<Event>> eventsByActivityDateTime = (Map<Datetime, List<Event>>)
    Stream.of(events)
        .collect(SObjectCollectors.groupingByDatetime('ActivityDateTime'));
```

##### `static groupingByDatetime(SObjectField field)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Datetime, List<Event>> eventsByActivityDateTime = (Map<Datetime, List<Event>>)
    Stream.of(events)
        .collect(SObjectCollectors.groupingByDatetime(Event.ActivityDateTime));
```

---
### Map<Time, ?> Collectors
##### `static groupingByTime(ISObjectFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Time, List<Object>>`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Time, List<Object>> slotsByStartTime = (Map<Time, List<Object>>)
    Stream.of(events)
        .collect(SObjectCollectors.groupingByTime(
            SObjectFunctions.get('StartTime')
        ));
Map<Time, List<TimeSlot>> slotsByStartTime = (Map<Time, List<TimeSlot>>)
    Stream.of(events)
        .collect(SObjectCollectors.groupingByTime(
            SObjectFunctions.get('StartTime')
        ).cast(Map<Time, List<TimeSlot>>.class));
```

##### `static groupingByTime(ISObjectFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Time, Object> slotsByStartTime = (Map<Time, Object>)
    Stream.of(events)
        .collect(SObjectCollectors.groupingByTime(
            SObjectFunctions.get('StartTime'),
            SObjectCollectors.toSet()
        ));
Map<Time, Set<SObject>> slotsByStartTime = (Map<Time, Set<SObject>>)
    Stream.of(events)
        .collect(SObjectCollectors.groupingByTime(
            SObjectFunctions.get('StartTime'),
            SObjectCollectors.toSet()
        ).cast(Map<Time, Set<SObject>>.class));
```

##### `static groupingByTime(ISObjectFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Time, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Time, Set<SObject>> slotsByStartTime = (Map<Time, Set<SObject>>)
    Stream.of(events)
        .collect(SObjectCollectors.groupingByTime(
            SObjectFunctions.get('StartTime'),
            Supplier.of(Map<Time, Set<SObject>>.class),
            SObjectCollectors.toSet()
        ));
```

##### `static groupingByTime(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Time, List<String>> namesByStartTime = (Map<Time, List<String>>)
    Stream.of(slots)
        .collect(SObjectCollectors.groupingByDatetime(
            'StartTime',
            'Name'
        ).cast(Map<Time, List<String>>.class));
```

##### `static groupingByTime(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Time, List<String>> descriptionsByActivityDateTime = (Map<Time, List<String>>)
    Stream.of(slots)
        .collect(SObjectCollectors.groupingByTime(
            TimeSlot.StartTime,
            TimeSlot.Description
        ).cast(Map<Time, List<String>>.class));
```

##### `static groupingByTime(String fieldName)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Group values by keys provided by field
Map<Time, List<TimeSlot>> slotsByStartTime = (Map<Time, List<TimeSlot>>)
    Stream.of(slots)
        .collect(SObjectCollectors.groupingByTime('StartTime'));
```

##### `static groupingByTime(SObjectField field)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Time, List<TimeSlot>> slotsByStartTime = (Map<Time, List<TimeSlot>>)
    Stream.of(slots)
        .collect(SObjectCollectors.groupingByTime(TimeSlot.StartTime));
```

---
### Map<Integer, ?> Collectors
##### `static groupingByInt(ISObjectToIntFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Integer, List<Object>>`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Integer, List<Object>> accountsByNumberOfEmployees = (Map<Integer, List<Object>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByInt(
            SObjectToIntFunctions.get('NumberOfEmployees')
        ));
Map<Integer, List<Account>> accountsByNumberOfEmployees = (Map<Integer, List<Account>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByInt(
            SObjectToIntFunctions.get('NumberOfEmployees')
        ).cast(Map<Integer, List<Account>>.class));
```

##### `static groupingByInt(ISObjectToIntFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Integer, Object> accountsByNumberOfEmployees = (Map<Integer, Object>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByInt(
            SObjectToIntFunctions.get('NumberOfEmployees'),
            SObjectCollectors.toSet()
        ));
Map<Integer, Set<SObject>> accountsByNumberOfEmployees = (Map<Integer, Set<SObject>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByInt(
            SObjectToIntFunctions.get('NumberOfEmployees'),
            SObjectCollectors.toSet()
        ).cast(Map<Integer, Set<SObject>>.class));
```

##### `static groupingByInt(ISObjectToIntFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Integer, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Integer, Set<SObject>> accountsByNumberOfEmployees = (Map<Integer, Set<SObject>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByInt(
            SObjectToIntFunctions.get('NumberOfEmployees'),
            Supplier.of(Map<Integer, Set<SObject>>.class)
            SObjectCollectors.toSet()
        ));
```

##### `static groupingByInt(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Integer, List<String>> namesByNumberOfEmployees = (Map<Integer, List<String>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByInt(
            'NumberOfEmployees',
            'Name'
        ).cast(Map<Integer, List<String>>.class));
```

##### `static groupingByInt(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Integer, List<String>> namesByNumberOfEmployees = (Map<Integer, List<String>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByInt(
            Account.NumberOfEmployees,
            Account.Name
        ).cast(Map<Integer, List<String>>.class));
```

##### `static groupingByInt(String fieldName)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Group values by keys provided by field
Map<Integer, List<Account>> accountsByNumberOfEmployees = (Map<Integer, List<Account>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByInt('NumberOfEmployees'));
```

##### `static groupingByInt(SObjectField field)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Integer, List<Account>> accountsByNumberOfEmployees = (Map<Integer, List<Account>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByInt(Account.NumberOfEmployees));
```

---
### Map<Long, ?> Collectors
##### `static groupingByLong(ISObjectToLongFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Long, List<Object>>`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Long, List<Object>> accountsByNumberOfEmployees = (Map<Long, List<Object>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByLong(
            SObjectToLongFunctions.get('NumberOfEmployees')
        ));
Map<Long, List<Account>> accountsByNumberOfEmployees = (Map<Long, List<Account>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByLong(
            SObjectToLongFunctions.get('NumberOfEmployees')
        ).cast(Map<Long, List<Account>>.class));
```

##### `static groupingByLong(ISObjectToLongFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Long, Object> accountsByNumberOfEmployees = (Map<Long, Object>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByLong(
            SObjectToLongFunctions.get('NumberOfEmployees'),
            SObjectCollectors.toSet()
        ));
Map<Long, Set<SObject>> accountsByNumberOfEmployees = (Map<Long, Set<SObject>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByInt(
            SObjectToLongFunctions.get('NumberOfEmployees'),
            SObjectCollectors.toSet()
        ).cast(Map<Long, Set<SObject>>.class));
```

##### `static groupingByLong(ISObjectToLongFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Long, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Long, Set<SObject>> accountsByNumberOfEmployees = (Map<Long, Set<SObject>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByInt(
            SObjectToLongFunctions.get('NumberOfEmployees'),
            Supplier.of(Map<Long, Set<SObject>>.class)
            SObjectCollectors.toSet()
        ));
```

##### `static groupingByLong(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Long, List<String>> namesByNumberOfEmployees = (Map<Long, List<String>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByLong(
            'NumberOfEmployees',
            'Name'
        ).cast(Map<Long, List<String>>.class));
```

##### `static groupingByLong(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Long, List<String>> namesByNumberOfEmployees = (Map<Long, List<String>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByLong(
            Account.NumberOfEmployees,
            Account.Name
        ).cast(Map<Long, List<String>>.class));
```

##### `static groupingByLong(String fieldName)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Group values by keys provided by field
Map<Long, List<Account>> accountsByNumberOfEmployees = (Map<Long, List<Account>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByLong('NumberOfEmployees'));
```

##### `static groupingByLong(SObjectField field)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Long, List<Account>> accountsByNumberOfEmployees = (Map<Long, List<Account>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByLong(Account.NumberOfEmployees));
```

---
### Map<Double, ?> Collectors
##### `static groupingByDouble(ISObjectToDoubleFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Double, List<Object>>`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Double, List<Object>> accountsByBillingLatitude = (Map<Double, List<Object>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByDouble(
            SObjectToDoubleFunctions.get('BillingLatitude')
        ));
Map<Double, List<Account>> accountsByBillingLatitude = (Map<Double, List<Account>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByDouble(
            SObjectToDoubleFunctions.get('BillingLatitude')
        ).cast(Map<Double, List<Account>>.class));
```

##### `static groupingByDouble(ISObjectToDoubleFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Double, Object> accountsByBillingLatitude = (Map<Double, Object>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByDouble(
            SObjectToDoubleFunctions.get('BillingLatitude'),
            SObjectCollectors.toSet()
        ));
Map<Double, Set<SObject>> accountsByBillingLatitude = (Map<Double, Set<SObject>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByDouble(
            SObjectToDoubleFunctions.get('BillingLatitude'),
            SObjectCollectors.toSet()
        ).cast(Map<Double, Set<SObject>>.class));
```

##### `static groupingByDouble(ISObjectToDoubleFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Double, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Double, Set<SObject>> accountsByBillingLatitude = (Map<Double, Set<SObject>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByDouble(
            SObjectToDoubleFunctions.get('BillingLatitude'),
            Supplier.of(Map<Double, Set<SObject>>.class)
            SObjectCollectors.toSet()
        ));
```

##### `static groupingByDouble(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Double, List<String>> namesByBillingLatitude = (Map<Double, List<String>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByDouble(
            'BillingLatitude',
            'Name'
        ).cast(Map<Double, List<String>>.class));
```

##### `static groupingByDouble(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Double, List<String>> namesByBillingLatitude = (Map<Double, List<String>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByDouble(
            Account.BillingLatitude,
            Account.Name
        ).cast(Map<Double, List<String>>.class));
```

---
### Map<Object, ?> Collectors
##### `static groupingByDouble(String fieldName)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Group values by keys provided by field
Map<Double, List<Account>> accountsByBillingLatitude = (Map<Double, List<Account>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByDouble('BillingLatitude'));
```

##### `static groupingByDouble(SObjectField field)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Double, List<Account>> accountsByBillingLatitude = (Map<Double, List<Account>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByDouble(Account.BillingLatitude));
```

##### `static groupingBy(ISObjectFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Object, List<Object>>`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as SObjectCollectors.groupingById, SObjectCollectors.groupingByString, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Object, List<Object>> contactsByBirthdate = (Map<Object, List<Object>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingBy(
            SObjectFunctions.get('Birthdate')
        ));
Map<Object, List<Contact>> contactsByBirthdate = (Map<Object, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingBy(
            SObjectFunctions.get('Birthdate')
        ).cast(Map<Object, List<Contact>>.class));
```

##### `static groupingBy(ISObjectFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as SObjectCollectors.groupingById, SObjectCollectors.groupingByString, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Object, Object> contactsByBirthdate = (Map<Object, Object>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingBy(
            SObjectFunctions.get('Birthdate'),
            SObjectCollectors.toSet()
        ));
Map<Object, Set<SObject>> contactsByBirthdate = (Map<Object, Set<SObject>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingBy(
            SObjectFunctions.get('Birthdate'),
            SObjectCollectors.toSet()
        ).cast(Map<Object, Set<SObject>>.class));
```

##### `static groupingBy(ISObjectFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as SObjectCollectors.groupingById, SObjectCollectors.groupingByString, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the function that returns keys|
|`mapSupplier`|the supplier that returns a `Map<Object, ?>` container into which the results will be inserted|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier`, `mapSupplier` or `downstream` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Object, Set<SObject>> contactsByBirthdate = (Map<Object,Set<SObject>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingBy(
            SObjectFunctions.get('Birthdate'),
            Supplier.of(Map<Object, Set<SObject>>.class),
            SObjectCollectors.toSet()
        ));
```

##### `static groupingBy(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as SObjectCollectors.groupingById, SObjectCollectors.groupingByString, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyFieldName`|the field value to accumulate as key|
|`valueFieldName`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|

###### Example
```apex
// Group values by keys provided by function
Map<Object, List<String>> lastNamesByBirthdate = (Map<Object, List<String>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingBy(
            'Birthdate',
            'LastName'
        ).cast(Map<Object, List<String>>.class));
```

##### `static groupingBy(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as SObjectCollectors.groupingById, SObjectCollectors.groupingByString, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyField`|the field value to accumulate as key|
|`valueField`|the field value to accumulate as values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyField` or `valueField` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Object, List<String>> lastNamesByBirthdate = (Map<Object, List<String>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingBy(
            Contact.Birthdate,
            Contact.LastName
        ).cast(Map<Object, List<String>>.class));
```

##### `static groupingBy(String fieldName)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported. <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as SObjectCollectors.groupingById, SObjectCollectors.groupingByString, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
// Group values by keys provided by field
Map<Object, List<Contact>> contactsByBody = (Map<Object, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingBy('Birthdate'));
```

##### `static groupingBy(SObjectField field)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `field`. <p>The result container keys however <strong>cannot</strong> be cast to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as SObjectCollectors.groupingById, SObjectCollectors.groupingByString, etc.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate as key|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Group values by keys provided by field
Map<Object, List<Contact>> contactsByBody = (Map<Object, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollectors.groupingBy(Contact.Birthdate));
```

---
### Partitioning By Collectors
##### `static partitioningBy(ISObjectPredicate predicate)`

Returns a `SObjectCollector` that partitions the SObject input arguments according to `predicate` and organizes them into a `Map<Boolean, Object>`. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate that classifies input arguments (true or false)|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Map<Boolean, Object> accountsPartitionedByHavingMoreThan100Employees = (Map<Boolean, Object>)
    Stream.of(accounts)
        .collect(SObjectCollectors.partitioningBy(
            SObjectPredicates.isGreater('NumberOfEmployees', 100)
        ));
Map<Boolean, List<Account>> accountsPartitionedByHavingMoreThan100Employees = (Map<Boolean, List<Account>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.partitioningBy(
            SObjectPredicates.isGreater('NumberOfEmployees', 100)
        ).cast(Map<Boolean, List<Account>>.class));
```

##### `static partitioningBy(ISObjectPredicate predicate, ISObjectCollector downstream)`

Returns a `SObjectCollector` that partitions the SObject input arguments according to `predicate`, reduces the values in each partition according to `downstream` Collector, and organizes them into a `Map<Boolean, Object>` whose values are the result of the downstream reduction. <p>The result container values type can be cast to a specific type using SObjectCollector.cast.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate that classifies input arguments (true or false)|
|`downstream`|the downstream reduction collector|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` or `downstream` is null|

###### Example
```apex
Map<Boolean, Set<String>> accountNamesPartitionedByHavingMoreThan100Employees =
    (Map<Boolean, Set<String>>) Stream.of(accounts)
        .collect(SObjectCollectors.partitioningBy(
            SObjectPredicates.isGreater('NumberOfEmployees', 100),
            SObjectCollectors.toStringSet('Name')
        ).cast(Map<Boolean, Set<Account>>.class));
```

##### `static partitioningBy(String fieldName, Object value)`

Returns a `SObjectCollector` that partitions the SObject input arguments according to whether `fieldName` is equal to `value` and organizes them into a `Map<Boolean, List<SObject>>`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to test|
|`value`|the expected value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
Map<Boolean, List<Account>> accountNamesPartitionedByHavingMoreThan100Employees =
    (Map<Boolean, List<Account>>) Stream.of(contacts)
        .collect(SObjectCollectors.partitioningBy('OtherCountry', 'UK'));
```

##### `static partitioningBy(SObjectField field, Object value)`

Returns a `SObjectCollector` that partitions the SObject input arguments according to whether `field` is equal to `value` and organizes them into a `Map<Boolean, List<SObject>>`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to test|
|`value`|the expected value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** SObjectPredicates.isEqual

###### Example
```apex
Map<Boolean, List<Account>> accountNamesPartitionedByHavingMoreThan100Employees =
    (Map<Boolean, List<Account>>) Stream.of(contacts)
        .collect(SObjectCollectors.partitioningBy(Contact.OtherCountry, 'UK'));
```

---
### Joining
##### `static joining(String fieldName)`

Returns a `SObjectCollector` that concatenates `fieldName` String values of the SObject input arguments. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to concatenate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
String lastNames = (String) Stream.of(contacts).collect(SObjectCollectors.joining('LastName'));
```

##### `static joining(SObjectField field)`

Returns a `SObjectCollector` that concatenates `fieldName` String values of the SObject input arguments.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to concatenate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
String lastNames = (String) Stream.of(contacts).collect(SObjectCollectors.joining(Contact.LastName));
```

##### `static joining(String fieldName, String delimiter)`

Returns a `SObjectCollector` that concatenates `fieldName` String values of the SObject input arguments, separated by the `delimiter`.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to concatenate|
|`delimiter`|the delimiter between each element|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank or `delimiter` is null|

###### Example
```apex
String lastNames = (String) Stream.of(contacts)
     .collect(SObjectCollectors.joining('LastName', '; '));
```

##### `static joining(SObjectField field, String delimiter)`

Returns a `SObjectCollector` that concatenates `field` String values of the SObject input arguments, separated by the `delimiter`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to concatenate|
|`delimiter`|the delimiter between each element|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `delimiter` is null|

###### Example
```apex
String lastNames = (String) Stream.of(contacts)
    .collect(SObjectCollectors.joining(Contact.LastName, '; '));
```

##### `static joining(String fieldName, String delimiter, String prefix, String suffix)`

Returns a `SObjectCollector` that concatenates `fieldName` String values of the SObject input arguments, separated by the `delimiter` with `prefix` and `suffix`.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to concatenate|
|`delimiter`|the delimiter between each element|
|`prefix`|the prefix|
|`suffix`|the suffix|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank or `delimiter`, `prefix` or `suffix` is null|

###### Example
```apex
String lastNames = (String) Stream.of(contacts)
     .collect(SObjectCollectors.joining('LastName', '; ', 'prefix', 'suffix'));
```

##### `static joining(SObjectField field, String delimiter, String prefix, String suffix)`

Returns a `SObjectCollector` that concatenates `field` String values of the SObject input arguments, separated by the `delimiter` with `prefix` and `suffix`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to concatenate|
|`delimiter`|the delimiter between each element|
|`prefix`|the prefix|
|`suffix`|the suffix|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field`, `delimiter`, `prefix` or `suffix` is null|

###### Example
```apex
String lastNames = (String) Stream.of(contacts)
     .collect(SObjectCollectors.joining(Contact.LastName, '; ', 'prefix', 'suffix'));
```

---
### Int Collectors
##### `static averagingInt(ISObjectToIntFunction mapper)`

Returns a `SObjectCollector` that returns the arithmetic mean of values returned by `mapper`. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function extracting the Integer value to average|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Double averageNumberOfEmployees = (Double) Stream.of(accounts)
    .collect(SObjectCollectors.averagingInt(SObjectToIntFunctions.get('NumberOfEmployees')));
```

##### `static averagingInt(String fieldName)`

Returns a `SObjectCollector` that returns the arithmetic mean of `fieldName` values. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to average|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
Double averageNumberOfEmployees = (Double) Stream.of(accounts)
    .collect(SObjectCollectors.averagingInt('NumberOfEmployees'));
```

##### `static averagingInt(SObjectField field)`

Returns a `SObjectCollector` that returns the arithmetic mean of `field` values. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to average|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Double averageNumberOfEmployees = (Double) Stream.of(accounts)
    .collect(SObjectCollectors.averagingInt(Account.NumberOfEmployees));
```

##### `static counting()`

Returns a `SObjectCollector` that counts the number of input elements. If no elements are present, the result is 0.

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Example
```apex
Double averageNumberOfEmployees = (Double) Stream.of(accounts)
    .collect(SObjectCollectors.counting());
```

##### `static summingInt(ISObjectToIntFunction mapper)`

Returns a `SObjectCollector` that returns the arithmetic sum of values returned by `mapper`. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function extracting the Integer value to sum|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Integer sumOfNumberOfEmployees = (Integer) Stream.of(accounts)
    .collect(SObjectCollectors.summingInt(SObjectToIntFunctions.get('NumberOfEmployees')));
```

##### `static summingInt(String fieldName)`

Returns a `SObjectCollector` that returns the arithmetic sum of `fieldName` values. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to sum|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
Integer sumOfNumberOfEmployees = (Integer) Stream.of(accounts)
    .collect(SObjectCollectors.summingInt('NumberOfEmployees'));
```

##### `static summingInt(SObjectField field)`

Returns a `SObjectCollector` that returns the arithmetic sum of `field` values. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to sum|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Integer sumOfNumberOfEmployees = (Integer) Stream.of(accounts)
    .collect(SObjectCollectors.summingInt(Account.NumberOfEmployees));
```

---
### Long Collectors
##### `static averagingLong(ISObjectToLongFunction mapper)`

Returns a `SObjectCollector` that returns the arithmetic mean of values returned by `mapper`. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function extracting the Long value to average|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Double averageNumberOfEmployees = (Double) Stream.of(accounts)
    .collect(SObjectCollectors.averagingLong(SObjectToLongFunctions.get('NumberOfEmployees')));
```

##### `static averagingLong(String fieldName)`

Returns a `SObjectCollector` that returns the arithmetic mean of `fieldName` values. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to average|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
Double averageNumberOfEmployees = (Double) Stream.of(accounts)
    .collect(SObjectCollectors.averagingLong('NumberOfEmployees'));
```

##### `static averagingLong(SObjectField field)`

Returns a `SObjectCollector` that returns the arithmetic mean of `field` values. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to average|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Double averageNumberOfEmployees = (Double) Stream.of(accounts)
    .collect(SObjectCollectors.averagingLong(Account.NumberOfEmployees));
```

##### `static summingLong(ISObjectToLongFunction mapper)`

Returns a `SObjectCollector` that returns the arithmetic sum of values returned by `mapper`. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function extracting the Long value to sum|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Long sumOfNumberOfEmployees = (Long) Stream.of(accounts)
    .collect(SObjectCollectors.summingLong(SObjectToLongFunctions.get('NumberOfEmployees')));
```

##### `static summingLong(String fieldName)`

Returns a `SObjectCollector` that returns the arithmetic sum of `fieldName` values. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to sum|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
Long sumOfNumberOfEmployees = (Long) Stream.of(accounts)
    .collect(SObjectCollectors.summingLong('NumberOfEmployees'));
```

##### `static summingLong(SObjectField field)`

Returns a `SObjectCollector` that returns the arithmetic sum of `field` values. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to sum|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Long sumOfNumberOfEmployees = (Long) Stream.of(accounts)
    .collect(SObjectCollectors.summingLong(Account.NumberOfEmployees));
```

---
### Double Collectors
##### `static averagingDouble(ISObjectToDoubleFunction mapper)`

Returns a `SObjectCollector` that returns the arithmetic mean of values returned by `mapper`. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function extracting the Double value to average|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Double averageBillingLatitude = (Double) Stream.of(accounts)
    .collect(SObjectCollectors.averagingLong(SObjectToDoubleFunctions.get('BillingLatitude')));
```

##### `static averagingDouble(String fieldName)`

Returns a `SObjectCollector` that returns the arithmetic mean of `fieldName` values. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to average|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
Double averageBillingLatitude = (Double) Stream.of(accounts)
    .collect(SObjectCollectors.averagingDouble('BillingLatitude'));
```

##### `static averagingDouble(SObjectField field)`

Returns a `SObjectCollector` that returns the arithmetic mean of `field` values. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to average|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Double averageBillingLatitude = (Double) Stream.of(accounts)
    .collect(SObjectCollectors.averagingDouble(Account.BillingLatitude));
```

##### `static summingDouble(ISObjectToDoubleFunction mapper)`

Returns a `SObjectCollector` that returns the arithmetic sum of values returned by `mapper`. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function extracting the Long value to sum|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Long sumOfBillingLatitude = (Long) Stream.of(accounts)
    .collect(SObjectCollectors.summingDouble(SObjectToDoubleFunctions.get('BillingLatitude')));
```

##### `static summingDouble(String fieldName)`

Returns a `SObjectCollector` that returns the arithmetic sum of `fieldName` values. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to sum|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
Double sumOfBillingLatitude = (Double) Stream.of(accounts)
    .collect(SObjectCollectors.summingDouble('BillingLatitude'));
```

##### `static summingDouble(SObjectField field)`

Returns a `SObjectCollector` that returns the arithmetic sum of `field` values. If no elements are present, the result is 0.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to BillingLatitude|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Double sumOfBillingLatitude = (Double) Stream.of(accounts)
    .collect(SObjectCollectors.summingDouble(Account.NumberOfEmployees));
```

---
### Intermediate Collectors
##### `static filtering(ISObjectPredicate predicate)`

Adapts a `SObjectCollector` to one accepting elements by applying `predicate` to each input element and only accumulating if it returns true.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate to test input arguments|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
// Get accounts with more than 100 employees
List<Account> accountsHavingMoreThan100Employees = (List<Account>) Stream.of(accounts)
    .collect(SObjectCollectors.filtering(SObjectPredicates.isGreater('NumberOfEmployees', 100)));
// Group accounts with more than 100 employees by type
Map<String, List<Account>> accountNamesHavingMoreThan100EmployeesByType =
    (Map<String, List<Account>>) Stream.of(accounts)
       .collect(
            SObjectCollectors.groupingByString(
                SObjectFunctions.get('Type'),
                SObjectCollectors.filtering(SObjectPredicates.isGreater('NumberOfEmployees', 100))
       ).cast(Map<String, List<Account>>.class));
```

##### `static filtering(ISObjectPredicate predicate, ISObjectCollector downstream)`

Adapts a `SObjectCollector` to one accepting elements by applying `predicate` to each input element and only accumulating if it returns true.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate to test input arguments|
|`downstream`|the collector that accumulates only matched values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` or `downstream` is null|

###### Example
```apex
// Get accounts with more than 100 employees
List<String> accountNamesHavingMoreThan100Employees = (List<Account>) Stream.of(accounts)
    .collect(SObjectCollectors.filtering(
        SObjectPredicates.isGreater('NumberOfEmployees', 100),
        SObjectCollectors.toList('Name')
     ).cast(List<String>.class));
// Group accounts names with more than 100 employees by type
Map<String, List<String>> accountNamesHavingMoreThan100EmployeesByType =
    (Map<String, List<String>>) Stream.of(accounts)
    .collect(
        SObjectCollectors.filtering(
            SObjectPredicates.isGreater('NumberOfEmployees', 100),
            SObjectCollectors.groupingByString(
                SObjectFunctions.get('Type'),
                SObjectCollectors.toList('Name')
            ).cast(Map<String, List<String>>.class)
     ));
```

##### `static filtering(String fieldName, Object value)`

Adapts a `SObjectCollector` to one accepting elements by testing of `fieldName` is equal to `value` to each input element and only accumulating if it is true.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to test input arguments|
|`value`|the expected value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|


**See** SObjectPredicates.isEqual

###### Example
```apex
// Get accounts with hot Rating
List<Account> accountsHavingMoreThan100Employees = (List<Account>) Stream.of(accounts)
    .collect(SObjectCollectors.filtering('Rating', 'Hot'));
// Group accounts with hot Rating by type
Map<String, List<Account>> accountNamesHavingMoreThan100EmployeesByType =
    (Map<String, List<Account>>) Stream.of(accounts)
       .collect(
            SObjectCollectors.groupingByString(
                SObjectFunctions.get('Type'),
                SObjectCollectors.filtering('Rating', 'Hot')
       ).cast(Map<String, List<Account>>.class));
```

##### `static filtering(SObjectField field, Object value)`

Adapts a `SObjectCollector` to one accepting elements by testing of `field` is equal to `value` to each input element and only accumulating if it is true.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to test input arguments|
|`value`|the expected value|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
// Get accounts with hot Rating
List<Account> accountsHavingMoreThan100Employees = (List<Account>) Stream.of(accounts)
    .collect(SObjectCollectors.filtering(Account.Rating, 'Hot'));
// Group accounts with hot Rating by type
Map<String, List<Account>> accountNamesHavingMoreThan100EmployeesByType =
    (Map<String, List<Account>>) Stream.of(accounts)
       .collect(
            SObjectCollectors.groupingByString(
                SObjectFunctions.get('Type'),
                SObjectCollectors.filtering(Account.Rating, 'Hot')
       ).cast(Map<String, List<Account>>.class));
```

##### `static mapping(ISObjectFunction mapper)`

Adapts a `SObjectCollector` to one accepting elements by applying `mapper` function to each input element before accumulation.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function to return the value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<String> accountNames = (List<String>)
    Stream.of(accounts)
        .collect(SObjectCollectors.mapping(SObjectFunctions.get('Name')).cast(List<String>.class));
```

##### `static mapping(ISObjectFunction mapper, ICollector downstream)`

Adapts a `SObjectCollector` to one accepting elements by applying `mapper` function to each input element before accumulation.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function to return the value to accumulate|
|`downstream`|the collector which accepts mapped values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `downstream` is null|

###### Example
```apex
Map<String, Set<String>> namesByType = (Map<String, Set<String>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('Type'),
            SObjectCollectors.mapping(
                SObjectFunctions.get('Name'),
                Collector.toStringSet()
            )
        ).cast(Map<String, Set<String>>.class));
```

##### `static mapping(String fieldName)`

Adapts a `SObjectCollector` to one accepting `fieldName` values to each input element before accumulation.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
List<String> accountNames = (List<String>)
    Stream.of(accounts)
        .collect(SObjectCollectors.mapping('Name').cast(List<String>.class));
```

##### `static mapping(SObjectField field)`

Adapts a `SObjectCollector` to one accepting `field` values to each input element before accumulation.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to accumulate|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
List<String> accountNames = (List<String>)
    Stream.of(accounts)
        .collect(SObjectCollectors.mapping(Account.Name).cast(List<String>.class));
```

##### `static flatMapping(ISObjectFunction mapper)`

Adapts a `SObjectCollector` to one accepting elements as a result of replacing each input element with the contents of a mapped iterable created by applying the specified `mapper` function to each element before accumulation.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function which must produce `Iterable<SObject>`|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `downstream` is null|

###### Example
```apex
List<Contact> contacts = (List<Contact>) Stream.of(accounts)
    .collect(
        SObjectCollectors.flatMapping(SObjectFunctions.getSObjects('Contacts'))
    ).cast(List<Contact>.class));
Map<String, List<Contact>> contactsByAccountType = (Map<String, List<Contact>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('Type'),
            SObjectCollectors.flatMapping(SObjectFunctions.getSObjects('Contacts'))
        ).cast(Map<String, List<Contact>>.class));
```

##### `static flatMapping(ISObjectFunction mapper, ICollector downstream)`

Adapts a `SObjectCollector` to one accepting elements as a result of replacing each input element with the contents of a mapped iterable created by applying the specified `mapper` function to each element before accumulation.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function which must produce `Iterable<SObject>`|
|`downstream`|the collector which accepts mapped values|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `downstream` is null|

###### Example
```apex
Set<SObject> contacts = (Set<SObject>) Stream.of(accounts)
    .collect(SObjectCollectors.flatMapping(
        SObjectFunctions.getSObjects('Contacts'),
        Collector.toSObjectSet()
    ));
Map<String, List<Contact>> contactsByAccountType = (Map<String, List<Contact>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('Type'),
            SObjectCollectors.flatMapping(
                SObjectFunctions.getSObjects('Contacts'),
                Collector.toSObjectList()
        ).cast(Map<String, List<Contact>>.class));
```

##### `static flatMapping(String fieldName)`

Adapts a `SObjectCollector` to one accepting elements as a result of replacing each input element with the contents of a mapped iterable according to child relationship `fieldName` before accumulation.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the child relationship field|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
List<Contact> contacts = (List<Contact>) Stream.of(accounts)
    .collect(SObjectCollectors.flatMapping('Contacts')).cast(List<Contact>.class));
Map<String, List<Contact>> contactsByAccountType = (Map<String, List<Contact>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('Type'),
            SObjectCollectors.flatMapping('Contacts')
        ).cast(Map<String, List<Contact>>.class));
```

##### `static flatMapping(SObjectField field)`

Adapts a `SObjectCollector` to one accepting elements as a result of replacing each input element with the contents of a mapped iterable according to child relationship `field` before accumulation.

###### Parameters
|Param|Description|
|---|---|
|`field`|the child relationship field|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
List<Contact> contacts = (List<Contact>) Stream.of(accounts)
    .collect(SObjectCollectors.flatMapping(Contact.AccountId)).cast(List<Contact>.class));
Map<String, List<Contact>> contactsByAccountType = (Map<String, List<Contact>>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('Type'),
            SObjectCollectors.flatMapping(Contact.AccountId)
        ).cast(Map<String, List<Contact>>.class));
```

##### `static reducing(SObject identity, ISObjectBinaryOperator accumulator)`

Returns a `SObjectCollector` which performs a reduction of its input elements under `accumulator` using `identity`.

###### Parameters
|Param|Description|
|---|---|
|`identity`|the identity value for the reduction|
|`accumulator`|the input arguments reducer|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
Account accountWithSummedNumberOfEmployees = (Account) Stream.of(accounts)
    .collect(SObjectCollectors.reducing(
        new Account(NumberOfEmployees = 0),
        sumIntFieldReducer
    ));
```

---
### Optional Collectors
##### `static reducing(ISObjectBinaryOperator accumulator)`

Returns a `SObjectCollector` which performs a reduction of its input elements under `accumulator`. The result is described as an `OptionalSObject`. <p>The result container <strong>cannot</strong> be cast to a specific `OptionalSObject`.</p>

###### Parameters
|Param|Description|
|---|---|
|`accumulator`|the input arguments reducer|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
Map<String, Object> accountOptionalWithMaxNumberOfEmployeesPerType = (Map<String, Object>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('Type'),
            SObjectCollectors.reducing(
                SObjectBinaryOperator.maxBy('NumberOfEmployees')
            )
        ));
Account customerWithMaxNumberOfEmployees = (Account)
    accountOptionalWithMaxNumberOfEmployeesPerType.get('Customer').get();
```

##### `static maximizing(ISObjectComparator comparator)`

Returns a `SObjectCollector` which produces the maximal element according to `comparator`, described as an `OptionalSObject` . <p>The result container <strong>cannot</strong> be cast to a specific `OptionalSObject`.</p>

###### Parameters
|Param|Description|
|---|---|
|`comparator`|the comparator|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
Map<String, Object> accountOptionalWithMaxNumberOfEmployeesPerType = (Map<String, Object>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('Type'),
            SObjectCollectors.maximizing(
                SObjectComparator.comparingInt('NumberOfEmployees')
            )
        ));
Account customerWithMaxNumberOfEmployees = (Account)
    ((OptionalSObject) accountOptionalWithMaxNumberOfEmployeesPerType).get('Customer').get();
```

##### `static maximizing(String fieldName)`

Returns a `SObjectCollector` which produces the maximal element according to `fieldName`, described as an `OptionalSObject` . <p>The result container <strong>cannot</strong> be cast to a specific `OptionalSObject`.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to compare|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
Map<String, Object> accountOptionalWithMaxNumberOfEmployeesPerType = (Map<String, Object>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('Type'),
            SObjectCollectors.maximizing('NumberOfEmployees')
        ));
Account customerWithMaxNumberOfEmployees = (Account)
    ((OptionalSObject) accountOptionalWithMaxNumberOfEmployeesPerType).get('Customer').get();
```

##### `static maximizing(SObjectField field)`

Returns a `SObjectCollector` which produces the maximal element according to `field`, described as an `OptionalSObject` . <p>The result container <strong>cannot</strong> be cast to a specific `OptionalSObject`.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to compare|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Map<String, Object> accountOptionalWithMaxNumberOfEmployeesPerType = (Map<String, Object>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get(Account.Type),
            SObjectCollectors.maximizing(Account.NumberOfEmployees)
        ));
Account customerWithMaxNumberOfEmployees = (Account)
    ((OptionalSObject) accountOptionalWithMaxNumberOfEmployeesPerType).get('Customer').get();
```

##### `static minimizing(ISObjectComparator comparator)`

Returns a `SObjectCollector` which produces the minimal element according to `comparator`, described as an `OptionalSObject` . <p>The result container <strong>cannot</strong> be cast to a specific `OptionalSObject`.</p>

###### Parameters
|Param|Description|
|---|---|
|`comparator`|the comparator|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
Map<String, Object> accountOptionalWithMinNumberOfEmployeesPerType = (Map<String, Object>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('Type'),
            SObjectCollectors.minimizing(
                SObjectComparator.comparingInt('NumberOfEmployees')
            )
        ));
Account customerWithMinNumberOfEmployees = (Account)
    accountOptionalWithMinNumberOfEmployeesPerType.get('Customer').get();
```

##### `static minimizing(String fieldName)`

Returns a `SObjectCollector` which produces the minimal element according to `fieldName`, described as an `OptionalSObject` . <p>The result container <strong>cannot</strong> be cast to a specific `OptionalSObject`.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to compare|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
Map<String, Object> accountOptionalWithMinNumberOfEmployeesPerType = (Map<String, Object>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get('Type'),
            SObjectCollectors.maximizing('NumberOfEmployees')
        ));
Account customerWithMinNumberOfEmployees = (Account)
    ((OptionalSObject) accountOptionalWithMinNumberOfEmployeesPerType).get('Customer').get();
```

##### `static minimizing(SObjectField field)`

Returns a `SObjectCollector` which produces the maximal element according to `field`, described as an `OptionalSObject` . <p>The result container <strong>cannot</strong> be cast to a specific `OptionalSObject`.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to compare|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Map<String, Object> accountOptionalWithMinNumberOfEmployeesPerType = (Map<String, Object>)
    Stream.of(accounts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get(Account.Type),
            SObjectCollectors.maximizing(Account.NumberOfEmployees)
        ));
Account customerWithMinNumberOfEmployees = (Account)
    ((OptionalSObject) accountOptionalWithMinNumberOfEmployeesPerType).get('Customer').get();
```

---
