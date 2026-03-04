# virtual SObjectConsumers

`APIVERSION: 66`

`STATUS: ACTIVE`

Provides common implementations of [Consumer](/docs/Functional-Abstract-Classes/Consumer.md)
and related utilities.


**See** [Consumer](/docs/Functional-Abstract-Classes/Consumer.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static Consumer addError(String field, String message)`

Returns a `Consumer` that adds an error to `field`.

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
|`IllegalArgumentException`|if `field` is blank|
|`NullPointerException`|if `field` is null|
|`NullPointerException`|if `message` is null|
|`SObjectException`|if provided invalid `field`|


**See** [SObject.addError](SObject.addError)

###### Example
```apex
SObjectConsumers.addError('NumberOfEmployees', 'Error message');
```


##### `public static Consumer addError(SObjectField field, String message)`

Returns a `Consumer` that adds an error to `field`.

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

Returns a `Consumer` that adds an error to an input argument.

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

Returns a `Consumer` that adds an error to an input argument.

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


##### `public static Consumer set(String field, IFunction mapper)`

Returns a `Consumer` that sets the value returned by the `mapper` for the specified `field`. Cross-reference fields and safe navigation are supported.

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
|`IllegalArgumentException`|if `field` is blank|
|`NullPointerException`|if `field` is null|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `field`|


**See** [SObject.put](SObject.put)

###### Example
```apex
SObjectConsumers.set('NumberOfEmployees', someFunction);
SObjectConsumers.set('Parent.NumberOfEmployees', someFunction);
SObjectConsumers.set('Parent?.NumberOfEmployees', someFunction);
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
|`SObjectException`|if provided invalid `field`|


**See** [SObject.put](SObject.put)

###### Example
```apex
SObjectConsumers.set(Account.NumberOfEmployees, someFunction);
```


##### `public static Consumer set(String field, Object value)`

Returns a `Consumer` that sets the `value` for the specified `field`. Cross-reference fields and safe navigation are supported.

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
|`IllegalArgumentException`|if `field` is blank|
|`NullPointerException`|if `field` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `field`|


**See** [SObject.put](SObject.put)

###### Example
```apex
SObjectConsumers.set('NumberOfEmployees', 100);
SObjectConsumers.set('Parent.NumberOfEmployees', 100);
SObjectConsumers.set('Parent?.NumberOfEmployees', (Object) null);
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
|`IllegalArgumentException`|if `field` is blank|
|`NullPointerException`|if `field` is null|
|`SObjectException`|if provided invalid `field`|


**See** [SObject.put](SObject.put)

###### Example
```apex
SObjectConsumers.set(Account.NumberOfEmployees, 100);
SObjectConsumers.set(Account.NumberOfEmployees, (Object) null);
```


##### `public static Consumer setSObject(String field, IOperator operator)`

Returns a `Consumer` that sets the SObject value returned by the `operator` for the specified `field`. Cross-reference fields and safe navigation are supported.

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
|`IllegalArgumentException`|if `field` is blank|
|`NullPointerException`|if `field` is null|
|`NullPointerException`|if `operator` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `field`|


**See** [SObject.putSObject](SObject.putSObject)

###### Example
```apex
SObjectConsumers.setSObject('Parent', someOperator);
SObjectConsumers.setSObject('Parent.Parent', someOperator);
SObjectConsumers.setSObject('Parent?.Parent', someOperator);
```


##### `public static Consumer setSObject(SObjectField field, IOperator operator)`

Returns a `Consumer` that sets the SObject value returned by the `operator` for the specified `field`.

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


##### `public static Consumer setSObject(String field, SObject parent)`

Returns a `Consumer` that sets the SObject `parent` for the specified `field`. Cross-reference fields and safe navigation are supported.

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
|`IllegalArgumentException`|if `field` is blank|
|`NullPointerException`|if `field` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `field`|


**See** [SObject.putSObject](SObject.putSObject)

###### Example
```apex
SObjectConsumers.setSObject('Parent', someAccount);
SObjectConsumers.setSObject('Parent.Parent', someAccount);
SObjectConsumers.setSObject('Parent?.Parent', (SObject) null);
```


##### `public static Consumer setSObject(SObjectField field, SObject parent)`

Returns a `Consumer` that sets the SObject `parent` for the specified `field`.

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


---
