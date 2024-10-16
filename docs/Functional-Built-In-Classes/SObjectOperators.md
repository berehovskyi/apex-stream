# virtual SObjectOperators

`SUPPRESSWARNINGS`

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides common implementations of [Operator](/docs/Functional-Abstract-Classes/Operator.md)
and related utilities.


**See** [Operator](/docs/Functional-Abstract-Classes/Operator.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static Operator getSObject(String fieldName)`

Returns a `Operator` that gets sobject for the specified `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field to get a value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [SObject.getSObject](SObject.getSObject)

###### Example
```apex
SObjectOperators.getSObject('Parent');
SObjectOperators.getSObject('Parent.Parent');
SObjectOperators.getSObject('Parent?.Parent');
```


##### `public static Operator getSObject(SObjectField field)`

Returns a `Operator` that gets sobject for the specified `field`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field to get a value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** [SObject.getSObject](SObject.getSObject)

###### Example
```apex
SObjectOperators.getSObject(Account.ParentId);
```


##### `public static Operator set(String fieldName, IFunction mapper)`

Returns a `Operator` that sets the value returned by the `mapper` for the specified `fieldName` and returns a mutated argument. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`mapper`|applied to the input argument|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

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
SObjectOperators.set('NumberOfEmployees', someFunction);
SObjectOperators.set('Parent.NumberOfEmployees', someFunction);
SObjectOperators.set('Parent?.NumberOfEmployees', someFunction);
```


##### `public static Operator set(SObjectField field, IFunction mapper)`

Returns a `Operator` that sets the value returned by the `mapper` for the specified `field` and returns a mutated argument.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field name to set a value|
|`mapper`|applied to the input argument|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `mapper` is null|

###### Example
```apex
SObjectOperators.set(Account.NumberOfEmployees, someFunction);
SObjectOperators.set(Account.NumberOfEmployees, Function.constant(100));
```


##### `public static Operator set(String fieldName, Object value)`

Returns a `Operator` that sets the `value` for the specified `fieldName` and returns a mutated argument. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`value`|the value to set|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectOperators.set('NumberOfEmployees', 100);
SObjectOperators.set('Parent.NumberOfEmployees', 100);
SObjectOperators.set('Parent?.NumberOfEmployees', (Object) null);
```


##### `public static Operator set(SObjectField field, Object value)`

Returns a `Operator` that sets the `value` for the specified `field` and returns a mutated argument.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field name to set a value|
|`value`|the value to set|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectOperators.set(Account.NumberOfEmployees, 100);
SObjectOperators.set(Account.NumberOfEmployees, (Object) null);
```


##### `public static Operator setSObject(String fieldName, IOperator valueMapper)`

Returns a `Operator` that sets SObject the value returned by the `valueMapper` for the specified `fieldName` and returns a mutated argument. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`valueMapper`|applied to the input argument|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `valueMapper` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [SObjectConsumers.setSObject](SObjectConsumers.setSObject)

###### Example
```apex
SObjectOperators.setSObject('Parent', someOperator);
SObjectOperators.setSObject('Parent.Parent', someOperator);
SObjectOperators.setSObject('Parent?.Parent', someOperator);
```


##### `public static Operator setSObject(SObjectField field, IOperator valueMapper)`

Returns a `Operator` that sets SObject the value returned by the `valueMapper` for the specified `field` and returns a mutated argument. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field name to set a value|
|`valueMapper`|applied to the input argument|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `valueMapper` is null|


**See** [SObjectConsumers.setSObject](SObjectConsumers.setSObject)

###### Example
```apex
SObjectOperators.setSObject(Account.ParentId, someOperator);
```


##### `public static Operator setSObject(String fieldName, SObject parent)`

Returns a `Operator` that sets SObject the `parent` for the specified `fieldName` and returns a mutated argument. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`parent`|the value to set|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [SObjectConsumers.setSObject](SObjectConsumers.setSObject)

###### Example
```apex
SObjectOperators.setSObject('Parent', someAccount);
SObjectOperators.setSObject('Parent.Parent', someAccount);
SObjectOperators.setSObject('Parent?.Parent', (SObject) null);
```


##### `public static Operator setSObject(SObjectField field, SObject parent)`

Returns a `Operator` that sets SObject the `parent` for the specified `field` and returns a mutated argument. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`field`|the field name to set a value|
|`parent`|the value to set|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [SObjectConsumers.setSObject](SObjectConsumers.setSObject)

###### Example
```apex
SObjectOperators.setSObject(Account.ParentId, someAccount);
SObjectOperators.setSObject(Account.ParentId, (SObject) null);
```


##### `public static Operator setSObjects(String fieldName, IFunction mapper)`

Returns a `Operator` that sets sobjects the value returned by the `mapper` for the specified `fieldName` and returns a mutated argument. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>This valueMapper uses serialization / deserialization to set related children sobjects.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`mapper`|applied to the input argument|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

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
SObjectOperators.setSObjects('Contacts', someFunction);
SObjectOperators.setSObjects('Parent.Contacts', someFunction);
SObjectOperators.setSObjects('Parent?.Contacts', someFunction);
```


##### `public static Operator setSObjects(SObjectField field, IFunction mapper)`

Returns a `Operator` that sets sobjects the value returned by the `mapper` for the specified `field` and returns a mutated argument. <p><strong>Note: </strong></p> <p>This valueMapper uses serialization / deserialization to set related children sobjects.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|the field name to set a value|
|`mapper`|applied to the input argument|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `mapper` is null|

###### Example
```apex
SObjectOperators.setSObjects(Contact.AccountId, someFunction);
```


##### `public static Operator setSObjects(String fieldName, List<SObject> children)`

Returns a `Operator` that sets sobjects the `children` for the specified `fieldName` and returns a mutated argument. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>This valueMapper uses serialization / deserialization to set related children sobjects.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name to set a value|
|`children`|the value to set|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectOperators.setSObjects('Contacts', someFunction);
SObjectOperators.setSObjects('Parent.Contacts', someFunction);
SObjectOperators.setSObjects('Parent?.Contacts', someFunction);
```


##### `public static Operator setSObjects(SObjectField field, List<SObject> children)`

Returns a `Operator` that sets sobjects the `children` the for the specified `field` and returns a mutated argument. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>This valueMapper uses serialization / deserialization to set related children sobjects.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|the field name to set a value|
|`children`|the value to set|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectOperators.setSObjects(Contact.AccountId, childrenContacts);
SObjectOperators.setSObjects(Contact.AccountId, (List<SObject>) null);
```


##### `public static Operator newSObject(SObjectType sObjectType)`

Returns a `Operator` that returns a new sobject of the given `sObjectType`.

###### Parameters

|Param|Description|
|---|---|
|`sObjectType`|the SObjectType of a new SObject to be returned|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` is null|


**See** [Supplier.of](Supplier.of)

###### Example
```apex
SObjectOperators.newSObject(Account.SObjectType);
```


##### `public static Operator newSObject(SObjectType sObjectType, IBiOperator merger)`

Returns a combined `Operator` of the [SObjectOperators.newSObject](SObjectOperators.newSObject) and the `merger`. Is typically used to create a new SObject based on an input argument.

###### Parameters

|Param|Description|
|---|---|
|`sObjectType`|the SObjectType of a new SObject to be returned|
|`merger`|the binary valueMapper that merges input arguments|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` or `merger` is null|

##### `public static Operator newSObject(SObjectType sObjectType, String fieldName, IFunction mapper)`

Returns a combined `Operator` of the [SObjectOperators.newSObject](SObjectOperators.newSObject) and the [SObjectBiConsumers.set](SObjectBiConsumers.set). Is typically used to create a new SObject based on an input argument. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`sObjectType`|the SObjectType of a new SObject to be returned|
|`fieldName`|target field name of a first input argument|
|`mapper`|the function applied to a second input argument|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` or `fieldName`, `mapper` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectOperators.newSObject(Account.SObjectType, 'Id', Functions.get('AccountId'));
SObjectOperators.newSObject(Account.SObjectType, 'Id', Functions.get('Account.ParentId'));
```


##### `public static Operator newSObject(SObjectType sObjectType, SObjectField field, IFunction mapper)`

Returns a combined `Operator` of the [SObjectOperators.newSObject](SObjectOperators.newSObject) and the [SObjectBiConsumers.set](SObjectBiConsumers.set). Is typically used to create a new SObject based on an input argument. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`sObjectType`|the SObjectType of a new SObject to be returned|
|`field`|target field of a first input argument|
|`mapper`|the function applied to a second input argument|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` or `field`, `mapper` is null|

###### Example
```apex
SObjectOperators.newSObject(Account.SObjectType, Account.Id, Functions.get('AccountId'));
```


##### `public static Operator newSObject(SObjectType sObjectType, String fieldName, Object value)`

Returns a combined `Operator` of the [SObjectOperators.newSObject](SObjectOperators.newSObject) and the [SObjectBiConsumers.set](SObjectBiConsumers.set). Is typically used to create a new SObject and set the `value` for the `fieldName`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`sObjectType`|the SObjectType of a new SObject to be returned|
|`fieldName`|target field name of a first input argument|
|`value`|the value to set|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` or `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectOperators.newSObject(Account.SObjectType, 'Id', someAccId);
```


##### `public static Operator newSObject(SObjectType sObjectType, SObjectField field, Object value)`

Returns a combined `Operator` of the [SObjectOperators.newSObject](SObjectOperators.newSObject) and the [SObjectBiConsumers.set](SObjectBiConsumers.set). Is typically used to create a new SObject and set the `value` for the `field`.

###### Parameters

|Param|Description|
|---|---|
|`sObjectType`|the SObjectType of a new SObject to be returned|
|`field`|the target field|
|`value`|the value to set|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` or `fieldName` is null|

###### Example
```apex
SObjectOperators.newSObject(Account.SObjectType, Account.Id, someAccId);
```


---
