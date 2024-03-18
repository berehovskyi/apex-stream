# virtual CollectorSuppliers

`APIVERSION: 60`

`STATUS: ACTIVE`

Provides common implementations of [Supplier](/docs/Functional-Abstract-Classes/Supplier.md)
and related utilities that are used by [Collectors](/docs/Functional-Built-In-Classes/Collectors.md).


**Inheritance**

[BaseCollectorSuppliers](/docs/Functional-Built-In-Classes/BaseCollectorSuppliers.md)
 > 
CollectorSuppliers


**See** [Supplier](/docs/Functional-Abstract-Classes/Supplier.md)


**See** [Collectors](/docs/Functional-Built-In-Classes/Collectors.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static Supplier joiningString()`

Returns a `Supplier` that returns a list container to track joining String.

###### Returns

|Type|Description|
|---|---|
|`Supplier`|the `Supplier`|


**See** [Collectors.joining](Collectors.joining)

##### `public static Supplier averagingInt()`

Returns a `Supplier` that returns a list container to track Integer averaging.

###### Returns

|Type|Description|
|---|---|
|`Supplier`|the `Supplier`|


**See** [Collectors.averagingInt](Collectors.averagingInt)

##### `public static Supplier averagingLong()`

Returns a `Supplier` that returns a list container to track Long averaging.

###### Returns

|Type|Description|
|---|---|
|`Supplier`|the `Supplier`|


**See** [Collectors.averagingLong](Collectors.averagingLong)

##### `public static Supplier box(Object identity)`

Returns a `Supplier` that returns a list container to track `identity` mutation.

###### Parameters

|Param|Description|
|---|---|
|`identity`|the tracked SObject|

###### Returns

|Type|Description|
|---|---|
|`Supplier`|the `Supplier`|


**See** [Collectors.reducing](Collectors.reducing)

##### `public static Supplier averagingDouble()`

*Inherited*


Returns a `Supplier` that returns a list container to track Double averaging.

###### Returns

|Type|Description|
|---|---|
|`Supplier`|the `Supplier`|


**See** [BaseCollectors.averagingDouble](BaseCollectors.averagingDouble)

---
