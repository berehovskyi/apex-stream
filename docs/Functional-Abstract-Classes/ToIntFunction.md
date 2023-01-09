# ToIntFunction

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides default and static methods of [IToIntFunction](/docs/Functional-Interfaces/IToIntFunction.md) functional interface.


**See** [IToIntFunction](/docs/Functional-Interfaces/IToIntFunction.md)


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

ToIntFunction

**Description**

the `ToIntFunction`

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

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

---
