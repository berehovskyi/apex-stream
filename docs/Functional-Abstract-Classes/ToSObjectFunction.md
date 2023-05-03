# ToSObjectFunction

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides default and static methods of [IToSObjectFunction](/docs/Functional-Interfaces/IToSObjectFunction.md) functional interface.


**See** [IToSObjectFunction](/docs/Functional-Interfaces/IToSObjectFunction.md)


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
##### `static compose(IFunction mapper)`

Returns a composed `ToSObjectFunction` of the `IFunction`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function|

###### Return

**Type**

ToSObjectFunction

**Description**

the `ToSObjectFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

---
