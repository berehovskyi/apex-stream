# SObjectToIntFunction

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ISObjectToIntFunction](/docs/Functional-Interfaces/ISObjectToIntFunction.md) functional interface and provides common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions

## Methods
### `apply(SObject sObj)`
#### Parameters
|Param|Description|
|---|---|

### `static downcast(ISObjectFunction mapper)`

Returns a composed `SObjectToIntFunction` of the `ISObjectFunction`.

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the function|

#### Return

**Type**

SObjectToIntFunction

**Description**

the `SObjectToIntFunction`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

### `static get(String fieldName)`

Returns a `SObjectToIntFunction` that gets a value for the specified `fieldName` as Integer. Cross-reference fields and safe navigation are supported.

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field to get a Integer value|

#### Return

**Type**

SObjectToIntFunction

**Description**

the `SObjectToIntFunction`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.get

#### Example
```apex
SObjectToIntFunction.get('NumberOfEmployees');
SObjectToIntFunction.get('Parent.NumberOfEmployees');
SObjectToIntFunction.get('Parent?.NumberOfEmployees');
```

### `static get(SObjectField field)`

Returns a `SObjectToIntFunction` that gets a value for the specified `field` as Integer.

#### Parameters
|Param|Description|
|---|---|
|`field`|the field to get a value|

#### Return

**Type**

SObjectToIntFunction

**Description**

the `SObjectToIntFunction`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** SObject.get

#### Example
```apex
SObjectToIntFunction.get(Account.NumberOfEmployees);
```

---
