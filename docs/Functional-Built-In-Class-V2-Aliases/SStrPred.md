# SStrPred

`APIVERSION: 61`

`STATUS: ACTIVE`

An alias for [SObjectStringPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectStringPredicateProvider.md).


**Inheritance**

[SObjectStringPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectStringPredicateProvider.md)
 > 
SStrPred


**Group** Functional Built-In Class V2 Aliases

## Methods
### `public virtual StringOperator is(IFunction mapper)`

*Inherited*


Creates an instance of `StringOperator` using the provided mapping function.

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the function used to map an SObject to a string value|

#### Returns

|Type|Description|
|---|---|
|`StringOperator`|the `StringOperator`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
IPredicate isNameContainingJohn = new SObjectStringPredicateProvider()
    .is(new SObjectFunctionProvider().get(Account.Name))
    .containing('John');
isNameContainingJohn.test(new Account(Name = 'John Doe')); // true
```


### `public virtual StringOperator is(String fieldName)`

*Inherited*


Creates an instance of `StringOperator` using the provided field name.

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name of the SObject to be used for mapping|

#### Returns

|Type|Description|
|---|---|
|`StringOperator`|the `StringOperator`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
IPredicate isNameContainingJohn = new SObjectStringPredicateProvider()
    .is('Name')
    .containing('John');
isNameContainingJohn.test(new Account(Name = 'John Doe')); // true
// safe navigation
IPredicate isParentNameContainingJohn = new SObjectStringPredicateProvider()
    .is('Parent?.Name')
    .containing('John');
```


### `public virtual StringOperator is(SObjectField field)`

*Inherited*


Creates an instance of `StringOperator` using the provided SObjectField.

#### Parameters

|Param|Description|
|---|---|
|`field`|the SObjectField to be used for mapping|

#### Returns

|Type|Description|
|---|---|
|`StringOperator`|the `StringOperator`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
IPredicate isNameContainingJohn = new SObjectStringPredicateProvider()
    .is(Account.Name)
    .containing('John');
isNameContainingJohn.test(new Account(Name = 'John Doe')); // true
```


---
