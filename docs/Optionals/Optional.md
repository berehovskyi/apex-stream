# Optional

`APIVERSION: 57`

`STATUS: ACTIVE`

A container which may or may not contain a non-null `Object` value.


**Author** Oleh Berehovskyi


**Group** Optionals

## Methods
### `static of(Object value)`

Returns an instance of `Optional`.

#### Parameters
|Param|Description|
|---|---|
|`value`|the value to describe|

#### Return

**Type**

Optional

**Description**

the `Optional`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

### `static ofNullable(Object value)`

Returns an instance of `Optional` if non-null, otherwise returns an empty `Optional`.

#### Parameters
|Param|Description|
|---|---|
|`value`|the value to describe|

#### Return

**Type**

Optional

**Description**

the `Optional`

### `static empty()`

Returns an empty instance of `Optional`.

#### Return

**Type**

Optional

**Description**

the empty `Optional`

### `get()`

Returns `value` if a value is present, otherwise throws `NoSuchElementException`.

#### Return

**Type**

Object

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

### `ifPresent(IConsumer consumer)`

If a value is present, performs `consumer` action with `value`, otherwise does nothing.

#### Parameters
|Param|Description|
|---|---|
|`consumer`|the consumer action to perform|

### `ifPresentOrElse(IConsumer consumer, IRunnable action)`

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

### `filter(IPredicate predicate)`

Returns an `Optional` describing the value, if `value` matches `predicate`, otherwise returns an empty `Optional`.

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate to test a value|

#### Return

**Type**

Optional

**Description**

the nullable `Optional` or an empty `Optional`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

### `mapTo(IFunction mapper)`

Returns an `Optional` describing the result of applying the `mapper` function to the value if the value is present, otherwise returns an empty `Optional`.

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the function|

#### Return

**Type**

Optional

**Description**

the nullable `Optional` or an empty `Optional`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

### `flatMapTo(IFunction mapper)`

Returns an `Optional` the result of applying the `mapper` function to the value if the value is present, otherwise returns an empty `Optional`.

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the function that returns an `Optional`|

#### Return

**Type**

Optional

**Description**

the nullable `Optional` or an empty `Optional`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

### `orGet(ISupplier supplier)`

Returns an `Optional` describing the value if the value is present, otherwise returns `Optional` produced by the supplying function.

#### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplying function|

#### Return

**Type**

Optional

**Description**

the nullable `Optional` or an empty `Optional`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

### `orElse(Object other)`

Returns a value if the value is present, otherwise returns the fallback `other` Object. May be null.

#### Parameters
|Param|Description|
|---|---|
|`other`|the supplying function|

#### Return

**Type**

Object

**Description**

the `Object`

### `orElseGet(ISupplier supplier)`

Returns a value if the value is present, otherwise returns the value provided by `supplier`.

#### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplying function|

#### Return

**Type**

Object

**Description**

the `Object`

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

Object

**Description**

the `Object`

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
