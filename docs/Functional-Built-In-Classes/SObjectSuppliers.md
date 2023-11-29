# virtual SObjectSuppliers

`APIVERSION: 58`

`STATUS: ACTIVE`

Provides common implementations of `SObject` [Supplier](/docs/Functional-Abstract-Classes/Supplier.md)
and related utilities.


**See** [Supplier](/docs/Functional-Abstract-Classes/Supplier.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static Supplier of(SObjectType sObjectType)`

Returns a `SObjectSupplier` that returns a new `SObject` instance of the given `sObjectType`.

###### Parameters

|Param|Description|
|---|---|
|`sObjectType`|SObjectType of the new instance to create|

###### Returns

|Type|Description|
|---|---|
|`Supplier`|the `SObjectSupplier`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` is null|


**See** [SObjectType.newSObject](SObjectType.newSObject)

---
