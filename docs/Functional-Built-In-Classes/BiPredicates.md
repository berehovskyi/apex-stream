# BiPredicates

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides common implementations of [BiPredicate](/docs/Functional-Abstract-Classes/BiPredicate.md) and related utilities.


**See** [BiPredicate](/docs/Functional-Abstract-Classes/BiPredicate.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
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
BiPredicates.isCompared(func1, func2, Comparator.defaultOrder(), 1);
```

##### `static areEqual()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is equal to the second input argument.

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
BiPredicates.areEqual();
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


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
BiPredicates.areEqual(func1, func2);
BiPredicates.areEqual(func1, Function.constant(100));
```

##### `static areNotEqual()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is not equal to the second input argument.

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
BiPredicates.areNotEqual();
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


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
BiPredicates.areNotEqual(func1, func2);
BiPredicates.areNotEqual(func1, Function.constant(100));
```

##### `static isGreater()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is greater than the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
BiPredicates.isGreater();
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


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
BiPredicates.isGreater(func1, func2);
BiPredicates.isGreater(func1, Function.constant(100));
```

##### `static isGreaterOrEqual()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is greater than or equal to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
BiPredicates.isGreaterOrEqual();
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


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
BiPredicates.isGreaterOrEqual(func1, func2);
```

##### `static isLess()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is less than the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
BiPredicates.isLess();
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


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
BiPredicates.isLess(func1, func2);
```

##### `static isLessOrEqual()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is less than or equal to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Return

**Type**

BiPredicate

**Description**

the `BiPredicate`


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
BiPredicates.isLessOrEqual();
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


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
BiPredicates.isLessOrEqual(func1, func2);
```

---
