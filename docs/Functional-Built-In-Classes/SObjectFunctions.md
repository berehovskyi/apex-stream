# SObjectFunctions

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides common implementations of [SObjectFunction](/docs/Functional-Abstract-Classes/SObjectFunction.md) and related utilities.


**See** [SObjectFunction](/docs/Functional-Abstract-Classes/SObjectFunction.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `static get(String fieldName)`

Returns a `SObjectFunction` that gets a value for the specified `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field to get a value|

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

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
SObjectFunctions.get('Name');
SObjectFunctions.get('Parent.Name');
SObjectFunctions.get('Parent?.Name');
```

##### `static get(SObjectField field)`

Returns a `SObjectFunction` that gets a value for the specified `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field to get a value|

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** SObject.get

###### Example
```apex
SObjectFunctions.get(Account.Name);
```

##### `static getPopulatedFieldsAsMap()`

Returns a `SObjectFunction` that returns a map of populated field names and their corresponding values for an input argument.

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`


**See** SObject.getPopulatedFieldsAsMap

##### `static getQuickActionName()`

Returns a `SObjectFunction` that returns the name of a quick action associated with an input argument.

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`


**See** SObject.getQuickActionName

##### `static getSObjects(String fieldName)`

Returns a `SObjectFunction` that gets children sobjects for the specified `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field to get a value|

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.getSObjects

###### Example
```apex
SObjectFunctions.getSObjects('Contacts');
SObjectFunctions.getSObjects('Parent.Contacts');
SObjectFunctions.getSObjects('Parent?.Contacts');
```

##### `static getSObjects(SObjectField field)`

Returns a `SObjectFunction` that gets children sobjects for the specified `field`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field to get a value|

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.getSObjects

###### Example
```apex
SObjectFunctions.getSObjects(Contact.AccountId);
```

##### `static getSObjectType()`

Returns a `SObjectFunction` that returns the `SObjectType` of an input argument.

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`


**See** SObject.getSObjectType

##### `static put(String fieldName, ISObjectFunction mapper)`

Returns a `SObjectFunction` that sets the value returned by the `mapper` for the specified `fieldName` and returns the previous value for the field. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`mapper`|applied to the input argument|

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.put

###### Example
```apex
SObjectFunctions.put('NumberOfEmployees', someSObjectFunction);
SObjectFunctions.put('Parent.NumberOfEmployees', someSObjectFunction);
SObjectFunctions.put('Parent?.NumberOfEmployees', someSObjectFunction);
```

##### `static put(SObjectField field, ISObjectFunction mapper)`

Returns a `SObjectFunction` that sets the value returned by the `mapper` for the specified `field` and returns the previous value for the field.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field name to set a value|
|`mapper`|applied to the input argument|

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `mapper` is null|


**See** SObject.put

###### Example
```apex
SObjectConsumers.put(Account.NumberOfEmployees, someSObjectFunction);
SObjectConsumers.put(Account.NumberOfEmployees, SObjectFunction.constant(100));
```

##### `static put(String fieldName, Object value)`

Returns a `SObjectFunction` that sets the `value` for the specified `fieldName` and returns the previous value for the field. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`value`|the value to set|

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.put

###### Example
```apex
SObjectFunctions.put('NumberOfEmployees', 100);
SObjectFunctions.put('Parent.NumberOfEmployees', 100);
SObjectFunctions.put('Parent?.NumberOfEmployees', (Object) null);
```

##### `static put(SObjectField field, Object value)`

Returns a `SObjectFunction` that sets the `value` for the specified `field` and returns the previous value for the field.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field name to set a value|
|`value`|the value to set|

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.put

###### Example
```apex
SObjectFunctions.put(Account.NumberOfEmployees, 100);
SObjectFunctions.put(Account.NumberOfEmployees, (Object) null);
```

---
