# OptionalLong

`APIVERSION: 55`

`STATUS: ACTIVE`

A container which may or may not contain a non-null `Long` value.


**Author** Oleh Berehovskyi


**Group** Optionals

## Methods
### `static of(Long value)`

Returns an instance of `OptionalLong`.

#### Parameters
|Param|Description|
|---|---|
|`value`|the value to describe|

#### Return

**Type**

OptionalLong

**Description**

the `OptionalLong`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

### `static ofNullable(Long value)`

Returns an instance of `OptionalLong` if non-null, otherwise returns an empty `OptionalLong`.

#### Parameters
|Param|Description|
|---|---|
|`value`|the value to describe|

#### Return

**Type**

OptionalLong

**Description**

the `OptionalLong`

### `static empty()`

Returns an empty instance of `OptionalLong`.

#### Return

**Type**

OptionalLong

**Description**

the empty `OptionalLong`

### `get()`

Returns `value` if a value is present, otherwise throws `NoSuchElementException`.

#### Return

**Type**

Long

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

### `ifPresent(ILongConsumer consumer)`

If a value is present, performs `consumer` action with `value`, otherwise does nothing.

#### Parameters
|Param|Description|
|---|---|
|`consumer`|the consumer action to perform|

### `ifPresentOrElse(ILongConsumer consumer, IRunnable action)`

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

### `orElse(Long other)`

Returns a value if the value is present, otherwise returns the fallback `other` Long. May be null.

#### Parameters
|Param|Description|
|---|---|
|`other`|the supplying function|

#### Return

**Type**

Long

**Description**

the `Long`

### `orElseGet(ILongSupplier supplier)`

Returns a value if the value is present, otherwise returns the value provided by `supplier`.

#### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplying function|

#### Return

**Type**

Long

**Description**

the `Long`

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

Long

**Description**

the `Long`

#### Throws
|Exception|Description|
|---|---|
|`Exception`|if no value is present|
|`NullPointerException`|if `exceptionSupplier` is null|

### `equals(Object obj)`
#### Parameters
|Param|Description|
|---|---|

### `override hashCode()`
---
