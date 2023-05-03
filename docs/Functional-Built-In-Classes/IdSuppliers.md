# IdSuppliers

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides common implementations of `Id` [Supplier](/docs/Functional-Abstract-Classes/Supplier.md) and related utilities.


**See** [Supplier](/docs/Functional-Abstract-Classes/Supplier.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `static of(SObjectType sObjectType)`

Returns a `Supplier` that returns the next `Id` value for the given `sObjectType`. <p><strong>Note: </strong></p> <p>This is a stateful function.</p>

###### Parameters
|Param|Description|
|---|---|
|`sObjectType`|SObjectType of the new id to create|

###### Return

**Type**

Supplier

**Description**

the `Supplier`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` is null|

###### Example
```apex
ISupplier idSupp = IdSuppliers.of(Account.SObjectType);
idSupp.get(); // '000000000000000AAA'
idSupp.get(); // '000000000000001AAA'
```

---
