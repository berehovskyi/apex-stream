# SObjectUnaryOperator

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ISObjectUnaryOperator](/docs/Functional-Interfaces/ISObjectUnaryOperator.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes


**See** ISObjectIterable.mapTo

## Methods
### Function
##### `apply(SObject sObj)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `andThen(ISObjectUnaryOperator after)`

Returns a composed `SObjectUnaryOperator` that executes `this` operation first, then the `after` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the composed `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

##### `compose(ISObjectUnaryOperator before)`

Returns a composed `SObjectUnaryOperator` that executes `before` operation first, then the `this` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`before`|the operation to perform before this operation|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the composed `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if before is null|

---
### Static Methods
##### `static compose(List<ISObjectUnaryOperator> operators)`

Returns a composed `SObjectUnaryOperator` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters
|Param|Description|
|---|---|
|`operators`|the operations to sequentially perform|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the composed `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operators` is null or some element is null|

##### `static identity()`

Returns a `SObjectUnaryOperator` that always returns the input argument.

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

##### `static constant(SObject value)`

Returns a `SObjectUnaryOperator` that always returns the `value`.

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

##### `static forConsumer(ISObjectConsumer consumer)`

Returns a composed `SObjectUnaryOperator` of the `consumer`.

###### Parameters
|Param|Description|
|---|---|
|`consumer`|the consumer|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

##### `static forSupplier(ISObjectSupplier supplier)`

Returns a composed `SObjectUnaryOperator` of the `supplier`.

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

##### `static combine(ISObjectUnaryOperator operator, ISObjectBinaryOperator merger)`

Returns a combined `SObjectUnaryOperator` of the `operator` and the `merger`.

###### Parameters
|Param|Description|
|---|---|
|`operator`|the operator|
|`merger`|the binary operator that merges the input argument and a value returned by the `operator`.|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operator` or `merger` is null|

---
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
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.getSObject

###### Example
```apex
SObjectUnaryOperator.getSObject('Parent');
SObjectUnaryOperator.getSObject('Parent.Parent');
SObjectUnaryOperator.getSObject('Parent?.Parent');
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
|`NullPointerException`|if the `field` is null|


**See** SObject.getSObject

###### Example
```apex
SObjectUnaryOperator.getSObject(Account.ParentId);
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
|`NullPointerException`|if the `fieldName` is blank or the `mapper` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectConsumer.set

###### Example
```apex
SObjectUnaryOperator.set('NumberOfEmployees', someSObjectFunction);
SObjectUnaryOperator.set('Parent.NumberOfEmployees', someSObjectFunction);
SObjectUnaryOperator.set('Parent?.NumberOfEmployees', someSObjectFunction);
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
|`NullPointerException`|if the `field` or the `mapper` is null|


**See** SObjectConsumer.set

###### Example
```apex
SObjectUnaryOperator.set(Account.NumberOfEmployees, someSObjectFunction);
SObjectUnaryOperator.set(Account.NumberOfEmployees, SObjectFunction.constant(100));
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
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectConsumer.set

###### Example
```apex
SObjectUnaryOperator.set('NumberOfEmployees', 100);
SObjectUnaryOperator.set('Parent.NumberOfEmployees', 100);
SObjectUnaryOperator.set('Parent?.NumberOfEmployees', (Object) null);
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
|`NullPointerException`|if the `field` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectConsumer.set

###### Example
```apex
SObjectUnaryOperator.set(Account.NumberOfEmployees, 100);
SObjectUnaryOperator.set(Account.NumberOfEmployees, (Object) null);
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
|`NullPointerException`|if the `fieldName` is blank or the `operator` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectConsumer.setSObject

###### Example
```apex
SObjectUnaryOperator.setSObject('Parent', someSObjectUnaryOperator);
SObjectUnaryOperator.setSObject('Parent.Parent', someSObjectUnaryOperator);
SObjectUnaryOperator.setSObject('Parent?.Parent', someSObjectUnaryOperator);
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
|`NullPointerException`|if the `field` or the `operator` is null|


**See** SObjectConsumer.setSObject

###### Example
```apex
SObjectUnaryOperator.setSObject(Account.ParentId, someSObjectUnaryOperator);
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
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectConsumer.setSObject

###### Example
```apex
SObjectUnaryOperator.setSObject('Parent', someAccount);
SObjectUnaryOperator.setSObject('Parent.Parent', someAccount);
SObjectUnaryOperator.setSObject('Parent?.Parent', (SObject) null);
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
|`NullPointerException`|if the `field` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectConsumer.setSObject

###### Example
```apex
SObjectUnaryOperator.setSObject(Account.ParentId, someAccount);
SObjectUnaryOperator.setSObject(Account.ParentId, (SObject) null);
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
|`NullPointerException`|if the `fieldName` is blank or the `mapper` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectUnaryOperator.setSObjects('Contacts', someSObjectFunction);
SObjectUnaryOperator.setSObjects('Parent.Contacts', someSObjectFunction);
SObjectUnaryOperator.setSObjects('Parent?.Contacts', someSObjectFunction);
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
|`NullPointerException`|if the `field` or the `mapper` is null|

###### Example
```apex
SObjectUnaryOperator.setSObjects(Contact.AccountId, someSObjectFunction);
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
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectUnaryOperator.setSObjects('Contacts', someSObjectFunction);
SObjectUnaryOperator.setSObjects('Parent.Contacts', someSObjectFunction);
SObjectUnaryOperator.setSObjects('Parent?.Contacts', someSObjectFunction);
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
|`NullPointerException`|if the `field` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectUnaryOperator.setSObjects(Contact.AccountId, childrenContacts);
SObjectUnaryOperator.setSObjects(Contact.AccountId, (List<SObject>) null);
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
SObjectUnaryOperator.newSObject(Account.SObjectType);
```

##### `static newSObject(SObjectType sObjectType, ISObjectBinaryOperator merger)`

Returns a combined `SObjectUnaryOperator` of the SObjectUnaryOperator.newSObject and the `merger`. Is typically used to create a new SObject based on an input argument.

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


**See** SObjectCollector.mapping

##### `static newSObject(SObjectType sObjectType, String fieldName, ISObjectFunction mapper)`

Returns a combined `SObjectUnaryOperator` of the SObjectUnaryOperator.newSObject and the SObjectBiConsumer.set. Is typically used to create a new SObject based on an input argument. Cross-reference fields and safe navigation are supported.

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


**See** SObjectUnaryOperator.newSObject


**See** SObjectBiConsumer.set


**See** SObjectCollector.mapping

###### Example
```apex
SObjectUnaryOperator.newSObject(Account.SObjectType, 'Id', SObjectFunction.get('AccountId'));
SObjectUnaryOperator.newSObject(Account.SObjectType, 'Id', SObjectFunction.get('Account.ParentId'));
```

##### `static newSObject(SObjectType sObjectType, SObjectField field, ISObjectFunction mapper)`

Returns a combined `SObjectUnaryOperator` of the SObjectUnaryOperator.newSObject and the SObjectBiConsumer.set. Is typically used to create a new SObject based on an input argument. Cross-reference fields and safe navigation are supported.

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


**See** SObjectUnaryOperator.newSObject


**See** SObjectBiConsumer.set


**See** SObjectCollector.mapping

###### Example
```apex
SObjectUnaryOperator.newSObject(Account.SObjectType, Account.Id, SObjectFunction.get('AccountId'));
```

##### `static newSObject(SObjectType sObjectType, String fieldName, Object value)`

Returns a combined `SObjectUnaryOperator` of the SObjectUnaryOperator.newSObject and the SObjectBiConsumer.set. Is typically used to create a new SObject and set the `value` for the `fieldName`. Cross-reference fields and safe navigation are supported.

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
SObjectUnaryOperator.newSObject(Account.SObjectType, 'Id', someAccId);
```

##### `static newSObject(SObjectType sObjectType, SObjectField field, Object value)`

Returns a combined `SObjectUnaryOperator` of the SObjectUnaryOperator.newSObject and the SObjectBiConsumer.set. Is typically used to create a new SObject and set the `value` for the `field`.

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
SObjectUnaryOperator.newSObject(Account.SObjectType, Account.Id, someAccId);
```

---
