# SObjectBiPredicates

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides common implementations of [SObjectBiPredicate](/docs/Functional-Abstract-Classes/SObjectBiPredicate.md) and related utilities.


**See** [SObjectBiPredicate](/docs/Functional-Abstract-Classes/SObjectBiPredicate.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `static isCompared(ISObjectFunction left, ISObjectFunction right, IComparator comparator, Integer result)`

Returns a `SObjectBiPredicate` that tests if the result of comparing the values returned by the applied `left` and `right` functions applied to the first and the second input arguments respectively by the `comparator` is equal to the expected `result`.

###### Parameters
|Param|Description|
|---|---|
|`left`|the function applied to the first input argument the result of which is passed to the `comparator` as the first argument|
|`right`|the function applied to the second input argument the result of which is passed to the `comparator` as the second argument|
|`comparator`|the function that compares two arguments|
|`result`|the expected result of comparison (1, -1, or 0)|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left`, or `right`, or `comparator`, or `result` is null|

###### Example
```apex
SObjectBiPredicates.isCompared(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunctions.get('OtherIntField__c'),
    Comparator.defaultOrder(),
    1
);
```

##### `static areEqual()`

Returns a `SObjectBiPredicate` that tests the input sobjects if the value of the first input argument is equal to the second input argument.

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.areEqual();
```

##### `static areEqual(SObjectField field)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the value of the `field` of the first input argument is equal to the `field` of the second input argument, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`field`|of the first and the second input arguments the value of which are considered as comparison arguments|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.areEqual(Account.NumberOfEmployees);
```

##### `static areEqual(String fieldName)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the value of the `fieldName` of the first input argument is equal to the `fieldName` of the second input argument, comparing object value equality not reference equality. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|of the first and the second input arguments the value of which are considered as arguments of comparison|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.areEqual('NumberOfEmployees');
SObjectBiPredicates.areEqual('Parent?.NumberOfEmployees');
```

##### `static areEqual(ISObjectFunction function)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by the `function` function applied to the first input argument is equal to the result returned by the same `function` applied to the second input argument, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`function`|the function applied to the first and the second input arguments|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `function` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.areEqual(SObjectFunctions.get('NumberOfEmployees'));
```

##### `static areEqual(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is equal to the result returned by the `right` function applied to the second input argument, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.areEqual(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunctions.get('OtherIntField__c')
);
SObjectBiPredicates.areEqual(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

##### `static areNotEqual()`

Returns a `SObjectBiPredicate` that tests the input sobjects if the value of the first input argument is not equal to the second input argument.

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.areNotEqual();
```

##### `static areNotEqual(SObjectField field)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the value of the `field` of the first input argument is not equal to the `field` of the second input argument, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`field`|of the first and the second input arguments the value of which are considered as comparison arguments|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.areNotEqual(Account.NumberOfEmployees);
```

##### `static areNotEqual(String fieldName)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the value of the `fieldName` of the first input argument is not equal to the `fieldName` of the second input argument, comparing object value equality not reference equality. Cross-reference fields and safe navigation are supported.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|of the first and the second input arguments the value of which are considered as arguments of comparison|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.areNotEqual('NumberOfEmployees');
SObjectBiPredicates.areNotEqual('Parent?.NumberOfEmployees');
```

##### `static areNotEqual(ISObjectFunction function)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by the `function` function applied to the first input argument is not equal to the result returned by the same `function` applied to the second input argument, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`function`|the function applied to the first and the second input arguments|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `function` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.areNotEqual(SObjectFunctions.get('NumberOfEmployees'));
```

##### `static areNotEqual(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is not equal to the result returned by the `right` function applied to the second input argument, comparing object value equality not reference equality.

###### Parameters
|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.areNotEqual(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunctions.get('OtherIntField__c')
);
SObjectBiPredicates.areNotEqual(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

##### `static isGreater(SObjectField field)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the value of the `field` of the first input argument is greater than the `field` of the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|of the first and the second input arguments the value of which are considered as comparison arguments|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.isGreater(Account.NumberOfEmployees);
```

##### `static isGreater(String fieldName)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the value of the `fieldName` of the first input argument is greater than the `fieldName` of the second input argument. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|of the first and the second input arguments the value of which are considered as arguments of comparison|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.isGreater('NumberOfEmployees');
SObjectBiPredicates.isGreater('Parent?.NumberOfEmployees');
```

##### `static isGreater(ISObjectFunction function)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by the `function` function applied to the first input argument is greater than the result returned by the same `function` applied to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`function`|the function applied to the first and the second input arguments|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `function` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.isGreater(SObjectFunctions.get('NumberOfEmployees'));
```

##### `static isGreater(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is greater than the result returned by the `right` function applied to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.isGreater(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunctions.get('OtherIntField__c')
);
SObjectBiPredicates.isGreater(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

##### `static isGreaterOrEqual(SObjectField field)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the value of the `field` of the first input argument is greater than or equal to the `field` of the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|of the first and the second input arguments the value of which are considered as comparison arguments|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.isGreaterOrEqual(Account.NumberOfEmployees);
```

##### `static isGreaterOrEqual(String fieldName)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the value of the `fieldName` of the first input argument is greater than or equal to the `fieldName` of the second input argument. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|of the first and the second input arguments the value of which are considered as arguments of comparison|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.isGreaterOrEqual('NumberOfEmployees');
SObjectBiPredicates.isGreaterOrEqual('Parent?.NumberOfEmployees');
```

##### `static isGreaterOrEqual(ISObjectFunction function)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by the `function` function applied to the first input argument is greater than or equal to the result returned by the same `function` applied to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`function`|the function applied to the first and the second input arguments|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `function` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.isGreaterOrEqual(SObjectFunctions.get('NumberOfEmployees'));
```

##### `static isGreaterOrEqual(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is greater than or equal to the result returned by the `right` function applied to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.isGreaterOrEqual(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunctions.get('OtherIntField__c')
);
SObjectBiPredicates.isGreaterOrEqual(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

##### `static isLess(SObjectField field)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the value of the `field` of the first input argument is less than the `field` of the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|of the first and the second input arguments the value of which are considered as comparison arguments|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.isLess(Account.NumberOfEmployees);
```

##### `static isLess(String fieldName)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the value of the `fieldName` of the first input argument is less than the `fieldName` of the second input argument. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|of the first and the second input arguments the value of which are considered as arguments of comparison|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.isLess('NumberOfEmployees');
SObjectBiPredicates.isLess('Parent?.NumberOfEmployees');
```

##### `static isLess(ISObjectFunction function)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by the `function` function applied to the first input argument is less than the result returned by the same `function` applied to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`function`|the function applied to the first and the second input arguments|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `function` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.isLess(SObjectFunctions.get('NumberOfEmployees'));
```

##### `static isLess(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is less than the result returned by the `right` function applied to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.isLess(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunctions.get('OtherIntField__c')
);
SObjectBiPredicates.isLess(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

##### `static isLessOrEqual(SObjectField field)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the value of the `field` of the first input argument is less than or equal to the `field` of the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `&amp;lt;=` &quot;less than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|of the first and the second input arguments the value of which are considered as comparison arguments|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.isLessOrEqual(Account.NumberOfEmployees);
```

##### `static isLessOrEqual(String fieldName)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the value of the `fieldName` of the first input argument is less than or equal to the `fieldName` of the second input argument. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|of the first and the second input arguments the value of which are considered as arguments of comparison|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.isLessOrEqual('NumberOfEmployees');
SObjectBiPredicates.isLessOrEqual('Parent?.NumberOfEmployees');
```

##### `static isLessOrEqual(ISObjectFunction function)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by the `function` function applied to the first input argument is less than or equal to the result returned by the same `function` applied to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`function`|the function applied to the first and the second input arguments|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `function` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.isLessOrEqual(SObjectFunctions.get('NumberOfEmployees'));
```

##### `static isLessOrEqual(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectBiPredicate` that tests the input sobjects if the result returned by the `left` function applied to the first input argument is less than or equal to the result returned by the `right` function applied to the second input argument. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

###### Parameters
|Param|Description|
|---|---|
|`left`|the function applied to the first input argument, whose application result is considered as the left argument of comparison|
|`right`|the function applied to the second input argument, whose application result is considered as the right argument of comparison|

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|


**See** Comparators.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicates.isLessOrEqual(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunctions.get('OtherIntField__c')
);
SObjectBiPredicates.isLessOrEqual(
    SObjectFunctions.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

---
