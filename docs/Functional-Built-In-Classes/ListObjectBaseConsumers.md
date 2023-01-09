# ListObjectBaseConsumers

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides common implementations of `List<T> - Object` [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md) and related utilities.


**See** [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md)


**See** [Collector](/docs/Functional-Abstract-Classes/Collector.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Add To List<Object>
##### `static addToList()`

Returns a `BiConsumer` that casts the first input argument to `List<Object>` and adds the second input argument to this `List`.

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** ObjectIterable.toList

---
