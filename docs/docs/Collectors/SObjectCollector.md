# SObjectCollector

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ISObjectCollector](/docs/Collectors/ISObjectCollector.md) interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Collectors

## Methods
### Functions
##### `supplier()`
##### `accumulator()`
##### `finisher()`
---
### Static Methods
##### `static of(ISupplier supplier, IObjectSObjectConsumer accumulator)`

Returns a `SObjectCollector` by the given `supplier` and `accumulator`.

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier function for the `SObjectCollector`|
|`accumulator`|the accumulator function for the `SObjectCollector`|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `accumulator` is null|

##### `static of(ISupplier supplier, IObjectSObjectConsumer accumulator, IFunction finisher)`

Returns a `SObjectCollector` by the given `supplier`, `accumulator`, and `finisher`.

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier function for the `SObjectCollector`|
|`accumulator`|the accumulator function for the `SObjectCollector`|
|`finisher`|the final transformation function for the `SObjectCollector`|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `accumulator` is null|

##### `cast(Type t)`

Returns a `SObjectCollector` that recursively reconstructs collector&apos;s suppliers and returns a new `SObjectCollector` according to a given container type. <p>Supports casting list type for methods:</p> <ul>     <li>#toList(ISObjectFunction)</li>     <li>#toList(String)</li>     <li>#toList(SObjectField)</li> </ul> <p>Supports casting map value type (but not map key type) for methods:</p> <ul>     <li>#toBy<T>map(ISObjectFunction)</li>     <li>#toBy<T>map(String)</li>     <li>#toBy<T>map(SObjectField)</li>     <li>#groupingBy<T>(ISObjectFunction)</li>     <li>#groupingBy<T>(String)</li>     <li>#groupingBy<T>(SObjectField)</li>     <li>#partitioningBy(ISObjectPredicate)</li>     <li>#partitioningBy(ISObjectPredicate, ISObjectCollector)</li> </ul>

###### Parameters
|Param|Description|
|---|---|
|`t`|the Type to cast the result container to|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `t` is null|
|`TypeException`|if invalid `t` is provided|

###### Example
```apex
SObjectCollector.toList('Name').cast(List<String>.class);
```

---
### List<?> Collectors
##### `static toList()`

Returns a `SObjectCollector` that accumulates SObject input arguments into a new `List<SObject>`. <p>The result container can be casted to a specific `SObjectType`.</p> <p>ISObjectIterable.collect(SObjectCollector.toList()) can be replaced with ISObjectIterable.toList()</p>

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Example
```apex
// Accumulates SObjects into a List
List<SObject> sObjs = (List<SObject>) Stream.of(sObjects).collect(SObjectCollector.toList());
List<Account> accs = (List<Account>) Stream.of(accounts).collect(SObjectCollector.toList());
```

##### `static toList(ISObjectFunction mapper)`

Returns a `SObjectCollector` that accumulates the values returned by `mapper` into a new `List<Object>`. <p>The result container can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toList(SObjectFunction.get('Name')));
List<String> accountNames = (List<String>) Stream.of(accounts)
    .collect(SObjectCollector.toList(SObjectFunction.get('Name')).cast(List<String>.class));
```

##### `static toList(String fieldName)`

Returns a `SObjectCollector` that accumulates the values of `fieldName` into a new `List<Object>`. Cross-reference fields and safe navigation are supported. <p>The result container can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toList('Name'));
List<String> parentAccountNames = (List<String>) Stream.of(accounts)
    .collect(SObjectCollector.toList('Parent?.Name')).cast(List<String>.class));
```

##### `static toList(SObjectField field)`

Returns a `SObjectCollector` that accumulates the values of `field` into a new `List<Object>`. <p>The result container can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toList(Account.Name));
List<String> accountNames = (List<String>) Stream.of(accounts)
    .collect(SObjectCollector.toList(Account.Name)).cast(List<String>.class));
```

---
### Set<?> Collectors
##### `static toSet()`

Returns a `SObjectCollector` that accumulates SObject input arguments into a new `Set<SObject>`. <p>The result container <strong>cannot</strong> be casted to a specific `SObjectType`.</p> <p>ISObjectIterable.collect(SObjectCollector.toSet()) can be replaced with ISObjectIterable.toSet()</p>

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Example
```apex
// Accumulates SObjects into a List
Set<SObject> sObjs = (Set<SObject>) Stream.of(sObjects).collect(SObjectCollector.toSet());
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
    .collect(SObjectCollector.toBoolSet(SObjectFunction.get('DoNotCall')));
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
    .collect(SObjectCollector.toBoolSet('DoNotCall'));
Set<Boolean> parentDoNotCalls = (Set<Boolean>) Stream.of(contacts)
    .collect(SObjectCollector.toBoolSet('Parent?.DoNotCall'));
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
    .collect(SObjectCollector.toBoolSet(Contact.DoNotCall));
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
    .collect(SObjectCollector.toIdSet(SObjectFunction.get('Id')));
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
    .collect(SObjectCollector.toIdSet('Id'));
Set<Id> parentOwnerIds = (Set<Id>) Stream.of(accounts)
    .collect(SObjectCollector.toIdSet('Parent?.OwnerId'));
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
    .collect(SObjectCollector.toIdSet(Account.Id)));
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
    .collect(SObjectCollector.toStringSet(SObjectFunction.get('Name')));
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
    .collect(SObjectCollector.toStringSet('Name'));
Set<String> parentNames = (Set<String>) Stream.of(accounts)
    .collect(SObjectCollector.toStringSet('Parent?.Name'));
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
    .collect(SObjectCollector.toStringSet(Account.Name)));
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
    .collect(SObjectCollector.toBlobSet(SObjectFunction.get('Body')));
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
    .collect(SObjectCollector.toBlobSet('Body'));
Set<Blob> parentBodies = (Set<Blob>) Stream.of(attachments)
    .collect(SObjectCollector.toBlobSet('Parent?.Body'));
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
    .collect(SObjectCollector.toBlobSet(Attachment.Body)));
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
    .collect(SObjectCollector.toDateSet(SObjectFunction.get('Birthdate')));
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
    .collect(SObjectCollector.toDateSet('Birthdate'));
Set<Date> parentBirthdates = (Set<Date>) Stream.of(contacts)
    .collect(SObjectCollector.toDateSet('Parent?.Birthdate'));
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
    .collect(SObjectCollector.toDateSet(Contact.Birthdate)));
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
    .collect(SObjectCollector.toDatetimeSet(SObjectFunction.get('ActivityDateTime')));
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
    .collect(SObjectCollector.toDatetimeSet('ActivityDateTime'));
Set<Datetime> activityDateTimes = (Set<Datetime>) Stream.of(events)
    .collect(SObjectCollector.toDatetimeSet('Parent?.ActivityDateTime'));
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
    .collect(SObjectCollector.toDatetimeSet(Event.ActivityDateTime)));
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
    .collect(SObjectCollector.toTimeSet(SObjectFunction.get('StartTime')));
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
    .collect(SObjectCollector.toTimeSet('StartTime'));
Set<Time> parentStartTimes = (Set<Time>) Stream.of(slots)
    .collect(SObjectCollector.toTimeSet('Parent?.StartTime'));
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
    .collect(SObjectCollector.toTimeSet(TimeSlot.StartTime)));
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
    .collect(SObjectCollector.toIntSet(SObjectToIntFunction.get('NumberOfEmployees')));
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
    .collect(SObjectCollector.toIntSet('NumberOfEmployees'));
Set<Integer> parentNumberOfEmployees = (Set<Integer>) Stream.of(accounts)
    .collect(SObjectCollector.toIntSet('Parent?.NumberOfEmployees'));
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
    .collect(SObjectCollector.toIntSet(Account.NumberOfEmployees)));
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
    .collect(SObjectCollector.toLongSet(SObjectToLongFunction.get('NumberOfEmployees')));
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
    .collect(SObjectCollector.toLongSet('NumberOfEmployees'));
Set<Long> parentNumberOfEmployees = (Set<Long>) Stream.of(accounts)
    .collect(SObjectCollector.toLongSet('Parent?.NumberOfEmployees'));
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
    .collect(SObjectCollector.toLongSet(Account.NumberOfEmployees)));
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
    .collect(SObjectCollector.toDoubleSet(SObjectToDoubleFunction.get('BillingLatitude')));
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
    .collect(SObjectCollector.toDoubleSet('BillingLatitude'));
Set<Double> parentBillingLatitudes = (Set<Double>) Stream.of(accounts)
    .collect(SObjectCollector.toDoubleSet('Parent?.BillingLatitude'));
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
    .collect(SObjectCollector.toDoubleSet(Account.BillingLatitude)));
```

##### `static toSet(ISObjectFunction mapper)`

Returns a `SObjectCollector` that accumulates the Object values returned by `mapper` into a new `Set<Object>`. <p>The result container <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `to<T>Set()` collectors such as SObjectCollector.toIdSet, SObjectCollector.toStringSet, etc.</p>

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
    .collect(SObjectCollector.toSet(SObjectFunction.get('Birthdate')));
```

##### `static toSet(String fieldName)`

Returns a `SObjectCollector` that accumulates the Object values of `fieldName` into a new `Set<Double>`. Cross-reference fields and safe navigation are supported. <p>The result container <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `to<T>Set()` collectors such as SObjectCollector.toIdSet, SObjectCollector.toStringSet, etc.</p>

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
    .collect(SObjectCollector.toSet('Birthdate'));
Set<Object> parentBirthdates = (Set<Object>) Stream.of(contacts)
    .collect(SObjectCollector.toSet('Parent?.Birthdate'));
