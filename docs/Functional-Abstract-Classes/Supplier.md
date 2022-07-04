# Supplier

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides default and static methods of [ISupplier](/docs/Functional-Interfaces/ISupplier.md) functional interface.


**See** [ISupplier](/docs/Functional-Interfaces/ISupplier.md)


**See** [Collector](/docs/Functional-Abstract-Classes/Collector.md)


**See** [SObjectCollector](/docs/Functional-Abstract-Classes/SObjectCollector.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `get()`
---
### Static Methods
##### `static of(Type t)`

Returns a `Supplier` that returns a new instance of the given type.

###### Parameters
|Param|Description|
|---|---|
|`t`|Type of the new instance to create|

###### Return

**Type**

Supplier

**Description**

the `Supplier`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `t` is null|


**See** Type.newInstance

##### `static constant(Object o)`

Returns a stateful `Supplier` that returns a reference of the `o` object.

###### Parameters
|Param|Description|
|---|---|
|`o`|the Object|

###### Return

**Type**

Supplier

**Description**

the `Supplier`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `o` is null|

##### `static compose(IIntSupplier supplier)`

Returns a composed `Supplier` of the `IIntSupplier`.

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the int supplier|

###### Return

**Type**

Supplier

**Description**

the composed `Supplier`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

##### `static compose(ILongSupplier supplier)`

Returns a composed `Supplier` of the `ILongSupplier`.

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the Long supplier|

###### Return

**Type**

Supplier

**Description**

the composed `Supplier`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

##### `static compose(IDoubleSupplier supplier)`

Returns a composed `Supplier` of the `IDoubleSupplier`.

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the Double supplier|

###### Return

**Type**

Supplier

**Description**

the composed `Supplier`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

##### `static compose(ISObjectSupplier supplier)`

Returns a composed `Supplier` of the `ISObjectSupplier`.

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the SObject supplier|

###### Return

**Type**

Supplier

**Description**

the composed `Supplier`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

---
