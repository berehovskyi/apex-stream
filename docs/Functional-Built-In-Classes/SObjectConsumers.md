# virtual SObjectConsumers

`APIVERSION: 60`

`STATUS: ACTIVE`

Provides common implementations of [Consumer](/docs/Functional-Abstract-Classes/Consumer.md)
and related utilities.


**Inheritance**

[BaseSObjectConsumers](/docs/Functional-Built-In-Classes/BaseSObjectConsumers.md)
 > 
SObjectConsumers


**See** [Consumer](/docs/Functional-Abstract-Classes/Consumer.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static Consumer addError(String fieldName, String message)`

Returns a `Consumer` that adds error to `fieldName`.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name to add an error|
|`message`|the error message|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `message` is null|
|`SObjectException`|if provided invalid `fieldName`|


**See** [SObject.addError](SObject.addError)

###### Example
```apex
SObjectConsumers.addError('NumberOfEmployees', 'Error message');
```


##### `public static Consumer addError(SObjectField field, String message)`

Returns a `Consumer` that adds error to `field`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field to add an error|
|`message`|the error message|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is blank or `message` is null|


**See** [SObject.addError](SObject.addError)

###### Example
```apex
SObjectConsumers.addError(Account.NumberOfEmployees, 'Error message');
```


##### `public static Consumer addError(String message)`

Returns a `Consumer` that adds error to an input argument.

###### Parameters

|Param|Description|
|---|---|
|`message`|the error message|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|


**See** [SObject.addError](SObject.addError)

###### Example
```apex
SObjectConsumers.addError('Error message');
```


##### `public static Consumer addError(Exception exc)`

Returns a `Consumer` that adds error to an input argument.

###### Parameters

|Param|Description|
|---|---|
|`exc`|the exception to attach|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `exc` is null|


**See** [SObject.addError](SObject.addError)

###### Example
```apex
SObjectConsumers.addError(new IllegalArgumentException('Error message'));
```


##### `public static Consumer setSObject(String fieldName, IOperator operator)`

Returns a `Consumer` that sets SObject the value returned by the `operator` for the specified `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`operator`|applied to the input argument|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `operator` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [SObject.putSObject](SObject.putSObject)

###### Example
```apex
SObjectConsumers.setSObject('Parent', someOperator);
SObjectConsumers.setSObject('Parent.Parent', someOperator);
SObjectConsumers.setSObject('Parent?.Parent', someOperator);
```


##### `public static Consumer setSObject(SObjectField field, IOperator operator)`

Returns a `Consumer` that sets SObject the value returned by the `operator` for the specified `field`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field to set a value|
|`operator`|applied to the input argument|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `operator` is null|


**See** [SObject.putSObject](SObject.putSObject)

###### Example
```apex
SObjectConsumers.setSObject(Account.ParentId, someOperator);
```


##### `public static Consumer setSObject(String fieldName, SObject parent)`

Returns a `Consumer` that sets SObject the `parent` for the specified `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`parent`|the value to set|

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


**See** [SObject.putSObject](SObject.putSObject)

###### Example
```apex
SObjectConsumers.setSObject('Parent', someAccount);
SObjectConsumers.setSObject('Parent.Parent', someAccount);
SObjectConsumers.setSObject('Parent?.Parent', (SObject) null);
```


##### `public static Consumer setSObject(SObjectField field, SObject parent)`

Returns a `Consumer` that sets SObject the `parent` for the specified `field`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field to set a value|
|`parent`|the value to set|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** [SObject.putSObject](SObject.putSObject)

###### Example
```apex
SObjectConsumers.setSObject(Account.ParentId, someAccount);
SObjectConsumers.setSObject(Account.ParentId, (SObject) null);
```


##### `public static Consumer set(String fieldName, IFunction mapper)`

*Inherited*


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

*Inherited*


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

*Inherited*


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

*Inherited*


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
