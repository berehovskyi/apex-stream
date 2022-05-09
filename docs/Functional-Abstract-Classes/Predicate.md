# Predicate

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [IPredicate](/docs/Functional-Interfaces/IPredicate.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes


**See** IObjectIterable.filter


**See** IObjectIterable.take


**See** IObjectIterable.drop


**See** IObjectIterable.find


**See** IObjectIterable.some


**See** IObjectIterable.every


**See** IObjectIterable.none

## Methods
### Function
##### `test(Object o)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `orElse(IPredicate other)`

Returns a composed `Predicate` that applies short-circuiting logical OR} operator to `this` `IPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `Predicate`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
somePredicate1.orElse(somePredicate2);
```

##### `andAlso(IPredicate other)`

Returns a composed `Predicate` that applies short-circuiting logical AND} operator to `this` `IPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `Predicate`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
somePredicate1.andAlso(somePredicate2);
```

##### `negate()`

Returns a `Predicate` that applies logical `NOT` operator to `this` `IPredicate`.

###### Return

**Type**

Predicate

**Description**

the negated `Predicate`

###### Example
```apex
somePredicate1.negate();
```

---
### Static Methods
##### `static some(List<IPredicate> predicates)`

Returns a composed `Predicate` that applies sequentially short-circuiting logical `OR` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`IPredicates`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
Predicate.some(somePredicates);
```

##### `static some(IPredicate predicate1, IPredicate predicate2)`

Returns a composed `Predicate` that applies short-circuiting logical OR} operator to `predicate1` `IPredicate` and `predicate2` in that order.

###### Parameters
|Param|Description|
|---|---|
|`predicate1`|the first `IPredicate`|
|`predicate2`|the second `IPredicate`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate1` or `predicate2` is null|

###### Example
```apex
Predicate.some(somePredicate1, somePredicate2);
```

##### `static every(List<IPredicate> predicates)`

Returns a composed `Predicate` that applies sequentially short-circuiting logical `AND` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`IPredicates`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
Predicate.every(somePredicates);
```

##### `static every(IPredicate predicate1, IPredicate predicate2)`

Returns a composed `Predicate` that applies short-circuiting logical AND} operator to `predicate1` `IPredicate` and `predicate2` in that order.

###### Parameters
|Param|Description|
|---|---|
|`predicate1`|the first `IPredicate`|
|`predicate2`|the second `IPredicate`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate1` or `predicate2` is null|

###### Example
```apex
Predicate.every(somePredicate1, somePredicate2);
```

##### `static negate(IPredicate predicate)`

Returns a `Predicate` that applies logical `NOT` operator to `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the `IPredicate`|

###### Return

**Type**

Predicate

**Description**

the negated `Predicate`

###### Example
```apex
Predicate.negate(somePredicate);
```

##### `static always(Boolean value)`

Returns a `Predicate` that always evaluates to the Boolean `value` (`true` or `false`).

###### Parameters
|Param|Description|
|---|---|
|`value`|the evaluated value|

###### Return

**Type**

Predicate

**Description**

predicate the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
Predicate.always(true);
```

##### `static compose(IFunction mapper, IPredicate predicate)`

Returns a composed `Predicate` of the `IFunction` and the `IPredicate`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

###### Example
```apex
Predicate.compose(someFunction, somePredicate);
```

##### `static compose(IToIntFunction mapper, IIntPredicate predicate)`

Returns a composed `Predicate` of the `IToIntFunction` and the `IIntPredicate`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

###### Example
```apex
Predicate.compose(someToIntFunction, someIntPredicate);
```

##### `static compose(IToLongFunction mapper, ILongPredicate predicate)`

Returns a composed `Predicate` of the `IToLongFunction` and the `ILongPredicate`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

###### Example
```apex
Predicate.compose(someToLongFunction, someLongPredicate);
```

##### `static compose(IToDoubleFunction mapper, IDoublePredicate predicate)`

Returns a composed `Predicate` of the `IToDoubleFunction` and the `IDoublePredicate`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

###### Example
```apex
Predicate.compose(someToDoubleFunction, someDoublePredicate);
```

##### `static compose(IToSObjectFunction mapper, ISObjectPredicate predicate)`

