# SObjectToLongFunction

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides default and static methods of [ISObjectToLongFunction](/docs/Functional-Interfaces/ISObjectToLongFunction.md) functional interface.


**See** [ISObjectToLongFunction](/docs/Functional-Interfaces/ISObjectToLongFunction.md)


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

Returns a composed `SObjectToLongFunction` of the `ISObjectFunction`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function|

###### Return

**Type**

SObjectToLongFunction

**Description**

the `SObjectToLongFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

---
