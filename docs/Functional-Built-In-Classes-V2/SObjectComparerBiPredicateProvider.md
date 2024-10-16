# virtual SObjectComparerBiPredicateProvider

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides a fluent interface for building bi-predicates that compare two SObjects
using a comparer and currying. This builder allows you to create bi-predicates for equality,
inequality, and relational comparisons between two SObjects with the ability to use fields, constants,
or functions as comparands.


**Group** Functional Built-In Classes V2

## Constructors
### `public SObjectComparerBiPredicateProvider(IComparer comparer)`

Constructs an instance of `SObjectComparerBiPredicateProvider` with the provided comparer.

#### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer to be used for comparing SObject fields|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

#### Example
```apex
SObjectComparerBiPredicateProvider provider = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder());
```


---
## Methods
### `public virtual ComparisonOperator isL(IFunction left)`

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
## Classes
### ComparisonOperator

Represents the operations available for comparing an SObjects with another value or field,
utilizing currying to support flexible and reusable comparisons.

#### Methods
##### `public virtual RightComparand eq()`

Specifies that the comparison should check for equality (`==`).

###### Returns

|Type|Description|
|---|---|
|`RightComparand`|a `RightComparand` for specifying the right-hand side of the comparison|

###### Example
```apex
IBiPredicate areNamesEqBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .isL(Account.Name)
    .eq()
    .rVal(Account.Name);
areNamesEqBiPredicate.test(new Account(Name = 'John'), new Account(Name = 'John')); // true
```


##### `public virtual RightComparand ne()`

Specifies that the comparison should check for inequality (`!=`).

###### Returns

|Type|Description|
|---|---|
|`RightComparand`|a `RightComparand` for specifying the right-hand side of the comparison|

###### Example
```apex
IBiPredicate areNamesNeBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .isL(Account.Name)
    .ne()
    .rVal(Account.Name);
areNamesNeBiPredicate.test(new Account(Name = 'John'), new Account(Name = 'Jane')); // true
```


##### `public virtual RightComparand gt()`

Specifies that the comparison should check if the left value is greater than (`>`) the right value.

###### Returns

|Type|Description|
|---|---|
|`RightComparand`|a `RightComparand` for specifying the right-hand side of the comparison|

###### Example
```apex
IBiPredicate isLeftRevenueGtRightBiPredicate
    = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
        .isL(Account.AnnualRevenue)
        .gt()
        .rVal(Account.AnnualRevenue);
isLeftRevenueGtRightBiPredicate.test(
    new Account(AnnualRevenue = 2000000),
    new Account(AnnualRevenue = 1000000)
); // true
```


##### `public virtual RightComparand ge()`

Specifies that the comparison should check if the left value is greater than or equal to (`>=`) the right value.

###### Returns

|Type|Description|
|---|---|
|`RightComparand`|a `RightComparand` for specifying the right-hand side of the comparison|

###### Example
```apex
IBiPredicate isLeftRevenueGteRightBiPred = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .isL(Account.AnnualRevenue)
    .ge()
    .rVal(Account.AnnualRevenue);
isLeftRevenueGteRightBiPred.test(
    new Account(AnnualRevenue = 1000000),
    new Account(AnnualRevenue = 1000000)
); // true
```


##### `public virtual RightComparand lt()`

Specifies that the comparison should check if the left value is less than (`<`) the right value.

###### Returns

|Type|Description|
|---|---|
|`RightComparand`|a `RightComparand` for specifying the right-hand side of the comparison|

###### Example
```apex
IBiPredicate isLeftRevenueLtRightBiPredicate
    = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
        .isL(Account.AnnualRevenue)
        .lt()
        .rVal(Account.AnnualRevenue);
isLeftRevenueLtRightBiPredicate.test(
    new Account(AnnualRevenue = 500000),
    new Account(AnnualRevenue = 1000000)
); // true
```


##### `public virtual RightComparand le()`

Specifies that the comparison should check if the left value is less than or equal to (`<=`) the right value.

###### Returns

|Type|Description|
|---|---|
|`RightComparand`|a `RightComparand` for specifying the right-hand side of the comparison|

