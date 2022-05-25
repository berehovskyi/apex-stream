# IntPredicate

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IIntPredicate](/docs/Functional-Interfaces/IIntPredicate.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes


**See** IIntIterable.filter


**See** IIntIterable.take


**See** IIntIterable.drop


**See** IIntIterable.find


**See** IIntIterable.some


**See** IIntIterable.every


**See** IIntIterable.none

## Methods
### Function
##### `test(Integer i)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `orElse(IIntPredicate other)`

Returns a composed `IntPredicate` that applies short-circuiting logical `OR` operator to `this` `IIntPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `IIntPredicate`|

###### Return

**Type**

IntPredicate

**Description**

the composed `IntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someIntPredicate1.orElse(someIntPredicate2);
```

##### `andAlso(IIntPredicate other)`

Returns a composed `IntPredicate` that applies short-circuiting logical `AND` operator to `this` `IIntPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `IIntPredicate`|

###### Return

**Type**

IntPredicate

**Description**

the composed `IIntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someIntPredicate1.andAlso(someIntPredicate2);
```

##### `negate()`

Returns a `IntPredicate` that applies logical `NOT` operator to `this` `IIntPredicate`.

###### Return

**Type**

IntPredicate

**Description**

the negated `IntPredicate`

###### Example
```apex
someIntPredicate.negate();
```

---
### Static Methods
##### `static some(List<IIntPredicate> predicates)`

Returns a composed `IntPredicate` that applies sequentially short-circuiting logical `OR` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`IIntPredicates`|

###### Return

**Type**

IntPredicate

**Description**

the composed `IntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
IntPredicate.some(someIntPredicates);
```

##### `static some(IIntPredicate predicate1, IIntPredicate predicate2)`

Returns a composed `IntPredicate` that applies short-circuiting logical `OR` operator to `predicate1` `IIntPredicate` and `predicate2` in that order.

###### Parameters
|Param|Description|
|---|---|
|`predicate1`|the first `IIntPredicate`|
|`predicate2`|the second `IIntPredicate`|

###### Return

**Type**

IntPredicate

**Description**

the composed `IntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate1` or `predicate2` is null|

###### Example
```apex
IntPredicate.some(someIntPredicate1, someIntPredicate2);
```

##### `static every(List<IIntPredicate> predicates)`

Returns a composed `IntPredicate` that applies sequentially short-circuiting logical `AND` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`IIntPredicates`|

###### Return

**Type**

IntPredicate

**Description**

the composed `IntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
IntPredicate.every(someIntPredicates);
```

##### `static every(IIntPredicate predicate1, IIntPredicate predicate2)`

Returns a composed `IntPredicate` that applies short-circuiting logical `AND` operator to `predicate1` `IIntPredicate` and `predicate2` in that order.

###### Parameters
|Param|Description|
|---|---|
|`predicate1`|the first `IIntPredicate`|
|`predicate2`|the second `IIntPredicate`|

###### Return

**Type**

IntPredicate

**Description**

the composed `IntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate1` or `predicate2` is null|

###### Example
```apex
IntPredicate.every(someIntPredicate1, someIntPredicate2);
```

##### `static negate(IIntPredicate predicate)`

Returns a `IntPredicate` that applies logical `NOT` operator to `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the `IIntPredicate`|

###### Return

**Type**

IntPredicate

**Description**

the negated `IntPredicate`

###### Example
```apex
IntPredicate.negate(someIntPredicate);
```

##### `static always(Boolean value)`

Returns a `IntPredicate` that always evaluates to the Boolean `value` (`true` or `false`).

###### Parameters
|Param|Description|
|---|---|
|`value`|the evaluated value|

###### Return

**Type**

IntPredicate

**Description**

predicate the `IntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
IntPredicate.always(true);
```

---
### Built-Ins
##### `static isGreater(Integer value)`

Returns a `IntPredicate` that tests the input Integer if it is greater than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`


**See** Comparator.compareNullSafeInts

###### Example
```apex
IntPredicate.isGreater(100);
```

##### `static isGreaterOrEqual(Integer value)`

Returns a `IntPredicate` that tests the input Integer if it is greater than or equal to the `value`. <p><strong>Note: </strong></p> <<p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`


**See** Comparator.compareNullSafeInts

###### Example
```apex
IntPredicate.isGreaterOrEqual(100);
```

##### `static isLess(Integer value)`

Returns a `IntPredicate` that tests the input Integer if it is less than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`


**See** Comparator.compareNullSafeInts

###### Example
```apex
IntPredicate.isLess(100);
```

##### `static isLessOrEqual(Integer value)`

Returns a `IntPredicate` that tests the input Integer if it is less than or equal to the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`


**See** Comparator.compareNullSafeInts

###### Example
```apex
IntPredicate.isLessOrEqual(100);
```

##### `static isEqual(Integer value)`

Returns a `IntPredicate` that tests the input Integer if it is equal to the `value`.

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`


**See** Comparator.compareNullSafeInts

###### Example
```apex
IntPredicate.isEqual(100);
```

##### `static isNotEqual(Integer value)`

Returns a `IntPredicate` that tests the input Integer if it is not equal to the `value`.

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`


**See** Comparator.compareNullSafeInts

###### Example
```apex
IntPredicate.isNotEqual(100);
```

##### `static isIn(Iterable<Integer> container)`

Returns a `IntPredicate` that tests the input Integer if it is contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `container` is null|


**See** List.contains

###### Example
```apex
IntPredicate.isIn(new List<Integer>{ 1, 5, -7 });
IntPredicate.isIn((Iterable<Integer>) new Set<Integer>{ 1, 5, -7 });
IntPredicate.isIn(intStream);
```

##### `static isNotIn(Iterable<Integer> container)`

Returns a `IntPredicate` that tests the input Integer if it is not contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `container` is null|


**See** List.contains

###### Example
```apex
IntPredicate.isNotIn(new List<Integer>{ 1, 5, -7 });
IntPredicate.isNotIn((Iterable<Integer>) new Set<Integer>{ 1, 5, -7 });
IntPredicate.isNotIn(intStream);
```

##### `static isNull()`

Returns a `IntPredicate` that tests the input Integer if it is null.

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`

###### Example
```apex
IntPredicate.isNull();
```

##### `static isNotNull()`

Returns a `IntPredicate` that tests the input Integer if it is not null.

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`

###### Example
```apex
IntPredicate.isNotNull();
```

##### `static isEven()`

Returns a `IntPredicate` that tests the input Integer if it is even.

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`

###### Example
```apex
IntPredicate.isEven();
```

##### `static isFactorOf(Integer i)`

Returns a `IntPredicate` that tests the input Integer if it is a factor of `i`.

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `i` is null|

###### Example
```apex
IntPredicate.isFactorOf(5);
```

##### `static isNegative()`

Returns a `IntPredicate` that tests the input Integer if it is negative.

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`

###### Example
```apex
IntPredicate.isNegative();
```

##### `static isNegativeOrZero()`

Returns a `IntPredicate` that tests the input Integer if it is negative or zero.

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`

###### Example
```apex
IntPredicate.isNegativeOrZero();
```

##### `static isOdd()`

Returns a `IntPredicate` that tests the input Integer if it is odd.

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`

###### Example
```apex
IntPredicate.isEven();
```

##### `static isPositive()`

Returns a `IntPredicate` that tests the input Integer if it is positive.

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`

###### Example
```apex
IntPredicate.isPositive();
```

##### `static isPositiveOrZero()`

Returns a `IntPredicate` that tests the input Integer if it is positive or zero.

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`

###### Example
```apex
IntPredicate.isPositiveOrZero();
```

##### `static isPrime()`

Returns a `IntPredicate` that tests the input Integer if it is prime.

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the input argument is null|

###### Example
```apex
IntPredicate.isPrime();
```

##### `static isZero()`

Returns a `IntPredicate` that tests the input Integer if it is zero.

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`

###### Example
```apex
IntPredicate.isZero();
```

##### `static hasDivisor(Integer divisor)`

Returns a `IntPredicate` that tests the input Integer has the `divisor`.

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `divisor` is null|

###### Example
```apex
IntPredicate.hasDivisor(10);
```

---
