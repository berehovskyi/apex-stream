# SObjectToLongFunction

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ISObjectToLongFunction](/docs/Functional-Interfaces/ISObjectToLongFunction.md) functional interface and provides common class level implementations, and related utilities.


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

Returns a composed `SObjectToLongFunction` of the `ISObjectFunction`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function|

###### Return

**Type**

SObjectToLongFunction

**Description**

the `SObjectToLongFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

---
### Built-Ins
##### `static get(String fieldName)`

Returns a `SObjectToLongFunction` that gets a value for the specified `fieldName` as Long. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field to get a Long value|

###### Return

**Type**

SObjectToLongFunction

**Description**

the `SObjectToLongFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.get

###### Example
```apex
SObjectToLongFunction.get('NumberOfEmployees');
SObjectToLongFunction.get('Parent.NumberOfEmployees');
SObjectToLongFunction.get('Parent?.NumberOfEmployees');
```

##### `static get(SObjectField field)`

Returns a `SObjectToLongFunction` that gets a value for the specified `field` as Long.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field to get a value|

###### Return

**Type**

SObjectToLongFunction

**Description**

the `SObjectToLongFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** SObject.get

###### Example
```apex
SObjectToLongFunction.get(Account.NumberOfEmployees);
```

---
