# LongSupplier

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ILongSupplier](/docs/Functional-Interfaces/ILongSupplier.md) functional interface and provides common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions

## Methods
### Function
##### `get()`
---
### Built-Ins
##### `static increment()`

Returns a `LongSupplier` that returns a next Long value that has been incremented by 1 starting at 0L. <p><strong>Note: </strong></p> <p>This is a stateful function.</p>

###### Return

**Type**

LongSupplier

**Description**

the `LongSupplier`

##### `static increment(Long fromLong, Integer step)`

Returns a `LongSupplier` that returns a next Long value that has been incremented by `step` starting at `fromLong` inclusively. <p><strong>Note: </strong></p> <p>This is a stateful function.</p>

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

LongSupplier

**Description**

the `LongSupplier`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fromLong` or `step` is null|

##### `static fibonacci()`

Returns a `LongSupplier` that returns a next fibonacci Long value starting at 1L. <p><strong>Note: </strong></p> <p>This is a stateful function.</p>

###### Return

**Type**

LongSupplier

**Description**

the `LongSupplier`

---
