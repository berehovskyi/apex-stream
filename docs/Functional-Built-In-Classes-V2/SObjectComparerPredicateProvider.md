# virtual SObjectComparerPredicateProvider

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides a fluent interface for building predicates that compare SObjects
using a comparer and currying. This builder allows you to create predicates for equality,
inequality, and relational comparisons with the ability to use fields, constants, or functions as comparands.


**Group** Functional Built-In Classes V2

## Constructors
### `public SObjectComparerPredicateProvider(IComparer comparer)`

Constructs an instance of `SObjectComparerPredicateProvider` with the provided comparer.

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
SObjectComparerPredicateProvider provider = new SObjectComparerPredicateProvider(Comparer.defaultOrder());
```


---
## Methods
### `public virtual ComparisonOperator is(IFunction left)`

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
IPredicate isNameJohnPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is(Account.Name)
    .eq()
    .var('John');
isNameJohnPredicate.test(new Account(Name = 'John')); // true
```


##### `public virtual RightComparand ne()`

Specifies that the comparison should check for inequality (`!=`).

###### Returns

|Type|Description|
|---|---|
|`RightComparand`|a `RightComparand` for specifying the right-hand side of the comparison|

###### Example
```apex
IPredicate isNameNotJohnPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is(Account.Name)
    .ne()
    .var('John');
isNameNotJohnPredicate.test(new Account(Name = 'Sam')); // true
```


##### `public virtual RightComparand gt()`

Specifies that the comparison should check if the left value is greater than (`>`) the right value.

###### Returns

|Type|Description|
|---|---|
|`RightComparand`|a `RightComparand` for specifying the right-hand side of the comparison|

###### Example
```apex
IPredicate isRevenueGt1MPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is(Account.AnnualRevenue)
    .gt()
    .var(1000000);
isRevenueGt1MPredicate.test(new Account(AnnualRevenue = 2000000)); // true
```


##### `public virtual RightComparand ge()`

Specifies that the comparison should check if the left value is greater than or equal to (`>=`) the right value.

###### Returns

|Type|Description|
|---|---|
|`RightComparand`|a `RightComparand` for specifying the right-hand side of the comparison|

###### Example
```apex
IPredicate isRevenueGte1MPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is(Account.AnnualRevenue)
    .ge()
    .var(1000000);
isRevenueGte1MPredicate.test(new Account(AnnualRevenue = 2000000)); // true
isRevenueGte1MPredicate.test(new Account(AnnualRevenue = 1000000)); // true
isRevenueGte1MPredicate.test(new Account(AnnualRevenue = 500000)); // false
```


##### `public virtual RightComparand lt()`

Specifies that the comparison should check if the left value is less than (`<`) the right value.

###### Returns

|Type|Description|
|---|---|
|`RightComparand`|a `RightComparand` for specifying the right-hand side of the comparison|

###### Example
```apex
IPredicate isRevenueLt1MPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is(Account.AnnualRevenue)
    .lt()
    .var(1000000);
isRevenueLt1MPredicate.test(new Account(AnnualRevenue = 500000)); // true
```


##### `public virtual RightComparand le()`

Specifies that the comparison should check if the left value is less than or equal to (`<=`) the right value.

###### Returns

|Type|Description|
|---|---|
|`RightComparand`|a `RightComparand` for specifying the right-hand side of the comparison|

###### Example
```apex
IPredicate isRevenueLte1MPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is(Account.AnnualRevenue)
    .le()
    .var(1000000);
isRevenueLte1MPredicate.test(new Account(AnnualRevenue = 2000000)); // false
isRevenueLte1MPredicate.test(new Account(AnnualRevenue = 1000000)); // true
isRevenueLte1MPredicate.test(new Account(AnnualRevenue = 500000)); // true
```


##### `public virtual Predicate eqNull()`

Creates a predicate that checks if the left value is equal to `null`.

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the left value is `null`|

