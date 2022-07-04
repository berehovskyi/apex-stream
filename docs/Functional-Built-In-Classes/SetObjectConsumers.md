# SetObjectConsumers

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides common implementations of `Set<T> - T` [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md) and related utilities that are used by [Collectors](/Functional-Built-In-Classes/Collectors.md).


**See** [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md)


**See** [Collectors](/docs/Functional-Built-In-Classes/Collectors.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Add To Set<?> BiConsumers
##### `static addToSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Object>` and adds the second input argument to it.

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toSet

##### `static addToBoolSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Boolean>` and adds the second input argument to it.

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toBoolSet

##### `static addToIdSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Id>` and adds the second input argument to it.

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toIdSet

##### `static addToStringSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<String>` and adds the second input argument to it.

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toStringSet

##### `static addToBlobSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Blob>` and adds the second input argument to it.

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toBlobSet

##### `static addToDateSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Date>` and adds the second input argument to it.

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toDateSet

##### `static addToDatetimeSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Datetime>` and adds the second input argument to it.

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toDatetimeSet

##### `static addToTimeSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Time>` and adds the second input argument to it.

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toTimeSet

##### `static addToIntSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Integer>` and adds the second input argument to it.

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toIntSet

##### `static addToLongSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Long>` and adds the second input argument to it.

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toLongSet

##### `static addToDoubleSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Double>` and adds the second input argument to it.

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toDoubleSet

##### `static addToSObjectSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<SObject>` and adds the second input argument to it.

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.toSObjectSet

---
