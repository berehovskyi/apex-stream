# Function

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IFunction](/docs/Functional-Interfaces/IFunction.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions


**See** IObjectIterable.mapTo

## Methods
### `apply(Object o)`
#### Parameters
|Param|Description|
|---|---|

### `andThen(IFunction after)`

Returns a composed `Function` that executes `this` operation first, then the `after` operation in that order.

#### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

#### Return

**Type**

Function

**Description**

the composed `Function`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

### `compose(IFunction before)`

Returns a composed `Function` that executes `before` operation first, then the `this` operation in that order.

#### Parameters
|Param|Description|
|---|---|
|`before`|the operation to perform before this operation|

#### Return

**Type**

Function

**Description**

the composed `Function`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `before` is null|

### `static compose(List<IFunction> functions)`

Returns a composed `Function` that sequentially executes the operations in the same order as the order of the consumers input list.

#### Parameters
|Param|Description|
|---|---|
|`functions`|the functions to sequentially perform|

#### Return

**Type**

Function

**Description**

the composed `Function`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operators` is null or some element is null|

### `static identity()`

Returns a `Function` that always returns the input argument.

#### Return

**Type**

Function

**Description**

the `Function`

### `static constant(Object value)`

Returns a `Function` that always returns the `value`.

#### Parameters
|Param|Description|
|---|---|
|`value`|the value|

#### Return

**Type**

Function

**Description**

the `Function`

### `static forPredicate(IPredicate predicate)`

Returns a composed `Function` of the `predicate`.

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

Function

**Description**

the `Function`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

### `static upcast(ISObjectFunction function)`

Returns a composed `Function` of the `ISObjectFunction`.

#### Parameters
|Param|Description|
|---|---|
|`function`|the function|

#### Return

**Type**

Function

**Description**

the `Function`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `function` is null|

---
