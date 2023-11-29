# virtual BaseSObjectPredicates

`APIVERSION: 58`

`STATUS: ACTIVE`

Provides base implementations of [Predicate](/docs/Functional-Abstract-Classes/Predicate.md)
and related utilities that are used by [ISObjectEnumerable](/docs/Enumerables/ISObjectEnumerable.md).


**Inheritance**

[BasePredicates](/docs/Functional-Built-In-Classes/BasePredicates.md)
 > 
BaseSObjectPredicates


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static Predicate isEqual(String fieldName, IFunction function)`

Returns a `Predicate` that tests the input SObject if the value of the `fieldName` is equal to the result returned by the `function`, comparing object value equality not reference equality. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `function` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [Comparer.defaultOrder](Comparer.defaultOrder)

###### Example
```apex
BaseSObjectFunctions.isEqual(
    'NumberOfEmployees',
     Functions.get('OtherIntField__c')
);
BaseSObjectFunctions.isEqual(
    'Parent?.NumberOfEmployees',
    Function.constant(100)
);
```


##### `public static Predicate isEqual(SObjectField field, IFunction function)`

Returns a `Predicate` that tests the input SObject if the value of the `field` is equal to the result returned by the `function`, comparing object value equality not reference equality.

###### Parameters

|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `function` is null|


**See** [Comparer.defaultOrder](Comparer.defaultOrder)

###### Example
```apex
BaseSObjectFunctions.isEqual(
    Account.NumberOfEmployees,
    Functions.get('OtherIntField__c')
);
BaseSObjectFunctions.isEqual(
    Account.NumberOfEmployees,
    Function.constant(100)
);
```


##### `public static Predicate isEqual(String fieldName, Object value)`

Returns a `Predicate` that tests the input SObject if the value of the `fieldName` is equal to the `value`, comparing object value equality not reference equality. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [Comparer.defaultOrder](Comparer.defaultOrder)

###### Example
```apex
BaseSObjectFunctions.isEqual('NumberOfEmployees', 100);
BaseSObjectFunctions.isEqual('Parent?.NumberOfEmployees', 100);
```


##### `public static Predicate isEqual(SObjectField field, Object value)`

Returns a `Predicate` that tests the input SObject if the value of the `field` is equal to the `value`, comparing object value equality not reference equality.

###### Parameters

|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** [Comparer.defaultOrder](Comparer.defaultOrder)

###### Example
```apex
BaseSObjectFunctions.isEqual(Account.NumberOfEmployees, 100);
```


##### `public static Predicate isCompared(IFunction left, IFunction right, IComparer comparer, Integer result)`

*Inherited*


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
BasePredicates.isCompared(
    func1,
    func2,
    Comparer.defaultOrder(),
    1
);
```


##### `public static Predicate isIn(IFunction function, Iterable<Object> container)`

*Inherited*


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
BasePredicates.isIn(getNameFunc, new List<Object>{ 'John', 'Jim' });
BasePredicates.isIn(getNameFunc, (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
BasePredicates.isIn(getNameFunc, nameEnumerable);
```


##### `public static Predicate isIn(Iterable<Object> container)`

*Inherited*


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
BasePredicates.isIn(new List<Object>{ 'John', 'Jim' });
BasePredicates.isIn((Iterable<Object>) new Set<String>{ 'John', 'Jim' });
BasePredicates.isIn(nameEnumerable);
```


##### `public static Predicate isNull()`

*Inherited*


Returns a `Predicate` that tests the input object if it is not null.

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Example
```apex
BasePredicates.isNull().test(null); // true;
BasePredicates.isNull().test(1); // false;
```


##### `public static Predicate isNotNull()`

*Inherited*


Returns a `Predicate` that tests the input object if it is not null.

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Example
```apex
BasePredicates.isNotNull().test(null); // false
BasePredicates.isNotNull().test(1); // true
```


---
