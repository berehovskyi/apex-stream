# StringSuppliers

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides common implementations of `String` [Supplier](/docs/Functional-Abstract-Classes/Supplier.md) and related utilities.


**See** [Supplier](/docs/Functional-Abstract-Classes/Supplier.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `static uuid()`

Returns a `Supplier` that returns the next uuid.

###### Return

**Type**

Supplier

**Description**

the `Supplier`

###### Example
```apex
ISupplier uuid = StringSuppliers.uuid();
uuid.get(); // '563581af-5560-a1fd-2291-2b03582bf000'
uuid.get(); // '57b0a848-68e6-2eb8-96ce-2ec0691f51b8'
```

---
