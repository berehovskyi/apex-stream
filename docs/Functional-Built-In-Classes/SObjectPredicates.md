# SObjectPredicates

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides common implementations of [SObjectPredicate](/docs/Functional-Abstract-Classes/SObjectPredicate.md) and related utilities.


**See** [SObjectPredicate](/docs/Functional-Abstract-Classes/SObjectPredicate.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `static isCompared(ISObjectFunction left, ISObjectFunction right, IComparator comparator, Integer result)`

Returns a `SObjectPredicate` that tests if the result of comparing the values returned by the applied `left` and `right` functions by the `comparator` is equal to the expected `result`.

###### Parameters
|Param|Description|
|---|---|
|`left`|the function applied to the input argument the result of which is passed to the `comparator` as the first argument|
|`right`|the function applied to the input argument the result of which is passed to the `comparator` as the second argument|
|`comparator`|the function that compares two arguments|
|`result`|the expected result of comparison (1, -1, or 0)|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right`, or `comparator`, or `result` is null|

###### Example
```apex
SObjectPredicates.isCompared(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunctions.get('OtherIntField__c'),
    Comparator.defaultOrder(),
    1
);
```

##### `static isGreater(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `left` function is greater than the result returned by the `right` function. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isGreater(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunctions.get('OtherIntField__c')
);
SObjectPredicates.isGreater(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

##### `static isGreater(String fieldName, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `fieldName` is greater than the result returned by the `function`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isGreater('NumberOfEmployees', SObjectFunctions.get('OtherIntField__c'));
SObjectPredicates.isGreater(
    'Parent?.NumberOfEmployees',
    SObjectFunction.constant(100)
);
```

##### `static isGreater(SObjectField field, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `field` is greater than the result returned by the `function`. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isGreater(
        Account.NumberOfEmployees,
        SObjectFunctions.get('OtherIntField__c')
    );
SObjectPredicates.isGreater(
        Account.NumberOfEmployees,
        SObjectFunction.constant(100)
    );
```

##### `static isGreater(String fieldName, Object value)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `fieldName` is greater than the `value`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isGreater('NumberOfEmployees', 100);
SObjectPredicates.isGreater('Parent?.NumberOfEmployees', 100);
```

##### `static isGreater(SObjectField field, Object value)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `field` is greater than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isGreater(Account.NumberOfEmployees, 100);
```

##### `static isGreaterOrEqual(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `left` function is greater than or equal to the result returned by the `right` function. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isGreaterOrEqual(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunctions.get('OtherIntField__c')
);
SObjectPredicates.isGreaterOrEqual(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

##### `static isGreaterOrEqual(String fieldName, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `fieldName` is greater than or equal to the result returned by the `function`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isGreaterOrEqual(
    'NumberOfEmployees',
    SObjectFunctions.get('OtherIntField__c')
);
SObjectPredicates.isGreaterOrEqual(
    'Parent?.NumberOfEmployees',
    SObjectFunction.constant(100)
);
```

##### `static isGreaterOrEqual(SObjectField field, ISObjectFunction function)`

Returns a `SObjectPredicate` that teststhe input SObject  if the value of the `field` is greater than or equal to the result returned by the `function`. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isGreaterOrEqual(
    Account.NumberOfEmployees,
    SObjectFunctions.get('OtherIntField__c')
);
SObjectPredicates.isGreaterOrEqual(
    Account.NumberOfEmployees,
    SObjectFunction.constant(100)
);
```

##### `static isGreaterOrEqual(String fieldName, Object value)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `fieldName` is greater than or equal to the `value`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isGreaterOrEqual('NumberOfEmployees', 100);
SObjectPredicates.isGreaterOrEqual('Parent?.NumberOfEmployees', 100);
```

##### `static isGreaterOrEqual(SObjectField field, Object value)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `field` is greater than or equal to the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isGreaterOrEqual(Account.NumberOfEmployees, 100);
```

##### `static isLess(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectPredicate` that tests if the result returned by the `left` function is less than the result returned by the `right` function. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison.|
|`right`|the function whose application result is considered as the right argument of comparison.|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isLess(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunctions.get('OtherIntField__c')
);
SObjectPredicates.isLess(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

##### `static isLess(String fieldName, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests if the value of the `fieldName` is less than the result returned by the `function`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison.|
|`function`|the function whose application result is considered as the right argument of comparison.|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isLess('NumberOfEmployees', SObjectFunctions.get('OtherIntField__c'));
SObjectPredicates.isLess(
    'Parent?.NumberOfEmployees',
    SObjectFunction.constant(100)
);
```

##### `static isLess(SObjectField field, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests if the value of the `field` is less than the result returned by the `function`. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison.|
|`function`|the function whose application result is considered as the right argument of comparison.|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|


**See** Comparator.defaultOrder

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

##### `static isLess(String fieldName, Object value)`

Returns a `SObjectPredicate` that tests if the value of the `fieldName` is less than the `value`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison.|
|`value`|the right argument of comparison.|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isLess('NumberOfEmployees', 100);
SObjectPredicates.isLess('Parent?.NumberOfEmployees', 100);
```

##### `static isLess(SObjectField field, Object value)`

Returns a `SObjectPredicate` that tests if the value of the `field` is less than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison.|
|`value`|the right argument of comparison.|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isLess(Account.NumberOfEmployees, 100);
```

##### `static isLessOrEqual(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectPredicate` that tests if the result returned by the `left` function is less than or equal to the result returned by the `right` function. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison.|
|`right`|the function whose application result is considered as the right argument of comparison.|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isLessOrEqual(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunctions.get('OtherIntField__c')
);
SObjectPredicates.isLessOrEqual(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

##### `static isLessOrEqual(String fieldName, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests if the value of the `fieldName` is less than or equal to the result returned by the `function`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison.|
|`function`|the function whose application result is considered as the right argument of comparison.|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isLessOrEqual(
    'NumberOfEmployees',
     SObjectFunctions.get('OtherIntField__c')
);
SObjectPredicates.isLessOrEqual(
    'Parent?.NumberOfEmployees',
    SObjectFunction.constant(100)
);
```

##### `static isLessOrEqual(SObjectField field, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests if the value of the `field` is less than or equal to the result returned by the `function`. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison.|
|`function`|the function whose application result is considered as the right argument of comparison.|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isLessOrEqual(
    Account.NumberOfEmployees,
    SObjectFunctions.get('OtherIntField__c')
);
SObjectPredicates.isLessOrEqual(
    Account.NumberOfEmployees,
    SObjectFunction.constant(100)
);
```

##### `static isLessOrEqual(String fieldName, Object value)`

Returns a `SObjectPredicate` that tests if the value of the `fieldName` is less than or equal to the `value`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison.|
|`value`|the right argument of comparison.|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isLessOrEqual('NumberOfEmployees', 100);
SObjectPredicates.isLessOrEqual('Parent?.NumberOfEmployees', 100);
```

##### `static isLessOrEqual(SObjectField field, Object value)`

Returns a `SObjectPredicate` that tests if the value of the `field` is less than or equal to the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison.|
|`value`|the right argument of comparison.|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isLessOrEqual(Account.NumberOfEmployees, 100);
```

##### `static isEqual(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `left` function is equal to the result returned by the `right` function, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isEqual(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunctions.get('OtherIntField__c')
);
SObjectPredicates.isEqual(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

##### `static isEqual(String fieldName, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `fieldName` is equal to the result returned by the `function`, comparing object value equality not reference equality. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isEqual(
    'NumberOfEmployees',
     SObjectFunctions.get('OtherIntField__c')
);
SObjectPredicates.isEqual(
    'Parent?.NumberOfEmployees',
    SObjectFunction.constant(100)
);
```

##### `static isEqual(SObjectField field, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `field` is equal to the result returned by the `function`, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isEqual(
    Account.NumberOfEmployees,
    SObjectFunctions.get('OtherIntField__c')
);
SObjectPredicates.isEqual(
    Account.NumberOfEmployees,
    SObjectFunction.constant(100)
);
```

##### `static isEqual(String fieldName, Object value)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `fieldName` is equal to the `value`, comparing object value equality not reference equality. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isEqual('NumberOfEmployees', 100);
SObjectPredicates.isEqual('Parent?.NumberOfEmployees', 100);
```

##### `static isEqual(SObjectField field, Object value)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `field` is equal to the `value`, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isEqual(Account.NumberOfEmployees, 100);
```

##### `static isEqual(ISObjectUnaryOperator left, ISObjectUnaryOperator right)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `left` operator is equal to the result returned by the `right` operator, comparing SObject value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`left`|the operator whose application result is considered as the left argument of comparison|
|`right`|the operator whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left` or the `right` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isEqual(
    SObjectUnaryOperators.getSObject('ParentId'),
    SObjectUnaryOperators.getSObject('AnotherParentId')
);
```

##### `static isEqual(ISObjectUnaryOperator operator)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `identity` function is equal to the result returned by the `operator`, comparing SObject value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`operator`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `operator` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isEqual(SObjectUnaryOperators.getSObject('ParentId'));
```

##### `static isEqual(SObject value)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `identity` function is equal to the `value`, comparing SObject value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `operator` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isEqual(someAccount);
```

##### `static isNotEqual(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `left` function is not equal to the result returned by the `right` function, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isEqual(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunctions.get('OtherIntField__c')
);
SObjectPredicates.isEqual(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

##### `static isNotEqual(String fieldName, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `fieldName` is not equal to the result returned by the `function`, comparing object value equality not reference equality. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isEqual(
    'NumberOfEmployees',
     SObjectFunctions.get('OtherIntField__c')
);
SObjectPredicates.isEqual(
    'Parent?.NumberOfEmployees',
    SObjectFunction.constant(100)
);
```

##### `static isNotEqual(SObjectField field, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `field` is not equal to the result returned by the `function`, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isEqual(
    Account.NumberOfEmployees,
    SObjectFunctions.get('OtherIntField__c')
);
SObjectPredicates.isEqual(
    Account.NumberOfEmployees,
    SObjectFunction.constant(100)
);
```

##### `static isNotEqual(String fieldName, Object value)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `fieldName` is not equal to the `value`, comparing object value equality not reference equality. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isEqual('NumberOfEmployees', 100);
SObjectPredicates.isEqual('Parent?.NumberOfEmployees', 100);
```

##### `static isNotEqual(SObjectField field, Object value)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `field` is not equal to the `value`, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isEqual(Account.NumberOfEmployees, 100);
```

##### `static isNotEqual(ISObjectUnaryOperator left, ISObjectUnaryOperator right)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `left` operator is not equal to the result returned by the `right` operator, comparing SObject value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`left`|the operator whose application result is considered as the left argument of comparison|
|`right`|the operator whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left` or the `right` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isNotEqual(
    SObjectUnaryOperators.getSObject('ParentId'),
    SObjectUnaryOperators.getSObject('AnotherParentId')
);
```

##### `static isNotEqual(ISObjectUnaryOperator operator)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `identity` function is not equal to the result returned by the `operator`, comparing SObject value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`operator`|the function whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `operator` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isEqual(SObjectUnaryOperators.getSObject('ParentId'));
```

##### `static isNotEqual(SObject value)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `identity` function is not equal to the `value`, comparing SObject value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `operator` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isEqual(someAccount);
```

##### `static isLike(ISObjectFunction function, String likeString)`

Returns a `SObjectPredicate` that tests the input SObject if the string returned by the `function` matches the `likeString` pattern. Supports the `%` and the `_` wildcards and is case-insensitive.

###### Parameters
|Param|Description|
|---|---|
|`function`|the function whose application result string is tested|
|`likeString`|the pattern that is tested to match the string returned by the `function`|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `function`, or the `likeString` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isLike(SObjectFunctions.get('Name'), '%a_e');
SObjectPredicates.isLike(SObjectFunctions.get(Account.Name), '%a_e');
```

##### `static isLike(String fieldName, String likeString)`

Returns a `SObjectPredicate` that tests the input SObject if the string value of the `fieldName` matches the `likeString` pattern. Supports the `%` and the `_` wildcards and is case-insensitive. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is tested|
|`likeString`|the pattern that is tested to match the string value of the `fieldName`|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `likeString` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isLike('Name', '%a_e');
SObjectPredicates.isLike('Parent?.Name', '%a_e');
```

##### `static isLike(SObjectField field, String likeString)`

Returns a `SObjectPredicate` that tests the input SObject if the string value of the `field` matches the `likeString` pattern. Supports the `%` and the `_` wildcards and is case-insensitive. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is tested|
|`likeString`|the pattern that is tested to match the string value of the `field`|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field`, or the `likeString` is null|


**See** Comparator.defaultOrder

###### Example
```apex
SObjectPredicates.isLike(Account.Name, '%a_e');
```

##### `static isIn(ISObjectFunction function, Iterable<Object> container)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `function` is contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`function`|the function whose application result is tested|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `function`, or the `container` is null|


**See** List.contains

###### Example
```apex
SObjectPredicates.isIn(SObjectFunctions.get('Name'), new List<Object>{ 'John', 'Jim' });
SObjectPredicates.isIn(SObjectFunctions.get('Name'), (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
SObjectPredicates.isIn(SObjectFunctions.get('Name'), nameStream);
```

##### `static isIn(String fieldName, Iterable<Object> container)`

Returns a `SObjectPredicate` that tests the input SObject if the the value of the `fieldName` is contained in the `container`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is tested|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `container` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** List.contains

###### Example
```apex
SObjectPredicates.isIn('Name', new List<Object>{ 'John', 'Jim' });
SObjectPredicates.isIn('Parent?.Name', (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
SObjectPredicates.isIn('Parent.Name', nameStream);
```

##### `static isIn(SObjectField field, Iterable<Object> container)`

Returns a `SObjectPredicate` that tests the input SObject if the the value of the `field` is contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is tested|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field`, or the `container` is null|


**See** List.contains

###### Example
```apex
SObjectPredicates.isIn(Account.Name, new List<Object>{ 'John', 'Jim' });
SObjectPredicates.isIn(Account.Name, (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
SObjectPredicates.isIn(Account.Name, nameStream);
```

##### `static isIn(Iterable<SObject> container)`

Returns a `SObjectPredicate` that tests the input sobject is contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `container` is null|


**See** List.contains

###### Example
```apex
SObjectPredicates.isIn(accounts);
SObjectPredicates.isIn(accStream);
SObjectPredicates.isIn((Iterable<Account>) accountSet);
```

##### `static isNotIn(ISObjectFunction function, Iterable<Object> container)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `function` is not contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`function`|the function whose application result is tested|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `function`, or the `container` is null|


**See** List.contains

###### Example
```apex
SObjectPredicates.isNotIn(SObjectFunctions.get('Name'), new List<Object>{ 'John', 'Jim' });
SObjectPredicates.isNotIn(SObjectFunctions.get('Name'), (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
SObjectPredicates.isNotIn(SObjectFunctions.get('Name'), nameStream);
```

##### `static isNotIn(String fieldName, Iterable<Object> container)`

Returns a `SObjectPredicate` that tests the input SObject if the the value of the `fieldName` is not contained in the `container`. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is tested|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `container` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** List.contains

###### Example
```apex
SObjectPredicates.isNotIn('Name', new List<Object>{ 'John', 'Jim' });
SObjectPredicates.isNotIn('Parent?.Name', (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
SObjectPredicates.isNotIn('Parent.Name', nameStream);
```

##### `static isNotIn(SObjectField field, Iterable<Object> container)`

Returns a `SObjectPredicate` that tests the input SObject if the the value of the `field` is not contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is tested|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field`, or the `container` is null|


**See** List.contains

###### Example
```apex
SObjectPredicates.isNotIn(Account.Name, new List<Object>{ 'John', 'Jim' });
SObjectPredicates.isNotIn(Account.Name, (Iterable<Object>) new Set<String>{ 'John', 'Jim' });
SObjectPredicates.isNotIn(Account.Name, nameStream);
```

##### `static isNotIn(Iterable<SObject> container)`

Returns a `SObjectPredicate` that tests the input SObject if it is not contained in the `container`.

###### Parameters
|Param|Description|
|---|---|
|`container`|the iterable that checks for the presence of an element|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `container` is null|


**See** List.contains

###### Example
```apex
SObjectPredicates.isNotIn(accounts);
SObjectPredicates.isNotIn(accStream);
SObjectPredicates.isNotIn((Iterable<Account>) accountSet);
```

##### `static isNull()`

Returns a `SObjectPredicate` that tests the input SObject if it is null.

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Example
```apex
SObjectPredicates.isNull();
```

##### `static isNotNull()`

Returns a `SObjectPredicate` that tests the input SObject if it is not null.

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Example
```apex
SObjectPredicates.isNotNull();
```

##### `static has(ISObjectFunction function)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `function` is not null.

###### Parameters
|Param|Description|
|---|---|
|`function`|the function whose application result is tested|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `function` is null|


**See** SObjectPredicates.isNotEqual

###### Example
```apex
SObjectPredicates.has(SObjectFunctions.get('Name'));
SObjectPredicates.has(SObjectFunctions.get(Account.Name));
```

##### `static has(String fieldName)`

Returns a `SObjectPredicate` that tests the input SObject if the value the `fieldName` is not null. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is tested|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectPredicates.isNotEqual


**See** SObjectFunctions.get

###### Example
```apex
SObjectPredicates.has('Name');
SObjectPredicates.has('Parent?.Name');
```

##### `static has(SObjectField field)`

Returns a `SObjectPredicate` that tests the input SObject if the value the `field` is not null.

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is tested|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** SObjectPredicates.isNotEqual


**See** SObjectFunctions.get

###### Example
```apex
SObjectPredicates.has(Account.Name);
```

##### `static hasSObject(ISObjectUnaryOperator operator)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `operator` is not null.

###### Parameters
|Param|Description|
|---|---|
|`operator`|the operator whose application result is tested|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `operator` is null|


**See** SObjectPredicates.isNotEqual

###### Example
```apex
SObjectPredicates.hasSObject(SObjectFunctions.getSObject('Parent'));
SObjectPredicates.hasSObject(SObjectFunctions.getSObject(Account.ParentId));
```

##### `static hasSObject(String fieldName)`

Returns a `SObjectPredicate` that tests the input SObject if the parent SObject by the `fieldName` is not null. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is tested|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectPredicates.isNotEqual


**See** SObjectUnaryOperators.getSObject

###### Example
```apex
SObjectPredicates.hasSObject('Parent');
SObjectPredicates.hasSObject('Parent?.Parent');
```

##### `static hasSObject(SObjectField field)`

Returns a `SObjectPredicate` that tests the input SObject if the parent SObject by the `fieldName` is not null.

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is tested|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** SObjectPredicates.isNotEqual


**See** SObjectUnaryOperators.getSObject

###### Example
```apex
SObjectPredicates.hasSObject(Account.ParentId);
```

##### `static hasSObjects(String fieldName)`

Returns a `SObjectPredicate` that tests the input SObject if the children sobjects by the `fieldName` is not null. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is tested|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectPredicates.isNotEqual


**See** SObjectFunctions.getSObjects

###### Example
```apex
SObjectPredicates.hasSObjects('Parent');
SObjectPredicates.hasSObjects('Parent?.Parent');
```

##### `static hasSObjects(SObjectField field)`

Returns a `SObjectPredicate` that tests the input SObject if the children sobjects by the `field` is not null.

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is tested|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** SObjectPredicates.isNotEqual

###### Example
```apex
SObjectPredicates.hasSObjects(Contact.AccountId);
```

##### `static hasErrors()`

Returns a `SObjectPredicate` that tests the input SObject if it has errors

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`


**See** SObject.hasErrors

##### `static isClone()`

Returns a `SObjectPredicate` that tests the input SObject if it is a clone

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`


**See** SObject.isClone

##### `static isSet(String fieldName)`

Returns a `SObjectPredicate` that tests the input SObject if its `fieldName` is populated, either by direct assignment or by inclusion in a SOQL query. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is tested|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.isSet

###### Example
```apex
SObjectPredicates.isSet('Name');
SObjectPredicates.isSet('ParentId');
SObjectPredicates.isSet('Parent?.ParentId');
```

##### `static isSet(SObjectField field)`

Returns a `SObjectPredicate` that tests the input SObject if its `field` is populated, either by direct assignment or by inclusion in a SOQL query.

###### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is tested|

###### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`


**See** SObject.isSet

###### Example
```apex
SObjectPredicates.isSet(Account.Name);
SObjectPredicates.isSet(Account.ParentId);
```

---
