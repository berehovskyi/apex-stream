# virtual SObjectFunctions

`APIVERSION: 60`

`STATUS: ACTIVE`

Provides common implementations of [Function](/docs/Functional-Abstract-Classes/Function.md)
and related utilities.


**Inheritance**

[BaseSObjectFunctions](/docs/Functional-Built-In-Classes/BaseSObjectFunctions.md)
 > 
SObjectFunctions


**See** [Function](/docs/Functional-Abstract-Classes/Function.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static Function getPopulatedFieldsAsMap()`

Returns a `Function` that returns a map of populated field names and their corresponding values for an input argument.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [SObject.getPopulatedFieldsAsMap](SObject.getPopulatedFieldsAsMap)

##### `public static Function getQuickActionName()`

Returns a `Function` that returns the name of a quick action associated with an input argument.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [SObject.getQuickActionName](SObject.getQuickActionName)

##### `public static Function getSObjectType()`

Returns a `Function` that returns the `SObjectType` of an input argument.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [SObject.getSObjectType](SObject.getSObjectType)

##### `public static Function put(String fieldName, IFunction mapper)`

Returns a `Function` that sets the value returned by the `mapper` for the specified `fieldName` and returns the previous value for the field. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`mapper`|applied to the input argument|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

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
SObjectFunctions.put('NumberOfEmployees', someFunction);
SObjectFunctions.put('Parent.NumberOfEmployees', someFunction);
SObjectFunctions.put('Parent?.NumberOfEmployees', someFunction);
```


##### `public static Function put(SObjectField field, IFunction mapper)`

Returns a `Function` that sets the value returned by the `mapper` for the specified `field` and returns the previous value for the field.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field name to set a value|
|`mapper`|applied to the input argument|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `mapper` is null|


**See** [SObject.put](SObject.put)

###### Example
```apex
SObjectFunctions.put(Account.NumberOfEmployees, someFunction);
SObjectFunctions.put(Account.NumberOfEmployees, Function.constant(100));
```


##### `public static Function put(String fieldName, Object value)`

Returns a `Function` that sets the `value` for the specified `fieldName` and returns the previous value for the field. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`value`|the value to set|

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


**See** [SObject.put](SObject.put)

###### Example
```apex
SObjectFunctions.put('NumberOfEmployees', 100);
SObjectFunctions.put('Parent.NumberOfEmployees', 100);
SObjectFunctions.put('Parent?.NumberOfEmployees', (Object) null);
```


##### `public static Function put(SObjectField field, Object value)`

Returns a `Function` that sets the `value` for the specified `field` and returns the previous value for the field.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field name to set a value|
|`value`|the value to set|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [SObject.put](SObject.put)

###### Example
```apex
SObjectFunctions.put(Account.NumberOfEmployees, 100);
SObjectFunctions.put(Account.NumberOfEmployees, (Object) null);
```


##### `public static Function get(String fieldName)`

*Inherited*


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

*Inherited*


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

*Inherited*


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

*Inherited*


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
