# LongPredicate

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ILongPredicate](/docs/Functional-Interfaces/ILongPredicate.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions


**See** ILongIterable.filter


**See** ILongIterable.take


**See** ILongIterable.drop


**See** ILongIterable.find


**See** ILongIterable.some


**See** ILongIterable.every


**See** ILongIterable.none

## Methods
### Function
##### `test(Long l)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `orElse(ILongPredicate other)`

Returns a composed `LongPredicate` that applies short-circuiting logical `OR` operator to `this` `ILongPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `ILongPredicate`|

###### Return

**Type**

LongPredicate

**Description**

the composed `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someLongPredicate1.orElse(someLongPredicate2);
```

##### `andAlso(ILongPredicate other)`

Returns a composed `LongPredicate` that applies short-circuiting logical `AND` operator to `this` `ILongPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `ILongPredicate`|

###### Return

**Type**

LongPredicate

**Description**

the composed `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someLongPredicate1.andAlso(someLongPredicate2);
```

##### `negate()`

Returns a `LongPredicate` that applies logical `NOT` operator to `this` `ILongPredicate`.

###### Return

**Type**

LongPredicate

**Description**

the negated `LongPredicate`

###### Example
```apex
someLongPredicate.negate();
```

---
### Static Methods
##### `static some(List<ILongPredicate> predicates)`

Returns a composed `LongPredicate` that applies sequentially short-circuiting logical `OR` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`ILongPredicate`|

###### Return

**Type**

LongPredicate

**Description**

the composed `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
LongPredicate.some(someLongPredicates);
```

##### `static some(ILongPredicate predicate1, ILongPredicate predicate2)`

Returns a composed `LongPredicate` that applies short-circuiting logical `OR` operator to `predicate1` `ILongPredicate` and `predicate2` in that order.

###### Parameters
|Param|Description|
|---|---|
|`predicate1`|the first `ILongPredicate`|
|`predicate2`|the second `ILongPredicate`|

###### Return

**Type**

LongPredicate

**Description**

the composed `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate1` or `predicate2` is null|

###### Example
```apex
LongPredicate.some(someLongPredicate1, someLongPredicate2);
```

##### `static every(List<ILongPredicate> predicates)`

Returns a composed `LongPredicate` that applies sequentially short-circuiting logical `AND` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`ILongPredicates`|

###### Return

**Type**

LongPredicate

**Description**

the composed `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
LongPredicate.every(someLongPredicates);
```

##### `static every(ILongPredicate predicate1, ILongPredicate predicate2)`

Returns a composed `LongPredicate` that applies short-circuiting logical `AND` operator to `predicate1` `ILongPredicate` and `predicate2` in that order.

###### Parameters
|Param|Description|
|---|---|
|`predicate1`|the first `ILongPredicate`|
|`predicate2`|the second `ILongPredicate`|

###### Return

**Type**

LongPredicate

**Description**

the composed `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate1` or `predicate2` is null|

###### Example
```apex
LongPredicate.every(someLongPredicate1, someLongPredicate2);
```

##### `static negate(ILongPredicate predicate)`

Returns a `LongPredicate` that applies logical `NOT` operator to `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the `ILongPredicate`|

###### Return

**Type**

LongPredicate

**Description**

the negated `LongPredicate`

###### Example
```apex
LongPredicate.negate(someLongPredicate);
```

##### `static always(Boolean value)`

Returns a `LongPredicate` that always evaluates to the Boolean `value` (`true` or `false`).

###### Parameters
|Param|Description|
|---|---|
|`value`|the evaluated value|

###### Return

**Type**

LongPredicate

**Description**

predicate the `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
LongPredicate.always(true);
```

---
### Built-Ins
##### `static isGreater(Long value)`

Returns a `LongPredicate` that tests the input Long if it is greater than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`


**See** Comparator.compareNullSafeLongs

###### Example
```apex
LongPredicate.isGreater(100);
```

##### `static isGreaterOrEqual(Long value)`

Returns a `LongPredicate` that tests the input Long if it is greater than or equal to the `value`. <p><strong>Note: </strong></p> <<p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`


**See** Comparator.compareNullSafeLongs

###### Example
```apex
LongPredicate.isGreaterOrEqual(100);
```

##### `static isLess(Long value)`

Returns a `LongPredicate` that tests the input Long if it is less than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`


**See** Comparator.compareNullSafeLongs

###### Example
```apex
LongPredicate.isLess(100);
```

##### `static isLessOrEqual(Long value)`

Returns a `LongPredicate` that tests the input Long if it is less than or equal to the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`


**See** Comparator.compareNullSafeLongs

###### Example
```apex
LongPredicate.isLessOrEqual(100);
```

##### `static isEqual(Long value)`

Returns a `LongPredicate` that tests the input Long if it is equal to the `value`.

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`


**See** Comparator.compareNullSafeLongs

###### Example
```apex
LongPredicate.isEqual(100);
```

##### `static isNotEqual(Long value)`

Returns a `LongPredicate` that tests the input Long if it is not equal to the `value`.

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`


**See** Comparator.compareNullSafeLongs

###### Example
```apex
LongPredicate.isNotEqual(100);
```

##### `static isIn(List<Long> container)`

Returns a `LongPredicate` that tests the input Long if it is contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`container`|the list that checks for the presence of an element|

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `container` is null|


**See** List.contains

###### Example
```apex
LongPredicate.isIn(container);
```

##### `static isNotIn(List<Long> container)`

Returns a `LongPredicate` that tests the input Long if it is not contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`container`|the list that checks for the presence of an element|

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `container` is null|


**See** List.contains

###### Example
```apex
LongPredicate.isNotIn(container);
```

##### `static isNull()`

Returns a `LongPredicate` that tests the input Long if it is null.

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Example
```apex
LongPredicate.isNull();
```

##### `static isNotNull()`

Returns a `LongPredicate` that tests the input Long if it is not null.

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Example
```apex
LongPredicate.isNotNull();
```

##### `static isEven()`

Returns a `LongPredicate` that tests the input Long if it is even.

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Example
```apex
LongPredicate.isEven();
```

##### `static isFactorOf(Long i)`

Returns a `LongPredicate` that tests the input Long if it is a factor of `i`.

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `i` is null|

###### Example
```apex
LongPredicate.isFactorOf(5);
```

##### `static isNegative()`

Returns a `LongPredicate` that tests the input Long if it is negative.

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Example
```apex
LongPredicate.isNegative();
```

##### `static isNegativeOrZero()`

Returns a `LongPredicate` that tests the input Long if it is negative or zero.

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Example
```apex
LongPredicate.isNegativeOrZero();
```

##### `static isOdd()`

Returns a `LongPredicate` that tests the input Long if it is odd.

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Example
```apex
LongPredicate.isEven();
```

##### `static isPositive()`

Returns a `LongPredicate` that tests the input Long if it is positive.

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Example
```apex
LongPredicate.isPositive();
```

##### `static isPositiveOrZero()`

Returns a `LongPredicate` that tests the input Long if it is positive or zero.

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Example
```apex
LongPredicate.isPositiveOrZero();
```

##### `static isPrime()`

Returns a `LongPredicate` that tests the input Long if it is prime.

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the input argument is null|

###### Example
```apex
LongPredicate.isPrime();
```

##### `static isZero()`

Returns a `LongPredicate` that tests the input Long if it is zero.

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Example
```apex
LongPredicate.isZero();
```

##### `static hasDivisor(Long divisor)`

Returns a `LongPredicate` that tests the input Long has the `divisor`.

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `divisor` is null|

###### Example
```apex
LongPredicate.hasDivisor(10);
```

---
