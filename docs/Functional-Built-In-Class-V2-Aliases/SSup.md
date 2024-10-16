# SSup

`APIVERSION: 61`

`STATUS: ACTIVE`

An alias for [SObjectSupplierProvider](/docs/Functional-Built-In-Classes-V2/SObjectSupplierProvider.md).


**Inheritance**

[SObjectSupplierProvider](/docs/Functional-Built-In-Classes-V2/SObjectSupplierProvider.md)
 > 
SSup


**Group** Functional Built-In Class V2 Aliases

## Methods
### `public virtual Supplier of(SObjectType sObjectType)`

*Inherited*


Returns a `Supplier` that returns a new `SObject` instance of the given `sObjectType`.

#### Parameters

|Param|Description|
|---|---|
|`sObjectType`|SObjectType of the new instance to create|

#### Returns

|Type|Description|
|---|---|
|`Supplier`|the `Supplier`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` is null|


**See** [SObjectType.newSObject](SObjectType.newSObject)

#### Example
```apex
ISupplier accSupplier = new SObjectSupplierProvider().of(Account.SObjectType);
accSupplier.get(); // Account {}
```


---
