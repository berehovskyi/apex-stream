# ObjectDoubleConsumer

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IObjectDoubleConsumer](/docs/Functional-Interfaces/IObjectDoubleConsumer.md) functional interface and provides common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions

## Methods
### `accept(Object o, Double d)`
#### Parameters
|Param|Description|
|---|---|

### `static of(IBiConsumer consumer)`

Returns a composed `ObjectDoubleConsumer` of the `IBiConsumer`.

#### Parameters
|Param|Description|
|---|---|
|`consumer`|the binary consumer|

#### Return

**Type**

ObjectDoubleConsumer

**Description**

the composed `ObjectDoubleConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

---
