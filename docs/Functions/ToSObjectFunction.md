# ToSObjectFunction

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IToSObjectFunction](/docs/Functional-Interfaces/IToSObjectFunction.md) functional interface and provides common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions

## Methods
### `apply(Object o)`
#### Parameters
|Param|Description|
|---|---|

### `static downcast(IFunction mapper)`

Returns a composed `ToSObjectFunction` of the `IFunction`.

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the function|

#### Return

**Type**

ToSObjectFunction

**Description**

the `ToSObjectFunction`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

### `static asSObject()`
---
