# StringSupplier

`APIVERSION: 54`

`STATUS: ACTIVE`

Provides common class level implementations, and related utilities for `StringSuppliers`.


**Author** O. Berehovskyi


**Group** Functions

## Methods
### `static uuid()`

Returns a `Supplier` that returns the next uuid.

#### Return

**Type**

Supplier

**Description**

the `Supplier`

#### Example
```apex
ISupplier uuid = StringSupplier.uuid();
uuid.get(); // '563581af-5560-a1fd-2291-2b03582bf000'
uuid.get(); // '57b0a848-68e6-2eb8-96ce-2ec0691f51b8'
```

---
