# IntSupplier

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IntSupplier](/docs/Functional-Abstract-Classes/IntSupplier.md) functional interface and provides common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `get()`
---
### Built-Ins
##### `static increment()`

Returns a `IntSupplier` that returns a next Integer value that has been incremented by 1 starting at 0. <p><strong>Note: </strong></p> <p>This is a stateful function.</p>

###### Return

**Type**

IntSupplier

**Description**

the `IntSupplier`

##### `static increment(Integer fromInt, Integer step)`

Returns a `IntSupplier` that returns a next Integer value that has been incremented by `step` starting at `fromInt` inclusively. <p><strong>Note: </strong></p> <p>This is a stateful function.</p>

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

IntSupplier

**Description**

the `IntSupplier`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fromInt` or `step` is null|

##### `static fibonacci()`

Returns a `IntSupplier` that returns a next fibonacci Integer value starting at 1. <p><strong>Note: </strong></p> <p>This is a stateful function.</p>

###### Return

**Type**

IntSupplier

**Description**

the `IntSupplier`

---