Returns a composed `Predicate` of the `IToSObjectFunction` and the `ISObjectPredicate`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

###### Example
```apex
Predicate.compose(someToSObjectFunction, someSObjectPredicate);
```

##### `static upcast(IIntPredicate predicate)`

Returns a composed `Predicate` of the `IIntPredicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Predicate.upcast(someIntPredicate);
```

##### `static upcast(ILongPredicate predicate)`

Returns a composed `Predicate` of the `ILongPredicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Predicate.upcast(someLongPredicate);
```

##### `static upcast(IDoublePredicate predicate)`

Returns a composed `Predicate` of the `IDoublePredicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Predicate.upcast(someDoublePredicate);
```

##### `static upcast(ISObjectPredicate predicate)`

Returns a composed `Predicate` of the `ISObjectPredicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Predicate.upcast(someSObjectPredicate);
```

---
### Built-Ins
##### `static isCompared(IFunction left, IFunction right, IComparator comparator, Integer result)`

Returns a `Predicate` that tests if the result of comparing the values returned by the applied `left` and `right` functions by the `comparator` is equal to the expected `result`.

###### Parameters
|Param|Description|
|---|---|
|`left`|the function applied to the input argument the result of which is passed to the `comparator` as the first argument|
|`right`|the function applied to the input argument the result of which is passed to the `comparator` as the second argument|
|`comparator`|the function that compares two arguments|
|`result`|the expected result of comparison (1, -1, or 0)|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right`, or `comparator`, or `result` is null|

###### Example
```apex
Predicate.isCompared(
    func1,
    func2,
    Comparator.defaultOrder(),
    1
);
```

##### `static isGreater(IFunction left, IFunction right)`

Returns a `Predicate` that tests the input object if the result returned by the `left` function is greater than the result returned by the `right` function. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value. User-defined types must implement the `Comparable` interface.</p>

###### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
Predicate.isGreater(func1, func2);
Predicate.isGreater(func1, Function.constant(100));
```

##### `static isGreater(Object value)`

Returns a `Predicate` that tests the input object if it is greater than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value. User-defined types must implement the `Comparable` interface.</p>

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
Predicate.isGreater(100);
```

##### `static isGreaterOrEqual(IFunction left, IFunction right)`

Returns a `Predicate` that tests the input object if the result returned by the `left` function is greater than or equal to the result returned by the `right` function. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to &quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value. User-defined types must implement the `Comparable` interface.</p>

###### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
Predicate.isGreaterOrEqual(func1, func2);
Predicate.isGreaterOrEqual(func1, Function.constant(100));
```

##### `static isGreaterOrEqual(Object value)`

Returns a `Predicate` that tests the input object if it is greater than or equal to the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value. User-defined types must implement the `Comparable` interface.</p>

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
Predicate.isGreaterOrEqual(100);
```

##### `static isLess(IFunction left, IFunction right)`

Returns a `Predicate` that tests the input object if the result returned by the `left` function is less than the result returned by the `right` function. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value. User-defined types must implement the `Comparable` interface.</p>

###### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
Predicate.isLess(func1, func2);
Predicate.isLess(func1, Function.constant(100));
```

##### `static isLess(Object value)`

Returns a `Predicate` that tests the input object if it is less than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value. User-defined types must implement the `Comparable` interface.</p>

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
Predicate.isLess(100);
```

##### `static isLessOrEqual(IFunction left, IFunction right)`

Returns a `Predicate` that tests the input object if the result returned by the `left` function is less than or equal to the result returned by the `right` function. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value. User-defined types must implement the `Comparable` interface.</p>

###### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
Predicate.isLessOrEqual(func1, func2);
Predicate.isLessOrEqual(func1, Function.constant(100));
```

##### `static isLessOrEqual(Object value)`

Returns a `Predicate` that tests the input object if it is less than or equal to the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value. User-defined types must implement the `Comparable` interface.</p>

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
Predicate.isLess(100);
```

##### `static isEqual(IFunction left, IFunction right)`

Returns a `Predicate` that tests the input object if the result returned by the `left` function is equal to the result returned by the `right` function, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
Predicate.isEqual(func1, func2);
Predicate.isEqual(func1, Function.constant(100));
```

