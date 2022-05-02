# IntConsumer

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IIntConsumer](/docs/Functional-Interfaces/IIntConsumer.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions


**See** IIntIterable.forEach

## Methods
### `accept(Integer i)`
#### Parameters
|Param|Description|
|---|---|

### `andThen(IIntConsumer after)`

Returns a composed `IntConsumer` that executes `this` operation first, then the `after` operation in that order.

#### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

#### Return

**Type**

IntConsumer

**Description**

the composed `IntConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

### `static compose(List<IIntConsumer> consumers)`

Returns a composed `IntConsumer` that sequentially executes the operations in the same order as the order of the consumers input list.

#### Parameters
|Param|Description|
|---|---|
|`consumers`|the operations to sequentially perform|

#### Return

**Type**

IntConsumer

**Description**

the composed `IntConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumers` is null or some element is null|

### `static debug(LoggingLevel loggingLevel, String message)`

Returns a `IntConsumer` that debugs an input argument.

#### Parameters
|Param|Description|
|---|---|
|`loggingLevel`|the logging level|
|`message`|the message|

#### Return

**Type**

IntConsumer

**Description**

the `IntConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `loggingLevel` or `message` is null|

### `static debug(LoggingLevel loggingLevel)`

Returns a `IntConsumer` that debugs an input argument.

#### Parameters
|Param|Description|
|---|---|
|`loggingLevel`|the logging level|

#### Return

**Type**

IntConsumer

**Description**

the `IntConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `loggingLevel` is null|

### `static debug(String message)`

Returns a `IntConsumer` that debugs an input argument.

#### Parameters
|Param|Description|
|---|---|
|`message`|the message|

#### Return

**Type**

IntConsumer

**Description**

the `IntConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `message` is null|

### `static debug()`

Returns a `IntConsumer` that debugs an input argument.

#### Return

**Type**

IntConsumer

**Description**

the `IntConsumer`

---
