# IntSuppliers

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides common implementations of [IntSupplier](/docs/Functional-Abstract-Classes/IntSupplier.md) and related utilities.


**See** [IntSupplier](/docs/Functional-Abstract-Classes/IntSupplier.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
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
|`fromInt`|the starting value|
|`step`|the incremental step|

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

##### `static random()`

Returns a `IntSupplier` that returns a random Integer.

###### Return

**Type**

IntSupplier

**Description**

the `IntSupplier`


**See** Crypto.getRandomLong

---
