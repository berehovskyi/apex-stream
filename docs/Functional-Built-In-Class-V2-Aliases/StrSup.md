# StrSup

`APIVERSION: 61`

`STATUS: ACTIVE`

An alias for [StringSupplierProvider](/docs/Functional-Built-In-Classes-V2/StringSupplierProvider.md).


**Inheritance**

[StringSupplierProvider](/docs/Functional-Built-In-Classes-V2/StringSupplierProvider.md)
 > 
StrSup


**Group** Functional Built-In Class V2 Aliases

## Methods
### `public virtual Supplier uuid()`

*Inherited*


Returns a `Supplier` that returns the next uuid.

#### Returns

|Type|Description|
|---|---|
|`Supplier`|the `Supplier`|

#### Example
```apex
ISupplier uuidSupplier = new StringSupplierProvider().uuid();
uuidSupplier.get(); // '563581af-5560-a1fd-2291-2b03582bf000'
uuidSupplier.get(); // '57b0a848-68e6-2eb8-96ce-2ec0691f51b8'
```


### `public virtual Supplier autonumber(String format)`

*Inherited*


Returns a `Supplier` that returns the string in autonumber format.

#### Parameters

|Param|Description|
|---|---|
|`format`|autonumber format|

#### Returns

|Type|Description|
|---|---|
|`Supplier`|the `Supplier`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `format` does not match '\\S*\\{\\d+\\}' pattern|

#### Example
```apex
ISupplier autoNumberSupplier = new StringSupplierProvider().autonumber('A-{0000}');
autoNumberSupplier.get(); // 'A-0000'
autoNumberSupplier.get(); // 'A-0001'
autoNumberSupplier.get(); // 'A-0002'
```


---
