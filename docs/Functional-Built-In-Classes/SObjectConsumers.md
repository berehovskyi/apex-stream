# SObjectConsumers

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides common implementations of [SObjectConsumer](/docs/Functional-Abstract-Classes/SObjectConsumer.md) and related utilities.


**See** [SObjectConsumer](/docs/Functional-Abstract-Classes/SObjectConsumer.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `static addError(String fieldName, String message)`

Returns a `SObjectConsumer` that adds error to `fieldName`.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field name to add an error|
|`message`|the error message|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `message` is null|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.addError

###### Example
```apex
SObjectConsumers.addError('NumberOfEmployees', 'Error message');
```

##### `static addError(SObjectField field, String message)`

Returns a `SObjectConsumer` that adds error to `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field to add an error|
|`message`|the error message|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is blank or `message` is null|


**See** SObject.addError

###### Example
```apex
SObjectConsumers.addError(Account.NumberOfEmployees, 'Error message');
```

##### `static addError(String message)`

Returns a `SObjectConsumer` that adds error to an input argument.

###### Parameters
|Param|Description|
|---|---|
|`message`|the error message|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is nuyll|


**See** SObject.addError

###### Example
```apex
SObjectConsumers.addError('Error message');
```

##### `static addError(Exception exc)`

Returns a `SObjectConsumer` that adds error to an input argument.

###### Parameters
|Param|Description|
|---|---|
|`exc`|the exception to attach|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `exc` is null|


**See** SObject.addError

###### Example
```apex
SObjectConsumers.addError(new IllegalArgumentException('Error message'));
```

##### `static set(String fieldName, ISObjectFunction mapper)`

Returns a `SObjectConsumer` that sets the value returned by the `mapper` for the specified `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`mapper`|applied to the input argument|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

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
SObjectConsumers.set('NumberOfEmployees', someSObjectFunction);
SObjectConsumers.set('Parent.NumberOfEmployees', someSObjectFunction);
SObjectConsumers.set('Parent?.NumberOfEmployees', someSObjectFunction);
```

##### `static set(SObjectField field, ISObjectFunction mapper)`

Returns a `SObjectConsumer` that sets the value returned by the `mapper` for the specified `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field to set a value|
|`mapper`|applied to the input argument|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `mapper` is null|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.put

###### Example
```apex
SObjectConsumers.set(Account.NumberOfEmployees, someSObjectFunction);
```

##### `static set(String fieldName, Object value)`

Returns a `SObjectConsumer` that sets the `value` for the specified `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`value`|the value to set|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

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
SObjectConsumers.set('NumberOfEmployees', 100);
SObjectConsumers.set('Parent.NumberOfEmployees', 100);
SObjectConsumers.set('Parent?.NumberOfEmployees', (Object) null);
```

##### `static set(SObjectField field, Object value)`

Returns a `SObjectConsumer` that sets the `value` for the specified `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field to set a value|
|`value`|the value to set|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.put

###### Example
```apex
SObjectConsumers.set(Account.NumberOfEmployees, 100);
SObjectConsumers.set(Account.NumberOfEmployees, (Object) null);
```

##### `static setSObject(String fieldName, ISObjectUnaryOperator operator)`

Returns a `SObjectConsumer` that sets SObject the value returned by the `operator` for the specified `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`operator`|applied to the input argument|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `operator` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.putSObject

###### Example
```apex
SObjectConsumers.setSObject('Parent', someSObjectUnaryOperator);
SObjectConsumers.setSObject('Parent.Parent', someSObjectUnaryOperator);
SObjectConsumers.setSObject('Parent?.Parent', someSObjectUnaryOperator);
```

##### `static setSObject(SObjectField field, ISObjectUnaryOperator operator)`

Returns a `SObjectConsumer` that sets SObject the value returned by the `operator` for the specified `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field to set a value|
|`operator`|applied to the input argument|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `operator` is null|


**See** SObject.putSObject

###### Example
```apex
SObjectConsumers.setSObject(Account.ParentId, someSObjectUnaryOperator);
```

##### `static setSObject(String fieldName, SObject parent)`

Returns a `SObjectConsumer` that sets SObject the `parent` for the specified `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`parent`|the value to set|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.putSObject

###### Example
```apex
SObjectConsumers.setSObject('Parent', someAccount);
SObjectConsumers.setSObject('Parent.Parent', someAccount);
SObjectConsumers.setSObject('Parent?.Parent', (SObject) null);
```

##### `static setSObject(SObjectField field, SObject parent)`

Returns a `SObjectConsumer` that sets SObject the `parent` for the specified `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field to set a value|
|`parent`|the value to set|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** SObject.putSObject

###### Example
```apex
SObjectConsumers.setSObject(Account.ParentId, someAccount);
SObjectConsumers.setSObject(Account.ParentId, (SObject) null);
```

---
