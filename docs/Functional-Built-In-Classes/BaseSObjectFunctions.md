# virtual BaseSObjectFunctions

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides base implementations of [Function](/docs/Functional-Abstract-Classes/Function.md)
and related utilities that are used by [ISObjectEnumerable](/docs/Enumerables/ISObjectEnumerable.md).


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static Function get(String fieldName)`

Returns a `Function` that gets a value for the specified `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field to get a value|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [SObject.get](SObject.get)

###### Example
```apex
BaseSObjectFunctions.get('Name');
BaseSObjectFunctions.get('Parent.Name');
BaseSObjectFunctions.get('Parent?.Name');
```


##### `public static Function get(SObjectField field)`

Returns a `Function` that gets a value for the specified `field`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field to get a value|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** [SObject.get](SObject.get)

###### Example
```apex
BaseSObjectFunctions.get(Account.Name);
```


##### `public static Function getSObjects(String fieldName)`

Returns a `Function` that gets children sobjects for the specified `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field to get a value|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [SObject.getSObjects](SObject.getSObjects)

###### Example
```apex
BaseSObjectFunctions.getSObjects('Contacts');
BaseSObjectFunctions.getSObjects('Parent.Contacts');
BaseSObjectFunctions.getSObjects('Parent?.Contacts');
```


##### `public static Function getSObjects(SObjectField field)`

Returns a `Function` that gets children sobjects for the specified `field`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field to get a value|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|


**See** [SObject.getSObjects](SObject.getSObjects)

###### Example
```apex
BaseSObjectFunctions.getSObjects(Contact.AccountId);
```


---
