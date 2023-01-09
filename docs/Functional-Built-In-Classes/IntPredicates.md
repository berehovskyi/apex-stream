# IntPredicates

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides common implementations of [IntPredicate](/docs/Functional-Abstract-Classes/IntPredicate.md) and related utilities.


**See** [IntPredicate](/docs/Functional-Abstract-Classes/IntPredicate.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
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


**See** Comparators.compareNullSafeInts

###### Example
```apex
IntPredicates.isGreater(100);
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


**See** Comparators.compareNullSafeInts

###### Example
```apex
IntPredicates.isGreaterOrEqual(100);
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


**See** Comparators.compareNullSafeInts

###### Example
```apex
IntPredicates.isLess(100);
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


**See** Comparators.compareNullSafeInts

###### Example
```apex
IntPredicates.isLessOrEqual(100);
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


**See** Comparators.compareNullSafeInts

###### Example
```apex
IntPredicates.isEqual(100);
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


**See** Comparators.compareNullSafeInts

###### Example
```apex
IntPredicates.isNotEqual(100);
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
|`NullPointerException`|if `container` is null|


**See** List.contains

###### Example
```apex
IntPredicates.isIn(new List<Integer>{ 1, 5, -7 });
IntPredicates.isIn((Iterable<Integer>) new Set<Integer>{ 1, 5, -7 });
IntPredicates.isIn(intStream);
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
|`NullPointerException`|if `container` is null|


**See** List.contains

###### Example
```apex
IntPredicates.isNotIn(new List<Integer>{ 1, 5, -7 });
IntPredicates.isNotIn((Iterable<Integer>) new Set<Integer>{ 1, 5, -7 });
IntPredicates.isNotIn(intStream);
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
IntPredicates.isNull();
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
IntPredicates.isNotNull();
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
IntPredicates.isEven();
```

##### `static isFactorOf(Integer i)`

Returns a `IntPredicate` that tests the input Integer if it is a factor of `i`.

###### Parameters
|Param|Description|
|---|---|
|`i`|the tested value|

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `i` is null|

###### Example
```apex
IntPredicates.isFactorOf(5);
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
IntPredicates.isEven();
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
IntPredicates.isPrime();
```

##### `static hasDivisor(Integer divisor)`

Returns a `IntPredicate` that tests the input Integer has the `divisor`.

###### Parameters
|Param|Description|
|---|---|
|`divisor`|the tested value|

###### Return

**Type**

IntPredicate

**Description**

the `IntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `divisor` is null|

###### Example
```apex
IntPredicate.hasDivisor(10);
```

---
