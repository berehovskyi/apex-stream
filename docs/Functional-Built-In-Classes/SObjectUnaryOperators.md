# SObjectUnaryOperators

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides common implementations of [SObjectUnaryOperator](/docs/Functional-Abstract-Classes/SObjectUnaryOperator.md) and related utilities.


**See** [SObjectUnaryOperator](/docs/Functional-Abstract-Classes/SObjectUnaryOperator.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `static getSObject(String fieldName)`

Returns a `SObjectUnaryOperator` that gets sobject for the specified `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field to get a value|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.getSObject

###### Example
```apex
SObjectUnaryOperators.getSObject('Parent');
SObjectUnaryOperators.getSObject('Parent.Parent');
SObjectUnaryOperators.getSObject('Parent?.Parent');
```

##### `static getSObject(SObjectField field)`

Returns a `SObjectUnaryOperator` that gets sobject for the specified `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field to get a value|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** SObject.getSObject

###### Example
```apex
SObjectUnaryOperators.getSObject(Account.ParentId);
```

##### `static set(String fieldName, ISObjectFunction mapper)`

Returns a `SObjectUnaryOperator` that sets the value returned by the `mapper` for the specified `fieldName` and returns a mutated argument. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`mapper`|applied to the input argument|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectConsumers.set

###### Example
```apex
SObjectUnaryOperators.set('NumberOfEmployees', someSObjectFunction);
SObjectUnaryOperators.set('Parent.NumberOfEmployees', someSObjectFunction);
SObjectUnaryOperators.set('Parent?.NumberOfEmployees', someSObjectFunction);
```

##### `static set(SObjectField field, ISObjectFunction mapper)`

Returns a `SObjectUnaryOperator` that sets the value returned by the `mapper` for the specified `field` and returns a mutated argument.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field name to set a value|
|`mapper`|applied to the input argument|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `mapper` is null|


**See** SObjectConsumers.set

###### Example
```apex
SObjectUnaryOperators.set(Account.NumberOfEmployees, someSObjectFunction);
SObjectUnaryOperators.set(Account.NumberOfEmployees, SObjectFunction.constant(100));
```

##### `static set(String fieldName, Object value)`

Returns a `SObjectUnaryOperator` that sets the `value` for the specified `fieldName` and returns a mutated argument. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`value`|the value to set|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectConsumers.set

###### Example
```apex
SObjectUnaryOperators.set('NumberOfEmployees', 100);
SObjectUnaryOperators.set('Parent.NumberOfEmployees', 100);
SObjectUnaryOperators.set('Parent?.NumberOfEmployees', (Object) null);
```

##### `static set(SObjectField field, Object value)`

Returns a `SObjectUnaryOperator` that sets the `value` for the specified `field` and returns a mutated argument.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field name to set a value|
|`value`|the value to set|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectConsumers.set

###### Example
```apex
SObjectUnaryOperators.set(Account.NumberOfEmployees, 100);
SObjectUnaryOperators.set(Account.NumberOfEmployees, (Object) null);
```

##### `static setSObject(String fieldName, ISObjectUnaryOperator operator)`

Returns a `SObjectUnaryOperator` that sets SObject the value returned by the `operator` for the specified `fieldName` and returns a mutated argument. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`operator`|applied to the input argument|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `operator` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectConsumers.setSObject

###### Example
```apex
SObjectUnaryOperators.setSObject('Parent', someSObjectUnaryOperator);
SObjectUnaryOperators.setSObject('Parent.Parent', someSObjectUnaryOperator);
SObjectUnaryOperators.setSObject('Parent?.Parent', someSObjectUnaryOperator);
```

##### `static setSObject(SObjectField field, ISObjectUnaryOperator operator)`

Returns a `SObjectUnaryOperator` that sets SObject the value returned by the `operator` for the specified `field` and returns a mutated argument. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field name to set a value|
|`operator`|applied to the input argument|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `operator` is null|


**See** SObjectConsumers.setSObject

###### Example
```apex
SObjectUnaryOperators.setSObject(Account.ParentId, someSObjectUnaryOperator);
```

##### `static setSObject(String fieldName, SObject parent)`

Returns a `SObjectUnaryOperator` that sets SObject the `parent` for the specified `fieldName` and returns a mutated argument. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`parent`|the value to set|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectConsumers.setSObject

###### Example
```apex
SObjectUnaryOperators.setSObject('Parent', someAccount);
SObjectUnaryOperators.setSObject('Parent.Parent', someAccount);
SObjectUnaryOperators.setSObject('Parent?.Parent', (SObject) null);
```

##### `static setSObject(SObjectField field, SObject parent)`

Returns a `SObjectUnaryOperator` that sets SObject the `parent` for the specified `field` and returns a mutated argument. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field name to set a value|
|`parent`|the value to set|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectConsumers.setSObject

###### Example
```apex
SObjectUnaryOperators.setSObject(Account.ParentId, someAccount);
SObjectUnaryOperators.setSObject(Account.ParentId, (SObject) null);
```

##### `static setSObjects(String fieldName, ISObjectFunction mapper)`

Returns a `SObjectUnaryOperator` that sets sobjects the value returned by the `mapper` for the specified `fieldName` and returns a mutated argument. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>This operator uses serialization / deserialization to set related children sobjects.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`mapper`|applied to the input argument|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectUnaryOperators.setSObjects('Contacts', someSObjectFunction);
SObjectUnaryOperators.setSObjects('Parent.Contacts', someSObjectFunction);
SObjectUnaryOperators.setSObjects('Parent?.Contacts', someSObjectFunction);
```

##### `static setSObjects(SObjectField field, ISObjectFunction mapper)`

Returns a `SObjectUnaryOperator` that sets sobjects the value returned by the `mapper` for the specified `field` and returns a mutated argument. <p><strong>Note: </strong></p> <p>This operator uses serialization / deserialization to set related children sobjects.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the field name to set a value|
|`mapper`|applied to the input argument|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `mapper` is null|

###### Example
```apex
SObjectUnaryOperators.setSObjects(Contact.AccountId, someSObjectFunction);
```

##### `static setSObjects(String fieldName, List<SObject> children)`

Returns a `SObjectUnaryOperator` that sets sobjects the `children` for the specified `fieldName` and returns a mutated argument. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>This operator uses serialization / deserialization to set related children sobjects.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`children`|the value to set|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectUnaryOperators.setSObjects('Contacts', someSObjectFunction);
SObjectUnaryOperators.setSObjects('Parent.Contacts', someSObjectFunction);
SObjectUnaryOperators.setSObjects('Parent?.Contacts', someSObjectFunction);
```

##### `static setSObjects(SObjectField field, List<SObject> children)`

Returns a `SObjectUnaryOperator` that sets sobjects the `children` the for the specified `field` and returns a mutated argument. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>This operator uses serialization / deserialization to set related children sobjects.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the field name to set a value|
|`children`|the value to set|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectUnaryOperators.setSObjects(Contact.AccountId, childrenContacts);
SObjectUnaryOperators.setSObjects(Contact.AccountId, (List<SObject>) null);
```

##### `static newSObject(SObjectType sObjectType)`

Returns a `SObjectUnaryOperator` that returns a new sobject of the given `sObjectType`.

###### Parameters
|Param|Description|
|---|---|
|`sObjectType`|the SObjectType of a new SObject to be returned|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` is null|


**See** SObjectSupplier.of

###### Example
```apex
SObjectUnaryOperators.newSObject(Account.SObjectType);
```

##### `static newSObject(SObjectType sObjectType, ISObjectBinaryOperator merger)`

Returns a combined `SObjectUnaryOperator` of the SObjectUnaryOperators.newSObject and the `merger`. Is typically used to create a new SObject based on an input argument.

###### Parameters
|Param|Description|
|---|---|
|`sObjectType`|the SObjectType of a new SObject to be returned|
|`merger`|the binary operator that merges input arguments|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` or `merger` is null|


**See** SObjectCollectors.mapping

##### `static newSObject(SObjectType sObjectType, String fieldName, ISObjectFunction mapper)`

Returns a combined `SObjectUnaryOperator` of the SObjectUnaryOperators.newSObject and the SObjectBiConsumers.set. Is typically used to create a new SObject based on an input argument. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`sObjectType`|the SObjectType of a new SObject to be returned|
|`fieldName`|target field name of a first input argument|
|`mapper`|the function applied to a second input argument|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` or `fieldName`, `mapper` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectUnaryOperators.newSObject


**See** SObjectBiConsumers.set


**See** SObjectCollectors.mapping

###### Example
```apex
SObjectUnaryOperators.newSObject(Account.SObjectType, 'Id', SObjectFunctions.get('AccountId'));
SObjectUnaryOperators.newSObject(Account.SObjectType, 'Id', SObjectFunctions.get('Account.ParentId'));
```

##### `static newSObject(SObjectType sObjectType, SObjectField field, ISObjectFunction mapper)`

Returns a combined `SObjectUnaryOperator` of the SObjectUnaryOperators.newSObject and the SObjectBiConsumers.set. Is typically used to create a new SObject based on an input argument. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`sObjectType`|the SObjectType of a new SObject to be returned|
|`field`|target field of a first input argument|
|`mapper`|the function applied to a second input argument|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` or `field`, `mapper` is null|


**See** SObjectUnaryOperators.newSObject


**See** SObjectBiConsumers.set


**See** SObjectCollectors.mapping

###### Example
```apex
SObjectUnaryOperators.newSObject(Account.SObjectType, Account.Id, SObjectFunctions.get('AccountId'));
```

##### `static newSObject(SObjectType sObjectType, String fieldName, Object value)`

Returns a combined `SObjectUnaryOperator` of the SObjectUnaryOperators.newSObject and the SObjectBiConsumers.set. Is typically used to create a new SObject and set the `value` for the `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`sObjectType`|the SObjectType of a new SObject to be returned|
|`fieldName`|target field name of a first input argument|
|`value`|the value to set|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` or `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectUnaryOperators.newSObject(Account.SObjectType, 'Id', someAccId);
```

##### `static newSObject(SObjectType sObjectType, SObjectField field, Object value)`

Returns a combined `SObjectUnaryOperator` of the SObjectUnaryOperators.newSObject and the SObjectBiConsumers.set. Is typically used to create a new SObject and set the `value` for the `field`.

###### Parameters
|Param|Description|
|---|---|
|`sObjectType`|the SObjectType of a new SObject to be returned|
|`field`|the target field|
|`value`|the value to set|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` or `fieldName` is null|

###### Example
```apex
SObjectUnaryOperators.newSObject(Account.SObjectType, Account.Id, someAccId);
```

---
