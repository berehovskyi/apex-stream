# DoubleToIntFunction

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IDoubleToIntFunction](/docs/Functional-Interfaces/IDoubleToIntFunction.md) functional interface and provides common class level implementations, and related utilities.


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
##### `static intValue()`

Returns a `DoubleToIntFunction` that returns the Integer value of the Double input argument by casting it to an Integer.

###### Return

**Type**

DoubleToIntFunction

**Description**

the `DoubleToIntFunction`


**See** Double.intValue

##### `static round()`

Returns a `DoubleToIntFunction` that returns the closest Integer to the Double input argument. If the result is less than -2,147,483,648 or greater than 2,147,483,647, Apex generates an error.

###### Return

**Type**

DoubleToIntFunction

**Description**

the `DoubleToIntFunction`


**See** Math.round


**Deprecated** use Math.roundToLong instead.

---
