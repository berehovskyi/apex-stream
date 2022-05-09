# SObjectConsumer

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ISObjectConsumer](/docs/Functional-Interfaces/ISObjectConsumer.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes


**See** ISObjectIterable.forEach

## Methods
### Function
##### `accept(SObject sObj)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `andThen(ISObjectConsumer after)`

Returns a composed `SObjectConsumer` that executes `this` operation first, then the `after` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Return

**Type**

SObjectConsumer

**Description**

the composed `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

---
### Static Methods
##### `static compose(List<ISObjectConsumer> consumers)`

Returns a composed `SObjectConsumer` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters
|Param|Description|
|---|---|
|`consumers`|the operations to sequentially perform|

###### Return

**Type**

SObjectConsumer

**Description**

the composed `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumers` is null or some element is null|

---
### Built-Ins
##### `static debug(LoggingLevel loggingLevel, String message)`

Returns a `SObjectConsumer` that debugs an input argument.

###### Parameters
|Param|Description|
|---|---|
|`loggingLevel`|the logging level|
|`message`|the message|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `loggingLevel` or `message` is null|

##### `static debug(LoggingLevel loggingLevel)`

Returns a `SObjectConsumer` that debugs an input argument.

###### Parameters
|Param|Description|
|---|---|
|`loggingLevel`|the logging level|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `loggingLevel` is null|

##### `static debug(String message)`

Returns a `SObjectConsumer` that debugs an input argument.

###### Parameters
|Param|Description|
|---|---|
|`message`|the message|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `message` is null|

##### `static debug()`

Returns a `SObjectConsumer` that debugs an input argument.

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

##### `static debugPretty(LoggingLevel loggingLevel, String message)`

Returns a `SObjectConsumer` that debugs an input argument using the pretty-print format.

###### Parameters
|Param|Description|
|---|---|
|`loggingLevel`|the logging level|
|`message`|the message|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `loggingLevel` or `message` is null|

##### `static debugPretty(LoggingLevel loggingLevel)`

Returns a `SObjectConsumer` that debugs an input argument using the pretty-print format.

###### Parameters
|Param|Description|
|---|---|
|`loggingLevel`|the logging level|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `loggingLevel` is null|

##### `static debugPretty(String message)`

Returns a `SObjectConsumer` that debugs an input argument using the pretty-print format.

###### Parameters
|Param|Description|
|---|---|
|`message`|the message|

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `message` is null|

##### `static debugPretty()`

Returns a `SObjectConsumer` that debugs an input argument using the pretty-print format.

###### Return

**Type**

SObjectConsumer

**Description**

the `SObjectConsumer`

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
|`NullPointerException`|if `fieldName` is blank or `mapper` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.put

###### Example
```apex
SObjectConsumer.set('NumberOfEmployees', someSObjectFunction);
SObjectConsumer.set('Parent.NumberOfEmployees', someSObjectFunction);
SObjectConsumer.set('Parent?.NumberOfEmployees', someSObjectFunction);
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
|`NullPointerException`|if `fieldName` is blank or `mapper` is null|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.put

###### Example
```apex
SObjectConsumer.set(Account.NumberOfEmployees, someSObjectFunction);
```

##### `static set(String fieldName, Object value)`

Returns a `SObjectConsumer` that sets the `value` for the specified `fieldName`. Cross-reference fields and safe navigation are supported. SObjectConsumer.set(&apos;NumberOfEmployees&apos;, 100); SObjectConsumer.set(&apos;Parent.NumberOfEmployees&apos;, 100); SObjectConsumer.set(&apos;Parent?.NumberOfEmployees&apos;, (Object) null);

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
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.put

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
|`NullPointerException`|if `fieldName` is blank|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.put

###### Example
```apex
SObjectConsumer.set(Account.NumberOfEmployees, 100);
SObjectConsumer.set(Account.NumberOfEmployees, (Object) null);
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
|`NullPointerException`|if `fieldName` is blank or `operator` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.putSObject

###### Example
```apex
SObjectConsumer.setSObject('Parent', someSObjectUnaryOperator);
SObjectConsumer.setSObject('Parent.Parent', someSObjectUnaryOperator);
SObjectConsumer.setSObject('Parent?.Parent', someSObjectUnaryOperator);
</pre>
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
|`NullPointerException`|if `fieldName` is blank or `operator` is null|


**See** SObject.putSObject

###### Example
```apex
SObjectBiConsumer.setSObject(Account.ParentId, someSObjectUnaryOperator);
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
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.putSObject

###### Example
```apex
SObjectConsumer.setSObject('Parent', someAccount);
SObjectConsumer.setSObject('Parent.Parent', someAccount);
SObjectConsumer.setSObject('Parent?.Parent', (SObject) null);
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
|`NullPointerException`|if the `fieldName` is blank|


**See** SObject.putSObject

###### Example
```apex
SObjectConsumer.setSObject(Account.ParentId, someAccount);
SObjectConsumer.setSObject(Account.ParentId, (SObject) null);
```

---
