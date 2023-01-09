# ObjectIntConsumer

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides default and static methods of [IObjectIntConsumer](/docs/Functional-Interfaces/IObjectIntConsumer.md) functional interface.


**See** [IObjectIntConsumer](/docs/Functional-Interfaces/IObjectIntConsumer.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `accept(Object o, Integer l)`
###### Parameters
|Param|Description|
|---|---|

---
### Static Methods
##### `static compose(IBiConsumer consumer)`

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
