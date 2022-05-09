# DoubleFunction

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IDoubleFunction](/docs/Functional-Interfaces/IDoubleFunction.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes


**See** IDoubleIterable.mapToObject

## Methods
### Function
##### `apply(Double d)`
###### Parameters
|Param|Description|
|---|---|

---
### Built-Ins
##### `static format()`

Returns a `DoubleFunction` that returns a string that represents the Double input argument using the locale of the context user.

###### Return

**Type**

DoubleFunction

**Description**

the `SObjectFunction`


**See** Double.format

##### `static toString()`

Returns a `DoubleFunction` that returns a string that represents the Double input argument.

###### Return

**Type**

DoubleFunction

**Description**

the `SObjectFunction`


**See** String.valueOf

---
