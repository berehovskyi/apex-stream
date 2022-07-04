# ToDoubleFunction

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides default and static methods of [IToDoubleFunction](/docs/Functional-Interfaces/IToDoubleFunction.md) functional interface.


**See** [IToDoubleFunction](/docs/Functional-Interfaces/IToDoubleFunction.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `apply(Object o)`
###### Parameters
|Param|Description|
|---|---|

---
### Static Methods
##### `static compose(ISObjectFunction mapper)`

Returns a composed `ToDoubleFunction` of the `ISObjectFunction`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function|

###### Return

**Type**

ToDoubleFunction

**Description**

the `ToDoubleFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

##### `static compose(IFunction mapper)`

Returns a composed `ToDoubleFunction` of the `IFunction`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function|

###### Return

**Type**

ToDoubleFunction

**Description**

the `ToDoubleFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

---
