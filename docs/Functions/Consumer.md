# Consumer

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IConsumer](/docs/Functional-Interfaces/IConsumer.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions


**See** IObjectIterable.forEach

## Methods
### `accept(Object o)`
#### Parameters
|Param|Description|
|---|---|

### `andThen(IConsumer after)`

Returns a composed `Consumer` that executes `this` operation first, then the `after` operation in that order.

#### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

#### Return

**Type**

Consumer

**Description**

the composed `Consumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

### `static compose(List<IConsumer> consumers)`

Returns a composed `Consumer` that sequentially executes the operations in the same order as the order of the consumers input list.

#### Parameters
|Param|Description|
|---|---|
|`consumers`|the operations to sequentially perform|

#### Return

**Type**

Consumer

**Description**

the composed `Consumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumers` is null or some element is null|

### `static debug(LoggingLevel loggingLevel, String message)`

Returns a `Consumer` that debugs an input argument.

#### Parameters
|Param|Description|
|---|---|
|`loggingLevel`|the logging level|
|`message`|the message|

#### Return

**Type**

Consumer

**Description**

the `Consumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `loggingLevel` or `message` is null|

### `static debug(LoggingLevel loggingLevel)`

Returns a `Consumer` that debugs an input argument.

#### Parameters
|Param|Description|
|---|---|
|`loggingLevel`|the logging level|

#### Return

**Type**

Consumer

**Description**

the `Consumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `loggingLevel` is null|

### `static debug(String message)`

Returns a `Consumer` that debugs an input argument.

#### Parameters
|Param|Description|
|---|---|
|`message`|the message|

#### Return

**Type**

Consumer

**Description**

the `Consumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `message` is null|

### `static debug()`

Returns a `Consumer` that debugs an input argument.

#### Return

**Type**

Consumer

**Description**

the `Consumer`

### `static debugPretty(LoggingLevel loggingLevel, String message)`

Returns a `Consumer` that debugs an input argument using the pretty-print format.

#### Parameters
|Param|Description|
|---|---|
|`loggingLevel`|the logging level|
|`message`|the message|

#### Return

**Type**

Consumer

**Description**

the `Consumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `loggingLevel` or `message` is null|

### `static debugPretty(LoggingLevel loggingLevel)`

Returns a `Consumer` that debugs an input argument using the pretty-print format.

#### Parameters
|Param|Description|
|---|---|
|`loggingLevel`|the logging level|

#### Return

**Type**

Consumer

**Description**

the `Consumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `loggingLevel` is null|

### `static debugPretty(String message)`

Returns a `Consumer` that debugs an input argument using the pretty-print format.

#### Parameters
|Param|Description|
|---|---|
|`message`|the message|

#### Return

**Type**

Consumer

**Description**

the `Consumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `message` is null|

### `static debugPretty()`

Returns a `Consumer` that debugs an input argument using the pretty-print format.

#### Return

**Type**

Consumer

**Description**

the `Consumer`

---
