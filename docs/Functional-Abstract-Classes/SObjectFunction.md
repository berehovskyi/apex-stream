# SObjectFunction

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ISObjectFunction](/docs/Functional-Interfaces/ISObjectFunction.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes


**See** ISObjectIterable.mapToObject

## Methods
### Function
##### `apply(SObject sObj)`
###### Parameters
|Param|Description|
|---|---|

---
### Static Methods
##### `static identity()`

Returns a `SObjectFunction` that always returns the input argument.

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

##### `static constant(Object value)`

Returns a `SObjectFunction` that always returns the `value`.

###### Parameters
|Param|Description|
|---|---|
|`value`|the value|

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

##### `static forPredicate(ISObjectPredicate predicate)`

Returns a composed `SObjectFunction` of the `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

##### `static forOperator(ISObjectUnaryOperator operator)`

Returns a composed `SObjectFunction` of the `operator`.

###### Parameters
|Param|Description|
|---|---|
|`operator`|the operator|

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operator` is null|

##### `static forSupplier(ISupplier supplier)`

Returns a composed `SObjectFunction` of the `supplier`.

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier|

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

---
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
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.get

###### Example
```apex
SObjectFunction.get('Name');
SObjectFunction.get('Parent.Name');
SObjectFunction.get('Parent?.Name');
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
SObjectFunction.get(Account.Name);
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
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.getSObjects

###### Example
```apex
SObjectFunction.getSObjects('Contacts');
SObjectFunction.getSObjects('Parent.Contacts');
SObjectFunction.getSObjects('Parent?.Contacts');
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
SObjectFunction.getSObjects(Contact.AccountId);
```

##### `static getSObjectType()`

Returns a `SObjectFunction` that returns the `SObjectType` of an input argument.

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`


**See** SObject.getQuickActionName

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
|`NullPointerException`|if `fieldName` is blank or the `mapper` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.put

###### Example
```apex
SObjectFunction.put('NumberOfEmployees', someSObjectFunction);
SObjectFunction.put('Parent.NumberOfEmployees', someSObjectFunction);
SObjectFunction.put('Parent?.NumberOfEmployees', someSObjectFunction);
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
SObjectConsumer.put(Account.NumberOfEmployees, someSObjectFunction);
SObjectConsumer.put(Account.NumberOfEmployees, SObjectFunction.constant(100));
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
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.put

###### Example
```apex
SObjectFunction.put('NumberOfEmployees', 100);
SObjectFunction.put('Parent.NumberOfEmployees', 100);
SObjectFunction.put('Parent?.NumberOfEmployees', (Object) null);
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
SObjectFunction.put(Account.NumberOfEmployees, 100);
SObjectFunction.put(Account.NumberOfEmployees, (Object) null);
```

---
