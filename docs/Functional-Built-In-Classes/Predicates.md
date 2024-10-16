# virtual Predicates

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides common implementations of [Predicate](/docs/Functional-Abstract-Classes/Predicate.md)
and related utilities.


**See** [Predicate](/docs/Functional-Abstract-Classes/Predicate.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static Predicate isCompared(IFunction left, IFunction right, IComparer comparer, Integer result)`

`SUPPRESSWARNINGS`

Returns a `Predicate` that tests if the result of comparing the values returned by the applied `left` and `right` functions by the `comparer` is equal to the expected `result`.

###### Parameters

|Param|Description|
|---|---|
|`left`|the function applied to the input argument the result of which is passed to the `comparer` as the first argument|
|`right`|the function applied to the input argument the result of which is passed to the `comparer` as the second argument|
|`comparer`|the function that compares two arguments|
|`result`|the expected result of comparison (1, -1, or 0)|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or  `right`, or `comparer`, or `result` is null|

###### Example
```apex
Predicates.isCompared(
    func1,
    func2,
    Comparer.defaultOrder(),
    1
);
```


##### `public static Predicate isEqual(IFunction left, IFunction right)`

Returns a `Predicate` that tests the input object if the result returned by the `left` function is equal to the result returned by the `right` function, comparing object value equality not reference equality.

###### Parameters

|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|


**See** [Comparer.defaultOrder](Comparer.defaultOrder)

###### Example
```apex
Predicates.isEqual(func1, func2);
Predicates.isEqual(func1, Function.constant(100));
```


##### `public static Predicate isEqual(Object value)`

Returns a `Predicate` that tests the input object if it is equal to the `value`, comparing object value equality not reference equality.

###### Parameters

|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|


**See** [Comparer.defaultOrder](Comparer.defaultOrder)

###### Example
```apex
Predicates.isEqual(100).test(100); // true
Predicates.isEqual(100).test(50); // false
```


##### `public static Predicate isGreater(IFunction left, IFunction right)`

Returns a `Predicate` that tests the input object if the result returned by the `left` function is greater than the result returned by the `right` function. <p><strong>Note: </strong></p> <p>Unlike the standard `>` "greater than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value. User-defined types must implement the `Comparable` interface.</p>

###### Parameters

|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
Predicates.isGreater(func1, func2);
Predicates.isGreater(func1, Function.constant(100));
```


##### `public static Predicate isGreater(Object value)`

Returns a `Predicate` that tests the input object if it is greater than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `>` "greater than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value. User-defined types must implement the `Comparable` interface.</p>

###### Parameters

|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Example
```apex
Predicates.isGreater(100);
```


##### `public static Predicate isGreaterOrEqual(IFunction left, IFunction right)`

Returns a `Predicate` that tests the input object if the result returned by the `left` function is greater than or equal to the result returned by the `right` function. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` "greater than or equal to " operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value. User-defined types must implement the `Comparable` interface.</p>

###### Parameters

|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
Predicates.isGreaterOrEqual(func1, func2);
Predicates.isGreaterOrEqual(func1, Function.constant(100));
```


##### `public static Predicate isGreaterOrEqual(Object value)`

Returns a `Predicate` that tests the input object if it is greater than or equal to the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value. User-defined types must implement the `Comparable` interface.</p>

###### Parameters

|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Example
```apex
Predicates.isGreaterOrEqual(100);
```


##### `public static Predicate isLess(IFunction left, IFunction right)`

Returns a `Predicate` that tests the input object if the result returned by the `left` function is less than the result returned by the `right` function. <p><strong>Note: </strong></p> <p>Unlike the standard `<` "less than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value. User-defined types must implement the `Comparable` interface.</p>

###### Parameters

|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
Predicates.isLess(func1, func2);
Predicates.isLess(func1, Function.constant(100));
```


##### `public static Predicate isLess(Object value)`

Returns a `Predicate` that tests the input object if it is less than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<` "less than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value. User-defined types must implement the `Comparable` interface.</p>

###### Parameters

|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Example
```apex
Predicates.isLess(100);
```


##### `public static Predicate isLessOrEqual(IFunction left, IFunction right)`

Returns a `Predicate` that tests the input object if the result returned by the `left` function is less than or equal to the result returned by the `right` function. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value. User-defined types must implement the `Comparable` interface.</p>

###### Parameters

|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
Predicates.isLessOrEqual(func1, func2);
Predicates.isLessOrEqual(func1, Function.constant(100));
```


##### `public static Predicate isLessOrEqual(Object value)`

Returns a `Predicate` that tests the input object if it is less than or equal to the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value. User-defined types must implement the `Comparable` interface.</p>

###### Parameters

|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Example
```apex
Predicates.isLess(100);
```


##### `public static Predicate isNotEqual(IFunction left, IFunction right)`

Returns a `Predicate` that tests the input object if the result returned by the `left` function is not equal to the result returned by the `right` function, comparing object value equality not reference equality.

###### Parameters

|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
Predicates.isNotEqual(func1, func2);
Predicates.isNotEqual(func1, Function.constant(100));
```


##### `public static Predicate isNotEqual(Object value)`

Returns a `Predicate` that tests the input object if it is not equal to the `value`, comparing object value equality not reference equality.

###### Parameters

|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Example
```apex
Predicates.isEqual(100);
```


##### `public static Predicate isNull(IFunction left)`

Returns a `Predicate` that tests the result returned by the `function` if it is null.

###### Parameters

|Param|Description|
|---|---|
|`left`|the function whose application result is tested|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Example
```apex
Predicates.isNull(func1);
```


##### `public static Predicate isNull()`

Returns a `Predicate` that tests the input object if it is null.

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Example
```apex
Predicates.isNull().test(null); // true;
Predicates.isNull().test(1); // false;
```


##### `public static Predicate isNotNull(IFunction left)`

Returns a `Predicate` that tests the result returned by the `function` if it is not null.

###### Parameters

|Param|Description|
|---|---|
|`left`|the function whose application result is tested|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Example
```apex
Predicates.isNull().test(null); // true;
Predicates.isNull().test(1); // false;
```


##### `public static Predicate isNotNull()`

Returns a `Predicate` that tests the input object if it is not null.

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Example
```apex
Predicates.isNotNull().test(null); // false
Predicates.isNotNull().test(1); // true
```


##### `public static Predicate isLike(IFunction function, String likeString)`

Returns a `Predicate` that tests the input object if the string returned by the `function` matches the `likeString` pattern. Supports the `%` and the `_` wildcards and is case-insensitive.

###### Parameters

|Param|Description|
|---|---|
|`function`|the function whose application result string is tested|
|`likeString`|the pattern that is tested to match the string returned by the `function`|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `function` or `likeString` is null|


**See** [Comparer.defaultOrder](Comparer.defaultOrder)

###### Example
```apex
Predicates.isLike(Functions.get('Name'), '%a_e');
Predicates.isLike(Functions.get(Account.Name), '%a_e');
```


##### `public static Predicate isIn(IFunction function, Iterable<Object> container)`

Returns a `Predicate` that tests the input object if the result returned by the `function` is contained in the `container`.

###### Parameters

|Param|Description|
|---|---|
|`function`|the function whose application result is tested|
|`container`|the iterable that checks for the presence of an element|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `function` or `container` is null|


**See** [List.contains](List.contains)

###### Example
```apex
Predicates.isIn(getNameFunc, new List<Object>{ 'John', 'Jim' });
Predicates.isIn(getNameFunc, new Set<String>{ 'John', 'Jim' });
Predicates.isIn(getNameFunc, nameEnumerable);
```


##### `public static Predicate isIn(Iterable<Object> container)`

Returns a `Predicate` that tests the input object if it is contained in the `container`.

###### Parameters

|Param|Description|
|---|---|
|`container`|the iterable that checks for the presence of an element|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `container` is null|


**See** [List.contains](List.contains)

###### Example
```apex
Predicates.isIn(new List<Object>{ 'John', 'Jim' });
Predicates.isIn(new Set<String>{ 'John', 'Jim' });
Predicates.isIn(nameEnumerable);
```


##### `public static Predicate isNotIn(IFunction function, Iterable<Object> container)`

Returns a `Predicate` that tests the input object if the result returned by the `function` is not contained in the `container`.

###### Parameters

|Param|Description|
|---|---|
|`function`|the function whose application result is tested|
|`container`|the iterable that checks for the presence of an element|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `function` or `container` is null|


**See** [List.contains](List.contains)

###### Example
```apex
Predicates.isNotIn(getNameFunc, new List<Object>{ 'John', 'Jim' });
Predicates.isNotIn(getNameFunc, new Set<String>{ 'John', 'Jim' });
Predicates.isNotIn(getNameFunc, nameStream);
```


##### `public static Predicate isNotIn(Iterable<Object> container)`

Returns a `Predicate` that tests the input object if it is not contained in the `container`.

###### Parameters

|Param|Description|
|---|---|
|`container`|the iterable that checks for the presence of an element|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `container` is null|


**See** [List.contains](List.contains)

###### Example
```apex
Predicates.isNotIn(new List<Object>{ 'John', 'Jim' });
Predicates.isNotIn(new Set<String>{ 'John', 'Jim' });
Predicates.isNotIn(nameStream);
```


##### `public static Predicate includes(IFunction function, Iterable<String> container)`

Returns a `Predicate` that tests the input object if the string returned by the `function` fully matches any element of the `container`. Each element of the `container` should be represented as a subset and the subset elements should be separated by `;`.

###### Parameters

|Param|Description|
|---|---|
|`function`|the function whose application result is tested|
|`container`|the iterable against which the string is tested|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `function`, `container` is null, or `container` contains null element|


**See** [Set.containsAll](Set.containsAll)

###### Example
```apex
Person person = new Person(Name = 'AAA;BBB');
Predicates.includes(getNameFunc, new List<String>{ 'AAA' }).test(person); // false
Predicates.includes(getNameFunc, new Set<String>{ 'AAA;BBB' }).test(person); // true
Predicates.includes(getNameFunc, new Set<String>{ 'BBB;CCC' }).test(person); // false
Predicates.includes(getNameFunc, new Set<String>{ 'AAA;CCC', 'BBB' }).test(person); // true
Predicates.includes(getNameFunc, new List<String>{ 'AAA;BBB;CCC' }).test(person); // false
```


##### `public static Predicate excludes(IFunction function, Iterable<String> container)`

Returns a `Predicate` that tests the input object if the string returned by the `function` does not match every element of the `container`. Each element of the `container` should be represented as a subset and the subset elements should be separated by `;`.

###### Parameters

|Param|Description|
|---|---|
|`function`|the function whose application result is tested|
|`container`|the iterable against which the string is tested|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `function`, `container` is null, or `container` contains null element|


**See** [Set.containsAll](Set.containsAll)

###### Example
```apex
Person person = new Person(Name = 'AAA;BBB');
Predicates.excludes(getNameFunc, new List<String>{ 'AAA' }).test(person); // true
Predicates.excludes(getNameFunc, new Set<String>{ 'AAA;BBB' }).test(person); // false
Predicates.excludes(getNameFunc, new Set<String>{ 'BBB;CCC' }).test(person); // true
Predicates.excludes(getNameFunc, new Set<String>{ 'AAA;CCC', 'BBB' }).test(person); // false
Predicates.excludes(getNameFunc, new List<String>{ 'AAA;BBB;CCC' }).test(person); // true
```


---
