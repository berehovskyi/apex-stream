# SObjectToLongFunctions

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides common implementations of [SObjectToLongFunction](/docs/Functional-Abstract-Classes/SObjectToLongFunction.md) and related utilities.


**See** [SObjectToLongFunction](/docs/Functional-Abstract-Classes/SObjectToLongFunction.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `static get(String fieldName)`

Returns a `SObjectToLongFunction` that gets a value for the specified `fieldName` as Long. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field to get a Long value|

###### Return

**Type**

SObjectToLongFunction

**Description**

the `SObjectToLongFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.get

###### Example
```apex
SObjectToLongFunctions.get('NumberOfEmployees');
SObjectToLongFunctions.get('Parent.NumberOfEmployees');
SObjectToLongFunctions.get('Parent?.NumberOfEmployees');
```

##### `static get(SObjectField field)`

Returns a `SObjectToLongFunction` that gets a value for the specified `field` as Long.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field to get a value|

###### Return

**Type**

SObjectToLongFunction

**Description**

the `SObjectToLongFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** SObject.get

###### Example
```apex
SObjectToLongFunctions.get(Account.NumberOfEmployees);
```

---
