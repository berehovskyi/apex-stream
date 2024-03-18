# virtual Optional

`APIVERSION: 60`

`STATUS: ACTIVE`

A container which may or may not contain a non-null `Object` value.


**Implemented types**

[IOptional](/docs/Functional-Interfaces/IOptional.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### `public static Optional of(Object value)`

Returns an instance of `Optional`.

#### Parameters

|Param|Description|
|---|---|
|`value`|the value to describe|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

### `public static Optional ofNullable(Object value)`

Returns an instance of `Optional` if non-null, otherwise returns an empty `Optional`.

#### Parameters

|Param|Description|
|---|---|
|`value`|the value to describe|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional`|

### `public static Optional empty()`

Returns an empty instance of `Optional`.

#### Returns

|Type|Description|
|---|---|
|`Optional`|the empty `Optional`|

### `public virtual Object get()`

Returns `value` if a value is present, otherwise throws `NoSuchElementException`.

#### Returns

|Type|Description|
|---|---|
|`Object`|the non-null `value`|

#### Throws

|Exception|Description|
|---|---|
|`NoSuchElementException`|if `value` is null|

### `public virtual Boolean isPresent()`

Returns `true` if a value is present, otherwise `false`.

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public virtual Boolean isEmpty()`

Returns `true` if a value is not present, otherwise `false`.

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public virtual void ifPresent(IConsumer consumer)`

If a value is present, performs `consumer` action with `value`, otherwise does nothing.

#### Parameters

|Param|Description|
|---|---|
|`consumer`|the consumer action to perform|

### `public virtual void ifPresentOrElse(IConsumer consumer, IRunnable action)`

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

### `public virtual Optional filter(IPredicate predicate)`

Returns an `Optional` describing the value, if `value` matches `predicate`, otherwise returns an empty `Optional`.

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate to test a value|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the nullable `Optional` or an empty `Optional`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

### `public virtual Optional mapTo(IFunction mapper)`

Returns an `Optional` describing the result of applying the `mapper` function to the value if the value is present, otherwise returns an empty `Optional`.

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the function|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the nullable `Optional` or an empty `Optional`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

### `public virtual Optional flatMapTo(IFunction mapper)`

Returns an `Optional` the result of applying the `mapper` function to the value if the value is present, otherwise returns an empty `Optional`.

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the function that returns an `Optional`|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the nullable `Optional` or an empty `Optional`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

### `public virtual Optional orGet(ISupplier supplier)`

Returns an `Optional` describing the value if the value is present, otherwise returns `Optional` produced by the supplying function.

#### Parameters

|Param|Description|
|---|---|
|`supplier`|the supplying function|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the nullable `Optional` or an empty `Optional`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

### `public virtual Object orElse(Object other)`

Returns a value if the value is present, otherwise returns the fallback `other` Object. May be null.

#### Parameters

|Param|Description|
|---|---|
|`other`|the fallback value|

#### Returns

|Type|Description|
|---|---|
|`Object`|the `Object`|

### `public virtual Object orElseGet(ISupplier supplier)`

Returns a value if the value is present, otherwise returns the value provided by `supplier`.

#### Parameters

|Param|Description|
|---|---|
|`supplier`|the supplying function|

#### Returns

|Type|Description|
|---|---|
|`Object`|the `Object`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

### `public virtual Object orElseThrow(ISupplier exceptionSupplier)`

Returns a value if the value is present, otherwise throws an Exception provided by `exceptionSupplier`.

#### Parameters

|Param|Description|
|---|---|
|`exceptionSupplier`|the exception supplying function|

#### Returns

|Type|Description|
|---|---|
|`Object`|the `Object`|

#### Throws

|Exception|Description|
|---|---|
|`Exception`|if no value is present|
|`NullPointerException`|if `exceptionSupplier` is null|

### `public virtual Boolean equals(Object obj)`
### `public virtual override Integer hashCode()`
---
