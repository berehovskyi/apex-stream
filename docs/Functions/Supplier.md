# Supplier

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ISupplier](/docs/Functional-Interfaces/ISupplier.md) functional interface and provides common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions


**See** [Collector](/docs/Collectors/Collector.md)


**See** [SObjectCollector](/docs/Collectors/SObjectCollector.md)

## Methods
### `get()`
### `static of(Type t)`

Returns a `Supplier` that returns a new instance of the given type.

#### Parameters
|Param|Description|
|---|---|
|`t`|Type of the new instance to create|

#### Return

**Type**

Supplier

**Description**

the `Supplier`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `t` is null|


**See** Type.newInstance

### `static upcast(IIntSupplier supplier)`

Returns a composed `Supplier` of the `IIntSupplier`.

#### Parameters
|Param|Description|
|---|---|
|`supplier`|the int supplier|

#### Return

**Type**

Supplier

**Description**

the composed `Supplier`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

### `static upcast(ILongSupplier supplier)`

Returns a composed `Supplier` of the `ILongSupplier`.

#### Parameters
|Param|Description|
|---|---|
|`supplier`|the Long supplier|

#### Return

**Type**

Supplier

**Description**

the composed `Supplier`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

### `static upcast(IDoubleSupplier supplier)`

Returns a composed `Supplier` of the `IDoubleSupplier`.

#### Parameters
|Param|Description|
|---|---|
|`supplier`|the Double supplier|

#### Return

**Type**

Supplier

**Description**

the composed `Supplier`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

### `static upcast(ISObjectSupplier supplier)`

Returns a composed `Supplier` of the `ISObjectSupplier`.

#### Parameters
|Param|Description|
|---|---|
|`supplier`|the SObject supplier|

#### Return

**Type**

Supplier

**Description**

the composed `Supplier`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

### `static joiningString()`

Returns a `Supplier` that returns a list container to track joining string.

#### Return

**Type**

Supplier

**Description**

the `Supplier`


**See** Collector.joining


**See** SObjectCollector.joining

### `static averagingInt()`

Returns a `Supplier` that returns a list container to track int averaging.

#### Return

**Type**

Supplier

**Description**

the `Supplier`


**See** Collector.averagingInt


**See** SObjectCollector.averagingInt

### `static averagingLong()`

Returns a `Supplier` that returns a list container to track Long averaging.

#### Return

**Type**

Supplier

**Description**

the `Supplier`


**See** Collector.averagingLong


**See** SObjectCollector.averagingLong

### `static averagingDouble()`

Returns a `Supplier` that returns a list container to track Double averaging.

#### Return

**Type**

Supplier

**Description**

the `Supplier`


**See** Collector.averagingDouble


**See** SObjectCollector.averagingDouble

### `static summingInt()`

Returns a `Supplier` that returns a list container to track int summing.

#### Return

**Type**

Supplier

**Description**

the `Supplier`


**See** Collector.summingInt


**See** SObjectCollector.summingInt

### `static summingLong()`

Returns a `Supplier` that returns a list container to track Long summing.

#### Return

**Type**

Supplier

**Description**

the `Supplier`


**See** Collector.summingLong


**See** SObjectCollector.summingLong

### `static summingDouble()`

Returns a `Supplier` that returns a list container to track Double summing.

#### Return

**Type**

Supplier

**Description**

the `Supplier`


**See** Collector.summingDouble


**See** SObjectCollector.summingDouble

### `static box(Object identity)`

Returns a `Supplier` that returns a list container to track `identity` mutation.

#### Parameters
|Param|Description|
|---|---|

#### Return

**Type**

Supplier

**Description**

the `Supplier`


**See** Collector.reducing

### `static sObjectBox(SObject identity)`

Returns a `Supplier` that returns a list container to track `identity` mutation.

#### Parameters
|Param|Description|
|---|---|

#### Return

**Type**

Supplier

**Description**

the `Supplier`


**See** SObjectCollector.reducing

---