##### `static isEqual(Object value)`

Returns a `Predicate` that tests the input object if it is equal to the `value`, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
Predicate.isEqual(100);
```

##### `static isNotEqual(IFunction left, IFunction right)`

Returns a `Predicate` that tests the input object if the result returned by the `left` function is not equal to the result returned by the `right` function, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
Predicate.isNotEqual(func1, func2);
Predicate.isNotEqual(func1, Function.constant(100));
```

##### `static isNotEqual(Object value)`

Returns a `Predicate` that tests the input object if it is not equal to the `value`, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
Predicate.isEqual(100);
```

##### `static isIn(IFunction function, List<Object> container)`

Returns a `Predicate` that tests the input object if the result returned by the `function` is contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`function`|the function whose application result is tested|
|`container`|the list that checks for the presence of an element|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `function`, or the `container` is null|


**See** List.contains

###### Example
```apex
Predicate.isIn(func, container);
```

##### `static isIn(List<Object> container)`

Returns a `Predicate` that tests the input object if it is contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`container`|the list that checks for the presence of an element|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `container` is null|


**See** List.contains

###### Example
```apex
Predicate.isIn(container);
```

##### `static isNotIn(IFunction function, List<Object> container)`

Returns a `Predicate` that tests the input object if the result returned by the `function` is not contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`function`|the function whose application result is tested|
|`container`|the list that checks for the presence of an element|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `function`, or the `container` is null|


**See** List.contains

###### Example
```apex
Predicate.isNotIn(func, container);
```

##### `static isNotIn(List<Object> container)`

Returns a `Predicate` that tests the input object if it is not contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`container`|the list that checks for the presence of an element|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `container` is null|


**See** List.contains

###### Example
```apex
Predicate.isNotIn(container);
```

##### `static isNull()`

Returns a `Predicate` that tests the input object if it is null.

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Example
```apex
Predicate.isNull();
```

##### `static isNotNull()`

Returns a `Predicate` that tests the input object if it is not null.

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Example
```apex
Predicate.isNotNull();
```

##### `static isInstanceOfBool()`

Returns a `Predicate` that tests the input object if it is of Boolean} type.

###### Return

**Type**

Predicate

**Description**

the `Predicate`

##### `static isInstanceOfId()`

Returns a `Predicate` that tests the input object if it is of Id} type.

###### Return

**Type**

Predicate

**Description**

the `Predicate`

##### `static isInstanceOfString()`

Returns a `Predicate` that tests the input object if it is of String} type.

###### Return

**Type**

Predicate

**Description**

the `Predicate`

##### `static isInstanceOfBlob()`

Returns a `Predicate` that tests the input object if it is of Blob} type.

###### Return

**Type**

Predicate

**Description**

the `Predicate`

##### `static isInstanceOfDate()`

Returns a `Predicate` that tests the input object if it is of Date} type.

###### Return

**Type**

Predicate

**Description**

the `Predicate`

##### `static isInstanceOfDatetime()`

Returns a `Predicate` that tests the input object if it is of Datetime} type.

###### Return

**Type**

Predicate

**Description**

the `Predicate`

##### `static isInstanceOfTime()`

Returns a `Predicate` that tests the input object if it is of Time} type.

###### Return

**Type**

Predicate

**Description**

the `Predicate`

##### `static isInstanceOfInt()`

Returns a `Predicate` that tests the input object if it is of Integer} type.

###### Return

**Type**

Predicate

**Description**

the `Predicate`

##### `static isInstanceOfLong()`

Returns a `Predicate` that tests the input object if it is of Long} type.

###### Return

**Type**

Predicate

**Description**

the `Predicate`

##### `static isInstanceOfDouble()`

Returns a `Predicate` that tests the input object if it is of Double} type.

###### Return

**Type**

Predicate

**Description**

the `Predicate`

##### `static isInstanceOfSObject()`

Returns a `Predicate` that tests the input object if it is of SObject} type.

###### Return

**Type**

Predicate

**Description**

the `Predicate`

##### `static isInstanceOfComparable()`

Returns a `Predicate` that tests the input object if it is of Comparable} type.

###### Return

**Type**

Predicate

**Description**

the `Predicate`

---
