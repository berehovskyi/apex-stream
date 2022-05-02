# SetObjectConsumer

`APIVERSION: 54`

`STATUS: ACTIVE`

Provides common class level implementations, and related utilities for `Set<T> - T` two-arity consumers. Typically is used by collectors.


**Author** O. Berehovskyi


**Group** Functions


**See** [IBiConsumer](/docs/Functional-Interfaces/IBiConsumer.md)


**See** [Collector](/docs/Collectors/Collector.md)

## Methods
### `static addToSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Object>` and adds the second input argument to it.

#### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collector.toSet

### `static addToBoolSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Boolean>` and adds the second input argument to it.

#### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collector.toBoolSet

### `static addToIdSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Id>` and adds the second input argument to it.

#### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collector.toIdSet

### `static addToStringSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<String>` and adds the second input argument to it.

#### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collector.toStringSet

### `static addToBlobSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Blob>` and adds the second input argument to it.

#### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collector.toBlobSet

### `static addToDateSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Date>` and adds the second input argument to it.

#### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collector.toDateSet

### `static addToDatetimeSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Datetime>` and adds the second input argument to it.

#### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collector.toDatetimeSet

### `static addToTimeSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Time>` and adds the second input argument to it.

#### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collector.toTimeSet

### `static addToIntSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Integer>` and adds the second input argument to it.

#### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collector.toIntSet

### `static addToLongSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Long>` and adds the second input argument to it.

#### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collector.toLongSet

### `static addToDoubleSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<Double>` and adds the second input argument to it.

#### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collector.toDoubleSet

### `static addToSObjectSet()`

Returns a `BiConsumer` that casts the first input argument to the `Set<SObject>` and adds the second input argument to it.

#### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the first input argument is null|


**See** Collector.toSObjectSet

---
