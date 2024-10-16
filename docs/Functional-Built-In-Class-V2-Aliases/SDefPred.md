# SDefPred

`APIVERSION: 61`

`STATUS: ACTIVE`

An alias for [SObjectDefaultComparerPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectDefaultComparerPredicateProvider.md).


**Inheritance**

[SObjectComparerPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectComparerPredicateProvider.md)
 > 
[SObjectDefaultComparerPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectDefaultComparerPredicateProvider.md)
 > 
SDefPred


**Group** Functional Built-In Class V2 Aliases

## Methods
### `public virtual ComparisonOperator is(IFunction left)`

*Inherited*


Creates a `ComparisonOperator` for comparing SObjects using the provided function, with support for currying to build complex comparisons.

#### Parameters

|Param|Description|
|---|---|
|`left`|the function used to map an SObject to a comparable value|

#### Returns

|Type|Description|
|---|---|
|`ComparisonOperator`|a `ComparisonOperator` for further specification of the comparison operation|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `left` is null|

#### Example
```apex
IPredicate isRevenueGt1MPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is(new SObjectFunctionProvider().get(Account.AnnualRevenue))
    .gt()
    .var(1000000);
```


### `public virtual ComparisonOperator is()`

*Inherited*


Creates a `ComparisonOperator` using the identity function as the default mapper, with support for currying to build complex comparisons.

#### Returns

|Type|Description|
|---|---|
|`ComparisonOperator`|a `ComparisonOperator` for further specification of the comparison operation|

#### Example
```apex
IPredicate isEqJohnPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is()
    .eq()
    .var(new Account(Name = 'John'));
isEqJohnPredicate.test(new Account(Name = 'John')); // true
```


### `public virtual ComparisonOperator isVar(Object left)`

*Inherited*


Creates a `ComparisonOperator` for comparing SObjects using a constant value, with support for currying to build complex comparisons.

#### Parameters

|Param|Description|
|---|---|
|`left`|the constant value to be used for comparison|

#### Returns

|Type|Description|
|---|---|
|`ComparisonOperator`|a `ComparisonOperator` for further specification of the comparison operation|

#### Example
```apex
IPredicate isRevenueLt1MPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .isVar(1000000)
    .gt()
    .val(Account.AnnualRevenue);
isRevenueLt1MPredicate.test(new Account(AnnualRevenue = 500000)); // true
```


### `public virtual ComparisonOperator is(String left)`

*Inherited*


Creates a `ComparisonOperator` for comparing SObjects using the provided field name, with support for currying to build complex comparisons.

#### Parameters

|Param|Description|
|---|---|
|`left`|the field name of the SObject to be used for mapping|

#### Returns

|Type|Description|
|---|---|
|`ComparisonOperator`|a `ComparisonOperator` for further specification of the comparison operation|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross-reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

#### Example
```apex
SObjectComparerPredicateProvider builder = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
IPredicate isNameJohnPredicate = builder.is('Name').eq().var('John');
isNameJohnPredicate.test(new Account(Name = 'John')); // true
IPredicate isRevenueGt1MPredicate = builder.is('AnnualRevenue').gt().var(1000000);
isRevenueGt1MPredicate.test(new Account(AnnualRevenue = 2000000)); // true
// safe navigation
builder.is('Parent?.Name').eq().var('John');
```


### `public virtual ComparisonOperator is(SObjectField left)`

*Inherited*


Creates a `ComparisonOperator` for comparing SObjects using the provided SObjectField, with support for currying to build complex comparisons.

#### Parameters

|Param|Description|
|---|---|
|`left`|the SObjectField to be used for mapping|

#### Returns

|Type|Description|
|---|---|
|`ComparisonOperator`|a `ComparisonOperator` for further specification of the comparison operation|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
IPredicate isRevenueGt1MPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is(Account.AnnualRevenue)
    .gt()
    .var(1000000);
isRevenueGt1MPredicate.test(new Account(AnnualRevenue = 2000000)); // true
```


---
