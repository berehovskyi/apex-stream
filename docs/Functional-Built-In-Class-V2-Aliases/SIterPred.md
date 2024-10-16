# SIterPred

`APIVERSION: 61`

`STATUS: ACTIVE`

An alias for [SObjectIterablePredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectIterablePredicateProvider.md).


**Inheritance**

[SObjectIterablePredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectIterablePredicateProvider.md)
 > 
SIterPred


**Group** Functional Built-In Class V2 Aliases

## Methods
### `public virtual SObjectIterableOperator is(IFunction mapper)`

*Inherited*


Creates an instance of `SObjectIterablePredicate` using the provided mapping function.

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the function used to map an SObject to a comparable value|

#### Returns

|Type|Description|
|---|---|
|`SObjectIterableOperator`|the `SObjectIterablePredicate`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
IPredicate isNameInPredicate = new SObjectIterablePredicateProvider()
    .is(new SObjectFunctionProvider().get(Account.Name))
    .inx(new List<String>{ 'John', 'Jane' });
isNameInPredicate.test(new Account(Name = 'John')); // true
```


### `public virtual SObjectIterableOperator is()`

*Inherited*


Creates an instance of `SObjectIterablePredicate` using the identity function as the default mapper.

#### Returns

|Type|Description|
|---|---|
|`SObjectIterableOperator`|the `SObjectIterablePredicate`|

#### Example
```apex
IPredicate isAccountInPredicate = new SObjectIterablePredicateProvider()
    .is()
    .inx(new List<Account>{ new Account(Name = 'John'), new Account(Name = 'Jane') });
isAccountInPredicate.test(new Account(Name = 'John')); // true
```


### `public virtual SObjectIterableOperator is(String fieldName)`

*Inherited*


Creates an instance of `SObjectIterableOperator` using the provided field name.

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name of the SObject to be used for mapping|

#### Returns

|Type|Description|
|---|---|
|`SObjectIterableOperator`|the `SObjectIterableOperator`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|

#### Example
```apex
IPredicate isNameInPredicate = new SObjectIterablePredicateProvider()
    .is('Name')
    .inx(new List<String>{ 'John', 'Jane' });
isNameInPredicate.test(new Account(Name = 'John')); // true
// safe navigation
new SObjectIterablePredicateProvider().is('Parent?.Name').inx(new List<String>{ 'Sam', 'Frank' });
```


### `public virtual SObjectIterableOperator is(SObjectField field)`

*Inherited*


Creates an instance of `SObjectIterableOperator` using the provided SObjectField.

#### Parameters

|Param|Description|
|---|---|
|`field`|the SObjectField to be used for mapping|

#### Returns

|Type|Description|
|---|---|
|`SObjectIterableOperator`|the `SObjectIterableOperator`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
IPredicate isNameInPredicate = new SObjectIterablePredicateProvider()
    .is(Account.Name)
    .inx(new List<String>{ 'John', 'Jane' });
isNameInPredicate.test(new Account(Name = 'John')); // true
```


---