```

##### `static toSet(SObjectField field)`

Returns a `SObjectCollector` that accumulates the Object values of `field` into a new `Set<Object>`. <p>The result container <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `to<T>Set()` collectors such as SObjectCollector.toIdSet, SObjectCollector.toStringSet, etc.</p>

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
    .collect(SObjectCollector.toSet(Contact.Birthdate)));
```

---
### Map<Id, SObject> Collectors
##### `static toMap()`

Returns a `SObjectCollector` that accumulates the SObject values into a `Map<Id, SObject>` <p>The result container value type can be casted to a specific `SObjectType` using SObjectCollector.cast.</p> <p>ISObjectIterable.collect(SObjectCollector.toMap()) can be replaced with ISObjectIterable.toMap()</p>

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`


**See** SObjectCollector.toByIdMap

###### Example
```apex
// Accumulates SObjects into a List
Map<Id, SObject> sObjs = (Map<Id, SObject>) Stream.of(sObjects)
    .collect(SObjectCollector.toMap());
Map<Id, Account> accs = (Map<Id, Account>) Stream.of(accounts)
    .collect(SObjectCollector.toMap().cast(Map<Id, Account));
```

##### `static toByIdMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Id, SObject> contactByAccountId = (Map<Id, SObject>) Stream.of(contacts)
    .collect(SObjectCollector.toByIdMap('AccountId'));
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toByIdMap('AccountId').cast(Map<Id, Contact>.class));
```

##### `static toByIdMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Id, SObject> contactByAccountId = (Map<Id, SObject>) Stream.of(contacts)
    .collect(SObjectCollector.toByIdMap(Contact.AccountId));
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toByIdMap(Contact.AccountId).cast(Map<Id, Contact>.class));
```

##### `static toByIdMap(ISObjectFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<Id, SObject> contactByAccountId = (Map<Id, SObject>) Stream.of(contacts)
    .collect(SObjectCollector.toByIdMap(SObjectFunction.get('AccountId')));
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toByIdMap(SObjectFunction.get('AccountId')).cast(Map<Id, Contact>.class));
```

##### `static toByIdMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByIdMap(
        SObjectFunction.get('AccountId'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Id, Contact>.class));
```

---
### Map<Boolean, Object> Collectors
##### `static toByBoolMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Boolean, Object> contactByDoNotCall = (Map<Boolean, Object>) Stream.of(contacts)
    .collect(SObjectCollector.toByBoolMap(
        SObjectFunction.get('DoNotCall'),
        SObjectFunction.identity()
    ));
Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toByBoolMap(
        SObjectFunction.get('DoNotCall'),
        SObjectFunction.identity()
    ).cast(Map<Boolean, Contact>.class));
Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) Stream.of(contacts)
    .collect(SObjectCollector.toByBoolMap(
        SObjectFunction.get('DoNotCall'),
        SObjectFunction.get('LastName')
    ).cast(Map<Boolean, String>.class));
```

##### `static toByBoolMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByBoolMap(
        SObjectFunction.get('DoNotCall'),
        SObjectFunction.get('LastName'),
        BinaryOperator.right()
    ).cast(Map<Boolean, String>.class));
```

##### `static toByBoolMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByBoolMap(
        SObjectFunction.get('DoNotCall'),
        SObjectFunction.get('LastName'),
        BinaryOperator.right(),
        Supplier.of(Map<Boolean, String>.class),
    ));
```

##### `static toByBoolMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) Stream.of(contacts)
    .collect(SObjectCollector.toByBoolMap('DoNotCall', 'LastName').cast(Map<Boolean, String>.class));
```

##### `static toByBoolMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` or `valueField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) Stream.of(contacts)
    .collect(SObjectCollector.toByBoolMap(
        Contact.DoNotCall,
       Contact.LastName
   ).cast(Map<Boolean, String>.class));
```

---
### Map<Boolean, SObject> Collectors
##### `static toByBoolMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Boolean, SObject> contactByDoNotCall = (Map<Boolean, SObject>) Stream.of(contacts)
    .collect(SObjectCollector.toByBoolMap('DoNotCall'));
Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toByBoolMap('DoNotCall').cast(Map<Boolean, Contact>.class));
```

##### `static toByBoolMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Boolean, SObject> contactByDoNotCall = (Map<Boolean, SObject>) Stream.of(contacts)
    .collect(SObjectCollector.toByBoolMap(Contact.DoNotCall));
Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toByBoolMap(Contact.DoNotCall).cast(Map<Boolean, Contact>.class));
```

##### `static toByBoolMap(ISObjectFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByBoolMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<Boolean, SObject> contactByDoNotCall = (Map<Boolean, SObject>) Stream.of(contacts)
    .collect(SObjectCollector.toByBoolMap(
        SObjectFunction.get('DoNotCall')
    ));
Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toByBoolMap(
        SObjectFunction.get('DoNotCall')
    ).cast(Map<Boolean, Contact>.class));
```

##### `static toByBoolMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Boolean, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByBoolMap(
        SObjectFunction.get('DoNotCall'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Boolean, Contact>.class));
```

---
### Map<Id, Object> Collectors
##### `static toByIdMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Id, Object> contactByAccountId = (Map<Id, Object>) Stream.of(contacts)
    .collect(SObjectCollector.toByIdMap(
        SObjectFunction.get('AccountId'),
        SObjectFunction.identity()
    ));
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toByIdMap(
        SObjectFunction.get('AccountId'),
        SObjectFunction.identity()
    ).cast(Map<Id, Contact>.class));
Map<Id, String> lastNameByAccountId = (Map<Id, String>) Stream.of(contacts)
    .collect(SObjectCollector.toByIdMap(
        SObjectFunction.get('AccountId'),
        SObjectFunction.get('LastName')
    ).cast(Map<Id, String>.class));
```

##### `static toByIdMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByIdMap(
        SObjectFunction.get('AccountId'),
        SObjectFunction.get('LastName'),
        BinaryOperator.right()
    ).cast(Map<Id, String>.class));
```

##### `static toByIdMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByIdMap(
        SObjectFunction.get('AccountId'),
        SObjectFunction.get('LastName'),
        BinaryOperator.right(),
        Supplier.of(Map<Id, String>.class)
    ));
```

##### `static toByIdMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Id, String> lastNameByAccountId = (Map<Id, String>) Stream.of(contacts)
    .collect(SObjectCollector.toByIdMap(
        'AccountId',
        'LastName'
    ).cast(Map<Id, String>.class));
```

##### `static toByIdMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Id, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByIdMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` or `valueField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Id, String> lastNameByAccountId = (Map<Id, String>) Stream.of(contacts)
    .collect(SObjectCollector.toByIdMap(
        Contact.AccountId,
        Contact.LastName
    ).cast(Map<Id, String>.class));
```

---
### Map<String, Object> Collectors
##### `static toByStringMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<String, Object> contactByFirstName = (Map<String, Object>) Stream.of(contacts)
    .collect(SObjectCollector.toByStringMap(
        SObjectFunction.get('FirstName'),
        SObjectFunction.identity()
    ));
Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toByStringMap(
        SObjectFunction.get('FirstName'),
        SObjectFunction.identity()
    ).cast(Map<String, Contact>.class));
Map<String, String> lastNameByFirstName = (Map<String, String>) Stream.of(contacts)
    .collect(SObjectCollector.toByStringMap(
        SObjectFunction.get('FirstName'),
        SObjectFunction.get('LastName')
    ).cast(Map<String, String>.class));
```

##### `static toByStringMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByStringMap(
        SObjectFunction.get('FirstName'),
        SObjectFunction.get('LastName'),
        BinaryOperator.right()
    ).cast(Map<String, String>.class));
```

##### `static toByStringMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByStringMap(
        SObjectFunction.get('FirstName'),
        SObjectFunction.get('LastName'),
        BinaryOperator.right(),
        Supplier.of(Map<String, String>.class)
    ));
```

##### `static toByStringMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<String, String> lastNameByFirstName = (Map<String, String>) Stream.of(contacts)
    .collect(SObjectCollector.toByStringMap(
        'FirstName',
        'LastName'
    ).cast(Map<String, String>.class));
```

##### `static toByStringMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` or `valueField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<String, String> lastNameByFirstName = (Map<String, String>) Stream.of(contacts)
    .collect(SObjectCollector.toByStringMap(
        Contact.FirstName,
        Contact.LastName
    ).cast(Map<String, String>.class));
```

---
### Map<String, SObject> Collectors
##### `static toByStringMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<String, SObject> contactByFirstName = (Map<String, SObject>) Stream.of(contacts)
    .collect(SObjectCollector.toByStringMap('FirstName'));
Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toByStringMap('FirstName').cast(Map<String, Contact>.class));
```

##### `static toByStringMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<String, SObject> contactByFirstName = (Map<String, SObject>) Stream.of(contacts)
    .collect(SObjectCollector.toByStringMap(Contact.FirstName));
Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toByStringMap(Contact.FirstName).cast(Map<String, Contact>.class));
```

##### `static toByStringMap(ISObjectFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByStringMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<String, SObject> contactByFirstName = (Map<String, SObject>) Stream.of(contacts)
    .collect(SObjectCollector.toByStringMap(
        SObjectFunction.get('FirstName')
    ));
Map<String, Contact> contactByFirstName = (Map<String, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toByStringMap(
        SObjectFunction.get('FirstName')
    ).cast(Map<String, Contact>.class));
```

##### `static toByStringMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<String, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByStringMap(
        SObjectFunction.get('FirstName'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<String, Contact>.class));
```

---
### Map<Blob, Object> Collectors
##### `static toByBlobMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Blob, Object> attachmentByBody = (Map<Blob, Object>) Stream.of(attachments)
    .collect(SObjectCollector.toByBlobMap(
        SObjectFunction.get('Body'),
        SObjectFunction.identity()
    ));
Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
    .collect(SObjectCollector.toByBlobMap(
        SObjectFunction.get('Body'),
        SObjectFunction.identity()
    ).cast(Map<Blob, Attachment>.class));
Map<Blob, String> nameByBody = (Map<Blob, String>) Stream.of(attachments)
    .collect(SObjectCollector.toByBlobMap(
        SObjectFunction.get('Body'),
        SObjectFunction.get('Name')
    ).cast(Map<Blob, String>.class));
```

##### `static toByBlobMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByBlobMap(
        SObjectFunction.get('Body'),
        SObjectFunction.get('Name'),
        BinaryOperator.right()
    ).cast(Map<Blob, String>.class));
