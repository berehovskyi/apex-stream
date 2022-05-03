# SObjectToDoubleFunction

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ISObjectToDoubleFunction](/docs/Functional-Interfaces/ISObjectToDoubleFunction.md) functional interface and provides common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions

## Methods
### Function
##### `apply(SObject sObj)`
###### Parameters
|Param|Description|
|---|---|

---
### Static Methods
##### `static downcast(ISObjectFunction mapper)`

Returns a composed `SObjectToDoubleFunction` of the `ISObjectFunction`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function|

###### Return

**Type**

SObjectToDoubleFunction

**Description**

the `SObjectToDoubleFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

##### `static downcast(IFunction mapper)`

Returns a composed `SObjectToDoubleFunction` of the `IFunction`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function|

###### Return

**Type**

SObjectToDoubleFunction

**Description**

the `SObjectToDoubleFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

---
### Built-Ins
##### `static get(String fieldName)`

Returns a `SObjectToDoubleFunction` that gets a value for the specified `fieldName` as Double. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field to get a Double value|

###### Return

**Type**

SObjectToDoubleFunction

**Description**

the `SObjectToDoubleFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.get

###### Example
```apex
SObjectToDoubleFunction.get('BillingLatitude');
SObjectToDoubleFunction.get('Parent.BillingLatitude');
SObjectToDoubleFunction.get('Parent?.BillingLatitude');
```

##### `static get(SObjectField field)`

Returns a `SObjectToDoubleFunction` that gets a value for the specified `field` as Double.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field to get a value|

###### Return

**Type**

SObjectToDoubleFunction

**Description**

the `SObjectToDoubleFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** SObject.get

###### Example
```apex
SObjectToDoubleFunction.get(Account.BillingLatitude);
```

---
