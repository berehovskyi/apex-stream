# IdSupplier

`APIVERSION: 54`

`STATUS: ACTIVE`

Provides common class level implementations, and related utilities for `IdSuppliers`.


**Author** O. Berehovskyi


**Group** Functions

## Methods
### `static of(SObjectType sObjectType)`

Returns a `Supplier` that returns the next `Id` value for the given `sObjectType`. <p><strong>Note: </strong></p> <p>This is a stateful function.</p>

#### Parameters
|Param|Description|
|---|---|
|`sObjectType`|SObjectType of the new id to create|

#### Return

**Type**

Supplier

**Description**

the `Supplier`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` is null|


**See** SObjectType.newSObject

#### Example
```apex
ISupplier idSupp = IdSupplier.of(Account.SObjectType);
idSupp.get(); // '000000000000000AAA'
idSupp.get(); // '000000000000001AAA'
```

---