```

##### `static toByBlobMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByBlobMap(
        SObjectFunction.get('Body'),
        SObjectFunction.get('Name'),
        BinaryOperator.right(),
        Supplier.of(Map<Blob, String>.class)
    ));
```

##### `static toByBlobMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Blob, String> nameByBody = (Map<Blob, String>) Stream.of(attachments)
    .collect(SObjectCollector.toByBlobMap(
        'Body',
        'Name'
    ).cast(Map<Blob, String>.class));
```

##### `static toByBlobMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` or `valueField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Blob, String> nameByBody = (Map<Blob, String>) Stream.of(attachments)
    .collect(SObjectCollector.toByBlobMap(
        Attachment.Body,
        Attachment.Name
    ).cast(Map<Blob, String>.class));
```

---
### Map<Blob, SObject> Collectors
##### `static toByBlobMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Blob, SObject> attachmentByBody = (Map<Blob, SObject>) Stream.of(attachments)
    .collect(SObjectCollector.toByBlobMap('Body'));
Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
    .collect(SObjectCollector.toByBlobMap('Body').cast(Map<Blob, Attachment>.class));
```

##### `static toByBlobMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Blob, SObject> attachmentByBody = (Map<Blob, SObject>) Stream.of(attachments)
    .collect(SObjectCollector.toByBlobMap(Attachment.Body));
Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
    .collect(SObjectCollector.toByBlobMap(Attachment.Body).cast(Map<Blob, Attachment>.class));
```

##### `static toByBlobMap(ISObjectFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByBlobMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<Blob, SObject> attachmentByBody = (Map<Blob, SObject>) Stream.of(attachments)
    .collect(SObjectCollector.toByBlobMap(
        SObjectFunction.get('Body')
    ));
Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) Stream.of(attachments)
    .collect(SObjectCollector.toByBlobMap(
        SObjectFunction.get('Body')
    ).cast(Map<Blob, Attachment>.class));
```

##### `static toByBlobMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Blob, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByBlobMap(
        SObjectFunction.get('Body'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Blob, Attachment>.class));
```

---
### Map<Date, Object> Collectors
##### `static toByDateMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Date, Object> contactByBirthdate = (Map<Date, Object>) Stream.of(contacts)
    .collect(SObjectCollector.toByDateMap(
        SObjectFunction.get('Birthdate'),
        SObjectFunction.identity()
    ));
Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toByDateMap(
        SObjectFunction.get('Birthdate'),
        SObjectFunction.identity()
    ).cast(Map<Date, Contact>.class));
Map<Date, String> lastNameByBirthdate = (Map<Date, String>) Stream.of(contacts)
    .collect(SObjectCollector.toByDateMap(
        SObjectFunction.get('Birthdate'),
        SObjectFunction.get('LastName')
    ).cast(Map<Date, String>.class));
```

##### `static toByDateMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByDateMap(
        SObjectFunction.get('Birthdate'),
        SObjectFunction.get('LastName'),
        BinaryOperator.right()
    ).cast(Map<Date, String>.class));
```

##### `static toByDateMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByDateMap(
        SObjectFunction.get('Birthdate'),
        SObjectFunction.get('LastName'),
        BinaryOperator.right(),
        Supplier.of(Map<Date, String>.class)
    ));
```

##### `static toByDateMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Date, String> lastNameByBirthdate = (Map<Date, String>) Stream.of(contacts)
    .collect(SObjectCollector.toByDateMap(
        'Birthdate',
        'LastName'
    ).cast(Map<Date, String>.class));
```

##### `static toByDateMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` or `valueField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Date, String> lastNameByBirthdate = (Map<Date, String>) Stream.of(contacts)
    .collect(SObjectCollector.toByDateMap(
        Contact.Birthdate,
        Contact.LastName
    ).cast(Map<Date, String>.class));
```

---
### Map<Date, SObject> Collectors
##### `static toByDateMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Date, SObject> contactByBirthdate = (Map<Date, SObject>) Stream.of(contacts)
    .collect(SObjectCollector.toByDateMap('Birthdate'));
Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toByDateMap('Birthdate').cast(Map<Date, Contact>.class));
```

##### `static toByDateMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Date, SObject> contactByBirthdate = (Map<Date, SObject>) Stream.of(contacts)
    .collect(SObjectCollector.toByDateMap(Contact.Birthdate));
Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toByDateMap(Contact.Birthdate).cast(Map<Date, Contact>.class));
```

##### `static toByDateMap(ISObjectFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByDateMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<Date, SObject> contactByBirthdate = (Map<Date, SObject>) Stream.of(contacts)
    .collect(SObjectCollector.toByDateMap(
        SObjectFunction.get('Birthdate')
    ));
Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toByDateMap(
        SObjectFunction.get('Birthdate')
    ).cast(Map<Date, Contact>.class));
```

##### `static toByDateMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Date, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByDateMap(
        SObjectFunction.get('Birthdate'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Date, Contact>.class));
```

---
### Map<Datetime, Object> Collectors
##### `static toByDatetimeMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Datetime, Object> eventByActivityDateTime = (Map<Datetime, Object>) Stream.of(events)
    .collect(SObjectCollector.toByDatetimeMap(
        SObjectFunction.get('ActivityDateTime'),
        SObjectFunction.identity()
    ));
Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
    .collect(SObjectCollector.toByDatetimeMap(
        SObjectFunction.get('ActivityDateTime'),
        SObjectFunction.identity()
    ).cast(Map<Datetime, Event>.class));
Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) Stream.of(events)
    .collect(SObjectCollector.toByDatetimeMap(
        SObjectFunction.get('ActivityDateTime'),
        SObjectFunction.get('Description')
    ).cast(Map<Datetime, String>.class));
```

##### `static toByDatetimeMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByDatetimeMap(
        SObjectFunction.get('ActivityDateTime'),
        SObjectFunction.get('Description'),
        BinaryOperator.right()
    ).cast(Map<Datetime, String>.class));
```

##### `static toByDatetimeMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByDatetimeMap(
        SObjectFunction.get('ActivityDateTime'),
        SObjectFunction.get('Description'),
        BinaryOperator.right(),
        Supplier.of(Map<Datetime, String>.class)
    ));
```

##### `static toByDatetimeMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) Stream.of(events)
    .collect(SObjectCollector.toByDatetimeMap(
        'ActivityDateTime',
        'Description'
    ).cast(Map<Datetime, String>.class));
```

##### `static toByDatetimeMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` or `valueField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Datetime, String> descriptionByActivityDateTime = (Map<Datetime, String>) Stream.of(events)
    .collect(SObjectCollector.toByDatetimeMap(
        Event.ActivityDateTime,
        Event.Description
    ).cast(Map<Datetime, String>.class));
```

---
### Map<Datetime, SObject> Collectors
##### `static toByDatetimeMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Datetime, SObject> eventByActivityDateTime = (Map<Datetime, SObject>) Stream.of(events)
    .collect(SObjectCollector.toByDatetimeMap('ActivityDateTime'));
Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
    .collect(SObjectCollector.toByDatetimeMap('ActivityDateTime').cast(Map<Datetime, Event>.class));
```

##### `static toByDatetimeMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Datetime, SObject> eventByActivityDateTime = (Map<Datetime, SObject>) Stream.of(events)
    .collect(SObjectCollector.toByDatetimeMap(Event.ActivityDateTime));
Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
    .collect(SObjectCollector.toByDatetimeMap(Event.ActivityDateTime).cast(Map<Datetime, Event>.class));
```

##### `static toByDatetimeMap(ISObjectFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<Datetime, SObject> eventByActivityDateTime = (Map<Datetime, SObject>) Stream.of(events)
    .collect(SObjectCollector.toByDatetimeMap(
        SObjectFunction.get('ActivityDateTime')
    ));
Map<Datetime, Event> eventByActivityDateTime = (Map<Datetime, Event>) Stream.of(events)
    .collect(SObjectCollector.toByDatetimeMap(
        SObjectFunction.get('ActivityDateTime')
    ).cast(Map<Datetime, Event>.class));
```

##### `static toByDatetimeMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByDatetimeMap(
        SObjectFunction.get('ActivityDateTime'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Datetime, Event>.class));
```

---
### Map<Time, Object> Collectors
##### `static toByTimeMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Time, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Time, Object> timeSlotByStartTime = (Map<Time, Object>) Stream.of(slots)
    .collect(SObjectCollector.toByTimeMap(
        SObjectFunction.get('StartTime'),
        SObjectFunction.identity()
    ));
Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
    .collect(SObjectCollector.toByTimeMap(
        SObjectFunction.get('StartTime'),
        SObjectFunction.identity()
    ).cast(Map<Time, TimeSlot>.class));
Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) Stream.of(slots)
    .collect(SObjectCollector.toByTimeMap(
        SObjectFunction.get('StartTime'),
        SObjectFunction.get('EndTime')
    ).cast(Map<Time, Time>.class));
```

##### `static toByTimeMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Time, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByTimeMap(
        SObjectFunction.get('StartTime'),
        SObjectFunction.get('EndTime'),
        BinaryOperator.right()
    ).cast(Map<Time, Time>.class));
