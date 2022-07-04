# OptionalInt

`APIVERSION: 55`

`STATUS: ACTIVE`

A container which may or may not contain a non-null `Integer` value.


**Author** Oleh Berehovskyi


**Group** Optionals

## Methods
### `static of(Integer value)`

Returns an instance of `OptionalInt`.

#### Parameters
|Param|Description|
|---|---|
|`value`|the value to describe|

#### Return

**Type**

OptionalInt

**Description**

the `OptionalInt`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

### `static ofNullable(Integer value)`

Returns an instance of `OptionalInt` if non-null, otherwise returns an empty `OptionalInt`.

#### Parameters
|Param|Description|
|---|---|
|`value`|the value to describe|

#### Return

**Type**

OptionalInt

**Description**

the `OptionalInt`

### `static empty()`

Returns an empty instance of `OptionalInt`.

#### Return

**Type**

OptionalInt

**Description**

the empty `OptionalInt`

### `get()`

Returns `value` if a value is present, otherwise throws `NoSuchElementException`.

#### Return

**Type**

Integer

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

### `ifPresent(IIntConsumer consumer)`

If a value is present, performs `consumer` action with `value`, otherwise does nothing.

#### Parameters
|Param|Description|
|---|---|
|`consumer`|the consumer action to perform|

### `ifPresentOrElse(IIntConsumer consumer, IRunnable action)`

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

### `orElse(Integer other)`

Returns a value if the value is present, otherwise returns the fallback `other` Integer. May be null.

#### Parameters
|Param|Description|
|---|---|
|`other`|the supplying function|

#### Return

**Type**

Integer

**Description**

the `Integer`

### `orElseGet(IIntSupplier supplier)`

Returns a value if the value is present, otherwise returns the value provided by `supplier`.

#### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplying function|

#### Return

**Type**

Integer

**Description**

the `Integer`

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

Integer

**Description**

the `Integer`

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
