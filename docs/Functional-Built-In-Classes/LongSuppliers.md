# LongSuppliers

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides common implementations of [LongSupplier](/docs/Functional-Abstract-Classes/LongSupplier.md) and related utilities.


**See** [LongSupplier](/docs/Functional-Abstract-Classes/LongSupplier.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
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
|`fromLong`|the starting value|
|`step`|the incremental step|

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

##### `static random()`

Returns a `LongSupplier` that returns a random Long.

###### Return

**Type**

LongSupplier

**Description**

the `LongSupplier`


**See** Crypto.getRandomLong

---
