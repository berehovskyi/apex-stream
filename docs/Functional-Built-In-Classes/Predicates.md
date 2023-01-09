# Predicates

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides common implementations of [Predicate](/docs/Functional-Abstract-Classes/Predicate.md) and related utilities.


**See** [Predicate](/docs/Functional-Abstract-Classes/Predicate.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
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
|`NullPointerException`|if `left` or  `right`, or `comparator`, or `result` is null|

###### Example
```apex
Predicates.isCompared(
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
|`NullPointerException`|if `left` or `right` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
Predicates.isGreater(func1, func2);
Predicates.isGreater(func1, Function.constant(100));
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


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
Predicates.isGreater(100);
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
|`NullPointerException`|if `left` or `right` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
Predicates.isGreaterOrEqual(func1, func2);
Predicates.isGreaterOrEqual(func1, Function.constant(100));
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


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
Predicates.isGreaterOrEqual(100);
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
|`NullPointerException`|if `left` or `right` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
Predicates.isLess(func1, func2);
Predicates.isLess(func1, Function.constant(100));
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


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
Predicates.isLess(100);
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
|`NullPointerException`|if `left` or `right` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
Predicates.isLessOrEqual(func1, func2);
Predicates.isLessOrEqual(func1, Function.constant(100));
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


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
Predicates.isLess(100);
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
|`NullPointerException`|if `left` or `right` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
Predicates.isEqual(func1, func2);
Predicates.isEqual(func1, Function.constant(100));
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


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
Predicates.isEqual(100);
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
|`NullPointerException`|if `left` or `right` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
Predicates.isNotEqual(func1, func2);
Predicates.isNotEqual(func1, Function.constant(100));
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


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
Predicates.isEqual(100);
```

##### `static isIn(IFunction function, Iterable<Object> container)`

Returns a `Predicate` that tests the input object if the result returned by the `function` is contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`function`|the function whose application result is tested|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `function` or `container` is null|


**See** List.contains

###### Example
```apex
Predicates.isIn(getNameFunc, new List<Object>{ 'John', 'Jim' });
Predicates.isIn(getNameFunc, (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
Predicates.isIn(getNameFunc, nameStream);
```

##### `static isIn(Iterable<Object> container)`

Returns a `Predicate` that tests the input object if it is contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `container` is null|


**See** List.contains

###### Example
```apex
Predicates.isIn(new List<Object>{ 'John', 'Jim' });
Predicates.isIn((Iterable<Object>) new Set<String>{ 'John', 'Jim' });
Predicates.isIn(nameStream);
```

##### `static isNotIn(IFunction function, Iterable<Object> container)`

Returns a `Predicate` that tests the input object if the result returned by the `function` is not contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`function`|the function whose application result is tested|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `function` or `container` is null|


**See** List.contains

###### Example
```apex
Predicates.isNotIn(getNameFunc, new List<Object>{ 'John', 'Jim' });
Predicates.isNotIn(getNameFunc, (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
Predicates.isNotIn(getNameFunc, nameStream);
```

##### `static isNotIn(Iterable<Object> container)`

Returns a `Predicate` that tests the input object if it is not contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `container` is null|


**See** List.contains

###### Example
```apex
Predicates.isNotIn(new List<Object>{ 'John', 'Jim' });
Predicates.isNotIn((Iterable<Object>) new Set<String>{ 'John', 'Jim' });
Predicates.isNotIn(nameStream);
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
Predicates.isNull();
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
Predicates.isNotNull();
```

---
