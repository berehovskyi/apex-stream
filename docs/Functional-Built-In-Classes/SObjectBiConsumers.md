# SObjectBiConsumers

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides common implementations of [SObjectBiConsumer](/docs/Functional-Abstract-Classes/SObjectBiConsumer.md) and related utilities.


**See** [SObjectBiConsumer](/docs/Functional-Abstract-Classes/SObjectBiConsumer.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `static set(String fieldName, ISObjectFunction mapper)`

Returns a `SObjectBiConsumer` that sets for the specified field for the second `SObject` input argument a result returned by the `mapper` applied to the first `SObject` input argument. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the target field name of the second `SObject` input argument|
|`mapper`|the function applied to the first `SObject` input argument|

###### Return

**Type**

SObjectBiConsumer

**Description**

the `SObjectBiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectBinaryOperator.forBiConsumer

###### Example
```apex
SObjectBiConsumers.set('NumberOfEmployees', someSObjectFunction);
SObjectBiConsumers.set('Parent.NumberOfEmployees', someSObjectFunction);
SObjectBiConsumers.set('Parent?.NumberOfEmployees', someSObjectFunction);
```

##### `static set(SObjectField field, ISObjectFunction mapper)`

Returns a `SObjectBiConsumer` that sets for the specified field for the second `SObject` input argument a result returned by the `mapper` applied to the first `SObject` input argument.

###### Parameters
|Param|Description|
|---|---|
|`field`|the target `SObjectField` of the second `SObject` input argument|
|`mapper`|the function applied to the first `SObject` input argument|

###### Return

**Type**

SObjectBiConsumer

**Description**

the `SObjectBiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `mapper` is null|


**See** SObjectBinaryOperator.forBiConsumer

###### Example
```apex
SObjectBiConsumers.set(Account.NumberOfEmployees, someSObjectFunction);
```

##### `static set(String fieldName, Object value)`

Returns a `SObjectBiConsumer` that sets the `value` for the specified field for the second `SObject` input argument. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the target field name of the second `SObject` input argument|
|`value`|the value to set for the second `SObject` input argument|

###### Return

**Type**

SObjectBiConsumer

**Description**

the `SObjectBiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectBinaryOperator.forBiConsumer

###### Example
```apex
SObjectBiConsumers.set('NumberOfEmployees', 100);
SObjectBiConsumers.set('Parent.NumberOfEmployees', 100);
SObjectBiConsumers.set('Parent?.NumberOfEmployees', 100);
```

##### `static set(SObjectField field, Object value)`

Returns a `SObjectBiConsumer` that sets the `value` for the specified field for the second `SObject` input argument.

###### Parameters
|Param|Description|
|---|---|
|`field`|the target `SObjectField` of the second `SObject` input argument|
|`value`|the value to set for the second `SObject` input argument|

###### Return

**Type**

SObjectBiConsumer

**Description**

the `SObjectBiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `mapper` is null|


**See** SObjectBinaryOperator.forBiConsumer

###### Example
```apex
SObjectBiConsumers.set(Account.NumberOfEmployees, 100);
```

##### `static setSObject(String fieldName, ISObjectUnaryOperator operator)`

Returns a `SObjectBiConsumer` that sets `SObject` for the specified field for the second `SObject` input argument a result returned by the `mapper` applied to the first `SObject` input argument. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the target field name of the second `SObject` input argument|
|`operator`|the operator applied to the first `SObject` input argument|

###### Return

**Type**

SObjectBiConsumer

**Description**

the `SObjectBiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `operator` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectBinaryOperator.forBiConsumer

###### Example
```apex
SObjectBiConsumers.setSObject('Parent', someSObjectUnaryOperator);
SObjectBiConsumers.setSObject('Parent.Parent', someSObjectUnaryOperator);
SObjectBiConsumers.setSObject('Parent?.Parent', someSObjectUnaryOperator);
```

##### `static setSObject(SObjectField field, ISObjectUnaryOperator operator)`

Returns a `SObjectBiConsumer` that sets `SObject` for the specified field for the second `SObject` input argument a result returned by the `mapper` applied to the first `SObject` input argument.

###### Parameters
|Param|Description|
|---|---|
|`field`|the target `SObjectField` of the second `SObject` input argument|
|`operator`|the operator applied to the first `SObject` input argument|

###### Return

**Type**

SObjectBiConsumer

**Description**

the `SObjectBiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `operator` is null|


**See** SObjectBinaryOperator.forBiConsumer

###### Example
```apex
SObjectBiConsumers.setSObject(Account.ParentId, someSObjectUnaryOperator);
```

##### `static setSObject(String fieldName, SObject value)`

Returns a `SObjectBiConsumer` that sets `SObject` the `value` for the specified field for the second `SObject` input argument. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the target field name of the second `SObject` input argument|
|`value`|the value to set for the second `SObject` input argument|

###### Return

**Type**

SObjectBiConsumer

**Description**

the `SObjectBiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectBinaryOperator.forBiConsumer

###### Example
```apex
SObjectBiConsumers.setSObject('Parent', someAccount);
SObjectBiConsumers.setSObject('Parent.Parent', someAccount);
SObjectBiConsumers.setSObject('Parent?.Parent', someAccount);
```

##### `static setSObject(SObjectField field, SObject value)`

Returns a `SObjectBiConsumer` that sets `SObject` the `value` for the specified field for the second `SObject` input argument.

###### Parameters
|Param|Description|
|---|---|
|`field`|the target `SObjectField` of the second `SObject` input argument|
|`value`|the value to set for the second `SObject` input argument|

###### Return

**Type**

SObjectBiConsumer

**Description**

the `SObjectBiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `mapper` is null|


**See** SObjectBinaryOperator.forBiConsumer

###### Example
```apex
SObjectBiConsumers.setSObject(Account.ParentId, someAccount);
```

---
