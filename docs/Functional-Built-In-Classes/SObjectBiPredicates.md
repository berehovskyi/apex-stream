# virtual SObjectBiPredicates

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides common implementations of [BiPredicate](/docs/Functional-Abstract-Classes/BiPredicate.md)
and related utilities.


**Inheritance**

[BiPredicates](/docs/Functional-Built-In-Classes/BiPredicates.md)
 > 
SObjectBiPredicates


**See** [BiPredicate](/docs/Functional-Abstract-Classes/BiPredicate.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static BiPredicate areEqual(SObjectField field)`

Returns a `BiPredicate` that tests the input sobjects if the value of the `field` of the first input argument is equal to the `field` of the second input argument, comparing object value equality not reference equality.

###### Parameters

|Param|Description|
|---|---|
|`field`|of the first and the second input arguments the value of which are considered as comparison arguments|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
SObjectBiPredicates.areEqual(Account.NumberOfEmployees);
```


##### `public static BiPredicate areEqual(String fieldName)`

Returns a `BiPredicate` that tests the input sobjects if the value of the `fieldName` of the first input argument is equal to the `fieldName` of the second input argument, comparing object value equality not reference equality. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|of the first and the second input arguments the value of which are considered as arguments of comparison|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectBiPredicates.areEqual('NumberOfEmployees');
SObjectBiPredicates.areEqual('Parent?.NumberOfEmployees');
```


##### `public static BiPredicate areNotEqual(SObjectField field)`

Returns a `BiPredicate` that tests the input sobjects if the value of the `field` of the first input argument is not equal to the `field` of the second input argument, comparing object value equality not reference equality.

###### Parameters

|Param|Description|
|---|---|
|`field`|of the first and the second input arguments the value of which are considered as comparison arguments|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
SObjectBiPredicates.areNotEqual(Account.NumberOfEmployees);
```


##### `public static BiPredicate areNotEqual(String fieldName)`

Returns a `BiPredicate` that tests the input sobjects if the value of the `fieldName` of the first input argument is not equal to the `fieldName` of the second input argument, comparing object value equality not reference equality. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|of the first and the second input arguments the value of which are considered as arguments of comparison|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectBiPredicates.areNotEqual('NumberOfEmployees');
SObjectBiPredicates.areNotEqual('Parent?.NumberOfEmployees');
```


##### `public static BiPredicate isGreater(SObjectField field)`

Returns a `BiPredicate` that tests the input sobjects if the value of the `field` of the first input argument is greater than the `field` of the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>` "greater than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|of the first and the second input arguments the value of which are considered as comparison arguments|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
SObjectBiPredicates.isGreater(Account.NumberOfEmployees);
```


##### `public static BiPredicate isGreater(String fieldName)`

Returns a `BiPredicate` that tests the input sobjects if the value of the `fieldName` of the first input argument is greater than the `fieldName` of the second input argument. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `>` "greater than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|of the first and the second input arguments the value of which are considered as arguments of comparison|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectBiPredicates.isGreater('NumberOfEmployees');
SObjectBiPredicates.isGreater('Parent?.NumberOfEmployees');
```


##### `public static BiPredicate isGreaterOrEqual(SObjectField field)`

Returns a `BiPredicate` that tests the input sobjects if the value of the `field` of the first input argument is greater than or equal to the `field` of the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|of the first and the second input arguments the value of which are considered as comparison arguments|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
SObjectBiPredicates.isGreaterOrEqual(Account.NumberOfEmployees);
```


##### `public static BiPredicate isGreaterOrEqual(String fieldName)`

Returns a `BiPredicate` that tests the input sobjects if the value of the `fieldName` of the first input argument is greater than or equal to the `fieldName` of the second input argument. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|of the first and the second input arguments the value of which are considered as arguments of comparison|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectBiPredicates.isGreaterOrEqual('NumberOfEmployees');
SObjectBiPredicates.isGreaterOrEqual('Parent?.NumberOfEmployees');
```


##### `public static BiPredicate isLess(SObjectField field)`

Returns a `BiPredicate` that tests the input sobjects if the value of the `field` of the first input argument is less than the `field` of the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `<` "less than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|of the first and the second input arguments the value of which are considered as comparison arguments|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
SObjectBiPredicates.isLess(Account.NumberOfEmployees);
```


##### `public static BiPredicate isLess(String fieldName)`

Returns a `BiPredicate` that tests the input sobjects if the value of the `fieldName` of the first input argument is less than the `fieldName` of the second input argument. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `<` "less than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|of the first and the second input arguments the value of which are considered as arguments of comparison|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectBiPredicates.isLess('NumberOfEmployees');
SObjectBiPredicates.isLess('Parent?.NumberOfEmployees');
```


##### `public static BiPredicate isLessOrEqual(SObjectField field)`

Returns a `BiPredicate` that tests the input sobjects if the value of the `field` of the first input argument is less than or equal to the `field` of the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|of the first and the second input arguments the value of which are considered as comparison arguments|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
SObjectBiPredicates.isLessOrEqual(Account.NumberOfEmployees);
```


##### `public static BiPredicate isLessOrEqual(String fieldName)`

Returns a `BiPredicate` that tests the input sobjects if the value of the `fieldName` of the first input argument is less than or equal to the `fieldName` of the second input argument. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|of the first and the second input arguments the value of which are considered as arguments of comparison|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
SObjectBiPredicates.isLessOrEqual('NumberOfEmployees');
SObjectBiPredicates.isLessOrEqual('Parent?.NumberOfEmployees');
```


##### `public static BiPredicate isCompared(IFunction left, IFunction right, IComparer comparer, Integer result)`

*Inherited*


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


---
