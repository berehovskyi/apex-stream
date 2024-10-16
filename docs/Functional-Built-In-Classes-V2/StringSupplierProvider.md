# virtual StringSupplierProvider

`APIVERSION: 61`

`STATUS: ACTIVE`

A provider class that supplies `Supplier` instances for generating various types of strings.
This includes generating unique UUIDs and creating strings in a customizable autonumber format.


**Group** Functional Built-In Classes V2

## Methods
### `public virtual Supplier uuid()`

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
