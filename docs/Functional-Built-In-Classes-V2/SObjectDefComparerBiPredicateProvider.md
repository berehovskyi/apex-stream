# virtual SObjectDefComparerBiPredicateProvider

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides a fluent interface for building bi-predicates
that uses the default comparer for comparing two SObjects.
<p><strong>Note: </strong></p>
<p>Bi-predicates built with this builder consider a non-null value as always greater than a null value.</p>


**Inheritance**

[SObjectComparerBiPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectComparerBiPredicateProvider.md)
 > 
SObjectDefComparerBiPredicateProvider


**Group** Functional Built-In Classes V2

## Constructors
### `public SObjectDefComparerBiPredicateProvider()`

Creates a new instance of `SObjectDefComparerBiPredicateProvider` using the default comparer.

---
## Methods
### `public virtual ComparisonOperator isL(IFunction left)`

*Inherited*


Creates a `ComparisonOperator` for comparing the left value of two SObjects using the provided function, with support for currying to build complex comparisons.

#### Parameters

|Param|Description|
|---|---|
|`left`|the function used to map the left SObject to a comparable value|

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
IBiPredicate areRevenuesEqBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .isL(new SObjectFunctionProvider().get(Account.AnnualRevenue))
    .eq()
    .rVal(new SObjectFunctionProvider().get(Account.AnnualRevenue));
areRevenuesEqBiPredicate.test(
    new Account(AnnualRevenue = 1000000),
    new Account(AnnualRevenue = 1000000)
); // true
```


### `public virtual ComparisonOperator isL()`

*Inherited*


Creates a `ComparisonOperator` using the identity function as the default mapper for the left SObject, with support for currying to build complex comparisons.

#### Returns

|Type|Description|
|---|---|
|`ComparisonOperator`|a `ComparisonOperator` for further specification of the comparison operation|

#### Example
```apex
IBiPredicate areEqAccountsBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .isL()
    .eq()
    .rVal();
areEqAccountsBiPredicate.test(
    new Account(Id = '001000000000000AAA'),
    new Account(Id = '001000000000000AAA')
); // true
```


### `public virtual ComparisonOperator isLVar(Object left)`

*Inherited*


Creates a `ComparisonOperator` for comparing the left value of two SObjects using a constant value, with support for currying to build complex comparisons.

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
IBiPredicate isRightRevenueLt1MBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .isLVar(1000000)
    .gt()
    .rVal('AnnualRevenue');
isRightRevenueLt1MBiPredicate.test(
    new Account(),
    new Account(AnnualRevenue = 500000)
); // true
```


### `public virtual ComparisonOperator isL(String left)`

*Inherited*


Creates a `ComparisonOperator` for comparing the left value of two SObjects using the provided field name, with support for currying to build complex comparisons.

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
IBiPredicate areNamesEqBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .isL('Name')
    .eq()
    .rVal('Name');
areNamesEqBiPredicate.test(new Account(Name = 'John'), new Account(Name = 'John')); // true
// safe navigation
new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .isL('Parent?.Name')
    .eq()
    .rVal('Parent?.Name');
```


### `public virtual ComparisonOperator isL(SObjectField left)`

*Inherited*


Creates a `ComparisonOperator` for comparing the left value of two SObjects using the provided SObjectField, with support for currying to build complex comparisons.

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
|`NullPointerException`|if `left` is null|

#### Example
```apex
IBiPredicate areNamesEqPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .isL(Account.Name)
    .eq()
    .rVal(Account.Name);
areNamesEqPredicate.test(new Account(Name = 'John'), new Account(Name = 'John')); // true
```


### `public virtual BiPredicate areEq()`

*Inherited*


Creates a `BiPredicate` that checks if the left and right SObject values are equal.

#### Returns

|Type|Description|
|---|---|
|`BiPredicate`|a `BiPredicate` that returns true if the left and right values are equal|

#### Example
```apex
IBiPredicate areEqAccountsBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .areEq();
areEqAccountsBiPredicate.test(
    new Account(Name = 'John'),
    new Account(Name = 'John')
); // true
```


### `public virtual BiPredicate areNe()`

*Inherited*


Creates a `BiPredicate` that checks if the left and right SObject values are not equal.

#### Returns

|Type|Description|
|---|---|
|`BiPredicate`|a `BiPredicate` that returns true if the left and right values are not equal|

#### Example
```apex
IBiPredicate areNeAccountsBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .areNe();
areNeAccountsBiPredicate.test(
    new Account(Name = 'John'),
    new Account(Name = 'Jane')
); // true
```


---
