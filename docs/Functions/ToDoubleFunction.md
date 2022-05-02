# ToDoubleFunction

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IToDoubleFunction](/docs/Functional-Interfaces/IToDoubleFunction.md) functional interface and provides common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions

## Methods
### `apply(Object o)`
#### Parameters
|Param|Description|
|---|---|

### `static downcast(ISObjectFunction mapper)`

Returns a composed `ToDoubleFunction` of the `ISObjectFunction`.

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the function|

#### Return

**Type**

ToDoubleFunction

**Description**

the `ToDoubleFunction`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

### `static downcast(IFunction mapper)`

Returns a composed `ToDoubleFunction` of the `IFunction`.

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the function|

#### Return

**Type**

ToDoubleFunction

**Description**

the `ToDoubleFunction`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

### `static asDouble()`

Returns a `ToDoubleFunction` that returns the Double value of the Object input argument by casting it to an Double.

#### Return

**Type**

ToDoubleFunction

**Description**

the `ToDoubleFunction`

### `static valueOf()`

Returns a `ToDoubleFunction` that returns the Double value of the Object input argument.

#### Return

**Type**

ToDoubleFunction

**Description**

the `ToDoubleFunction`


**See** Double.valueOf

---
