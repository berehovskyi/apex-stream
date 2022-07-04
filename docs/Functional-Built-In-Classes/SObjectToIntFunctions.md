# SObjectToIntFunctions

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides common implementations of [SObjectToIntFunction](/docs/Functional-Abstract-Classes/SObjectToIntFunction.md) and related utilities.


**See** [SObjectToIntFunction](/docs/Functional-Abstract-Classes/SObjectToIntFunction.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `static get(String fieldName)`

Returns a `SObjectToIntFunction` that gets a value for the specified `fieldName` as Integer. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field to get a Integer value|

###### Return

**Type**

SObjectToIntFunction

**Description**

the `SObjectToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.get

###### Example
```apex
SObjectToIntFunctions.get('NumberOfEmployees');
SObjectToIntFunctions.get('Parent.NumberOfEmployees');
SObjectToIntFunctions.get('Parent?.NumberOfEmployees');
```

##### `static get(SObjectField field)`

Returns a `SObjectToIntFunction` that gets a value for the specified `field` as Integer.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field to get a value|

###### Return

**Type**

SObjectToIntFunction

**Description**

the `SObjectToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** SObject.get

###### Example
```apex
SObjectToIntFunctions.get(Account.NumberOfEmployees);
```

---
