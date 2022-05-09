# ObjectIntConsumer

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IObjectIntConsumer](/docs/Functional-Interfaces/IObjectIntConsumer.md) functional interface and provides common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `accept(Object o, Integer l)`
###### Parameters
|Param|Description|
|---|---|

---
### Static Methods
##### `static of(IBiConsumer consumer)`

Returns a composed `ObjectIntConsumer` of the `IBiConsumer`.

###### Parameters
|Param|Description|
|---|---|
|`consumer`|the binary consumer|

###### Return

**Type**

ObjectIntConsumer

**Description**

the composed `ObjectIntConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

---
