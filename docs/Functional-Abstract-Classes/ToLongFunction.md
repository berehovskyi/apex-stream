# ToLongFunction

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IToLongFunction](/docs/Functional-Interfaces/IToLongFunction.md) functional interface and provides common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `apply(Object o)`
###### Parameters
|Param|Description|
|---|---|

---
### Static Methods
##### `static downcast(ISObjectFunction mapper)`

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

##### `static downcast(IFunction mapper)`

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
### Built-Ins
##### `static asLong()`

Returns a `ToLongFunction` that returns the Long value of the Object input argument by casting it to an Long.

###### Return

**Type**

ToLongFunction

**Description**

the `ToLongFunction`

---
