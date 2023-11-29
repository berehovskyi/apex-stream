# IOptional

`APIVERSION: 58`

`STATUS: ACTIVE`

A container which may or may not contain a value.


**Author** Oleh Berehovskyi


**Group** Functional Interfaces

## Methods
### `public Object get()`

Returns `value` if a value is present, otherwise throws `NoSuchElementException`.

#### Returns

|Type|Description|
|---|---|
|`Object`|the non-null `value`|

### `public Boolean isPresent()`

Returns `true` if a value is present, otherwise `false`.

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public Boolean isEmpty()`

Returns `true` if a value is not present, otherwise `false`.

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

### `public void ifPresent(IConsumer consumer)`

If a value is present, performs `consumer` action with `value`, otherwise does nothing.

#### Parameters

|Param|Description|
|---|---|
|`consumer`|the consumer action to perform|

### `public void ifPresentOrElse(IConsumer consumer, IRunnable action)`

If a value is present, performs `consumer` action with `value`, otherwise performs runnable `action`.

#### Parameters

|Param|Description|
|---|---|
|`consumer`|the consumer action|
|`action`|the runnable action|

### `public IOptional filter(IPredicate predicate)`

Returns an `IOptional` describing the value, if `value` matches `predicate`, otherwise returns an empty `IOptional`.

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate to test a value|

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the nullable `IOptional` or an empty `IOptional`|

### `public IOptional mapTo(IFunction mapper)`

Returns an `IOptional` describing the result of applying the `mapper` function to the value if the value is present, otherwise returns an empty `IOptional`.

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the function|

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the nullable `IOptional` or an empty `IOptional`|

### `public IOptional flatMapTo(IFunction mapper)`

Returns an `IOptional` the result of applying the `mapper` function to the value if the value is present, otherwise returns an empty `IOptional`.

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the function that returns an `IOptional`|

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the nullable `IOptional` or an empty `IOptional`|

### `public IOptional orGet(ISupplier supplier)`

Returns an `IOptional` describing the value if the value is present, otherwise returns `IOptional` produced by the supplying function.

#### Parameters

|Param|Description|
|---|---|
|`supplier`|the supplying function|

#### Returns

|Type|Description|
|---|---|
|`IOptional`|the nullable `IOptional` or an empty `IOptional`|

### `public Object orElse(Object other)`

Returns a value if the value is present, otherwise returns the fallback `other` Object. May be null.

#### Parameters

|Param|Description|
|---|---|
|`other`|the fallback value|

#### Returns

|Type|Description|
|---|---|
|`Object`|the `Object`|

### `public Object orElseGet(ISupplier supplier)`

Returns a value if the value is present, otherwise returns the value provided by `supplier`.

#### Parameters

|Param|Description|
|---|---|
|`supplier`|the supplying function|

#### Returns

|Type|Description|
|---|---|
|`Object`|the `Object`|

### `public Object orElseThrow(ISupplier exceptionSupplier)`

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

---
