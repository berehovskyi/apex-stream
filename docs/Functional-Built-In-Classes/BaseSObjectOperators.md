# virtual BaseSObjectOperators

`APIVERSION: 60`

`STATUS: ACTIVE`

Provides base implementations of [Operator](/docs/Functional-Abstract-Classes/Operator.md)
and related utilities that are used by [ISObjectEnumerable](/docs/Enumerables/ISObjectEnumerable.md).


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
BaseSObjectOperators.getSObject('Parent');
BaseSObjectOperators.getSObject('Parent.Parent');
BaseSObjectOperators.getSObject('Parent?.Parent');
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
BaseSObjectOperators.getSObject(Account.ParentId);
```


---
