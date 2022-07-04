# CollectorBaseSuppliers

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides common implementations of [Supplier](/docs/Functional-Abstract-Classes/Supplier.md) and related utilities that are used by [SObjectCollectors](/Functional-Built-In-Classes/SObjectCollectors.md).


**See** [Supplier](/docs/Functional-Abstract-Classes/Supplier.md)


**See** [SObjectCollectors](/docs/Functional-Built-In-Classes/SObjectCollectors.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `static joiningString()`

Returns a `Supplier` that returns a list container to track joining String.

###### Return

**Type**

Supplier

**Description**

the `Supplier`


**See** SObjectCollectors.joining

##### `static averagingInt()`

Returns a `Supplier` that returns a list container to track Integer averaging.

###### Return

**Type**

Supplier

**Description**

the `Supplier`


**See** SObjectCollectors.averagingInt

##### `static averagingLong()`

Returns a `Supplier` that returns a list container to track Long averaging.

###### Return

**Type**

Supplier

**Description**

the `Supplier`


**See** SObjectCollectors.averagingLong

##### `static averagingDouble()`

Returns a `Supplier` that returns a list container to track Double averaging.

###### Return

**Type**

Supplier

**Description**

the `Supplier`


**See** SObjectCollectors.averagingDouble

##### `static summingInt()`

Returns a `Supplier` that returns a list container to track Integer summing.

###### Return

**Type**

Supplier

**Description**

the `Supplier`


**See** SObjectCollectors.summingInt

##### `static summingLong()`

Returns a `Supplier` that returns a list container to track Long summing.

###### Return

**Type**

Supplier

**Description**

the `Supplier`


**See** SObjectCollectors.summingLong

##### `static summingDouble()`

Returns a `Supplier` that returns a list container to track Double summing.

###### Return

**Type**

Supplier

**Description**

the `Supplier`


**See** SObjectCollectors.summingDouble

##### `static sObjectBox(SObject identity)`

Returns a `Supplier` that returns a list container to track `identity` mutation.

###### Parameters
|Param|Description|
|---|---|
|`identity`|the tracked SObject|

###### Return

**Type**

Supplier

**Description**

the `Supplier`


**See** SObjectCollectors.reducing

---
