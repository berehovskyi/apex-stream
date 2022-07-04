# SObjectToIntFunction

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides default and static methods of [ISObjectToIntFunction](/docs/Functional-Interfaces/ISObjectToIntFunction.md) functional interface.


**See** [ISObjectToIntFunction](/docs/Functional-Interfaces/ISObjectToIntFunction.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `apply(SObject sObj)`
###### Parameters
|Param|Description|
|---|---|

---
### Static Methods
##### `static compose(ISObjectFunction mapper)`

Returns a composed `SObjectToIntFunction` of the `ISObjectFunction`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function|

###### Return

**Type**

SObjectToIntFunction

**Description**

the `SObjectToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

---
