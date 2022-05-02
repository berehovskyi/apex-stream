# ToIntFunction

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IToIntFunction](/docs/Functional-Interfaces/IToIntFunction.md) functional interface and provides common class level implementations, and related utilities.


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

ToIntFunction

**Description**

the `ToIntFunction`

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

ToIntFunction

**Description**

the `ToIntFunction`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

### `static asInt()`

Returns a `ToIntFunction` that returns the Integer value of the Object input argument by casting it to an Integer.

#### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

### `static valueOf()`

Returns a `ToIntFunction` that returns the Integer value of the Object input argument.

#### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`


**See** Integer.valueOf

---