###### Example
```apex
IBiPredicate isLeftRevenueLteRightBiPred = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .isL(Account.AnnualRevenue)
    .le()
    .rVal(Account.AnnualRevenue);
isLeftRevenueLteRightBiPred.test(
    new Account(AnnualRevenue = 1000000),
    new Account(AnnualRevenue = 1000000)
); // true
```


---

### RightComparand

Represents the right-hand side of a comparison, allowing specification of the value
or field to compare against.

#### Methods
##### `public virtual BiPredicate rVal(IFunction right)`

Specifies a function to compare the left value against, creating a `BiPredicate` that evaluates the comparison between two SObjects.

###### Parameters

|Param|Description|
|---|---|
|`right`|the function that maps the right SObject to a comparable value|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|a `BiPredicate` that returns true if the comparison holds for the specified function|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `right` is null|

###### Example
```apex
IBiPredicate areRevenuesEqBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .isL(Account.AnnualRevenue)
    .eq()
    .rVal(new SObjectFunctionProvider().get(Account.AnnualRevenue));
areRevenuesEqBiPredicate.test(
    new Account(AnnualRevenue = 1000000),
    new Account(AnnualRevenue = 1000000)
); // true
```


##### `public virtual BiPredicate rVal()`

Specifies that the left value should be compared against itself, creating a `BiPredicate` that evaluates this comparison.

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|a `BiPredicate` that returns true if the comparison holds for the left value|

###### Example
```apex
IBiPredicate areAccountsEqBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .isL()
    .eq()
    .rVal();
areAccountsEqBiPredicate.test(
    new Account(Id = '001000000000000AAA'),
    new Account(Id = '001000000000000AAA')
); // true
```


##### `public virtual BiPredicate rVar(Object right)`

Specifies a constant value to compare the left value against, creating a `BiPredicate` that evaluates the comparison.

###### Parameters

|Param|Description|
|---|---|
|`right`|the constant value to compare against|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|a `BiPredicate` that returns true if the comparison holds for the specified constant|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `right` is null|

###### Example
```apex
IBiPredicate isLeftRevenueGt1MBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .isL('AnnualRevenue')
    .gt()
    .rVar(1000000);
isLeftRevenueGt1MBiPredicate.test(
    new Account(AnnualRevenue = 1500000),
    new Account()
); // true
```


##### `public virtual BiPredicate rVal(String right)`

Specifies a field name to compare the left value against, creating a `BiPredicate` that evaluates the comparison.

###### Parameters

|Param|Description|
|---|---|
|`right`|the field name to compare against|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|a `BiPredicate` that returns true if the comparison holds for the specified field name|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross-reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
IBiPredicate isRevenueGtCfBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .isL(Account.AnnualRevenue)
    .gt()
    .rVal('CustomField__c');
isRevenueGtCfBiPredicate.test(
    new Account(AnnualRevenue = 1000000),
    new Account(CustomField__c = 500000)
); // true
// safe navigation
IBiPredicate isRevenueGtParentRevenueBiPred = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .isL(Account.AnnualRevenue)
    .gt()
    .rVal('Parent?.AnnualRevenue');
isRevenueGtParentRevenueBiPred.test(
    new Account(AnnualRevenue = 1000000),
    new Account(Parent = new Account(AnnualRevenue = 500000))
); // true
```


##### `public virtual BiPredicate rVal(SObjectField right)`

Specifies an SObjectField to compare the left value against, creating a `BiPredicate` that evaluates the comparison.

###### Parameters

|Param|Description|
|---|---|
|`right`|the SObjectField to compare against|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|a `BiPredicate` that returns true if the comparison holds for the specified SObjectField|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `right` is null|

###### Example
```apex
IBiPredicate isRevenueGtCfBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    .isL(Account.AnnualRevenue)
    .gt()
    .rVal(Account.CustomField__c);
isRevenueGtCfBiPredicate.test(
    new Account(AnnualRevenue = 1000000),
    new Account(CustomField__c = 500000)
); // true
```


---

---
