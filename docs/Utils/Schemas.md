# Schemas

`APIVERSION: 57`

`STATUS: ACTIVE`

Schema related utilities.


**Author** Oleh Berehovskyi


**Group** Utils

## Methods
### `static findChildRelationshipName(SObjectField field)`

Returns the name of the child relationship for the `SObjectField`.

#### Parameters
|Param|Description|
|---|---|
|`field`|the SObjectField|

#### Return

**Type**

String

**Description**

the name of the child relationship if found or null otherwise

#### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `field` is not lookup or master-detail.|

#### Example
```apex
Schemas.findChildRelationshipName(Contact.AccountId); // 'Contacts'
```

### `static isXRef(String fieldName)`

Checks if `fieldName` may be a cross-reference field.

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the fiend name|

#### Return

**Type**

Boolean

**Description**

true if `fieldName` may be a cross-reference field, false otherwise

#### Example
```apex
Schemas.isXRef('Name'); // false
Schemas.isXRef('Parent.Name'); // true
```

### `static isSaveNav(String fieldName)`

Checks if `fieldName` may be a safe navigated cross-reference field.

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the fiend name|

#### Return

**Type**

Boolean

**Description**

true if `fieldName` may be a safe navigated cross-reference field, false otherwise

#### Example
```apex
Schemas.isSaveNav('Name'); // false
Schemas.isSaveNav('Parent.Name'); // false
Schemas.isSaveNav('Parent?.Name'); // true
Schemas.isSaveNav('Parent?.Parent.Name'); // false
Schemas.isSaveNav('Parent.Parent?.Name'); // true
```

---
