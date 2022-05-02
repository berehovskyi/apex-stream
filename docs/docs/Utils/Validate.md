# Validate

`APIVERSION: 54`

`STATUS: ACTIVE`

Contains static utility arguments validation methods. <ul>   <li>An invalid `null` argument causes a NullPointerException.</li>   <li>A non-`null` argument causes an IllegalArgumentException.</li>   <li>Assertion failure causes a fatal error that causes code execution to halt.</li> </ul>


**Author** O. Berehovskyi


**Group** Utils

## Methods
### `static notNull(Object o)`

Checks whether the specified Object reference is not null.

#### Parameters
|Param|Description|
|---|---|
|`o`|the validated object reference|

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `o` is null|

### `static notBlank(String o)`

Checks whether the specified String reference is not blank.

#### Parameters
|Param|Description|
|---|---|
|`o`|the validated String|

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `o` is blank|

### `static noNullElements(List<Object> objs)`

Checks whether the specified `List<Object>` reference is not null nor contains any null elements.

#### Parameters
|Param|Description|
|---|---|
|`objs`|the validated list|

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `objs` or any element is null|

### `static isTrue(Boolean condition)`

Checks whether the specified `condition` is true.

#### Parameters
|Param|Description|
|---|---|
|`condition`|the boolean expression to check|

#### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `condition` evaluates to false|

### `static isTrue(Boolean condition, String message)`

Checks whether the specified `condition` is true.

#### Parameters
|Param|Description|
|---|---|
|`condition`|the boolean expression to check|
|`message`|the exception message|

#### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `condition` evaluates to false|

### `static isTrue(Boolean condition, Exception exc)`

Checks whether the specified `condition` is true.

#### Parameters
|Param|Description|
|---|---|
|`condition`|the boolean expression to check|
|`exc`|the exception to throw|

#### Throws
|Exception|Description|
|---|---|
|`Exception`|if `condition` evaluates to false|

### `static isTrue(Boolean condition, String message, List<Object> arguments)`

Checks whether the specified `condition` is true.

#### Parameters
|Param|Description|
|---|---|
|`condition`|the boolean expression to check|
|`message`|the formatted exception message|
|`arguments`|the optional values for the formatted exception message|

#### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `condition` evaluates to false|

#### Example
```apex
Validate.isTrue(n >= 0, 'The argument should be positive, actual: {0}.', new List<Object>{ n });
```

### `static validState(Boolean condition, String message, List<Object> arguments)`

Checks whether the specified `condition` is true.

#### Parameters
|Param|Description|
|---|---|
|`condition`|the boolean expression to check|
|`message`|the formatted exception message|
|`arguments`|the optional values for the formatted exception message|

#### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `condition` evaluates to false|

#### Example
```apex
Validate.validState(
    !map.containsKey(key),
    'Duplicate key {0} (attempted merging values {1} and {2}).',
    new List<Object>{ key, oldValue, newValue }
);
```

### `static assert(Boolean condition)`

Asserts whether the specified `condition` is true. If it is not, a fatal error is returned that causes code execution to halt.

#### Parameters
|Param|Description|
|---|---|
|`condition`|the boolean expression to check|

### `static assert(Boolean condition, String message)`

Asserts whether the specified `condition` is true. If it is not, a fatal error is returned that causes code execution to halt.

#### Parameters
|Param|Description|
|---|---|
|`condition`|the boolean expression to check|
|`message`|the optional message returned as part of the error message|

### `static assertEquals(Object expected, Object actual)`

Asserts that the first two arguments are the same. If it is not, a fatal error is returned that causes code execution to halt.

#### Parameters
|Param|Description|
|---|---|
|`expected`|the expected value|
|`actual`|the actual value|

### `static assertEquals(Object expected, Object actual, String message)`

Asserts that the first two arguments are the same. If it is not, a fatal error is returned that causes code execution to halt.

#### Parameters
|Param|Description|
|---|---|
|`expected`|the expected value|
|`actual`|the actual value|
|`message`|the optional message returned as part of the error message|

### `static assertNotEquals(Object expected, Object actual)`

Asserts that the first two arguments are not the same. If it is, a fatal error is returned that causes code execution to halt.

#### Parameters
|Param|Description|
|---|---|
|`expected`|the expected value|
|`actual`|the actual value|

### `static assertNotEquals(Object expected, Object actual, String message)`

Asserts that the first two arguments are not the same. If it is, a fatal error is returned that causes code execution to halt.

#### Parameters
|Param|Description|
|---|---|
|`expected`|the expected value|
|`actual`|the actual value|
|`message`|the optional message returned as part of the error message|

---
