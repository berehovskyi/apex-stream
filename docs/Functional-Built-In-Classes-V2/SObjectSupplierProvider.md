# virtual SObjectSupplierProvider

`APIVERSION: 61`

`STATUS: ACTIVE`

A provider class that supplies various `Supplier` instances capable of creating new `SObject` instances.
This class serves as a factory for generating suppliers that can instantiate specific SObject types.
The `Supplier` interface returned by the methods of this class allows for flexible creation of SObject instances
based on the given SObjectType.


**Group** Functional Built-In Classes V2

## Methods
### `public virtual Supplier of(SObjectType sObjectType)`

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