```

##### `static toByTimeMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Time, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByTimeMap(
        SObjectFunction.get('StartTime'),
        SObjectFunction.get('EndTime'),
        BinaryOperator.right(),
        Supplier.of(Map<Time, Time>.class)
    ));
```

##### `static toByTimeMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Time, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) Stream.of(slots)
    .collect(SObjectCollector.toByTimeMap(
        'StartTime',
        'EndTime'
    ).cast(Map<Time, Time>.class));
```

##### `static toByTimeMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Time, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` or `valueField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) Stream.of(slots)
    .collect(SObjectCollector.toByTimeMap(
        TimeSlot.StartTime,
        TimeSlot.EndTime
    ).cast(Map<Time, Time>.class));
```

---
### Map<Time, SObject> Collectors
##### `static toByTimeMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Time, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Time, SObject> timeSlotByStartTime = (Map<Time, SObject>) Stream.of(slots)
    .collect(SObjectCollector.toByTimeMap('StartTime'));
Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
    .collect(SObjectCollector.toByTimeMap('StartTime').cast(Map<Time, TimeSlot>.class));
```

##### `static toByTimeMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Datetime, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByDatetimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Time, SObject> timeSlotByStartTime = (Map<Time, SObject>) Stream.of(slots)
    .collect(SObjectCollector.toByTimeMap(TimeSlot.StartTime));
Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
    .collect(SObjectCollector.toByTimeMap(TimeSlot.StartTime).cast(Map<Time, TimeSlot>.class));
```

##### `static toByTimeMap(ISObjectFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Time, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByTimeMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<Time, SObject> timeSlotByStartTime = (Map<Time, SObject>) Stream.of(slots)
    .collect(SObjectCollector.toByTimeMap(
        SObjectFunction.get('StartTime')
    ));
Map<Time, TimeSlot> timeSlotByStartTime = (Map<Time, TimeSlot>) Stream.of(slots)
    .collect(SObjectCollector.toByTimeMap(
        SObjectFunction.get('StartTime')
    ).cast(Map<Time, TimeSlot>.class));
```

##### `static toByTimeMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Time, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByTimeMap(
        SObjectFunction.get('StartTime'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Time, TimeSlot>.class));
```

---
### Map<Integer, Object> Collectors
##### `static toByIntMap(ISObjectToIntFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Integer, Object> accountByNumberOfEmployees = (Map<Integer, Object>) Stream.of(accounts)
    .collect(SObjectCollector.toByIntMap(
        SObjectToIntFunction.get('NumberOfEmployees'),
        SObjectFunction.identity()
    ));
Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
    .collect(SObjectCollector.toByIntMap(
        SObjectToIntFunction.get('NumberOfEmployees'),
        SObjectFunction.identity()
    ).cast(Map<Integer, Account>.class));
Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) Stream.of(accounts)
    .collect(SObjectCollector.toByIntMap(
        SObjectToIntFunction.get('NumberOfEmployees'),
        SObjectFunction.get('Name')
    ).cast(Map<Integer, String>.class));
```

##### `static toByIntMap(ISObjectToIntFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByIntMap(
        SObjectToIntFunction.get('NumberOfEmployees'),
        SObjectFunction.get('Name'),
        BinaryOperator.right()
    ).cast(Map<Integer, String>.class));
```

##### `static toByIntMap(ISObjectToIntFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByIntMap(
        SObjectToIntFunction.get('NumberOfEmployees'),
        SObjectFunction.get('Name'),
        BinaryOperator.right(),
        Supplier.of(Map<Integer, String>.class)
    ));
```

##### `static toByIntMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) Stream.of(accounts)
    .collect(SObjectCollector.toByIntMap(
        'NumberOfEmployees',
        'Name'
    ).cast(Map<Integer, String>.class));
```

##### `static toByIntMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` or `valueField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Integer, String> nameByNumberOfEmployees = (Map<Integer, String>) Stream.of(accounts)
    .collect(SObjectCollector.toByIntMap(
        Account.NumberOfEmployees,
        Account.Name
    ).cast(Map<Integer, String>.class));
```

---
### Map<Integer, SObject> Collectors
##### `static toByIntMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, Object>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Integer, SObject> accountByNumberOfEmployees = (Map<Integer, SObject>) Stream.of(accounts)
    .collect(SObjectCollector.toByIntMap('NumberOfEmployees'));
Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
    .collect(SObjectCollector.toByIntMap('NumberOfEmployees').cast(Map<Integer, Account>.class));
```

##### `static toByIntMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, Object>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Integer, SObject> accountByNumberOfEmployees = (Map<Integer, SObject>) Stream.of(accounts)
    .collect(SObjectCollector.toByIntMap(Account.NumberOfEmployees));
Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
    .collect(SObjectCollector.toByIntMap(Account.NumberOfEmployees).cast(Map<Integer, Account>.class));
