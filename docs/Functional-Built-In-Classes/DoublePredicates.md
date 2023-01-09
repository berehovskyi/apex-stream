# DoublePredicates

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides common implementations of [DoublePredicate](/docs/Functional-Abstract-Classes/DoublePredicate.md) and related utilities.


**See** [DoublePredicate](/docs/Functional-Abstract-Classes/DoublePredicate.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `static isGreater(Double value)`

Returns a `DoublePredicate` that tests the input Double if it is greater than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`


**See** Comparators.compareNullSafeDoubles

###### Example
```apex
DoublePredicates.isGreater(100);
```

##### `static isGreaterOrEqual(Double value)`

Returns a `DoublePredicate` that tests the input Double if it is greater than or equal to the `value`. <p><strong>Note: </strong></p> <<p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`


**See** Comparators.compareNullSafeDoubles

###### Example
```apex
DoublePredicates.isGreaterOrEqual(100);
```

##### `static isLess(Double value)`

Returns a `DoublePredicate` that tests the input Double if it is less than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`


**See** Comparators.compareNullSafeDoubles

###### Example
```apex
DoublePredicates.isLess(100);
```

##### `static isLessOrEqual(Double value)`

Returns a `DoublePredicate` that tests the input Double if it is less than or equal to the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`


**See** Comparators.compareNullSafeDoubles

###### Example
```apex
DoublePredicates.isLessOrEqual(100);
```

##### `static isEqual(Double value)`

Returns a `DoublePredicate` that tests the input Double if it is equal to the `value`.

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`


**See** Comparators.compareNullSafeDoubles

###### Example
```apex
DoublePredicates.isEqual(100);
```

##### `static isNotEqual(Double value)`

Returns a `DoublePredicate` that tests the input Double if it is not equal to the `value`.

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`


**See** Comparators.compareNullSafeDoubles

###### Example
```apex
DoublePredicates.isNotEqual(100);
```

##### `static isIn(Iterable<Double> container)`

Returns a `DoublePredicate` that tests the input Double if it is contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `container` is null|


**See** List.contains

###### Example
```apex
DoublePredicates.isIn(new List<Double>{ 1.5, 5.1, Math.PI });
DoublePredicates.isIn((Iterable<Double>) new Set<Double>{ 1.5, 5.1, Math.PI });
DoublePredicates.isIn(doubleStream);
```

##### `static isNotIn(Iterable<Double> container)`

Returns a `DoublePredicate` that tests the input Double if it is not contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `container` is null|


**See** List.contains

###### Example
```apex
DoublePredicates.isNotIn(new List<Double>{ 1.5, 5.1, Math.PI });
DoublePredicates.isNotIn((Iterable<Double>) new Set<Double>{ 1.5, 5.1, Math.PI });
DoublePredicates.isNotIn(doubleStream);
```

##### `static isNull()`

Returns a `DoublePredicate` that tests the input Double if it is null.

###### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`

###### Example
```apex
DoublePredicates.isNull();
```

##### `static isNotNull()`

Returns a `DoublePredicate` that tests the input Double if it is not null.

###### Return

**Type**

DoublePredicate

**Description**

the `DoublePredicate`

###### Example
```apex
DoublePredicates.isNotNull();
```

---
