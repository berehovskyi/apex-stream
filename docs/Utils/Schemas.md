# Schemas

`APIVERSION: 54`

`STATUS: ACTIVE`

Schema related utilities.


**Author** O. Berehovskyi


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

#### Example
```apex
Schemas.find relationshipName(Contact.AccountId); // 'Contacts'
```

---
