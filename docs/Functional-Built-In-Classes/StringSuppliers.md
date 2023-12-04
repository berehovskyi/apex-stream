# virtual StringSuppliers

`APIVERSION: 59`

`STATUS: ACTIVE`

Provides common implementations of `String` [Supplier](/docs/Functional-Abstract-Classes/Supplier.md)
and related utilities.


**See** [Supplier](/docs/Functional-Abstract-Classes/Supplier.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static Supplier uuid()`

Returns a `Supplier` that returns the next uuid.

###### Returns

|Type|Description|
|---|---|
|`Supplier`|the `Supplier`|

###### Example
```apex
ISupplier uuid = StringSuppliers.uuid();
uuid.get(); // '563581af-5560-a1fd-2291-2b03582bf000'
uuid.get(); // '57b0a848-68e6-2eb8-96ce-2ec0691f51b8'
```


##### `public static Supplier autonumber(String format)`

Returns a `Supplier` that returns the string in autonumber format.

###### Parameters

|Param|Description|
|---|---|
|`format`|autonumber format|

###### Returns

|Type|Description|
|---|---|
|`Supplier`|the `Supplier`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `format` does not match '\\S*\\{\\d+\\}' pattern|

###### Example
```apex
ISupplier autonumber = StringSuppliers.autonumber('A-{0000}');
autonumber.get(); // 'A-0000'
autonumber.get(); // 'A-0001'
autonumber.get(); // 'A-0002'
```


---
