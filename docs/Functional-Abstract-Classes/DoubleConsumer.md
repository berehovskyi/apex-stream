# DoubleConsumer

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IDoubleConsumer](/docs/Functional-Interfaces/IDoubleConsumer.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes


**See** IDoubleIterable.forEach

## Methods
### Function
##### `accept(Double d)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `andThen(IDoubleConsumer after)`

Returns a composed `DoubleConsumer` that executes `this` operation first, then the `after` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Return

**Type**

DoubleConsumer

**Description**

the composed `DoubleConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

---
### Static Methods
##### `static compose(List<IDoubleConsumer> consumers)`

Returns a composed `DoubleConsumer` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters
|Param|Description|
|---|---|
|`consumers`|the operations to sequentially perform|

###### Return

**Type**

DoubleConsumer

**Description**

the composed `DoubleConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumers` is null or some element is null|

---
### Built-Ins
##### `static debug(LoggingLevel loggingLevel, String message)`

Returns a `DoubleConsumer` that debugs an input argument.

###### Parameters
|Param|Description|
|---|---|
|`loggingLevel`|the logging level|
|`message`|the message|

###### Return

**Type**

DoubleConsumer

**Description**

the `DoubleConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `loggingLevel` or `message` is null|

##### `static debug(LoggingLevel loggingLevel)`

Returns a `DoubleConsumer` that debugs an input argument.

###### Parameters
|Param|Description|
|---|---|
|`loggingLevel`|the logging level|

###### Return

**Type**

DoubleConsumer

**Description**

the `DoubleConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `loggingLevel` is null|

##### `static debug(String message)`

Returns a `DoubleConsumer` that debugs an input argument.

###### Parameters
|Param|Description|
|---|---|
|`message`|the message|

###### Return

**Type**

DoubleConsumer

**Description**

the `DoubleConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `message` is null|

##### `static debug()`

Returns a `DoubleConsumer` that debugs an input argument.

###### Return

**Type**

DoubleConsumer

**Description**

the `DoubleConsumer`

---
