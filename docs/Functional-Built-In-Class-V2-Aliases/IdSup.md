# IdSup

`APIVERSION: 61`

`STATUS: ACTIVE`

An alias for [IdSupplierProvider](/docs/Functional-Built-In-Classes-V2/IdSupplierProvider.md).


**Inheritance**

[IdSupplierProvider](/docs/Functional-Built-In-Classes-V2/IdSupplierProvider.md)
 > 
IdSup


**Group** Functional Built-In Class V2 Aliases

## Methods
### `public virtual Supplier of(SObjectType sObjectType)`

*Inherited*


Returns a `Supplier` that returns the next `Id` value for the given `sObjectType`. <p><strong>Note: </strong></p> <p>This is a stateful function.</p>

#### Parameters

|Param|Description|
|---|---|
|`sObjectType`|SObjectType of the new id to create|

#### Returns

|Type|Description|
|---|---|
|`Supplier`|the `Supplier`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` is null|

#### Example
```apex
ISupplier accIdSupplier = new IdSupplierProvider().of(Account.SObjectType);
accIdSupplier.get(); // '001000000000000AAA'
accIdSupplier.get(); // '001000000000001AAA'
```


---
