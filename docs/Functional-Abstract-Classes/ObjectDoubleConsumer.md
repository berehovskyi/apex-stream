# ObjectDoubleConsumer

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides default and static methods of [IObjectDoubleConsumer](/docs/Functional-Interfaces/IObjectDoubleConsumer.md) functional interface.


**See** [IObjectDoubleConsumer](/docs/Functional-Interfaces/IObjectDoubleConsumer.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `accept(Object o, Double d)`
###### Parameters
|Param|Description|
|---|---|

---
### Static Methods
##### `static compose(IBiConsumer consumer)`

Returns a composed `ObjectDoubleConsumer` of the `IBiConsumer`.

###### Parameters
|Param|Description|
|---|---|
|`consumer`|the binary consumer|

###### Return

**Type**

ObjectDoubleConsumer

**Description**

the composed `ObjectDoubleConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

---
