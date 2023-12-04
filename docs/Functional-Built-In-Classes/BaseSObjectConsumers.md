# virtual BaseSObjectConsumers

`APIVERSION: 59`

`STATUS: ACTIVE`

Provides base implementations of [Consumer](/docs/Functional-Abstract-Classes/Consumer.md)
and related utilities that are used by [ISObjectEnumerable](/docs/Enumerables/ISObjectEnumerable.md).


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static Consumer set(String fieldName, IFunction mapper)`

Returns a `Consumer` that sets the value returned by the `mapper` for the specified `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`mapper`|applied to the input argument|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [SObject.put](SObject.put)

###### Example
```apex
BaseSObjectConsumers.set('NumberOfEmployees', someFunction);
BaseSObjectConsumers.set('Parent.NumberOfEmployees', someFunction);
BaseSObjectConsumers.set('Parent?.NumberOfEmployees', someFunction);
```


##### `public static Consumer set(SObjectField field, IFunction mapper)`

Returns a `Consumer` that sets the value returned by the `mapper` for the specified `field`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field to set a value|
|`mapper`|applied to the input argument|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `mapper` is null|
|`SObjectException`|if provided invalid `fieldName`|


**See** [SObject.put](SObject.put)

###### Example
```apex
BaseSObjectConsumers.set(Account.NumberOfEmployees, someFunction);
```


##### `public static Consumer set(String fieldName, Object value)`

Returns a `Consumer` that sets the `value` for the specified `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`value`|the value to set|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [SObject.put](SObject.put)

###### Example
```apex
BaseSObjectConsumers.set('NumberOfEmployees', 100);
BaseSObjectConsumers.set('Parent.NumberOfEmployees', 100);
BaseSObjectConsumers.set('Parent?.NumberOfEmployees', (Object) null);
```


##### `public static Consumer set(SObjectField field, Object value)`

Returns a `Consumer` that sets the `value` for the specified `field`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field to set a value|
|`value`|the value to set|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`SObjectException`|if provided invalid `fieldName`|


**See** [SObject.put](SObject.put)

###### Example
```apex
BaseSObjectConsumers.set(Account.NumberOfEmployees, 100);
BaseSObjectConsumers.set(Account.NumberOfEmployees, (Object) null);
```


---