###### Example
```apex
IPredicate isNameNullPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is(Account.Name)
    .eqNull();
isNameNullPredicate.test(new Account()); // true
isNameNullPredicate.test(new Account(Name = 'Sam')); // false
IPredicate isNullPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is()
    .eqNull();
isNullPredicate.test(null); // true
```


##### `public virtual Predicate neNull()`

Creates a predicate that checks if the left value is not equal to `null`.

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the left value is not `null`|

###### Example
```apex
IPredicate isNameNotNullPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is(Account.Name)
    .neNull();
isNameNotNullPredicate.test(new Account()); // false
isNameNotNullPredicate.test(new Account(Name = 'Sam')); // true
IPredicate isNotNullPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is()
    .neNull();
isNotNullPredicate.test(null); // false
```


---

### RightComparand

Represents the right-hand side of a comparison, allowing specification of the value
or field to compare against.

#### Methods
##### `public virtual Predicate val(IFunction right)`

Specifies a function to compare the left value against, creating a predicate that evaluates the comparison.

###### Parameters

|Param|Description|
|---|---|
|`right`|the function that maps an SObject to a comparable value|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the comparison holds for the specified function|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `right` is null|

###### Example
```apex
IPredicate isRevenueGtCfPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is(Account.AnnualRevenue)
    .gt()
    .val(new SObjectFunctionProvider().get('CustomField__c'));
isRevenueGtCfPredicate.test(new Account(AnnualRevenue = 1000000, CustomField__c = 500000)); // true
```


##### `public virtual Predicate val()`

Specifies that the left value should be compared against itself, creating a predicate that evaluates this comparison.

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the comparison holds for the left value|

###### Example
```apex
IPredicate isEqPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is(new Account(AnnualRevenue = 1000000))
    .eq()
    .val();
isEqPredicate.test(new Account(AnnualRevenue = 1000000)); // true
```


##### `public virtual Predicate var(Object right)`

Specifies a constant value to compare the left value against, creating a predicate that evaluates the comparison.

###### Parameters

|Param|Description|
|---|---|
|`right`|the constant value to compare against|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the comparison holds for the specified constant|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `right` is null|

###### Example
```apex
IPredicate isRevenueGt1MPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is(Account.AnnualRevenue)
    .gt()
    .var(1000000);
isRevenueGt1MPredicate.test(new Account(AnnualRevenue = 2000000)); // true
```


##### `public virtual Predicate val(String right)`

Specifies a field name to compare the left value against, creating a predicate that evaluates the comparison.

###### Parameters

|Param|Description|
|---|---|
|`right`|the field name to compare against|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the comparison holds for the specified field name|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `right` is blank|
|`NullPointerException`|if `right` is null|
|`SObjectException`|if provided invalid `right`|

###### Example
```apex
IPredicate isRevenueGtCfPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is(Account.AnnualRevenue)
    .gt()
    .val('CustomField__c');
isRevenueGtCfPredicate.test(new Account(AnnualRevenue = 1000000, CustomField__c = 500000)); // true
// safe navigation
IPredicate isRevenueGtParentRevenuePredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is(Account.AnnualRevenue)
    .gt()
    .val('Parent?.AnnualRevenue');
isRevenueGtParentRevenuePredicate.test(
    new Account(AnnualRevenue = 1000000, Parent = new Account(AnnualRevenue = 500000))
); // true
```


##### `public virtual Predicate val(SObjectField right)`

Specifies an SObjectField to compare the left value against, creating a predicate that evaluates the comparison.

###### Parameters

|Param|Description|
|---|---|
|`right`|the SObjectField to compare against|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the comparison holds for the specified SObjectField|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `right` is null|

###### Example
```apex
IPredicate isRevenueGtCfPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
    .is(Account.AnnualRevenue)
    .gt()
    .val(Account.CustomField__c);
isRevenueGtCfPredicate.test(new Account(AnnualRevenue = 1000000, CustomField__c = 500000)); // true
```


---

---
