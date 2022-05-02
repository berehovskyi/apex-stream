# DoubleToLongFunction

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IDoubleToLongFunction](/docs/Functional-Interfaces/IDoubleToLongFunction.md) functional interface and provides common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions

## Methods
### Function
##### `apply(Double d)`
###### Parameters
|Param|Description|
|---|---|

---
### Built-Ins
##### `static longValue()`

Returns a `IDoubleToLongFunction` that returns the Long value of the Double input argument by casting it to an Long.

###### Return

**Type**

DoubleToLongFunction

**Description**

the `IDoubleToLongFunction`


**See** Double.longValue

##### `static roundToLong()`

Returns a `IDoubleToLongFunction` that returns the closest Long to the Double input argument.

###### Return

**Type**

DoubleToLongFunction

**Description**

the `IDoubleToLongFunction`


**See** Math.roundToLong

---
