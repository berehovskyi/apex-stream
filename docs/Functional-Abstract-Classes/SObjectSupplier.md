# SObjectSupplier

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides default and static methods of [ISObjectSupplier](/docs/Functional-Interfaces/ISObjectSupplier.md) functional interface.


**See** [ISObjectSupplier](/docs/Functional-Interfaces/ISObjectSupplier.md)


**Author** Oleh Berehovskyi


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

##### `static repeat(Iterable<SObject> iterable)`

Returns a `Supplier` that infinitely returns the elements in order.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the iterable|

###### Return

**Type**

SObjectSupplier

**Description**

the `Supplier`

###### Example
```apex
ISupplier repeat = Supplier.repeat(new List<Object>{ 'a', 'b', 'c' });
repeat.get(); // 'a'
repeat.get(); // 'b'
repeat.get(); // 'c'
repeat.get(); // 'a'
```

---
