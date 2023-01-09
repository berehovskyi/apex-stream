# LongPredicates

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides common implementations of [LongPredicate](/docs/Functional-Abstract-Classes/LongPredicate.md) and related utilities.


**See** [LongPredicate](/docs/Functional-Abstract-Classes/LongPredicate.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
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


**See** Comparators.compareNullSafeLongs

###### Example
```apex
LongPredicates.isGreater(100);
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


**See** Comparators.compareNullSafeLongs

###### Example
```apex
LongPredicates.isGreaterOrEqual(100);
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


**See** Comparators.compareNullSafeLongs

###### Example
```apex
LongPredicates.isLess(100);
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


**See** Comparators.compareNullSafeLongs

###### Example
```apex
LongPredicates.isLessOrEqual(100);
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


**See** Comparators.compareNullSafeLongs

###### Example
```apex
LongPredicates.isEqual(100);
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


**See** Comparators.compareNullSafeLongs

###### Example
```apex
LongPredicates.isNotEqual(100);
```

##### `static isIn(Iterable<Long> container)`

Returns a `LongPredicate` that tests the input Long if it is contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `container` is null|


**See** List.contains

###### Example
```apex
LongPredicates.isIn(new List<Long>{ 1, 5, -7 });
LongPredicates.isIn((Iterable<Long>) new Set<Long>{ 1, 5, -7 });
LongPredicates.isIn(longStream);
```

##### `static isNotIn(Iterable<Long> container)`

Returns a `LongPredicate` that tests the input Long if it is not contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `container` is null|


**See** List.contains

###### Example
```apex
LongPredicates.isNotIn(new List<Long>{ 1, 5, -7 });
LongPredicates.isNotIn((Iterable<Long>) new Set<Long>{ 1, 5, -7 });
LongPredicates.isNotIn(longStream);
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
LongPredicates.isNull();
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
LongPredicates.isNotNull();
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
LongPredicates.isEven();
```

##### `static isFactorOf(Long l)`

Returns a `LongPredicate` that tests the input Long if it is a factor of `l`.

###### Parameters
|Param|Description|
|---|---|
|`l`|number|

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|

###### Example
```apex
LongPredicates.isFactorOf(5);
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
LongPredicates.isEven();
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
LongPredicates.isPrime();
```

##### `static hasDivisor(Long divisor)`

Returns a `LongPredicate` that tests the input Long has the `divisor`.

###### Parameters
|Param|Description|
|---|---|
|`divisor`|divisor|

###### Return

**Type**

LongPredicate

**Description**

the `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `divisor` is null|

###### Example
```apex
LongPredicate.hasDivisor(10);
```

---
