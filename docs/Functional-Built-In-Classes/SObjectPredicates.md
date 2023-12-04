# virtual SObjectPredicates

`SUPPRESSWARNINGS`

`APIVERSION: 59`

`STATUS: ACTIVE`

Provides common implementations of [Predicate](/docs/Functional-Abstract-Classes/Predicate.md)
and related utilities.


**Inheritance**

[BasePredicates](/docs/Functional-Built-In-Classes/BasePredicates.md)
 > 
[Predicates](/docs/Functional-Built-In-Classes/Predicates.md)
 > 
SObjectPredicates


**See** [Predicate](/docs/Functional-Abstract-Classes/Predicate.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static Predicate isGreater(String fieldName, IFunction function)`

Returns a `Predicate` that tests the input SObject if the value of the `fieldName` is greater than the result returned by the `function`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `>` "greater than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

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
SObjectPredicates.isGreater('NumberOfEmployees', Functions.get('OtherIntField__c'));
SObjectPredicates.isGreater(
    'Parent?.NumberOfEmployees',
    Function.constant(100)
);
```


##### `public static Predicate isGreater(SObjectField field, IFunction function)`

Returns a `Predicate` that tests the input SObject if the value of the `field` is greater than the result returned by the `function`. <p><strong>Note: </strong></p> <p>Unlike the standard `>` "greater than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

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
SObjectPredicates.isGreater(
        Account.NumberOfEmployees,
        Functions.get('OtherIntField__c')
    );
SObjectPredicates.isGreater(
        Account.NumberOfEmployees,
        Function.constant(100)
    );
```


##### `public static Predicate isGreater(String fieldName, Object value)`

Returns a `Predicate` that tests the input SObject if the value of the `fieldName` is greater than the `value`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `>` "greater than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

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
SObjectPredicates.isGreater('NumberOfEmployees', 100);
SObjectPredicates.isGreater('Parent?.NumberOfEmployees', 100);
```


##### `public static Predicate isGreater(SObjectField field, Object value)`

Returns a `Predicate` that tests the input SObject if the value of the `field` is greater than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `>` "greater than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

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
SObjectPredicates.isGreater(Account.NumberOfEmployees, 100);
```


##### `public static Predicate isGreaterOrEqual(String fieldName, IFunction function)`

Returns a `Predicate` that tests the input SObject if the value of the `fieldName` is greater than or equal to the result returned by the `function`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

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
SObjectPredicates.isGreaterOrEqual(
    'NumberOfEmployees',
    Functions.get('OtherIntField__c')
);
SObjectPredicates.isGreaterOrEqual(
    'Parent?.NumberOfEmployees',
    Function.constant(100)
);
```


##### `public static Predicate isGreaterOrEqual(SObjectField field, IFunction function)`

Returns a `Predicate` that tests the input SObject  if the value of the `field` is greater than or equal to the result returned by the `function`. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

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
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `function` is null|


**See** [Comparer.defaultOrder](Comparer.defaultOrder)

###### Example
```apex
SObjectPredicates.isGreaterOrEqual(
    Account.NumberOfEmployees,
    Functions.get('OtherIntField__c')
);
SObjectPredicates.isGreaterOrEqual(
    Account.NumberOfEmployees,
    Function.constant(100)
);
```


##### `public static Predicate isGreaterOrEqual(String fieldName, Object value)`

Returns a `Predicate` that tests the input SObject if the value of the `fieldName` is greater than or equal to the `value`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

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
SObjectPredicates.isGreaterOrEqual('NumberOfEmployees', 100);
SObjectPredicates.isGreaterOrEqual('Parent?.NumberOfEmployees', 100);
```


##### `public static Predicate isGreaterOrEqual(SObjectField field, Object value)`

Returns a `Predicate` that tests the input SObject if the value of the `field` is greater than or equal to the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

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
SObjectPredicates.isGreaterOrEqual(Account.NumberOfEmployees, 100);
```


##### `public static Predicate isLess(String fieldName, IFunction function)`

Returns a `SObjectPredicate` that tests if the value of the `fieldName` is less than the result returned by the `function`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `<` "less than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison.|
|`function`|the function whose application result is considered as the right argument of comparison.|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `SObjectPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `function` is null|
|`SObjectException`|if provided invalid `fieldName`|


**See** [Comparer.defaultOrder](Comparer.defaultOrder)

###### Example
```apex
SObjectPredicates.isLess('NumberOfEmployees', SObjectFunctions.get('OtherIntField__c'));
SObjectPredicates.isLess(
    'Parent?.NumberOfEmployees',
    SObjectFunction.constant(100)
);
```


##### `public static Predicate isLess(SObjectField field, IFunction function)`

Returns a `SObjectPredicate` that tests if the value of the `field` is less than the result returned by the `function`. <p><strong>Note: </strong></p> <p>Unlike the standard `<` "less than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison.|
|`function`|the function whose application result is considered as the right argument of comparison.|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `SObjectPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `function` is null|


**See** [Comparer.defaultOrder](Comparer.defaultOrder)

###### Example
```apex
SObjectPredicates.isLess(
    Account.NumberOfEmployees,
    SObjectFunctions.get('OtherIntField__c')
);
SObjectPredicates.isLess(
    Account.NumberOfEmployees,
    SObjectFunction.constant(100)
);
```


##### `public static Predicate isLess(String fieldName, Object value)`

Returns a `Predicate` that tests if the value of the `fieldName` is less than the `value`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `<` "less than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison.|
|`value`|the right argument of comparison.|

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
SObjectPredicates.isLess('NumberOfEmployees', 100);
SObjectPredicates.isLess('Parent?.NumberOfEmployees', 100);
```


##### `public static Predicate isLess(SObjectField field, Object value)`

Returns a `Predicate` that tests if the value of the `field` is less than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<` "less than" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison.|
|`value`|the right argument of comparison.|

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
SObjectPredicates.isLess(Account.NumberOfEmployees, 100);
```


##### `public static Predicate isLessOrEqual(String fieldName, IFunction function)`

Returns a `Predicate` that tests if the value of the `fieldName` is less than or equal to the result returned by the `function`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison.|
|`function`|the function whose application result is considered as the right argument of comparison.|

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
SObjectPredicates.isLessOrEqual(
    'NumberOfEmployees',
     Functions.get('OtherIntField__c')
);
SObjectPredicates.isLessOrEqual(
    'Parent?.NumberOfEmployees',
    Function.constant(100)
);
```


##### `public static Predicate isLessOrEqual(SObjectField field, IFunction function)`

Returns a `Predicate` that tests if the value of the `field` is less than or equal to the result returned by the `function`. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison.|
|`function`|the function whose application result is considered as the right argument of comparison.|

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
SObjectPredicates.isLessOrEqual(
    Account.NumberOfEmployees,
    Functions.get('OtherIntField__c')
);
SObjectPredicates.isLessOrEqual(
    Account.NumberOfEmployees,
    Function.constant(100)
);
```


##### `public static Predicate isLessOrEqual(String fieldName, Object value)`

Returns a `Predicate` that tests if the value of the `fieldName` is less than or equal to the `value`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison.|
|`value`|the right argument of comparison.|

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
SObjectPredicates.isLessOrEqual('NumberOfEmployees', 100);
SObjectPredicates.isLessOrEqual('Parent?.NumberOfEmployees', 100);
```


##### `public static Predicate isLessOrEqual(SObjectField field, Object value)`

Returns a `Predicate` that tests if the value of the `field` is less than or equal to the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison.|
|`value`|the right argument of comparison.|

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
SObjectPredicates.isLessOrEqual(Account.NumberOfEmployees, 100);
```


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
SObjectPredicates.isEqual(
    'NumberOfEmployees',
     Functions.get('OtherIntField__c')
);
SObjectPredicates.isEqual(
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
SObjectPredicates.isEqual(
    Account.NumberOfEmployees,
    Functions.get('OtherIntField__c')
);
SObjectPredicates.isEqual(
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
SObjectPredicates.isEqual('NumberOfEmployees', 100);
SObjectPredicates.isEqual('Parent?.NumberOfEmployees', 100);
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
SObjectPredicates.isEqual(Account.NumberOfEmployees, 100);
```


##### `public static Predicate isNotEqual(String fieldName, IFunction function)`

Returns a `Predicate` that tests the input SObject if the value of the `fieldName` is not equal to the result returned by the `function`, comparing object value equality not reference equality. Cross-reference fields and safe navigation are supported.

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
SObjectPredicates.isEqual(
    'NumberOfEmployees',
     Functions.get('OtherIntField__c')
);
SObjectPredicates.isEqual(
    'Parent?.NumberOfEmployees',
    Function.constant(100)
);
```


##### `public static Predicate isNotEqual(SObjectField field, IFunction function)`

Returns a `Predicate` that tests the input SObject if the value of the `field` is not equal to the result returned by the `function`, comparing object value equality not reference equality.

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
SObjectPredicates.isEqual(
    Account.NumberOfEmployees,
    Functions.get('OtherIntField__c')
);
SObjectPredicates.isEqual(
    Account.NumberOfEmployees,
    Function.constant(100)
);
```


##### `public static Predicate isNotEqual(String fieldName, Object value)`

Returns a `Predicate` that tests the input SObject if the value of the `fieldName` is not equal to the `value`, comparing object value equality not reference equality. Cross-reference fields and safe navigation are supported.

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
SObjectPredicates.isEqual('NumberOfEmployees', 100);
SObjectPredicates.isEqual('Parent?.NumberOfEmployees', 100);
```


##### `public static Predicate isNotEqual(SObjectField field, Object value)`

Returns a `Predicate` that tests the input SObject if the value of the `field` is not equal to the `value`, comparing object value equality not reference equality.

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
SObjectPredicates.isEqual(Account.NumberOfEmployees, 100);
```


##### `public static Predicate isLike(String fieldName, String likeString)`

Returns a `Predicate` that tests the input SObject if the string value of the `fieldName` matches the `likeString` pattern. Supports the `%` and the `_` wildcards and is case-insensitive. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the value of which is tested|
|`likeString`|the pattern that is tested to match the string value of the `fieldName`|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `likeString` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [Comparer.defaultOrder](Comparer.defaultOrder)

###### Example
```apex
SObjectPredicates.isLike('Name', '%a_e');
SObjectPredicates.isLike('Parent?.Name', '%a_e');
```


##### `public static Predicate isLike(SObjectField field, String likeString)`

Returns a `Predicate` that tests the input SObject if the string value of the `field` matches the `likeString` pattern. Supports the `%` and the `_` wildcards and is case-insensitive. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`field`|the value of which is tested|
|`likeString`|the pattern that is tested to match the string value of the `field`|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `likeString` is null|


**See** [Comparer.defaultOrder](Comparer.defaultOrder)

###### Example
```apex
SObjectPredicates.isLike(Account.Name, '%a_e');
```


##### `public static Predicate isIn(String fieldName, Iterable<Object> container)`

Returns a `Predicate` that tests the input SObject if the the value of the `fieldName` is contained in the `container`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the value of which is tested|
|`container`|the iterable that checks for the presence of an element|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `container` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [List.contains](List.contains)

###### Example
```apex
SObjectPredicates.isIn('Name', new List<Object>{ 'John', 'Jim' });
SObjectPredicates.isIn('Parent?.Name', (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
SObjectPredicates.isIn('Parent.Name', nameStream);
```


##### `public static Predicate isIn(SObjectField field, Iterable<Object> container)`

Returns a `Predicate` that tests the input SObject if the the value of the `field` is contained in the `container`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the value of which is tested|
|`container`|the iterable that checks for the presence of an element|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `container` is null|


**See** [List.contains](List.contains)

###### Example
```apex
SObjectPredicates.isIn(Account.Name, new List<Object>{ 'John', 'Jim' });
SObjectPredicates.isIn(Account.Name, (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
SObjectPredicates.isIn(Account.Name, nameStream);
```


##### `public static Predicate isNotIn(String fieldName, Iterable<Object> container)`

Returns a `Predicate` that tests the input SObject if the the value of the `fieldName` is not contained in the `container`. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the value of which is tested|
|`container`|the iterable that checks for the presence of an element|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `container` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [List.contains](List.contains)

###### Example
```apex
SObjectPredicates.isNotIn('Name', new List<Object>{ 'John', 'Jim' });
SObjectPredicates.isNotIn('Parent?.Name', (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
SObjectPredicates.isNotIn('Parent.Name', nameStream);
```


##### `public static Predicate isNotIn(SObjectField field, Iterable<Object> container)`

Returns a `Predicate` that tests the input SObject if the the value of the `field` is not contained in the `container`.

###### Parameters

|Param|Description|
|---|---|
|`field`|the value of which is tested|
|`container`|the iterable that checks for the presence of an element|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `container` is null|


**See** [List.contains](List.contains)

###### Example
```apex
SObjectPredicates.isNotIn(Account.Name, new List<Object>{ 'John', 'Jim' });
SObjectPredicates.isNotIn(Account.Name, (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
SObjectPredicates.isNotIn(Account.Name, nameStream);
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
