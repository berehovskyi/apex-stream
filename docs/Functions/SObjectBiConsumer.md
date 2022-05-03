# SObjectBiConsumer

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ISObjectBiConsumer](/docs/Functional-Interfaces/ISObjectBiConsumer.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions


**See** [ISObjectBinaryOperator](/docs/Functional-Interfaces/ISObjectBinaryOperator.md)

## Methods
### Function
##### `accept(SObject sObj1, SObject sObj2)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `andThen(ISObjectBiConsumer after)`

Returns a composed `SObjectBiConsumer` that executes `this` operation first, then the `after` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Return

**Type**

SObjectBiConsumer

**Description**

the composed `SObjectBiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

---
### Static Methods
##### `static compose(List<ISObjectBiConsumer> consumers)`

Returns a composed `SObjectBiConsumer` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters
|Param|Description|
|---|---|
|`consumers`|the operations to sequentially perform|

###### Return

**Type**

SObjectBiConsumer

**Description**

the composed `SObjectBiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumers` is null or some element is null|

---
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
|`NullPointerException`|if `fieldName` is blank or `mapper` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectBinaryOperator.forBiConsumer

###### Example
```apex
SObjectBiConsumer.set('NumberOfEmployees', someSObjectFunction);
SObjectBiConsumer.set('Parent.NumberOfEmployees', someSObjectFunction);
SObjectBiConsumer.set('Parent?.NumberOfEmployees', someSObjectFunction);
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
SObjectBiConsumer.set(Account.NumberOfEmployees, someSObjectFunction);
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
|`NullPointerException`|if `fieldName` is blank or `mapper` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectBinaryOperator.forBiConsumer

###### Example
```apex
SObjectBiConsumer.set('NumberOfEmployees', 100);
SObjectBiConsumer.set('Parent.NumberOfEmployees', 100);
SObjectBiConsumer.set('Parent?.NumberOfEmployees', 100);
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
SObjectBiConsumer.set(Account.NumberOfEmployees, 100);
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
|`NullPointerException`|if `fieldName` is blank or `operator` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectBinaryOperator.forBiConsumer

###### Example
```apex
SObjectBiConsumer.setSObject('Parent', someSObjectUnaryOperator);
SObjectBiConsumer.setSObject('Parent.Parent', someSObjectUnaryOperator);
SObjectBiConsumer.setSObject('Parent?.Parent', someSObjectUnaryOperator);
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
SObjectBiConsumer.setSObject(Account.ParentId, someSObjectUnaryOperator);
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
|`NullPointerException`|if `fieldName` is blank or `mapper` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectBinaryOperator.forBiConsumer

###### Example
```apex
SObjectBiConsumer.setSObject('Parent', someAccount);
SObjectBiConsumer.setSObject('Parent.Parent', someAccount);
SObjectBiConsumer.setSObject('Parent?.Parent', someAccount);
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
SObjectBiConsumer.setSObject(Account.ParentId, someAccount);
```

---
