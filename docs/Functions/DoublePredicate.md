# DoublePredicate

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IDoublePredicate](/docs/Functional-Interfaces/IDoublePredicate.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions


**See** IDoubleIterable.filter


**See** IDoubleIterable.take


**See** IDoubleIterable.drop


**See** IDoubleIterable.find


**See** IDoubleIterable.some


**See** IDoubleIterable.every


**See** IDoubleIterable.none

## Methods
### `test(Double d)`
#### Parameters
|Param|Description|
|---|---|

### `orElse(IDoublePredicate other)`

Returns a composed `DoublePredicate` that applies short-circuiting logical `OR` operator to `this` `IDoublePredicate` and `other` in that order.

#### Parameters
|Param|Description|
|---|---|
|`other`|the other `IDoublePredicate`|

#### Return

**Type**

DoublePredicate

**Description**

the composed `DoublePredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

#### Example
```apex
someDoublePredicate1.orElse(someDoublePredicate2);
```

### `andAlso(IDoublePredicate other)`

Returns a composed `DoublePredicate` that applies short-circuiting logical `AND` operator to `this` `IDoublePredicate` and `other` in that order.

#### Parameters
|Param|Description|
|---|---|
|`other`|the other `IDoublePredicate`|

#### Return

**Type**

DoublePredicate

**Description**

the composed `IDoublePredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

#### Example
```apex
someDoublePredicate1.andAlso(someDoublePredicate2);
```

### `negate()`

Returns a `DoublePredicate` that applies logical `NOT` operator to `this` `IDoublePredicate`.

#### Return

**Type**

DoublePredicate

**Description**

the negated `DoublePredicate`

#### Example
```apex
someDoublePredicate.negate();
```

### `static some(List<IDoublePredicate> predicates)`

Returns a composed `DoublePredicate` that applies sequentially short-circuiting logical `OR` operator to `predicates` in the same order as the order of the input list.

#### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`IDoublePredicates`|

#### Return

**Type**

DoublePredicate

**Description**

the composed `DoublePredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

#### Example
```apex
DoublePredicate.some(someDoublePredicates);
```

### `static some(IDoublePredicate predicate1, IDoublePredicate predicate2)`

Returns a composed `DoublePredicate` that applies short-circuiting logical `OR` operator to `predicate1` `IDoublePredicate` and `predicate2` in that order.

#### Parameters
|Param|Description|
|---|---|
|`predicate1`|the first `IDoublePredicate`|
|`predicate2`|the second `IDoublePredicate`|

#### Return

**Type**

DoublePredicate

**Description**

the composed `DoublePredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate1` or `predicate2` is null|

#### Example
```apex
DoublePredicate.some(someDoublePredicate1, someDoublePredicate2);
```

### `static every(List<IDoublePredicate> predicates)`

Returns a composed `DoublePredicate` that applies sequentially short-circuiting logical `AND` operator to `predicates` in the same order as the order of the input list.

#### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`IDoublePredicates`|

#### Return

**Type**

DoublePredicate

**Description**

the composed `DoublePredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

#### Example
```apex
DoublePredicate.every(someDoublePredicates);
```

### `static every(IDoublePredicate predicate1, IDoublePredicate predicate2)`

Returns a composed `DoublePredicate` that applies short-circuiting logical `AND` operator to `predicate1` `IDoublePredicate` and `predicate2` in that order.

#### Parameters
|Param|Description|
|---|---|
|`predicate1`|the first `IDoublePredicate`|
|`predicate2`|the second `IDoublePredicate`|

#### Return

**Type**

DoublePredicate

**Description**

the composed `DoublePredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate1` or `predicate2` is null|

#### Example
```apex
DoublePredicate.every(someDoublePredicate1, someDoublePredicate2);
```

### `static negate(IDoublePredicate predicate)`

Returns a `DoublePredicate` that applies logical `NOT` operator to `predicate`.

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the `IDoublePredicate`|

#### Return

**Type**

DoublePredicate

**Description**

the negated `DoublePredicate`

#### Example
```apex
DoublePredicate.negate(someDoublePredicate);
```

### `static always(Boolean value)`

Returns a `DoublePredicate` that always evaluates to the Boolean `value` (`true` or `false`).

#### Parameters
|Param|Description|
|---|---|
|`value`|the evaluated value|

#### Return

**Type**

DoublePredicate

**Description**

predicate the `DoublePredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

#### Example
```apex
DoublePredicate.always(true);
```

### `static isGreater(Double value)`

Returns a `DoublePredicate` that tests the input Double if it is greater than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

#### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`


**See** Comparator.compareNullSafeDoubles

#### Example
```apex
DoublePredicate.isGreater(100);
```

### `static isGreaterOrEqual(Double value)`

Returns a `DoublePredicate` that tests the input Double if it is greater than or equal to the `value`. <p><strong>Note: </strong></p> <<p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

#### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`


**See** Comparator.compareNullSafeDoubles

#### Example
```apex
DoublePredicate.isGreaterOrEqual(100);
```

### `static isLess(Double value)`

Returns a `DoublePredicate` that tests the input Double if it is less than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

#### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`


**See** Comparator.compareNullSafeDoubles

#### Example
```apex
DoublePredicate.isLess(100);
```

### `static isLessOrEqual(Double value)`

Returns a `DoublePredicate` that tests the input Double if it is less than or equal to the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

#### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`


**See** Comparator.compareNullSafeDoubles

#### Example
```apex
DoublePredicate.isLessOrEqual(100);
```

### `static isEqual(Double value)`

Returns a `DoublePredicate` that tests the input Double if it is equal to the `value`.

#### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

#### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`


**See** Comparator.compareNullSafeDoubles

#### Example
```apex
DoublePredicate.isEqual(100);
```

### `static isNotEqual(Double value)`

Returns a `DoublePredicate` that tests the input Double if it is not equal to the `value`.

#### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

#### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`


**See** Comparator.compareNullSafeDoubles

#### Example
```apex
DoublePredicate.isNotEqual(100);
```

### `static isIn(List<Double> container)`

Returns a `DoublePredicate` that tests the input Double if it is contained in the `container`.

#### Parameters
|Param|Description|
|---|---|
|`container`|the list that checks for the presence of an element|

#### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `container` is null|


**See** List.contains

#### Example
```apex
DoublePredicate.isIn(container);
```

### `static isNotIn(List<Double> container)`

Returns a `DoublePredicate` that tests the input Double if it is not contained in the `container`.

#### Parameters
|Param|Description|
|---|---|
|`container`|the list that checks for the presence of an element|

#### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `container` is null|


**See** List.contains

#### Example
```apex
DoublePredicate.isNotIn(container);
```

### `static isNull()`

Returns a `DoublePredicate` that tests the input Double if it is null.

#### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`

#### Example
```apex
DoublePredicate.isNull();
```

### `static isNotNull()`

Returns a `DoublePredicate` that tests the input Double if it is not null.

#### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`

#### Example
```apex
DoublePredicate.isNotNull();
```

### `static isNegative()`

Returns a `DoublePredicate` that tests the input Double if it is negative.

#### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`

#### Example
```apex
DoublePredicate.isNegative();
```

### `static isNegativeOrZero()`

Returns a `DoublePredicate` that tests the input Double if it is negative or zero.

#### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`

#### Example
```apex
DoublePredicate.isNegativeOrZero();
```

### `static isPositive()`

Returns a `DoublePredicate` that tests the input Double if it is positive.

#### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`

#### Example
```apex
DoublePredicate.isPositive();
```

### `static isPositiveOrZero()`

Returns a `DoublePredicate` that tests the input Double if it is positive or zero.

#### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`

#### Example
```apex
DoublePredicate.isPositiveOrZero();
```

### `static isZero()`

Returns a `DoublePredicate` that tests the input Double if it is prime.

#### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the input argument is null|

#### Example
```apex
DoublePredicate.isPrime();
```

---
