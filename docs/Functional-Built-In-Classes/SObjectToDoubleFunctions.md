# SObjectToDoubleFunctions

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides common implementations of [SObjectToDoubleFunction](/docs/Functional-Abstract-Classes/SObjectToDoubleFunction.md) and related utilities.


**See** [SObjectToDoubleFunction](/docs/Functional-Abstract-Classes/SObjectToDoubleFunction.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `static get(String fieldName)`

Returns a `SObjectToDoubleFunction` that gets a value for the specified `fieldName` as Double. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field to get a Double value|

###### Return

**Type**

SObjectToDoubleFunction

**Description**

the `SObjectToDoubleFunction`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.get

###### Example
```apex
SObjectToDoubleFunctions.get('BillingLatitude');
SObjectToDoubleFunctions.get('Parent.BillingLatitude');
SObjectToDoubleFunctions.get('Parent?.BillingLatitude');
```

##### `static get(SObjectField field)`

Returns a `SObjectToDoubleFunction` that gets a value for the specified `field` as Double.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field to get a value|

###### Return

**Type**

SObjectToDoubleFunction

**Description**

the `SObjectToDoubleFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** SObject.get

###### Example
```apex
SObjectToDoubleFunctions.get(Account.BillingLatitude);
```

---
