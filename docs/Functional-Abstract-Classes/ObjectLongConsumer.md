# ObjectLongConsumer

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides default and static methods of [IObjectLongConsumer](/docs/Functional-Interfaces/IObjectLongConsumer.md) functional interface.


**See** [IObjectLongConsumer](/docs/Functional-Interfaces/IObjectLongConsumer.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `accept(Object o, Long l)`
###### Parameters
|Param|Description|
|---|---|

---
### Static Methods
##### `static compose(IBiConsumer consumer)`

Returns a composed `ObjectLongConsumer` of the `IBiConsumer`.

###### Parameters
|Param|Description|
|---|---|
|`consumer`|the binary consumer|

###### Return

**Type**

ObjectLongConsumer

**Description**

the composed `ObjectLongConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

---
