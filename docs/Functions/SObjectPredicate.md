# SObjectPredicate

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ISObjectPredicate](/docs/Functional-Interfaces/ISObjectPredicate.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions


**See** ISObjectIterable.filter


**See** ISObjectIterable.take


**See** ISObjectIterable.drop


**See** ISObjectIterable.find


**See** ISObjectIterable.some


**See** ISObjectIterable.every


**See** ISObjectIterable.none

## Methods
### `test(SObject sObj)`
#### Parameters
|Param|Description|
|---|---|

### `orElse(ISObjectPredicate other)`

Returns a composed `SObjectPredicate` that applies short-circuiting logical `OR` operator to `this` `ISObjectPredicate` and `other` in that order.

#### Parameters
|Param|Description|
|---|---|
|`other`|the other `ISObjectPredicate`|

#### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

#### Example
```apex
someSObjectPredicate1.orElse(someSObjectPredicate2);
```

### `andAlso(ISObjectPredicate other)`

Returns a composed `SObjectPredicate` that applies short-circuiting logical `AND` operator to `this` `ISObjectPredicate` and `other` in that order.

#### Parameters
|Param|Description|
|---|---|
|`other`|the other `ISObjectPredicate`|

#### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

#### Example
```apex
someSObjectPredicate1.andAlso(someSObjectPredicate2);
```

### `negate()`

Returns a `SObjectPredicate` that applies logical `NOT` operator to `this` `ISObjectPredicate`.

#### Return

**Type**

SObjectPredicate

**Description**

the negated `SObjectPredicate`

#### Example
```apex
someSObjectPredicate.negate();
```

### `static some(List<ISObjectPredicate> predicates)`

Returns a composed `SObjectPredicate` that applies sequentially short-circuiting logical `OR` operator to `predicates` in the same order as the order of the input list.

#### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`ISObjectPredicates`|

#### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

#### Example
```apex
SObjectPredicate.some(someSObjectPredicates);
```

### `static some(ISObjectPredicate predicate1, ISObjectPredicate predicate2)`

Returns a composed `SObjectPredicate` that applies short-circuiting logical `OR` operator to `predicate1` `ISObjectPredicate` and `predicate2` in that order.

#### Parameters
|Param|Description|
|---|---|
|`predicate1`|the first `ISObjectPredicate`|
|`predicate2`|the second `ISObjectPredicate`|

#### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate1` or `predicate2` is null|

#### Example
```apex
SObjectPredicate.some(someSObjectPredicate1, someSObjectPredicate2);
```

### `static every(List<ISObjectPredicate> predicates)`

Returns a composed `SObjectPredicate` that applies sequentially short-circuiting logical `AND` operator to `predicates` in the same order as the order of the input list.

#### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`ISObjectPredicates`|

#### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

#### Example
```apex
SObjectPredicate.every(someSObjectPredicates);
```

### `static every(ISObjectPredicate predicate1, ISObjectPredicate predicate2)`

Returns a composed `SObjectPredicate` that applies short-circuiting logical `AND` operator to `predicate1` `ISObjectPredicate` and `predicate2` in that order.

#### Parameters
|Param|Description|
|---|---|
|`predicate1`|the first `ISObjectPredicate`|
|`predicate2`|the second `ISObjectPredicate`|

#### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate1` or `predicate2` is null|

#### Example
```apex
SObjectPredicate.every(someSObjectPredicate1, someSObjectPredicate2);
```

### `static negate(ISObjectPredicate predicate)`

Returns a `SObjectPredicate` that applies logical `NOT` operator to `predicate`.

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the `ISObjectPredicate`|

#### Return

**Type**

SObjectPredicate

**Description**

the negated `SObjectPredicate`

#### Example
```apex
SObjectPredicate.negate(someSObjectPredicate);
```

### `static always(Boolean value)`

Returns a `SObjectPredicate` that always evaluates to the Boolean `value` (`true` or `false`).

#### Parameters
|Param|Description|
|---|---|
|`value`|the evaluated value|

#### Return

**Type**

SObjectPredicate

**Description**

predicate the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

#### Example
```apex
SObjectPredicate.always(true);
```

### `static compose(ISObjectFunction mapper, IPredicate predicate)`

Returns a composed `SObjectPredicate` of the `ISObjectFunction` and the `IPredicate`.

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

#### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

#### Example
```apex
SObjectPredicate.compose(someSObjectFunction, somePredicate);
SObjectPredicate.compose(SObjectFunction.get('Name'), StringPredicate.startsWith('A'));
```

### `static compose(ISObjectToIntFunction mapper, IIntPredicate predicate)`

Returns a composed `SObjectPredicate` of the `ISObjectToIntFunction` and the `IIntPredicate`.

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

#### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

#### Example
```apex
SObjectPredicate.compose(someSObjectToIntFunction, someIntPredicate);
SObjectPredicate.compose(
    SObjectToIntFunction.get('NumberOfEmployees'),
    IntPredicate.isEven()
);
```

### `static compose(ISObjectToLongFunction mapper, ILongPredicate predicate)`

Returns a composed `SObjectPredicate` of the `ISObjectToLongFunction` and the `ILongPredicate`.

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

#### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

#### Example
```apex
SObjectPredicate.compose(someSObjectToLongFunction, someLongPredicate);
SObjectPredicate.compose(
    SObjectToLongFunction.get('NumberOfEmployees'),
    LongPredicate.isEven()
);
```

### `static compose(ISObjectToDoubleFunction mapper, IDoublePredicate predicate)`

Returns a composed `SObjectPredicate` of the `ISObjectToDoubleFunction` and the `IDoublePredicate`.

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

#### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

#### Example
```apex
SObjectPredicate.compose(someSObjectToDoubleFunction, someDoublePredicate);
SObjectPredicate.compose(
    SObjectToDoubleFunction.get('ShippingLatitude'),
    DoublePredicate.isPositive()
);
```

### `static isCompared(ISObjectFunction left, ISObjectFunction right, IComparator comparator, Integer result)`

Returns a `SObjectPredicate` that tests if the result of comparing the values returned by the applied `left` and `right` functions by the `comparator` is equal to the expected `result`.

#### Parameters
|Param|Description|
|---|---|
|`left`|the function applied to the input argument the result of which is passed to the `comparator` as the first argument|
|`right`|the function applied to the input argument the result of which is passed to the `comparator` as the second argument|
|`comparator`|the function that compares two arguments|
|`result`|the expected result of comparison (1, -1, or 0)|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right`, or `comparator`, or `result` is null|

#### Example
```apex
SObjectPredicate.isCompared(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.get('OtherIntField__c'),
    Comparator.defaultOrder(),
    1
);
```

### `static isGreater(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `left` function is greater than the result returned by the `right` function. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isGreater(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.get('OtherIntField__c')
);
SObjectPredicate.isGreater(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

### `static isGreater(String fieldName, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `fieldName` is greater than the result returned by the `function`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isGreater('NumberOfEmployees', SObjectFunction.get('OtherIntField__c'));
SObjectPredicate.isGreater(
    'Parent?.NumberOfEmployees',
    SObjectFunction.constant(100)
);
```

### `static isGreater(SObjectField field, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `field` is greater than the result returned by the `function`. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
<pre>
SObjectPredicate.isGreater(
        Account.NumberOfEmployees,
        SObjectFunction.get('OtherIntField__c')
    );
SObjectPredicate.isGreater(
        Account.NumberOfEmployees,
        SObjectFunction.constant(100)
    );
</pre>
```

### `static isGreater(String fieldName, Object value)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `fieldName` is greater than the `value`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isGreater('NumberOfEmployees', 100);
SObjectPredicate.isGreater('Parent?.NumberOfEmployees', 100);
```

### `static isGreater(SObjectField field, Object value)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `field` is greater than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `>` &quot;greater than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isGreater(Account.NumberOfEmployees, 100);
```

### `static isGreaterOrEqual(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `left` function is greater than or equal to the result returned by the `right` function. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isGreaterOrEqual(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.get('OtherIntField__c')
);
SObjectPredicate.isGreaterOrEqual(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

### `static isGreaterOrEqual(String fieldName, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `fieldName` is greater than or equal to the result returned by the `function`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isGreaterOrEqual(
    'NumberOfEmployees',
    SObjectFunction.get('OtherIntField__c')
);
SObjectPredicate.isGreaterOrEqual(
    'Parent?.NumberOfEmployees',
    SObjectFunction.constant(100)
);
```

### `static isGreaterOrEqual(SObjectField field, ISObjectFunction function)`

Returns a `SObjectPredicate` that teststhe input SObject  if the value of the `field` is greater than or equal to the result returned by the `function`. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isGreaterOrEqual(
    Account.NumberOfEmployees,
    SObjectFunction.get('OtherIntField__c')
);
SObjectPredicate.isGreaterOrEqual(
    Account.NumberOfEmployees,
    SObjectFunction.constant(100)
);
```

### `static isGreaterOrEqual(String fieldName, Object value)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `fieldName` is greater than or equal to the `value`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isGreaterOrEqual('NumberOfEmployees', 100);
SObjectPredicate.isGreaterOrEqual('Parent?.NumberOfEmployees', 100);
```

### `static isGreaterOrEqual(SObjectField field, Object value)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `field` is greater than or equal to the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `>=` &quot;greater than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isGreaterOrEqual(Account.NumberOfEmployees, 100);
```

### `static isLess(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectPredicate` that tests if the result returned by the `left` function is less than the result returned by the `right` function. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison.|
|`right`|the function whose application result is considered as the right argument of comparison.|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isLess(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.get('OtherIntField__c')
);
SObjectPredicate.isLess(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

### `static isLess(String fieldName, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests if the value of the `fieldName` is less than the result returned by the `function`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison.|
|`function`|the function whose application result is considered as the right argument of comparison.|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isLess('NumberOfEmployees', SObjectFunction.get('OtherIntField__c'));
SObjectPredicate.isLess(
    'Parent?.NumberOfEmployees',
    SObjectFunction.constant(100)
);
```

### `static isLess(SObjectField field, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests if the value of the `field` is less than the result returned by the `function`. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison.|
|`function`|the function whose application result is considered as the right argument of comparison.|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
<pre>
SObjectPredicate.isLess(
    Account.NumberOfEmployees,
    SObjectFunction.get('OtherIntField__c')
);
SObjectPredicate.isLess(
    Account.NumberOfEmployees,
    SObjectFunction.constant(100)
);
```

### `static isLess(String fieldName, Object value)`

Returns a `SObjectPredicate` that tests if the value of the `fieldName` is less than the `value`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison.|
|`value`|the right argument of comparison.|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isLess('NumberOfEmployees', 100);
SObjectPredicate.isLess('Parent?.NumberOfEmployees', 100);
```

### `static isLess(SObjectField field, Object value)`

Returns a `SObjectPredicate` that tests if the value of the `field` is less than the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<` &quot;less than&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison.|
|`value`|the right argument of comparison.|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isLess(Account.NumberOfEmployees, 100);
```

### `static isLessOrEqual(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectPredicate` that tests if the result returned by the `left` function is less than or equal to the result returned by the `right` function. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison.|
|`right`|the function whose application result is considered as the right argument of comparison.|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isLessOrEqual(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.get('OtherIntField__c')
);
SObjectPredicate.isLessOrEqual(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

### `static isLessOrEqual(String fieldName, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests if the value of the `fieldName` is less than or equal to the result returned by the `function`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison.|
|`function`|the function whose application result is considered as the right argument of comparison.|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isLessOrEqual(
    'NumberOfEmployees',
     SObjectFunction.get('OtherIntField__c')
);
SObjectPredicate.isLessOrEqual(
    'Parent?.NumberOfEmployees',
    SObjectFunction.constant(100)
);
```

### `static isLessOrEqual(SObjectField field, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests if the value of the `field` is less than or equal to the result returned by the `function`. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison.|
|`function`|the function whose application result is considered as the right argument of comparison.|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isLessOrEqual(
    Account.NumberOfEmployees,
    SObjectFunction.get('OtherIntField__c')
);
SObjectPredicate.isLessOrEqual(
    Account.NumberOfEmployees,
    SObjectFunction.constant(100)
);
```

### `static isLessOrEqual(String fieldName, Object value)`

Returns a `SObjectPredicate` that tests if the value of the `fieldName` is less than or equal to the `value`. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison.|
|`value`|the right argument of comparison.|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isLessOrEqual('NumberOfEmployees', 100);
SObjectPredicate.isLessOrEqual('Parent?.NumberOfEmployees', 100);
```

### `static isLessOrEqual(SObjectField field, Object value)`

Returns a `SObjectPredicate` that tests if the value of the `field` is less than or equal to the `value`. <p><strong>Note: </strong></p> <p>Unlike the standard `<=` &quot;less than or equal to&quot; operator, the predicate function supports comparison of all primitive types and considers a non-null value as always greater than a null value.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison.|
|`value`|the right argument of comparison.|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isLessOrEqual(Account.NumberOfEmployees, 100);
```

### `static isEqual(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `left` function is equal to the result returned by the `right` function, comparing object value equality not reference equality.

#### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isEqual(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.get('OtherIntField__c')
);
SObjectPredicate.isEqual(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

### `static isEqual(String fieldName, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `fieldName` is equal to the result returned by the `function`, comparing object value equality not reference equality. Cross-reference fields and safe navigation are supported.

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isEqual(
    'NumberOfEmployees',
     SObjectFunction.get('OtherIntField__c')
);
SObjectPredicate.isEqual(
    'Parent?.NumberOfEmployees',
    SObjectFunction.constant(100)
);
```

### `static isEqual(SObjectField field, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `field` is equal to the result returned by the `function`, comparing object value equality not reference equality.

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isEqual(
    Account.NumberOfEmployees,
    SObjectFunction.get('OtherIntField__c')
);
SObjectPredicate.isEqual(
    Account.NumberOfEmployees,
    SObjectFunction.constant(100)
);
```

### `static isEqual(String fieldName, Object value)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `fieldName` is equal to the `value`, comparing object value equality not reference equality. Cross-reference fields and safe navigation are supported.

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isEqual('NumberOfEmployees', 100);
SObjectPredicate.isEqual('Parent?.NumberOfEmployees', 100);
```

### `static isEqual(SObjectField field, Object value)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `field` is equal to the `value`, comparing object value equality not reference equality.

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isEqual(Account.NumberOfEmployees, 100);
```

### `static isEqual(ISObjectUnaryOperator left, ISObjectUnaryOperator right)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `left` operator is equal to the result returned by the `right` operator, comparing SObject value equality not reference equality.

#### Parameters
|Param|Description|
|---|---|
|`left`|the operator whose application result is considered as the left argument of comparison|
|`right`|the operator whose application result is considered as the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left` or the `right` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isEqual(
    SObjectUnaryOperator.getSObject('ParentId'),
    SObjectUnaryOperator.getSObject('AnotherParentId')
);
```

### `static isEqual(ISObjectUnaryOperator operator)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `identity` function is equal to the result returned by the `operator`, comparing SObject value equality not reference equality.

#### Parameters
|Param|Description|
|---|---|
|`operator`|the function whose application result is considered as the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `operator` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isEqual(SObjectUnaryOperator.getSObject('ParentId'));
```

### `static isEqual(SObject value)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `identity` function is equal to the `value`, comparing SObject value equality not reference equality.

#### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `operator` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isEqual(someAccount);
```

### `static isNotEqual(ISObjectFunction left, ISObjectFunction right)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `left` function is not equal to the result returned by the `right` function, comparing object value equality not reference equality.

#### Parameters
|Param|Description|
|---|---|
|`left`|the function whose application result is considered as the left argument of comparison|
|`right`|the function whose application result is considered as the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left`, or the `right` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isEqual(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.get('OtherIntField__c')
);
SObjectPredicate.isEqual(
    SObjectFunction.get('NumberOfEmployees'),
    SObjectFunction.constant(100)
);
```

### `static isNotEqual(String fieldName, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `fieldName` is not equal to the result returned by the `function`, comparing object value equality not reference equality. Cross-reference fields and safe navigation are supported.

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isEqual(
    'NumberOfEmployees',
     SObjectFunction.get('OtherIntField__c')
);
SObjectPredicate.isEqual(
    'Parent?.NumberOfEmployees',
    SObjectFunction.constant(100)
);
```

### `static isNotEqual(SObjectField field, ISObjectFunction function)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `field` is not equal to the result returned by the `function`, comparing object value equality not reference equality.

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`function`|the function whose application result is considered as the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `function` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isEqual(
    Account.NumberOfEmployees,
    SObjectFunction.get('OtherIntField__c')
);
SObjectPredicate.isEqual(
    Account.NumberOfEmployees,
    SObjectFunction.constant(100)
);
```

### `static isNotEqual(String fieldName, Object value)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `fieldName` is not equal to the `value`, comparing object value equality not reference equality. Cross-reference fields and safe navigation are supported.

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isEqual('NumberOfEmployees', 100);
SObjectPredicate.isEqual('Parent?.NumberOfEmployees', 100);
```

### `static isNotEqual(SObjectField field, Object value)`

Returns a `SObjectPredicate` that tests the input SObject if the value of the `field` is not equal to the `value`, comparing object value equality not reference equality.

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is considered the left argument of comparison|
|`value`|the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isEqual(Account.NumberOfEmployees, 100);
```

### `static isNotEqual(ISObjectUnaryOperator left, ISObjectUnaryOperator right)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `left` operator is not equal to the result returned by the `right` operator, comparing SObject value equality not reference equality.

#### Parameters
|Param|Description|
|---|---|
|`left`|the operator whose application result is considered as the left argument of comparison|
|`right`|the operator whose application result is considered as the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `left` or the `right` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isNotEqual(
    SObjectUnaryOperator.getSObject('ParentId'),
    SObjectUnaryOperator.getSObject('AnotherParentId')
);
```

### `static isNotEqual(ISObjectUnaryOperator operator)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `identity` function is not equal to the result returned by the `operator`, comparing SObject value equality not reference equality.

#### Parameters
|Param|Description|
|---|---|
|`operator`|the function whose application result is considered as the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `operator` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isEqual(SObjectUnaryOperator.getSObject('ParentId'));
```

### `static isNotEqual(SObject value)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `identity` function is not equal to the `value`, comparing SObject value equality not reference equality.

#### Parameters
|Param|Description|
|---|---|
|`value`|the right argument of comparison|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `operator` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isEqual(someAccount);
```

### `static isLike(ISObjectFunction function, String likeString)`

Returns a `SObjectPredicate` that tests the input SObject if the string returned by the `function` matches the `likeString` pattern. Supports the `%` and the `_` wildcards and is case-insensitive.

#### Parameters
|Param|Description|
|---|---|
|`function`|the function whose application result string is tested|
|`likeString`|the pattern that is tested to match the string returned by the `function`|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `function`, or the `likeString` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isLike(SObjectFunction.get('Name'), '%a_e');
SObjectPredicate.isLike(SObjectFunction.get(Account.Name), '%a_e');
```

### `static isLike(String fieldName, String likeString)`

Returns a `SObjectPredicate` that tests the input SObject if the string value of the `fieldName` matches the `likeString` pattern. Supports the `%` and the `_` wildcards and is case-insensitive. Cross-reference fields and safe navigation are supported.

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is tested|
|`likeString`|the pattern that is tested to match the string value of the `fieldName`|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `likeString` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isLike('Name', '%a_e');
SObjectPredicate.isLike('Parent?.Name', '%a_e');
```

### `static isLike(SObjectField field, String likeString)`

Returns a `SObjectPredicate` that tests the input SObject if the string value of the `field` matches the `likeString` pattern. Supports the `%` and the `_` wildcards and is case-insensitive. Cross-reference fields and safe navigation are supported.

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is tested|
|`likeString`|the pattern that is tested to match the string value of the `field`|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field`, or the `likeString` is null|


**See** Comparator.compareNullSafeUntyped

#### Example
```apex
SObjectPredicate.isLike(Account.Name, '%a_e');
```

### `static isIn(ISObjectFunction function, List<Object> container)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `function` is contained in the `container`.

#### Parameters
|Param|Description|
|---|---|
|`function`|the function whose application result is tested|
|`container`|the list that checks for the presence of an element|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `function`, or the `container` is null|


**See** List.contains

#### Example
```apex
SObjectPredicate.isIn(SObjectFunction.get('Name'), listOfNames);
```

### `static isIn(String fieldName, List<Object> container)`

Returns a `SObjectPredicate` that tests the input SObject if the the value of the `fieldName` is contained in the `container`. Cross-reference fields and safe navigation are supported.

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is tested|
|`container`|the list that checks for the presence of an element|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `container` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** List.contains

#### Example
```apex
SObjectPredicate.isIn('Name', listOfNames);
SObjectPredicate.isIn('Parent?.Name', listOfNames);
```

### `static isIn(SObjectField field, List<Object> container)`

Returns a `SObjectPredicate` that tests the input SObject if the the value of the `field` is contained in the `container`.

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is tested|
|`container`|the list that checks for the presence of an element|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field`, or the `container` is null|


**See** List.contains

#### Example
```apex
SObjectPredicate.isIn('Name', listOfNames);
SObjectPredicate.isIn('Parent?.Name', listOfNames);
```

### `static isIn(List<SObject> container)`

Returns a `SObjectPredicate` that tests the input sobject is contained in the `container`.

#### Parameters
|Param|Description|
|---|---|
|`container`|the list that checks for the presence of an element|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `container` is null|


**See** List.contains

#### Example
```apex
SObjectPredicate.isNotIn(listOfNames);
```

### `static isNotIn(ISObjectFunction function, List<Object> container)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `function` is not contained in the `container`.

#### Parameters
|Param|Description|
|---|---|
|`function`|the function whose application result is tested|
|`container`|the list that checks for the presence of an element|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `function`, or the `container` is null|


**See** List.contains

#### Example
```apex
SObjectPredicate.isNotIn(SObjectFunction.get('Name'), listOfNames);
```

### `static isNotIn(String fieldName, List<Object> container)`

Returns a `SObjectPredicate` that tests the input SObject if the the value of the `fieldName` is not contained in the `container`. Cross-reference fields and safe navigation are supported.

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is tested|
|`container`|the list that checks for the presence of an element|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank, or the `container` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** List.contains

#### Example
```apex
SObjectPredicate.isNotIn('Name', listOfNames);
SObjectPredicate.isNotIn('Parent?.Name', listOfNames);
```

### `static isNotIn(SObjectField field, List<Object> container)`

Returns a `SObjectPredicate` that tests the input SObject if the the value of the `field` is not contained in the `container`.

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is tested|
|`container`|the list that checks for the presence of an element|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field`, or the `container` is null|


**See** List.contains

#### Example
```apex
SObjectPredicate.isNotIn('Name', listOfNames);
SObjectPredicate.isNotIn('Parent?.Name', listOfNames);
```

### `static isNotIn(List<SObject> container)`

Returns a `SObjectPredicate` that tests the input SObject if it is not contained in the `container`.

#### Parameters
|Param|Description|
|---|---|
|`container`|the list that checks for the presence of an element|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `container` is null|


**See** List.contains

#### Example
```apex
SObjectPredicate.isNotIn(listOfNames);
```

### `static isNull()`

Returns a `SObjectPredicate` that tests the input SObject if it is null.

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Example
```apex
SObjectPredicate.isNull();
```

### `static isNotNull()`

Returns a `SObjectPredicate` that tests the input SObject if it is not null.

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Example
```apex
SObjectPredicate.isNotNull();
```

### `static has(ISObjectFunction function)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `function` is not null.

#### Parameters
|Param|Description|
|---|---|
|`function`|the function whose application result is tested|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `function` is null|


**See** SObjectPredicate.isNotEqual

#### Example
```apex
SObjectPredicate.has(SObjectFunction.get('Name'));
SObjectPredicate.has(SObjectFunction.get(Account.Name));
```

### `static has(String fieldName)`

Returns a `SObjectPredicate` that tests the input SObject if the value the `fieldName` is not null. Cross-reference fields and safe navigation are supported.

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is tested|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectPredicate.isNotEqual


**See** SObjectFunction.get

#### Example
```apex
SObjectPredicate.has('Name');
SObjectPredicate.has('Parent?.Name');
```

### `static has(SObjectField field)`

Returns a `SObjectPredicate` that tests the input SObject if the value the `field` is not null.

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is tested|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** SObjectPredicate.isNotEqual


**See** SObjectFunction.get

#### Example
```apex
SObjectPredicate.has(Account.Name);
```

### `static hasSObject(ISObjectUnaryOperator operator)`

Returns a `SObjectPredicate` that tests the input SObject if the result returned by the `operator` is not null.

#### Parameters
|Param|Description|
|---|---|
|`operator`|the operator whose application result is tested|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `operator` is null|


**See** SObjectPredicate.isNotEqual

#### Example
```apex
SObjectPredicate.hasSObject(SObjectFunction.getSObject('Parent'));
SObjectPredicate.hasSObject(SObjectFunction.getSObject(Account.ParentId));
```

### `static hasSObject(String fieldName)`

Returns a `SObjectPredicate` that tests the input SObject if the parent SObject by the `fieldName` is not null. Cross-reference fields and safe navigation are supported.

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is tested|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectPredicate.isNotEqual


**See** SObjectUnaryOperator.getSObject

#### Example
```apex
SObjectPredicate.hasSObject('Parent');
SObjectPredicate.hasSObject('Parent?.Parent');
```

### `static hasSObject(SObjectField field)`

Returns a `SObjectPredicate` that tests the input SObject if the parent SObject by the `fieldName` is not null.

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is tested|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** SObjectPredicate.isNotEqual


**See** SObjectUnaryOperator.getSObject

#### Example
```apex
SObjectPredicate.hasSObject(Account.ParentId);
```

### `static hasSObjects(String fieldName)`

Returns a `SObjectPredicate` that tests the input SObject if the children sobjects by the `fieldName` is not null. Cross-reference fields and safe navigation are supported.

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is tested|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObjectPredicate.isNotEqual


**See** SObjectFunction.getSObjects

#### Example
```apex
SObjectPredicate.hasSObjects('Parent');
SObjectPredicate.hasSObjects('Parent?.Parent');
```

### `static hasSObjects(SObjectField field)`

Returns a `SObjectPredicate` that tests the input SObject if the children sobjects by the `field` is not null.

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is tested|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `field` is null|


**See** SObjectPredicate.isNotEqual

#### Example
```apex
SObjectPredicate.hasSObjects(Contact.AccountId);
```

### `static hasErrors()`

Returns a `SObjectPredicate` that tests the input SObject if it has errors

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`


**See** SObject.hasErrors

### `static isClone()`

Returns a `SObjectPredicate` that tests the input SObject if it is a clone

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`


**See** SObject.isClone

### `static isSet(String fieldName)`

Returns a `SObjectPredicate` that tests the input SObject if its `fieldName` is populated, either by direct assignment or by inclusion in a SOQL query. Cross-reference fields and safe navigation are supported.

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the value of which is tested|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `fieldName` is blank|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** SObject.isSet

#### Example
```apex
SObjectPredicate.isSet('Name');
SObjectPredicate.isSet('ParentId');
SObjectPredicate.isSet('Parent?.ParentId');
```

### `static isSet(SObjectField field)`

Returns a `SObjectPredicate` that tests the input SObject if its `field` is populated, either by direct assignment or by inclusion in a SOQL query.

#### Parameters
|Param|Description|
|---|---|
|`field`|the value of which is tested|

#### Return

**Type**

SObjectPredicate

**Description**

the `SObjectPredicate`


**See** SObject.isSet

#### Example
```apex
SObjectPredicate.isSet(Account.Name);
SObjectPredicate.isSet(Account.ParentId);
```

---
