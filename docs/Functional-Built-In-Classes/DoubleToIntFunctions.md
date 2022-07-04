# DoubleToIntFunctions

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides common implementations of [DoubleToIntFunction](/docs/Functional-Abstract-Classes/DoubleToIntFunction.md) and related utilities.


**See** [DoubleToIntFunction](/docs/Functional-Abstract-Classes/DoubleToIntFunction.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
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

---
