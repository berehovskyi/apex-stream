# BiPredicate

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IBiPredicate](/docs/Functional-Interfaces/IBiPredicate.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `test(Object o1, Object o2)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `orElse(IBiPredicate other)`

Returns a composed `BiPredicate` that applies short-circuiting logical `OR` operator to `this` `IBiPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `IBiPredicate`|

###### Return

**Type**

BiPredicate

**Description**

the composed `BiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someBiPredicate1.orElse(someBiPredicate2);
```

##### `andAlso(IBiPredicate other)`

Returns a composed `BiPredicate` that applies short-circuiting logical `AND` operator to `this` `IPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `IBiPredicate`|

###### Return

**Type**

BiPredicate

**Description**

the composed `BiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someBiPredicate1.andAlso(someBiPredicate2);
```

##### `negate()`

Returns a `BiPredicate` that applies logical `NOT` operator to `this` `IBiPredicate`.

###### Return

**Type**

BiPredicate

**Description**

the negated `BiPredicate`

###### Example
```apex
someBiPredicate.negate();
```

---
### Static Methods
##### `static some(List<IBiPredicate> predicates)`

Returns a composed `BiPredicate` that applies sequentially short-circuiting logical `OR` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`IBiPredicate`|

###### Return

**Type**

BiPredicate

**Description**

the composed `BiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
BiPredicate.some(someBiPredicates);
```

##### `static some(IBiPredicate predicate1, IBiPredicate predicate2)`

Returns a composed `BiPredicate` that applies short-circuiting logical `OR` operator to `predicate1` `IBiPredicate` and `predicate2` in that order.

###### Parameters
|Param|Description|
|---|---|
|`predicate1`|the first `IBiPredicate`|
|`predicate2`|the second `IBiPredicate`|

###### Return

**Type**

BiPredicate

**Description**

the composed `BiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate1` or `predicate2` is null|

###### Example
```apex
BiPredicate.some(someBiPredicate1, someBiPredicate2);
```

##### `static every(List<IBiPredicate> predicates)`

Returns a composed `BiPredicate` that applies sequentially short-circuiting logical `AND` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`IBiPredicate`|

###### Return

**Type**

BiPredicate

**Description**

the composed `BiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
BiPredicate.every(someBiPredicates);
```

##### `static every(IBiPredicate predicate1, IBiPredicate predicate2)`

Returns a composed `BiPredicate` that applies short-circuiting logical `AND` operator to `predicate1` `IBiPredicate` and `predicate2` in that order.

###### Parameters
|Param|Description|
|---|---|
|`predicate1`|the first `IBiPredicate`|
|`predicate2`|the second `IBiPredicate`|

###### Return

**Type**

BiPredicate

**Description**

the composed `BiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate1` or `predicate2` is null|

###### Example
```apex
Predicate.every(somePredicate1, somePredicate2);
```

##### `static negate(IBiPredicate predicate)`

Returns a `BiPredicate` that applies logical `NOT` operator to `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the `IBiPredicate`|

###### Return

**Type**

BiPredicate

**Description**

the negated `BiPredicate`

###### Example
```apex
BiPredicate.negate(someBiPredicate);
```

##### `static somePredicate(IPredicate left, IPredicate right)`

Returns a composed `BiPredicate` that applies short-circuiting logical `OR` operator to `predicate1` `IPredicate` and `predicate2` in that order applied to the first and the second input arguments respectively.

###### Parameters
|Param|Description|
|---|---|
|`left`|the predicate applied to the first input argument|
|`right`|the predicate applied to the second input argument|

###### Return

**Type**

BiPredicate

**Description**

the composed `BiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
BiPredicate.somePredicate(somePredicate1, somePredicate2);
```

##### `static everyPredicate(IPredicate left, IPredicate right)`

Returns a composed `BiPredicate` that applies short-circuiting logical `AND` operator to `predicate1` `IPredicate` and `predicate2` in that order applied to the first and the second input arguments respectively.

###### Parameters
|Param|Description|
|---|---|
|`left`|the predicate applied to the first input argument|
|`right`|the predicate applied to the second input argument|

###### Return

**Type**

BiPredicate

**Description**

the composed `BiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
BiPredicate.everyPredicate(somePredicate1, somePredicate2);
```

##### `static always(Boolean value)`

Returns a `BiPredicate` that always evaluates to the Boolean `value` (`true` or `false`).

###### Parameters
|Param|Description|
|---|---|
|`value`|the evaluated value|

###### Return

**Type**

BiPredicate

**Description**

predicate the `BiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
BiPredicate.always(true);
```

---
### Built-Ins
##### `static isCompared(IFunction left, IFunction right, IComparator comparator, Integer result)`

Returns a `BiPredicate` that tests if the result of comparing the values returned by the applied `left` and `right` functions applied to the first and the second input arguments respectively by the `comparator` is equal to the expected `result`.

###### Parameters
|Param|Description|
|---|---|
|`left`|the function applied to the first input argument the result of which is passed to the `comparator` as the first argument|
|`right`|the function applied to the second input argument the result of which is passed to the `comparator` as the second argument|
|`comparator`|the function that compares two arguments|
|`result`|the expected result of comparison (1, -1, or 0)|

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right`, or `comparator`, or `result` is null|

###### Example
```apex
BiPredicate.isCompared(func1, func2, Comparator.defaultOrder(), 1);
```

##### `static isGreater(IFunction left, IFunction right)`

Returns a `BiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is greater than the result returned by the `right` function applied to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
BiPredicate.isGreater(func1, func2);
BiPredicate.isGreater(func1, Function.constant(100));
```

##### `static isGreater()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is greater than the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
BiPredicate.isGreater();
```

##### `static isGreaterOrEqual(IFunction left, IFunction right)`

Returns a `BiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is greater than or equal to the result returned by the `right` function applied to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
BiPredicate.isGreaterOrEqual(func1, func2);
```

##### `static isGreaterOrEqual()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is greater than or equal to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
BiPredicate.isGreaterOrEqual();
```

##### `static isLess(IFunction left, IFunction right)`

Returns a `BiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is less than the result returned by the `right` function applied to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
BiPredicate.isLess(func1, func2);
```

##### `static isLess()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is less than the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
BiPredicate.isLess();
```

##### `static isLessOrEqual(IFunction left, IFunction right)`

Returns a `BiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is less than or equal to the result returned by the `right` function applied to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
BiPredicate.isLessOrEqual(func1, func2);
```

##### `static isLessOrEqual()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is less than or equal to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
BiPredicate.isLessOrEqual();
```

##### `static areEqual(IFunction left, IFunction right)`

Returns a `BiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is equal to the result returned by the `right` function applied to the second input argument, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
BiPredicate.areEqual(func1, func2);
BiPredicate.areEqual(func1, Function.constant(100));
```

##### `static areEqual()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is equal to the second input argument.

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
BiPredicate.areEqual();
```

##### `static areNotEqual(IFunction left, IFunction right)`

Returns a `BiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is not equal to the result returned by the `right` function applied to the second input argument, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
BiPredicate.areNotEqual(func1, func2);
BiPredicate.areNotEqual(func1, Function.constant(100));
```

##### `static areNotEqual()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is not equal to the second input argument.

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
BiPredicate.areNotEqual();
```

---
