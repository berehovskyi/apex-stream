# virtual BiPredicates

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides common implementations of [BiPredicate](/docs/Functional-Abstract-Classes/BiPredicate.md)
and related utilities.


**See** [BiPredicate](/docs/Functional-Abstract-Classes/BiPredicate.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static BiPredicate isCompared(IFunction left, IFunction right, IComparer comparer, Integer result)`

`SUPPRESSWARNINGS`

Returns a `BiPredicate` that tests if the result of comparing the values returned by the applied `left` and `right` functions applied to the first and the second input arguments respectively by the `comparer` is equal to the expected `result`.

###### Parameters

|Param|Description|
|---|---|
|`left`|the function applied to the first input argument the result of which is passed to the `comparer` as the first argument|
|`right`|the function applied to the second input argument the result of which is passed to the `comparer` as the second argument|
|`comparer`|the function that compares two arguments|
|`result`|the expected result of comparison (1, -1, or 0)|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right`, or `comparer`, or `result` is null|

###### Example
```apex
BiPredicates.isCompared(func1, func2, Comparer.defaultOrder(), 1);
```


##### `public static BiPredicate areEqual()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is equal to the second input argument.

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Example
```apex
BiPredicates.areEqual();
```


##### `public static BiPredicate areEqual(IFunction left, IFunction right)`

Returns a `BiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is equal to the result returned by the `right` function applied to the second input argument, comparing object value equality not reference equality.

###### Parameters

|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
BiPredicates.areEqual(func1, func2);
BiPredicates.areEqual(func1, Function.constant(100));
```


##### `public static BiPredicate areNotEqual()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is not equal to the second input argument.

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Example
```apex
BiPredicates.areNotEqual();
```


##### `public static BiPredicate areNotEqual(IFunction left, IFunction right)`

Returns a `BiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is not equal to the result returned by the `right` function applied to the second input argument, comparing object value equality not reference equality.

###### Parameters

|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
BiPredicates.areNotEqual(func1, func2);
BiPredicates.areNotEqual(func1, Function.constant(100));
```


##### `public static BiPredicate isGreater()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is greater than the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>` "greater than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Example
```apex
BiPredicates.isGreater();
```


##### `public static BiPredicate isGreater(IFunction left, IFunction right)`

Returns a `BiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is greater than the result returned by the `right` function applied to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>` "greater than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
BiPredicates.isGreater(func1, func2);
BiPredicates.isGreater(func1, Function.constant(100));
```


##### `public static BiPredicate isGreaterOrEqual()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is greater than or equal to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Example
```apex
BiPredicates.isGreaterOrEqual();
```


##### `public static BiPredicate isGreaterOrEqual(IFunction left, IFunction right)`

Returns a `BiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is greater than or equal to the result returned by the `right` function applied to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
BiPredicates.isGreaterOrEqual(func1, func2);
```


##### `public static BiPredicate isLess()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is less than the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `<` "less than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Example
```apex
BiPredicates.isLess();
```


##### `public static BiPredicate isLess(IFunction left, IFunction right)`

Returns a `BiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is less than the result returned by the `right` function applied to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `<` "less than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
BiPredicates.isLess(func1, func2);
```


##### `public static BiPredicate isLessOrEqual()`

Returns a `BiPredicate` that tests the input sobjects if the value of the first input argument is less than or equal to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` "less than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Example
```apex
BiPredicates.isLessOrEqual();
```


##### `public static BiPredicate isLessOrEqual(IFunction left, IFunction right)`

Returns a `BiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is less than or equal to the result returned by the `right` function applied to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
BiPredicates.isLessOrEqual(func1, func2);
```


---
