# SObjectSupplier

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ISObjectSupplier](/docs/Functional-Interfaces/ISObjectSupplier.md) functional interface and provides common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `get()`
---
### Static Methods
##### `static of(SObjectType sObjectType)`

Returns a `SObjectSupplier` that returns a new `SObject` instance of the given `sObjectType`.

###### Parameters
|Param|Description|
|---|---|
|`sObjectType`|SObjectType of the new instance to create|

###### Return

**Type**

SObjectSupplier

**Description**

the `SObjectSupplier`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjectType` is null|


**See** SObjectType.newSObject

##### `static constant(SObject sObj)`

Returns a stateful `Supplier` that returns a reference of the `sObj` SObject.

###### Parameters
|Param|Description|
|---|---|
|`sObj`|the SObject|

###### Return

**Type**

SObjectSupplier

**Description**

the `SObjectSupplier`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObj` is null|

---
