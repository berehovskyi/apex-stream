# virtual SObjectBiConsumers

`APIVERSION: 58`

`STATUS: ACTIVE`

Provides common implementations of [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md)
and related utilities.


**See** [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static BiConsumer set(String fieldName, IFunction mapper)`

Returns a `BiConsumer` that sets for the specified field for the second `SObject` input argument a result returned by the `mapper` applied to the first `SObject` input argument. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the target field name of the second `SObject` input argument|
|`mapper`|the function applied to the first `SObject` input argument|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [BiOperator.combine](BiOperator.combine)

###### Example
```apex
SObjectBiConsumers.set('NumberOfEmployees', someFunction);
SObjectBiConsumers.set('Parent.NumberOfEmployees', someFunction);
SObjectBiConsumers.set('Parent?.NumberOfEmployees', someFunction);
```


##### `public static BiConsumer set(SObjectField field, IFunction mapper)`

Returns a `BiConsumer` that sets for the specified field for the second `SObject` input argument a result returned by the `mapper` applied to the first `SObject` input argument.

###### Parameters

|Param|Description|
|---|---|
|`field`|the target `SObjectField` of the second `SObject` input argument|
|`mapper`|the function applied to the first `SObject` input argument|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `mapper` is null|


**See** [BiOperator.combine](BiOperator.combine)

###### Example
```apex
SObjectBiConsumers.set(Account.NumberOfEmployees, someFunction);
```


##### `public static BiConsumer set(String fieldName, Object value)`

Returns a `BiConsumer` that sets the `value` for the specified field for the second `SObject` input argument. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the target field name of the second `SObject` input argument|
|`value`|the value to set for the second `SObject` input argument|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [BiOperator.combine](BiOperator.combine)

###### Example
```apex
SObjectBiConsumers.set('NumberOfEmployees', 100);
SObjectBiConsumers.set('Parent.NumberOfEmployees', 100);
SObjectBiConsumers.set('Parent?.NumberOfEmployees', 100);
```


##### `public static BiConsumer set(SObjectField field, Object value)`

Returns a `BiConsumer` that sets the `value` for the specified field for the second `SObject` input argument.

###### Parameters

|Param|Description|
|---|---|
|`field`|the target `SObjectField` of the second `SObject` input argument|
|`value`|the value to set for the second `SObject` input argument|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `mapper` is null|


**See** [BiOperator.combine](BiOperator.combine)

###### Example
```apex
SObjectBiConsumers.set(Account.NumberOfEmployees, 100);
```


##### `public static BiConsumer setSObject(String fieldName, IOperator operator)`

Returns a `BiConsumer` that sets `SObject` for the specified field for the second `SObject` input argument a result returned by the `mapper` applied to the first `SObject` input argument. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the target field name of the second `SObject` input argument|
|`operator`|the operator applied to the first `SObject` input argument|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `operator` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [BiOperator.combine](BiOperator.combine)

###### Example
```apex
SObjectBiConsumers.setSObject('Parent', someOperator);
SObjectBiConsumers.setSObject('Parent.Parent', someOperator);
SObjectBiConsumers.setSObject('Parent?.Parent', someOperator);
```


##### `public static BiConsumer setSObject(SObjectField field, IOperator operator)`

Returns a `BiConsumer` that sets `SObject` for the specified field for the second `SObject` input argument a result returned by the `mapper` applied to the first `SObject` input argument.

###### Parameters

|Param|Description|
|---|---|
|`field`|the target `SObjectField` of the second `SObject` input argument|
|`operator`|the operator applied to the first `SObject` input argument|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `operator` is null|


**See** [BiOperator.combine](BiOperator.combine)

###### Example
```apex
SObjectBiConsumers.setSObject(Account.ParentId, someOperator);
```


##### `public static BiConsumer setSObject(String fieldName, SObject value)`

Returns a `BiConsumer` that sets `SObject` the `value` for the specified field for the second `SObject` input argument. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the target field name of the second `SObject` input argument|
|`value`|the value to set for the second `SObject` input argument|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [BiOperator.combine](BiOperator.combine)

###### Example
```apex
SObjectBiConsumers.setSObject('Parent', someAccount);
SObjectBiConsumers.setSObject('Parent.Parent', someAccount);
SObjectBiConsumers.setSObject('Parent?.Parent', someAccount);
```


##### `public static BiConsumer setSObject(SObjectField field, SObject value)`

Returns a `BiConsumer` that sets `SObject` the `value` for the specified field for the second `SObject` input argument.

###### Parameters

|Param|Description|
|---|---|
|`field`|the target `SObjectField` of the second `SObject` input argument|
|`value`|the value to set for the second `SObject` input argument|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `mapper` is null|


**See** [BiOperator.combine](BiOperator.combine)

###### Example
```apex
SObjectBiConsumers.setSObject(Account.ParentId, someAccount);
```


---
