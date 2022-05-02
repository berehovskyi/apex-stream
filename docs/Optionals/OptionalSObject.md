# OptionalSObject

`APIVERSION: 54`

`STATUS: ACTIVE`

A container which may or may not contain a non-null `SObject` value.


**Author** O. Berehovskyi


**Group** Optionals

## Methods
### `static of(SObject value)`

Returns an instance of `OptionalSObject`.

#### Parameters
|Param|Description|
|---|---|
|`value`|the value to describe|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

### `static ofNullable(SObject value)`

Returns an instance of `OptionalSObject` if non-null, otherwise returns an empty `OptionalSObject`.

#### Parameters
|Param|Description|
|---|---|
|`value`|the value to describe|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject`

### `static empty()`

Returns an empty instance of `OptionalSObject`.

#### Return

**Type**

OptionalSObject

**Description**

the empty `OptionalSObject`

### `get()`

Returns `value` if a value is present, otherwise throws `NoSuchElementException`.

#### Return

**Type**

SObject

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

### `ifPresent(ISObjectConsumer consumer)`

If a value is present, performs `consumer` action with `value`, otherwise does nothing.

#### Parameters
|Param|Description|
|---|---|
|`consumer`|the consumer action to perform|

### `ifPresentOrElse(ISObjectConsumer consumer, IRunnable action)`

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

### `filter(ISObjectPredicate predicate)`

Returns an `OptionalSObject` describing the value, if `value` matches `predicate`, otherwise returns an empty `OptionalSObject`.

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate to test a value|

#### Return

**Type**

OptionalSObject

**Description**

the nullable `OptionalSObject` or an empty `OptionalSObject`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

### `mapTo(ISObjectUnaryOperator mapper)`

Returns an `OptionalSObject` describing result of applying `mapper` function to the value if the value is present, otherwise returns an empty `OptionalSObject`.

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the operator|

#### Return

**Type**

OptionalSObject

**Description**

the nullable `OptionalSObject` or an empty `OptionalSObject`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

### `orGet(ISObjectSupplier supplier)`

Returns an `OptionalSObject` describing the value if the value is present, otherwise returns `OptionalSObject` produced by the supplying function.

#### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplying function|

#### Return

**Type**

OptionalSObject

**Description**

the nullable `OptionalSObject` or an empty `OptionalSObject`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `optionalSupplier` is null|

### `orElse(SObject other)`

Returns a value if the value is present, otherwise returns the fallback `other` SObject. May be null.

#### Parameters
|Param|Description|
|---|---|
|`other`|the supplying function|

#### Return

**Type**

SObject

**Description**

the `SObject`

### `orElseGet(ISObjectSupplier supplier)`

Returns a value if the value is present, otherwise returns the value provided by `supplier`.

#### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplying function|

#### Return

**Type**

SObject

**Description**

the `SObject`

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

SObject

**Description**

the `SObject`

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
