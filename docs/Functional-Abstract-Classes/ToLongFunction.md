# ToLongFunction

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides default and static methods of [IToLongFunction](/docs/Functional-Interfaces/IToLongFunction.md) functional interface.


**See** [IToLongFunction](/docs/Functional-Interfaces/IToLongFunction.md)


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

Returns a composed `ToLongFunction` of the `ISObjectFunction`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function|

###### Return

**Type**

ToLongFunction

**Description**

the `ToLongFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

##### `static compose(IFunction mapper)`

Returns a composed `ToLongFunction` of the `IFunction`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function|

###### Return

**Type**

ToLongFunction

**Description**

the `ToLongFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

---
