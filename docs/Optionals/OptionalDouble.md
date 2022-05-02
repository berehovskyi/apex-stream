# OptionalDouble

`APIVERSION: 54`

`STATUS: ACTIVE`

A container which may or may not contain a non-null `Double` value.


**Author** O. Berehovskyi


**Group** Optionals

## Methods
### `static of(Double value)`

Returns an instance of `OptionalDouble`.

#### Parameters
|Param|Description|
|---|---|
|`value`|the value to describe|

#### Return

**Type**

OptionalDouble

**Description**

the `OptionalDouble`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

### `static ofNullable(Double value)`

Returns an instance of `OptionalDouble` if non-null, otherwise returns an empty `OptionalDouble`.

#### Parameters
|Param|Description|
|---|---|
|`value`|the value to describe|

#### Return

**Type**

OptionalDouble

**Description**

the `OptionalDouble`

### `static empty()`

Returns an empty instance of `OptionalDouble`.

#### Return

**Type**

OptionalDouble

**Description**

the empty `OptionalDouble`

### `get()`

Returns `value` if a value is present, otherwise throws `NoSuchElementException`.

#### Return

**Type**

Double

**Description**

the non-null `value`

#### Throws
|Exception|Description|
|---|---|
|`NoSuchElementException`|if `value` is null|

### `isPresent()`

Returns `true` if a value is present, otherwise `false`.

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `isEmpty()`

Returns `true` if a value is not present, otherwise `false`.

#### Return

**Type**

Boolean

**Description**

`true` or `false`

### `ifPresent(IDoubleConsumer consumer)`

If a value is present, performs `consumer` action with `value`, otherwise does nothing.

#### Parameters
|Param|Description|
|---|---|
|`consumer`|the consumer action to perform|

### `ifPresentOrElse(IDoubleConsumer consumer, IRunnable action)`

If a value is present, performs `consumer` action with `value`, otherwise performs runnable `action`.

#### Parameters
|Param|Description|
|---|---|
|`consumer`|the consumer action|
|`action`|the runnable action|

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` or `action` is null|

### `orElse(Double other)`

Returns a value if the value is present, otherwise returns the fallback `other` SObject. May be null.

#### Parameters
|Param|Description|
|---|---|
|`other`|the supplying function|

#### Return

**Type**

Double

**Description**

the `Double`

### `orElseGet(IDoubleSupplier supplier)`

Returns a value if the value is present, otherwise returns the value provided by `supplier`.

#### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplying function|

#### Return

**Type**

Double

**Description**

the `Double`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

### `orElseThrow(ISupplier exceptionSupplier)`

Returns a value if the value is present, otherwise throws an Exception provided by `exceptionSupplier`.

#### Parameters
|Param|Description|
|---|---|
|`exceptionSupplier`|the exception supplying function|

#### Return

**Type**

Double

**Description**

the `Double`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `exceptionSupplier` is null|
|`Exception`|if no value is present|

### `equals(Object obj)`
#### Parameters
|Param|Description|
|---|---|

### `override hashCode()`
---
