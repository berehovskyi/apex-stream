# virtual IdSupplierProvider

`APIVERSION: 61`

`STATUS: ACTIVE`

A provider class that supplies `Supplier` instances for generating sequential `Id` values
for a given `SObjectType`. Each supplier generated by this class returns a new, unique Id value
for the specified SObject type, following Salesforce's 15-character Id format.


**Group** Functional Built-In Classes V2

## Methods
### `public virtual Supplier of(SObjectType sObjectType)`

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