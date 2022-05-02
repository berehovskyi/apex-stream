# LongConsumer

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ILongConsumer](/docs/Functional-Interfaces/ILongConsumer.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions


**See** ILongIterable.forEach

## Methods
### Function
##### `accept(Long l)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `andThen(ILongConsumer after)`

Returns a composed `LongConsumer` that executes `this` operation first, then the `after` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Return

**Type**

LongConsumer

**Description**

the composed `LongConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

---
### Static Methods
##### `static compose(List<ILongConsumer> consumers)`

Returns a composed `LongConsumer` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters
|Param|Description|
|---|---|
|`consumers`|the operations to sequentially perform|

###### Return

**Type**

LongConsumer

**Description**

the composed `LongConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumers` is null or some element is null|

---
### Built-Ins
##### `static debug(LoggingLevel loggingLevel, String message)`

Returns a `LongConsumer` that debugs an input argument.

###### Parameters
|Param|Description|
|---|---|
|`loggingLevel`|the logging level|
|`message`|the message|

###### Return

**Type**

LongConsumer

**Description**

the `LongConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `loggingLevel` or `message` is null|

##### `static debug(LoggingLevel loggingLevel)`

Returns a `LongConsumer` that debugs an input argument.

###### Parameters
|Param|Description|
|---|---|
|`loggingLevel`|the logging level|

###### Return

**Type**

LongConsumer

**Description**

the `LongConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `loggingLevel` is null|

##### `static debug(String message)`

Returns a `LongConsumer` that debugs an input argument.

###### Parameters
|Param|Description|
|---|---|
|`message`|the message|

###### Return

**Type**

LongConsumer

**Description**

the `LongConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `message` is null|

##### `static debug()`

Returns a `LongConsumer` that debugs an input argument.

###### Return

**Type**

LongConsumer

**Description**

the `LongConsumer`

---
