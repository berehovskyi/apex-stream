# SObjectBiPredicate

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ISObjectBiPredicate](/docs/Functional-Interfaces/ISObjectBiPredicate.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions


**See** SObjectStream.zip


**See** SObjectSequence.zip

## Methods
### Function
##### `test(SObject sObj1, SObject sObj2)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `orElse(ISObjectBiPredicate other)`

Returns a composed `SObjectBiPredicate` that applies short-circuiting logical `OR` operator to `this` `ISObjectBiPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `ISObjectBiPredicate`|

###### Return

**Type**

SObjectBiPredicate

**Description**

the composed `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someSObjectBiPredicate1.orElse(someSObjectBiPredicate2);
```

##### `andAlso(ISObjectBiPredicate other)`

Returns a composed `SObjectBiPredicate` that applies short-circuiting logical `AND` operator to `this` `ISObjectPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `ISObjectBiPredicate`|

###### Return

**Type**

SObjectBiPredicate

**Description**

the composed `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someSObjectBiPredicate1.andAlso(someSObjectBiPredicate2);
```

##### `negate()`

Returns a `SObjectBiPredicate` that applies logical `NOT` operator to `this` `ISObjectBiPredicate`.

###### Return

**Type**

SObjectBiPredicate

**Description**

the negated `SObjectBiPredicate`

###### Example
```apex
someSObjectBiPredicate.negate();
```

---
### Static Methods
##### `static some(List<ISObjectBiPredicate> predicates)`

Returns a composed `SObjectBiPredicate` that applies sequentially short-circuiting logical `OR` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`ISObjectBiPredicate`|

###### Return

**Type**

SObjectBiPredicate

**Description**

the composed `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
SObjectBiPredicate.some(someSObjectBiPredicates);
```

##### `static some(ISObjectBiPredicate predicate1, ISObjectBiPredicate predicate2)`

Returns a composed `SObjectBiPredicate` that applies short-circuiting logical `OR` operator to `predicate1` `ISObjectBiPredicate` and `predicate2` in that order.

###### Parameters
|Param|Description|
|---|---|
|`predicate1`|the first `ISObjectBiPredicate`|
|`predicate2`|the second `ISObjectBiPredicate`|

###### Return

**Type**

SObjectBiPredicate

**Description**

the composed `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate1` or `predicate2` is null|

###### Example
```apex
SObjectBiPredicate.some(someSObjectBiPredicate1, someSObjectBiPredicate2);
```

##### `static every(List<ISObjectBiPredicate> predicates)`

Returns a composed `SObjectBiPredicate` that applies sequentially short-circuiting logical `AND` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`ISObjectBiPredicate`|

###### Return

**Type**

SObjectBiPredicate

**Description**

the composed `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
SObjectBiPredicate.every(someSObjectBiPredicates);
```

##### `static every(ISObjectBiPredicate predicate1, ISObjectBiPredicate predicate2)`

Returns a composed `SObjectBiPredicate` that applies short-circuiting logical `AND` operator to `predicate1` `ISObjectBiPredicate` and `predicate2` in that order.

###### Parameters
|Param|Description|
|---|---|
|`predicate1`|the first `ISObjectBiPredicate`|
|`predicate2`|the second `ISObjectBiPredicate`|

###### Return

**Type**

SObjectBiPredicate

**Description**

the composed `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate1` or `predicate2` is null|

###### Example
```apex
SObjectPredicate.every(someSObjectPredicate1, someSObjectPredicate2);
```

##### `static negate(ISObjectBiPredicate predicate)`

Returns a `SObjectBiPredicate` that applies logical `NOT` operator to `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the `ISObjectBiPredicate`|

###### Return

**Type**

SObjectBiPredicate

**Description**

the negated `SObjectBiPredicate`

###### Example
```apex
SObjectBiPredicate.negate(someSObjectBiPredicate);
```

##### `static somePredicate(ISObjectPredicate left, ISObjectPredicate right)`

Returns a composed `SObjectBiPredicate` that applies short-circuiting logical `OR` operator to `predicate1` `ISObjectPredicate` and `predicate2` in that order applied to the first and the second input arguments respectively.

###### Parameters
|Param|Description|
|---|---|
|`left`|the predicate applied to the first input argument|
|`right`|the predicate applied to the second input argument|

###### Return

**Type**

SObjectBiPredicate

**Description**

the composed `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
SObjectBiPredicate.somePredicate(someSObjectPredicate1, someSObjectPredicate2);
```

##### `static everyPredicate(ISObjectPredicate left, ISObjectPredicate right)`

Returns a composed `SObjectBiPredicate` that applies short-circuiting logical `AND` operator to `predicate1` `ISObjectPredicate` and `predicate2` in that order applied to the first and the second input arguments respectively.

###### Parameters
|Param|Description|
|---|---|
|`left`|the predicate applied to the first input argument|
|`right`|the predicate applied to the second input argument|

###### Return

**Type**

SObjectBiPredicate

**Description**

the composed `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
SObjectBiPredicate.everyPredicate(someSObjectPredicate1, someSObjectPredicate2);
```

##### `static always(Boolean value)`

Returns a `SObjectBiPredicate` that always evaluates to the Boolean `value` (`true` or `false`).

###### Parameters
|Param|Description|
|---|---|
|`value`|the evaluated value|

###### Return

**Type**

SObjectBiPredicate

**Description**

predicate the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
SObjectBiPredicate.always(true);
```

---
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
SObjectBiPredicate.isCompared(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.get('OtherIntField__c'),
    Comparator.defaultOrder(),
    1
);
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


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.isGreater(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.get('OtherIntField__c')
);
SObjectBiPredicate.isGreater(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
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


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.isGreater(SObjectFunction.get('NumberOfEmployees'));
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
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.isGreater('NumberOfEmployees');
SObjectBiPredicate.isGreater('Parent?.NumberOfEmployees');
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


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.isGreater(Account.NumberOfEmployees);
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


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.isGreaterOrEqual(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.get('OtherIntField__c')
);
SObjectBiPredicate.isGreaterOrEqual(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
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


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.isGreaterOrEqual(SObjectFunction.get('NumberOfEmployees'));
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
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.isGreaterOrEqual('NumberOfEmployees');
SObjectBiPredicate.isGreaterOrEqual('Parent?.NumberOfEmployees');
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


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.isGreaterOrEqual(Account.NumberOfEmployees);
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


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.isLess(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.get('OtherIntField__c')
);
SObjectBiPredicate.isLess(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
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
|`NullPointerException`|if the `function` is null|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.isLess(SObjectFunction.get('NumberOfEmployees'));
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
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.isLess('NumberOfEmployees');
SObjectBiPredicate.isLess('Parent?.NumberOfEmployees');
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


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.isLess(Account.NumberOfEmployees);
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


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.isLessOrEqual(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.get('OtherIntField__c')
);
SObjectBiPredicate.isLessOrEqual(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
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


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.isLessOrEqual(SObjectFunction.get('NumberOfEmployees'));
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
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.isLessOrEqual('NumberOfEmployees');
SObjectBiPredicate.isLessOrEqual('Parent?.NumberOfEmployees');
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


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.isLessOrEqual(Account.NumberOfEmployees);
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


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.areEqual(
SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.get('OtherIntField__c')
);
SObjectBiPredicate.areEqual(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
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


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.areEqual(SObjectFunction.get('NumberOfEmployees'));
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
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.areEqual('NumberOfEmployees');
SObjectBiPredicate.areEqual('Parent?.NumberOfEmployees');
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


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.areEqual(Account.NumberOfEmployees);
```

##### `static areEqual()`

Returns a `SObjectBiPredicate` that tests the input sobjects if the value of the first input argument is equal to the second input argument.

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.areEqual();
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


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.areNotEqual(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.get('OtherIntField__c')
);
SObjectBiPredicate.areNotEqual(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
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


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.areNotEqual(SObjectFunction.get('NumberOfEmployees'));
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
|`NullPointerException`|if `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.areNotEqual('NumberOfEmployees');
SObjectBiPredicate.areNotEqual('Parent?.NumberOfEmployees');
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


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.areNotEqual(Account.NumberOfEmployees);
```

##### `static areNotEqual()`

Returns a `SObjectBiPredicate` that tests the input sobjects if the value of the first input argument is not equal to the second input argument.

###### Return

**Type**

SObjectBiPredicate

**Description**

the `SObjectBiPredicate`


**See** Comparator.compareNullSafeUntyped

###### Example
```apex
SObjectBiPredicate.areNotEqual();
```

---