```

##### `static toByIntMap(ISObjectToIntFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByIntMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Integer, SObject> accountByNumberOfEmployees = (Map<Integer, SObject>) Stream.of(accounts)
    .collect(SObjectCollector.toByIntMap(
        SObjectToIntFunction.get('NumberOfEmployees')
    ));
Map<Integer, Account> accountByNumberOfEmployees = (Map<Integer, Account>) Stream.of(accounts)
    .collect(SObjectCollector.toByIntMap(
        SObjectToIntFunction.get('NumberOfEmployees')
    ).cast(Map<Integer, Account>.class));
```

##### `static toByIntMap(ISObjectToIntFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Integer, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByIntMap(
        SObjectToIntFunction.get('NumberOfEmployees'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Integer, Account>.class));
```

---
### Map<Long, Object> Collectors
##### `static toByLongMap(ISObjectToLongFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Long, Object> accountByNumberOfEmployees = (Map<Long, Object>) Stream.of(accounts)
    .collect(SObjectCollector.toByLongMap(
        SObjectToLongFunction.get('NumberOfEmployees'),
        SObjectFunction.identity()
    ));
Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
    .collect(SObjectCollector.toByLongMap(
        SObjectToLongFunction.get('NumberOfEmployees'),
        SObjectFunction.identity()
    ).cast(Map<Long, Account>.class));
Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) Stream.of(accounts)
    .collect(SObjectCollector.toByLongMap(
        SObjectToLongFunction.get('NumberOfEmployees'),
        SObjectFunction.get('Name')
    ).cast(Map<Long, String>.class));
```

##### `static toByLongMap(ISObjectToLongFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByLongMap(
        SObjectToLongFunction.get('NumberOfEmployees'),
        SObjectFunction.get('Name'),
        BinaryOperator.right()
    ).cast(Map<Long, String>.class));
```

##### `static toByLongMap(ISObjectToLongFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByLongMap(
        SObjectToLongFunction.get('NumberOfEmployees'),
        SObjectFunction.get('Name'),
        BinaryOperator.right(),
        Supplier.of(Map<Long, String>.class)
    ));
```

##### `static toByLongMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) Stream.of(accounts)
    .collect(SObjectCollector.toByIntMap(
        'NumberOfEmployees',
        'Name'
    ).cast(Map<Long, String>.class));
```

##### `static toByLongMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` or `valueField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Long, String> nameByNumberOfEmployees = (Map<Long, String>) Stream.of(accounts)
    .collect(SObjectCollector.toByLongMap(
        Account.NumberOfEmployees,
        Account.Name
    ).cast(Map<Long, String>.class));
```

---
### Map<Long, SObject> Collectors
##### `static toByLongMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, SObject>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Long, SObject> accountByNumberOfEmployees = (Map<Long, SObject>) Stream.of(accounts)
    .collect(SObjectCollector.toByLongMap('NumberOfEmployees'));
Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
    .collect(SObjectCollector.toByLongMap('NumberOfEmployees').cast(Map<Long, Account>.class));
```

##### `static toByLongMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, SObject>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByLongMap(ISObjectToLongFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Long, SObject> accountByNumberOfEmployees = (Map<Long, SObject>) Stream.of(accounts)
    .collect(SObjectCollector.toByLongMap(Account.NumberOfEmployees));
Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
    .collect(SObjectCollector.toByLongMap(Account.NumberOfEmployees).cast(Map<Long, Account>.class));
```

##### `static toByLongMap(ISObjectToLongFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByLongMap(ISObjectToIntFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Long, SObject> accountByNumberOfEmployees = (Map<Long, SObject>) Stream.of(accounts)
    .collect(SObjectCollector.toByLongMap(
        SObjectFunction.get('NumberOfEmployees')
    ));
Map<Long, Account> accountByNumberOfEmployees = (Map<Long, Account>) Stream.of(accounts)
    .collect(SObjectCollector.toByLongMap(
        SObjectFunction.get('NumberOfEmployees')
    ).cast(Map<Long, Account>.class));
```

##### `static toByLongMap(ISObjectToLongFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Long, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByLongMap(
        SObjectToLongFunction.get('NumberOfEmployees'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Long, Account>.class));
```

---
### Map<Double, Object> Collectors
##### `static toByDoubleMap(ISObjectToDoubleFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Double, Object> accountByBillingLatitude = (Map<Double, Object>) Stream.of(accounts)
    .collect(SObjectCollector.toByDoubleMap(
        SObjectToDoubleFunction.get('BillingLatitude'),
        SObjectFunction.identity()
    ));
Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
    .collect(SObjectCollector.toByDoubleMap(
        SObjectToDoubleFunction.get('BillingLatitude'),
        SObjectFunction.identity()
    ).cast(Map<Double, Account>.class));
Map<Double, String> nameByBillingLatitude = (Map<Double, String>) Stream.of(accounts)
    .collect(SObjectCollector.toByDoubleMap(
        SObjectToDoubleFunction.get('BillingLatitude'),
        SObjectFunction.get('Name')
    ).cast(Map<Double, String>.class));
```

##### `static toByDoubleMap(ISObjectToDoubleFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByDoubleMap(
        SObjectToDoubleFunction.get('BillingLatitude'),
        SObjectFunction.get('Name'),
        BinaryOperator.right()
    ).cast(Map<Double, String>.class));
```

##### `static toByDoubleMap(ISObjectToDoubleFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByDoubleMap(
        SObjectToDoubleFunction.get('BillingLatitude'),
        SObjectFunction.get('Name'),
        BinaryOperator.right(),
        Supplier.of(Map<Double, String>.class)
    ));
```

##### `static toByDoubleMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Double, String> nameByBillingLatitude = (Map<Double, String>) Stream.of(accounts)
    .collect(SObjectCollector.toByDoubleMap(
        'BillingLatitude',
        'Name'
    ).cast(Map<Double, String>.class));
```

##### `static toByDoubleMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` or `valueField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Double, String> nameByBillingLatitude = (Map<Double, String>) Stream.of(accounts)
    .collect(SObjectCollector.toByDoubleMap(
        Account.BillingLatitude,
        Account.Name
    ).cast(Map<Double, String>.class));
```

---
### Map<Double, SObject> Collectors
##### `static toByDoubleMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, SObject>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Double, SObject> accountByBillingLatitude = (Map<Double, SObject>) Stream.of(accounts)
    .collect(SObjectCollector.toByDoubleMap('BillingLatitude'));
Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
    .collect(SObjectCollector.toByDoubleMap('BillingLatitude').cast(Map<Double, Account>.class));
```

##### `static toByDoubleMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, SObject>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByDoubleMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Double, SObject> accountByBillingLatitude = (Map<Double, SObject>) Stream.of(accounts)
    .collect(SObjectCollector.toByDoubleMap(Account.BillingLatitude));
Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
    .collect(SObjectCollector.toByDoubleMap(Account.BillingLatitude).cast(Map<Double, Account>.class));
```

##### `static toByDoubleMap(ISObjectToDoubleFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toByLongMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
|`NullPointerException`|if `keyMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Double, SObject> accountByBillingLatitude = (Map<Double, SObject>) Stream.of(accounts)
    .collect(SObjectCollector.toByDoubleMap(
        SObjectToDoubleFunction.get('BillingLatitude')
    ));
Map<Double, Account> accountByBillingLatitude = (Map<Double, Account>) Stream.of(accounts)
    .collect(SObjectCollector.toByDoubleMap(
        SObjectToDoubleFunction.get('BillingLatitude')
    ).cast(Map<Double, Account>.class));
```

##### `static toByDoubleMap(ISObjectToDoubleFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Double, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
    .collect(SObjectCollector.toByDoubleMap(
        SObjectToDoubleFunction.get('BillingLatitude'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Double, Account>.class));
```

---
### Map<Object, Object> Collectors
##### `static toMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollector.toByIdMap, SObjectCollector.toByStringMap, etc.</p>

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
|`NullPointerException`|if `keyMapper` or `valueMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping functions
Map<Object, Object> contactByBirthdate = (Map<Object, Object>) Stream.of(contacts)
    .collect(SObjectCollector.toMap(
        SObjectFunction.get('Birthdate'),
        SObjectFunction.identity()
    ));
Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toMap(
        SObjectFunction.get('Birthdate'),
        SObjectFunction.identity()
    ).cast(Map<Object, Contact>.class));
Map<Object, String> lastNameByBirthdate = (Map<Object, String>) Stream.of(contacts)
    .collect(SObjectCollector.toMap(
        SObjectFunction.get('Birthdate'),
        SObjectFunction.get('LastName')
    ).cast(Map<Object, String>.class));
```

##### `static toMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollector.toByIdMap, SObjectCollector.toByStringMap, etc.</p>

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
    .collect(SObjectCollector.toMap(
        SObjectFunction.get('Birthdate'),
        SObjectFunction.get('LastName'),
        BinaryOperator.right()
    ).cast(Map<Object, String>.class));
```

##### `static toMap(ISObjectFunction keyMapper, ISObjectFunction valueMapper, IBinaryOperator merger, ISupplier mapSupplier)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, Object>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollector.toByIdMap, SObjectCollector.toByStringMap, etc.</p>

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
    .collect(SObjectCollector.toMap(
        SObjectFunction.get('Birthdate'),
        SObjectFunction.get('LastName'),
        BinaryOperator.right(),
        Supplier.of(Map<Object, String>.class)
    ));
```

##### `static toMap(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, Object>` whose keys and values are values of `keyFieldName` and `valueFieldName` of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollector.toByIdMap, SObjectCollector.toByStringMap, etc.</p>

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
|`NullPointerException`|if `keyFieldName` or `valueFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Object, String> lastNameByBirthdate = (Map<Object, String>) Stream.of(contacts)
    .collect(SObjectCollector.toMap(
        'Birtdate',
        'LastName'
    ).cast(Map<Object, String>.class));
```

##### `static toMap(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, Object>` whose keys and values are values of `keyField` and `valueField` of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollector.toByIdMap, SObjectCollector.toByStringMap, etc.</p>

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
|`NullPointerException`|if `keyField` or `valueField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by fields
Map<Object, String> lastNameByBirthdate = (Map<Object, String>) Stream.of(contacts)
    .collect(SObjectCollector.toMap(
        Contact.Birthdate,
        Contact.LastName
    ).cast(Map<Object, String>.class));
```

---
### Map<Object, SObject> Collectors
##### `static toMap(String keyFieldName)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, SObject>` whose keys are values of `keyFieldName` and values are values of the SObject input arguments. Cross-reference fields and safe navigation are supported. If the mapped keys might have duplicates, use SObjectCollector.toMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollector.toByIdMap, SObjectCollector.toByStringMap, etc.</p>

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
|`NullPointerException`|if `keyFieldName` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Object, SObject> contactByBirthdate = (Map<Object, SObject>) Stream.of(contacts)
    .collect(SObjectCollector.toMap('Birthdate'));
Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toMap('Birthdate').cast(Map<Double, Contact>.class));
```

##### `static toMap(SObjectField keyField)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, SObject>` whose keys are values of `keyField` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toMap(ISObjectToDoubleFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollector.toByIdMap, SObjectCollector.toByStringMap, etc.</p>

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
|`NullPointerException`|if `keyField` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by field
Map<Object, SObject> contactByBirthdate = (Map<Object, SObject>) Stream.of(contacts)
    .collect(SObjectCollector.toMap(Contact.Birthdate));
Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toMap(Contact.Birthdate).cast(Map<Object, Contact>.class));
```

##### `static toMap(ISObjectFunction keyMapper)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, SObject>` whose keys are values returned by `keyMapper` and values are values of the SObject input arguments. If the mapped keys might have duplicates, use SObjectCollector.toMap(ISObjectFunction, ISObjectFunction, IBinaryOperator) instead. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollector.toByIdMap, SObjectCollector.toByStringMap, etc.</p>

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
|`NullPointerException`|if `keyMapper` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
// Maps values by keys provided by mapping function
Map<Object, SObject> contactByBirthdate = (Map<Object, SObject>) Stream.of(contacts)
    .collect(SObjectCollector.toMap(
        SObjectFunction.get('Birthdate')
    ));
Map<Object, Contact> contactByBirthdate = (Map<Object, Contact>) Stream.of(contacts)
    .collect(SObjectCollector.toMap(
        SObjectFunction.get('Birthdate')
    ).cast(Map<Object, Contact>.class));
```

##### `static toMap(ISObjectFunction keyMapper, ISObjectUnaryOperator valueMapper, ISObjectBinaryOperator merger)`

Returns a `SObjectCollector` that accumulates elements into a `Map<Object, SObject>` whose keys and values are the result of applying `keyMapper` and `valueMapper` mapping functions to the SObject input arguments. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `to<T>Map()` collectors such as SObjectCollector.toByIdMap, SObjectCollector.toByStringMap, etc.</p>

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
    .collect(SObjectCollector.toMap(
        SObjectFunction.get('Birthdate'),
        SObjectUnaryOperator.identity(),
        BinaryOperator.right()
    ).cast(Map<Object, Contact>.class));
```

---
### Map<Boolean, ?> Collectors
##### `static groupingByBool(ISObjectFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Boolean, List<Object>>`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByBool(
            SObjectFunction.get('DoNotCall')
        ));
Map<Boolean, List<Contact>> contactsByDoNotCall = (Map<Boolean, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollector.groupingByBool(
            SObjectFunction.get('DoNotCall')
        ).cast(Map<Boolean, List<Contact>>.class));
```

##### `static groupingByBool(ISObjectFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByBool(
            SObjectFunction.get('DoNotCall'),
            SObjectCollector.toSet()
        ));
Map<Boolean, Set<SObject>> contactsByDoNotCall = (Map<Boolean, Set<SObject>>)
    Stream.of(contacts)
        .collect(SObjectCollector.groupingByBool(
            SObjectFunction.get('DoNotCall'),
            SObjectCollector.toSet()
        ).cast(Map<Boolean, Set<SObject>>.class));
```

##### `static groupingByBool(ISObjectFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByBool(
            SObjectFunction.get('DoNotCall'),
            Supplier.of(Map<Boolean, Set<SObject>>.class),
            SObjectCollector.toSet()
        ));
```

##### `static groupingByBool(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByBool(
            'DoNotCall',
            'LastName'
        ).cast(Map<Boolean, List<String>>.class));
```

##### `static groupingByBool(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByBool(
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
        .collect(SObjectCollector.groupingByBool('DoNotCall'));
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
        .collect(SObjectCollector.groupingByBool(Contact.DoNotCall));
```

---
### Map<Id, ?> Collectors
##### `static groupingById(ISObjectFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Id, List<Object>>`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingById(
            SObjectFunction.get('AccountId')
        ));
Map<Id, List<Contact>> contactsByAccountId = (Map<Id, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollector.groupingById(
            SObjectFunction.get('AccountId')
        ).cast(Map<Id, List<Contact>>.class));
```

##### `static groupingById(ISObjectFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingById(
            SObjectFunction.get('AccountId'),
            SObjectCollector.toSet()
        ));
Map<Id, Set<SObject>> contactsByAccountId = (Map<Id, Set<SObject>>)
    Stream.of(contacts)
        .collect(SObjectCollector.groupingById(
            SObjectFunction.get('AccountId'),
            SObjectCollector.toSet()
        ).cast(Map<Id, Set<SObject>>.class));
```

##### `static groupingById(ISObjectFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingById(
            SObjectFunction.get('AccountId'),
            Supplier.of(Map<Id, Set<SObject>>.class)
            SObjectCollector.toSet()
        ));
```

##### `static groupingById(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingById(
            'AccountId',
            'LastName'
        ).cast(Map<Id, List<String>>.class));
```

##### `static groupingById(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByBool(
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
        .collect(SObjectCollector.groupingById('AccountId'));
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
        .collect(SObjectCollector.groupingById(Contact.AccountId));
```

---
### Map<String, ?> Collectors
##### `static groupingByString(ISObjectFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<String, List<Object>>`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByString(
            SObjectFunction.get('OtherCity')
        ));
Map<String, List<Contact>> contactsByOtherCity = (Map<String, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollector.groupingByString(
            SObjectFunction.get('OtherCity')
        ).cast(Map<String, List<Contact>>.class));
```

##### `static groupingByString(ISObjectFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByString(
            SObjectFunction.get('OtherCity'),
            SObjectCollector.toSet()
        ));
Map<String, Set<SObject>> contactsByOtherCity = (Map<String, Set<SObject>>)
    Stream.of(contacts)
        .collect(SObjectCollector.groupingByString(
            SObjectFunction.get('OtherCity'),
            SObjectCollector.toSet()
        ).cast(Map<String, Set<SObject>>.class));
```

##### `static groupingByString(ISObjectFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByString(
            SObjectFunction.get('OtherCity'),
            Supplier.of(Map<String, Set<SObject>>.class),
            SObjectCollector.toSet()
        ));
```

##### `static groupingByString(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByString(
            'OtherCity',
            'LastName'
        ).cast(Map<String, List<String>>.class));
```

##### `static groupingByString(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByString(
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
        .collect(SObjectCollector.groupingByString('OtherCity'));
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
        .collect(SObjectCollector.groupingByString(Contact.OtherCity));
```

---
### Map<Blob, ?> Collectors
##### `static groupingByBlob(ISObjectFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Blob, List<Object>>`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByBlob(
            SObjectFunction.get('Body')
        ));
Map<Blob, List<Attachment>> attachmentsByOtherCity = (Map<Blob, List<Attachment>>)
    Stream.of(attachments)
        .collect(SObjectCollector.groupingByBlob(
            SObjectFunction.get('Body')
        ).cast(Map<Blob, List<Attachment>>.class));
```

##### `static groupingByBlob(ISObjectFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByBlob(
            SObjectFunction.get('Body'),
            SObjectCollector.toSet()
        ));
Map<Blob, Set<SObject>> attachmentsByOtherCity = (Map<Blob, Set<SObject>>)
    Stream.of(attachments)
        .collect(SObjectCollector.groupingByBlob(
            SObjectFunction.get('Body'),
            SObjectCollector.toSet()
        ).cast(Map<Blob, Set<SObject>>.class));
```

##### `static groupingByBlob(ISObjectFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByBlob(
            SObjectFunction.get('Body'),
            Supplier.of(Map<String, Set<SObject>>.class),
            SObjectCollector.toSet()
        ));
```

##### `static groupingByBlob(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByBlob(
            'Body',
            'Name'
        ).cast(Map<Blob, List<String>>.class));
```

##### `static groupingByBlob(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByString(
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
        .collect(SObjectCollector.groupingByBlob('Body'));
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
        .collect(SObjectCollector.groupingByBlob(Attachment.Body));
```

---
### Map<Date, ?> Collectors
##### `static groupingByDate(ISObjectFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Date, List<Object>>`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByDate(
            SObjectFunction.get('Birthdate')
        ));
Map<Date, List<Contact>> contactsByBirthdate = (Map<Date, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollector.groupingByDate(
            SObjectFunction.get('Birthdate')
        ).cast(Map<Date, List<Contact>>.class));
```

##### `static groupingByDate(ISObjectFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByDate(
            SObjectFunction.get('Birthdate'),
            SObjectCollector.toSet()
        ));
Map<Date, Set<SObject>> contactsByBirthdate = (Map<Date, Set<SObject>>)
    Stream.of(contacts)
        .collect(SObjectCollector.groupingByDate(
            SObjectFunction.get('Birthdate'),
            SObjectCollector.toSet()
        ).cast(Map<Date, Set<SObject>>.class));
```

##### `static groupingByDate(ISObjectFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByDate(
            SObjectFunction.get('Birthdate'),
            Supplier.of(Map<Date, Set<SObject>>.class),
            SObjectCollector.toSet()
        ));
```

##### `static groupingByDate(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByDate(
            'Birthdate',
            'LastName'
        ).cast(Map<Date, List<String>>.class));
```

##### `static groupingByDate(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByDate(
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
        .collect(SObjectCollector.groupingByDate('Birthdate'));
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
        .collect(SObjectCollector.groupingByDate(Contact.Birthdate));
```

---
### Map<Datetime, ?> Collectors
##### `static groupingByDatetime(ISObjectFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Datetime, List<Object>>`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByDatetime(
            SObjectFunction.get('ActivityDateTime')
        ));
Map<Datetime, List<Event>> eventsByActivityDateTime = (Map<Datetime, List<Event>>)
    Stream.of(events)
        .collect(SObjectCollector.groupingByDatetime(
            SObjectFunction.get('ActivityDateTime')
        ).cast(Map<Datetime, List<Event>>.class));
```

##### `static groupingByDatetime(ISObjectFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByDatetime(
            SObjectFunction.get('ActivityDateTime'),
            SObjectCollector.toSet()
        ));
Map<Datetime, Set<SObject>> eventsByActivityDateTime = (Map<Datetime, Set<SObject>>)
    Stream.of(events)
        .collect(SObjectCollector.groupingByDatetime(
            SObjectFunction.get('ActivityDateTime'),
            SObjectCollector.toSet()
        ).cast(Map<Datetime, Set<SObject>>.class));
```

##### `static groupingByDatetime(ISObjectFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByDatetime(
            SObjectFunction.get('ActivityDateTime'),
            Supplier.of(Map<Datetime, Set<SObject>>.class),
            SObjectCollector.toSet()
        ));
```

##### `static groupingByDatetime(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByDatetime(
            'ActivityDateTime',
            'Description'
        ).cast(Map<Datetime, List<String>>.class));
```

##### `static groupingByDatetime(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByDatetime(
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
        .collect(SObjectCollector.groupingByDatetime('ActivityDateTime'));
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
        .collect(SObjectCollector.groupingByDatetime(Event.ActivityDateTime));
```

---
### Map<Time, ?> Collectors
##### `static groupingByTime(ISObjectFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Time, List<Object>>`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByTime(
            SObjectFunction.get('StartTime')
        ));
Map<Time, List<TimeSlot>> slotsByStartTime = (Map<Time, List<TimeSlot>>)
    Stream.of(events)
        .collect(SObjectCollector.groupingByTime(
            SObjectFunction.get('StartTime')
        ).cast(Map<Time, List<TimeSlot>>.class));
```

##### `static groupingByTime(ISObjectFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByTime(
            SObjectFunction.get('StartTime'),
            SObjectCollector.toSet()
        ));
Map<Time, Set<SObject>> slotsByStartTime = (Map<Time, Set<SObject>>)
    Stream.of(events)
        .collect(SObjectCollector.groupingByTime(
            SObjectFunction.get('StartTime'),
            SObjectCollector.toSet()
        ).cast(Map<Time, Set<SObject>>.class));
```

##### `static groupingByTime(ISObjectFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByTime(
            SObjectFunction.get('StartTime'),
            Supplier.of(Map<Time, Set<SObject>>.class),
            SObjectCollector.toSet()
        ));
```

##### `static groupingByTime(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByDatetime(
            'StartTime',
            'Name'
        ).cast(Map<Time, List<String>>.class));
```

##### `static groupingByTime(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByTime(
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
        .collect(SObjectCollector.groupingByTime('StartTime'));
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
        .collect(SObjectCollector.groupingByTime(TimeSlot.StartTime));
```

---
### Map<Integer, ?> Collectors
##### `static groupingByInt(ISObjectToIntFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Integer, List<Object>>`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByInt(
            SObjectToIntFunction.get('NumberOfEmployees')
        ));
Map<Integer, List<Account>> accountsByNumberOfEmployees = (Map<Integer, List<Account>>)
    Stream.of(accounts)
        .collect(SObjectCollector.groupingByInt(
            SObjectToIntFunction.get('NumberOfEmployees')
        ).cast(Map<Integer, List<Account>>.class));
```

##### `static groupingByInt(ISObjectToIntFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByInt(
            SObjectToIntFunction.get('NumberOfEmployees'),
            SObjectCollector.toSet()
        ));
Map<Integer, Set<SObject>> accountsByNumberOfEmployees = (Map<Integer, Set<SObject>>)
    Stream.of(accounts)
        .collect(SObjectCollector.groupingByInt(
            SObjectToIntFunction.get('NumberOfEmployees'),
            SObjectCollector.toSet()
        ).cast(Map<Integer, Set<SObject>>.class));
```

##### `static groupingByInt(ISObjectToIntFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByInt(
            SObjectToIntFunction.get('NumberOfEmployees'),
            Supplier.of(Map<Integer, Set<SObject>>.class)
            SObjectCollector.toSet()
        ));
```

##### `static groupingByInt(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByInt(
            'NumberOfEmployees',
            'Name'
        ).cast(Map<Integer, List<String>>.class));
```

##### `static groupingByInt(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByInt(
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
        .collect(SObjectCollector.groupingByInt('NumberOfEmployees'));
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
        .collect(SObjectCollector.groupingByInt(Account.NumberOfEmployees));
```

---
### Map<Long, ?> Collectors
##### `static groupingByLong(ISObjectToLongFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Long, List<Object>>`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByLong(
            SObjectToLongFunction.get('NumberOfEmployees')
        ));
Map<Long, List<Account>> accountsByNumberOfEmployees = (Map<Long, List<Account>>)
    Stream.of(accounts)
        .collect(SObjectCollector.groupingByLong(
            SObjectToLongFunction.get('NumberOfEmployees')
        ).cast(Map<Long, List<Account>>.class));
```

##### `static groupingByLong(ISObjectToLongFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByLong(
            SObjectToLongFunction.get('NumberOfEmployees'),
            SObjectCollector.toSet()
        ));
Map<Long, Set<SObject>> accountsByNumberOfEmployees = (Map<Long, Set<SObject>>)
    Stream.of(accounts)
        .collect(SObjectCollector.groupingByInt(
            SObjectToLongFunction.get('NumberOfEmployees'),
            SObjectCollector.toSet()
        ).cast(Map<Long, Set<SObject>>.class));
```

##### `static groupingByLong(ISObjectToLongFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByInt(
            SObjectToLongFunction.get('NumberOfEmployees'),
            Supplier.of(Map<Long, Set<SObject>>.class)
            SObjectCollector.toSet()
        ));
```

##### `static groupingByLong(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByLong(
            'NumberOfEmployees',
            'Name'
        ).cast(Map<Long, List<String>>.class));
```

##### `static groupingByLong(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByLong(
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
        .collect(SObjectCollector.groupingByLong('NumberOfEmployees'));
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
        .collect(SObjectCollector.groupingByLong(Account.NumberOfEmployees));
```

---
### Map<Double, ?> Collectors
##### `static groupingByDouble(ISObjectToDoubleFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Double, List<Object>>`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByDouble(
            SObjectToDoubleFunction.get('BillingLatitude')
        ));
Map<Double, List<Account>> accountsByBillingLatitude = (Map<Double, List<Account>>)
    Stream.of(accounts)
        .collect(SObjectCollector.groupingByDouble(
            SObjectToDoubleFunction.get('BillingLatitude')
        ).cast(Map<Double, List<Account>>.class));
```

##### `static groupingByDouble(ISObjectToDoubleFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByDouble(
            SObjectToDoubleFunction.get('BillingLatitude'),
            SObjectCollector.toSet()
        ));
Map<Double, Set<SObject>> accountsByBillingLatitude = (Map<Double, Set<SObject>>)
    Stream.of(accounts)
        .collect(SObjectCollector.groupingByDouble(
            SObjectToDoubleFunction.get('BillingLatitude'),
            SObjectCollector.toSet()
        ).cast(Map<Double, Set<SObject>>.class));
```

##### `static groupingByDouble(ISObjectToDoubleFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByDouble(
            SObjectToDoubleFunction.get('BillingLatitude'),
            Supplier.of(Map<Double, Set<SObject>>.class)
            SObjectCollector.toSet()
        ));
```

##### `static groupingByDouble(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByDouble(
            'BillingLatitude',
            'Name'
        ).cast(Map<Double, List<String>>.class));
```

##### `static groupingByDouble(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.groupingByDouble(
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
        .collect(SObjectCollector.groupingByDouble('BillingLatitude'));
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
        .collect(SObjectCollector.groupingByDouble(Account.BillingLatitude));
```

##### `static groupingBy(ISObjectFunction classifier)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier`, and returns the results in a `Map<Object, List<Object>>`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as SObjectCollector.groupingById, SObjectCollector.groupingByString, etc.</p>

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
        .collect(SObjectCollector.groupingBy(
            SObjectFunction.get('Birthdate')
        ));
Map<Object, List<Contact>> contactsByBirthdate = (Map<Object, List<Contact>>)
    Stream.of(contacts)
        .collect(SObjectCollector.groupingBy(
            SObjectFunction.get('Birthdate')
        ).cast(Map<Object, List<Contact>>.class));
```

##### `static groupingBy(ISObjectFunction classifier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as SObjectCollector.groupingById, SObjectCollector.groupingByString, etc.</p>

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
        .collect(SObjectCollector.groupingBy(
            SObjectFunction.get('Birthdate'),
            SObjectCollector.toSet()
        ));
Map<Object, Set<SObject>> contactsByBirthdate = (Map<Object, Set<SObject>>)
    Stream.of(contacts)
        .collect(SObjectCollector.groupingBy(
            SObjectFunction.get('Birthdate'),
            SObjectCollector.toSet()
        ).cast(Map<Object, Set<SObject>>.class));
```

##### `static groupingBy(ISObjectFunction classifier, ISupplier mapSupplier, ISObjectCollector downstream)`

Returns a `SObjectCollector` that performs grouping operation according to the `classifier` and then performing a reduction operation on the values associated with a given key using the specified `downstream` SObjectCollector. The Map container is created by `mapSupplier`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as SObjectCollector.groupingById, SObjectCollector.groupingByString, etc.</p>

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
        .collect(SObjectCollector.groupingBy(
            SObjectFunction.get('Birthdate'),
            Supplier.of(Map<Object, Set<SObject>>.class),
            SObjectCollector.toSet()
        ));
```

##### `static groupingBy(String keyFieldName, String valueFieldName)`

Returns a `SObjectCollector` that performs grouping operation according to `keyFieldName` and `valueFieldName`. Cross-reference fields and safe navigation are supported. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as SObjectCollector.groupingById, SObjectCollector.groupingByString, etc.</p>

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
        .collect(SObjectCollector.groupingBy(
            'Birthdate',
            'LastName'
        ).cast(Map<Object, List<String>>.class));
```

##### `static groupingBy(SObjectField keyField, SObjectField valueField)`

Returns a `SObjectCollector` that performs grouping operation according to `keyField` and `valueField`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p> <p>The result container keys however <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as SObjectCollector.groupingById, SObjectCollector.groupingByString, etc.</p>

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
        .collect(SObjectCollector.groupingBy(
            Contact.Birthdate,
            Contact.LastName
        ).cast(Map<Object, List<String>>.class));
```

##### `static groupingBy(String fieldName)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `fieldName`. Cross-reference fields and safe navigation are supported. <p>The result container keys however <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as SObjectCollector.groupingById, SObjectCollector.groupingByString, etc.</p>

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
        .collect(SObjectCollector.groupingBy('Birthdate'));
```

##### `static groupingBy(SObjectField field)`

Returns a `SObjectCollector` that performs grouping of SObject input arguments according to `field`. <p>The result container keys however <strong>cannot</strong> be casted to a specific type.</p> <p>To get a result container of a specific type use `groupingBy<T>()` collectors such as SObjectCollector.groupingById, SObjectCollector.groupingByString, etc.</p>

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
        .collect(SObjectCollector.groupingBy(Contact.Birthdate));
```

---
### Partitioning By Collectors
##### `static partitioningBy(ISObjectPredicate predicate)`

Returns a `SObjectCollector` that partitions the SObject input arguments according to `predicate` and organizes them into a `Map<Boolean, Object>`. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.partitioningBy(
            SObjectPredicate.isGreater('NumberOfEmployees', 100)
        ));
Map<Boolean, List<Account>> accountsPartitionedByHavingMoreThan100Employees = (Map<Boolean, List<Account>>)
    Stream.of(accounts)
        .collect(SObjectCollector.partitioningBy(
            SObjectPredicate.isGreater('NumberOfEmployees', 100)
        ).cast(Map<Boolean, List<Account>>.class));
```

##### `static partitioningBy(ISObjectPredicate predicate, ISObjectCollector downstream)`

Returns a `SObjectCollector` that partitions the SObject input arguments according to `predicate`, reduces the values in each partition according to `downstream` Collector, and organizes them into a `Map<Boolean, Object>` whose values are the result of the downstream reduction. <p>The result container values type can be casted to a specific type using SObjectCollector.cast.</p>

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
        .collect(SObjectCollector.partitioningBy(
            SObjectPredicate.isGreater('NumberOfEmployees', 100),
            SObjectCollector.toStringSet('Name')
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
        .collect(SObjectCollector.partitioningBy('OtherCountry', 'UK'));
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

###### Example
```apex
Map<Boolean, List<Account>> accountNamesPartitionedByHavingMoreThan100Employees =
    (Map<Boolean, List<Account>>) Stream.of(contacts)
        .collect(SObjectCollector.partitioningBy(Contact.OtherCountry, 'UK'));
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
String lastNames = (String) Stream.of(contacts).collect(SObjectCollector.joining('LastName'));
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
String lastNames = (String) Stream.of(contacts).collect(SObjectCollector.joining(Contact.LastName));
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
     .collect(SObjectCollector.joining('LastName', '; '));
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
    .collect(SObjectCollector.joining(Contact.LastName, '; '));
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
     .collect(SObjectCollector.joining('LastName', '; ', 'prefix', 'suffix'));
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
     .collect(SObjectCollector.joining(Contact.LastName, '; ', 'prefix', 'suffix'));
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
    .collect(SObjectCollector.averagingInt(SObjectToIntFunction.get('NumberOfEmployees')));
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
    .collect(SObjectCollector.averagingInt('NumberOfEmployees'));
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
    .collect(SObjectCollector.averagingInt(Account.NumberOfEmployees));
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
    .collect(SObjectCollector.counting());
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
    .collect(SObjectCollector.summingInt(SObjectToIntFunction.get('NumberOfEmployees')));
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
    .collect(SObjectCollector.summingInt('NumberOfEmployees'));
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
    .collect(SObjectCollector.summingInt(Account.NumberOfEmployees));
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
    .collect(SObjectCollector.averagingLong(SObjectToLongFunction.get('NumberOfEmployees')));
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
    .collect(SObjectCollector.averagingLong('NumberOfEmployees'));
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
    .collect(SObjectCollector.averagingLong(Account.NumberOfEmployees));
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
    .collect(SObjectCollector.summingLong(SObjectToLongFunction.get('NumberOfEmployees')));
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
    .collect(SObjectCollector.summingLong('NumberOfEmployees'));
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
    .collect(SObjectCollector.summingLong(Account.NumberOfEmployees));
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
    .collect(SObjectCollector.averagingLong(SObjectToDoubleFunction.get('BillingLatitude')));
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
    .collect(SObjectCollector.averagingDouble('BillingLatitude'));
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
    .collect(SObjectCollector.averagingDouble(Account.BillingLatitude));
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
    .collect(SObjectCollector.summingDouble(SObjectToDoubleFunction.get('BillingLatitude')));
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
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
Double sumOfBillingLatitude = (Double) Stream.of(accounts)
    .collect(SObjectCollector.summingDouble('BillingLatitude'));
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
    .collect(SObjectCollector.summingDouble(Account.NumberOfEmployees));
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
    .collect(SObjectCollector.filtering(SObjectPredicate.isGreater('NumberOfEmployees', 100)));
// Group accounts with more than 100 employees by type
Map<String, List<Account>> accountNamesHavingMoreThan100EmployeesByType =
    (Map<String, List<Account>>) Stream.of(accounts)
       .collect(
            SObjectCollector.groupingByString(
                SObjectFunction.get('Type'),
                SObjectCollector.filtering(SObjectPredicate.isGreater('NumberOfEmployees', 100))
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
    .collect(SObjectCollector.filtering(
        SObjectPredicate.isGreater('NumberOfEmployees', 100),
        SObjectCollector.toList('Name')
     ).cast(List<String>.class));
// Group accounts names with more than 100 employees by type
Map<String, List<String>> accountNamesHavingMoreThan100EmployeesByType =
    (Map<String, List<String>>) Stream.of(accounts)
    .collect(
        SObjectCollector.filtering(
            SObjectPredicate.isGreater('NumberOfEmployees', 100),
            SObjectCollector.groupingByString(
                SObjectFunction.get('Type'),
                SObjectCollector.toList('Name')
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
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
// Get accounts with hot Rating
List<Account> accountsHavingMoreThan100Employees = (List<Account>) Stream.of(accounts)
    .collect(SObjectCollector.filtering('Rating', 'Hot'));
// Group accounts with hot Rating by type
Map<String, List<Account>> accountNamesHavingMoreThan100EmployeesByType =
    (Map<String, List<Account>>) Stream.of(accounts)
       .collect(
            SObjectCollector.groupingByString(
                SObjectFunction.get('Type'),
                SObjectCollector.filtering('Rating', 'Hot')
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
    .collect(SObjectCollector.filtering(Account.Rating, 'Hot'));
// Group accounts with hot Rating by type
Map<String, List<Account>> accountNamesHavingMoreThan100EmployeesByType =
    (Map<String, List<Account>>) Stream.of(accounts)
       .collect(
            SObjectCollector.groupingByString(
                SObjectFunction.get('Type'),
                SObjectCollector.filtering(Account.Rating, 'Hot')
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
        .collect(SObjectCollector.mapping(SObjectFunction.get('Name')).cast(List<String>.class));
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
Map<String, Set<String>> namesByType = (Map<String Set<String>>)
    Stream.of(accounts)
        .collect(SObjectCollector.groupingByString(
            ISObjectFunction.get('Type'),
            SObjectCollector.mapping(
                SObjectFunction.get('Name'),
                Collector.toStringSet()
            )
        ).cast(Map<String Set<String>>.class));
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
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
List<String> accountNames = (List<String>)
    Stream.of(accounts)
        .collect(SObjectCollector.mapping('Name').cast(List<String>.class));
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
        .collect(SObjectCollector.mapping(Account.Name).cast(List<String>.class));
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
    .collect(SObjectCollector.reducing(
        new Account(NumberOfEmployees = 0),
        sumIntFieldReducer
     ));
```

---
### Optional Collectors
##### `static reducing(ISObjectBinaryOperator accumulator)`

Returns a `SObjectCollector` which performs a reduction of its input elements under `accumulator`. The result is described as an `OptionalSObject`. <p>The result container <strong>cannot</strong> be casted to a specific `OptionalSObject`.</p>

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
        .collect(SObjectCollector.groupingByString(
            ISObjectFunction.get('Type'),
            SObjectCollector.reducing(
                SObjectBinaryOperator.maxBy('NumberOfEmployees')
            )
        ));
Account customerWithMaxNumberOfEmployees = (Account)
    accountOptionalWithMaxNumberOfEmployeesPerType.get('Customer').get();
```

##### `static maximizing(ISObjectComparator comparator)`

Returns a `SObjectCollector` which produces the maximal element according to `comparator`, described as an `OptionalSObject` . <p>The result container <strong>cannot</strong> be casted to a specific `OptionalSObject`.</p>

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
        .collect(SObjectCollector.groupingByString(
            ISObjectFunction.get('Type'),
            SObjectCollector.maximizing(
                SObjectComparator.comparingInt('NumberOfEmployees')
            )
        ));
Account customerWithMaxNumberOfEmployees = (Account)
    ((OptionalSObject) accountOptionalWithMaxNumberOfEmployeesPerType).get('Customer').get();
```

##### `static maximizing(String fieldName)`

Returns a `SObjectCollector` which produces the maximal element according to `fieldName`, described as an `OptionalSObject` . <p>The result container <strong>cannot</strong> be casted to a specific `OptionalSObject`.</p>

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
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
Map<String, Object> accountOptionalWithMaxNumberOfEmployeesPerType = (Map<String, Object>)
    Stream.of(accounts)
        .collect(SObjectCollector.groupingByString(
            ISObjectFunction.get('Type'),
            SObjectCollector.maximizing('NumberOfEmployees')
        ));
Account customerWithMaxNumberOfEmployees = (Account)
    ((OptionalSObject) accountOptionalWithMaxNumberOfEmployeesPerType).get('Customer').get();
```

##### `static maximizing(SObjectField field)`

Returns a `SObjectCollector` which produces the maximal element according to `field`, described as an `OptionalSObject` . <p>The result container <strong>cannot</strong> be casted to a specific `OptionalSObject`.</p>

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
        .collect(SObjectCollector.groupingByString(
            ISObjectFunction.get(Account.Type),
            SObjectCollector.maximizing(Account.NumberOfEmployees)
        ));
Account customerWithMaxNumberOfEmployees = (Account)
    ((OptionalSObject) accountOptionalWithMaxNumberOfEmployeesPerType).get('Customer').get();
```

##### `static minimizing(ISObjectComparator comparator)`

Returns a `SObjectCollector` which produces the minimal element according to `comparator`, described as an `OptionalSObject` . <p>The result container <strong>cannot</strong> be casted to a specific `OptionalSObject`.</p>

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
        .collect(SObjectCollector.groupingByString(
            ISObjectFunction.get('Type'),
            SObjectCollector.minimizing(
                SObjectComparator.comparingInt('NumberOfEmployees')
            )
        ));
Account customerWithMinNumberOfEmployees = (Account)
    accountOptionalWithMinNumberOfEmployeesPerType.get('Customer').get();
```

##### `static minimizing(String fieldName)`

Returns a `SObjectCollector` which produces the minimal element according to `fieldName`, described as an `OptionalSObject` . <p>The result container <strong>cannot</strong> be casted to a specific `OptionalSObject`.</p>

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
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
Map<String, Object> accountOptionalWithMinNumberOfEmployeesPerType = (Map<String, Object>)
    Stream.of(accounts)
        .collect(SObjectCollector.groupingByString(
            ISObjectFunction.get('Type'),
            SObjectCollector.maximizing('NumberOfEmployees')
        ));
Account customerWithMinNumberOfEmployees = (Account)
    ((OptionalSObject) accountOptionalWithMinNumberOfEmployeesPerType).get('Customer').get();
```

##### `static minimizing(SObjectField field)`

Returns a `SObjectCollector` which produces the maximal element according to `field`, described as an `OptionalSObject` . <p>The result container <strong>cannot</strong> be casted to a specific `OptionalSObject`.</p>

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
        .collect(SObjectCollector.groupingByString(
            ISObjectFunction.get(Account.Type),
            SObjectCollector.maximizing(Account.NumberOfEmployees)
        ));
Account customerWithMinNumberOfEmployees = (Account)
    ((OptionalSObject) accountOptionalWithMinNumberOfEmployeesPerType).get('Customer').get();
```

---
