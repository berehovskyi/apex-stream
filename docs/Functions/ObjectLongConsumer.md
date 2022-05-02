# ObjectLongConsumer

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IObjectLongConsumer](/docs/Functional-Interfaces/IObjectLongConsumer.md) functional interface and provides common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions

## Methods
### `accept(Object o, Long l)`
#### Parameters
|Param|Description|
|---|---|

### `static of(IBiConsumer consumer)`

Returns a composed `ObjectLongConsumer` of the `IBiConsumer`.

#### Parameters
|Param|Description|
|---|---|
|`consumer`|the binary consumer|

#### Return

**Type**

ObjectLongConsumer

**Description**

the composed `ObjectLongConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

---
