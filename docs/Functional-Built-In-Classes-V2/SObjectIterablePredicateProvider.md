# virtual SObjectIterablePredicateProvider

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides a fluent interface for building predicates
that operate on iterable collections using currying.
This builder allows you to create predicates for checking if an object is in or not in a given collection,
as well as if a string is included in or excluded from a iterable of strings.


**Group** Functional Built-In Classes V2

## Methods
### `public virtual SObjectIterableOperator is(IFunction mapper)`

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
## Classes
### SObjectIterableOperator

Represents predicate operations on iterables, utilizing currying to build complex conditions.

#### Methods
##### `public virtual Predicate inx(Iterable<Object> container)`

Creates a predicate that checks if the mapped value is `IN` the provided container.

###### Parameters

|Param|Description|
|---|---|
|`container`|an iterable of objects to check against|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the mapped value is in the container|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `container` is null|

###### Example
```apex
IPredicate inPredicate = new SObjectIterablePredicateProvider()
    .is(Account.Name)
    .inx(new List<String>{ 'John', 'Jane' });
inPredicate.test(new Account(Name = 'John')); // true
```


##### `public virtual Predicate nin(Iterable<Object> container)`

Creates a predicate that checks if the mapped value is `NOT IN` the provided container.

###### Parameters

|Param|Description|
|---|---|
|`container`|an iterable of objects to check against|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the mapped value is not in the container|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `container` is null|

###### Example
```apex
IPredicate notInPredicate = new SObjectIterablePredicateProvider()
    .is(Account.Name)
    .nin(new List<String>{ 'John', 'Jane' });
notInPredicate.test(new Account(Name = 'Doe')); // true
```


##### `public virtual Predicate inc(Iterable<String> container)`

Creates a predicate that checks if the mapped string value `INCLUDES` any of the strings in the provided container.

###### Parameters

|Param|Description|
|---|---|
|`container`|an iterable of strings to check against|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the mapped string value includes any of the strings in the container|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `container` is null or `container` contains null element|

###### Example
```apex
SObjectIterablePredicateProvider builder = new SObjectIterablePredicateProvider();
Account acc = new Account(Name = 'AAA;BBB');
builder.is(Account.Name).inc(new List<String>{ 'AAA' }).test(acc); // true
builder.is(Account.Name).inc(new Set<String>{ 'AAA;BBB' }).test(acc); // true
builder.is(Account.Name).inc(new Set<String>{ 'BBB;CCC' }).test(acc); // false
builder.is('Name').inc(new Set<String>{ 'AAA;CCC', 'BBB' }).test(acc); // true
builder.is('Name').inc(new List<String>{ 'AAA;BBB;CCC' }).test(acc); // false
// safe navigation
builder.is('Parent?.Name').inc(new List<String>{ 'AAA' });
```


##### `public virtual Predicate exc(Iterable<String> container)`

Creates a predicate that checks if the mapped string value does not include (`EXCLUDES`) any of the strings in the provided container.

###### Parameters

|Param|Description|
|---|---|
|`container`|an iterable collection of strings to check against|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the mapped string value does not include any of the strings in the container|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `container` is null or `container` contains null element|

###### Example
```apex
SObjectIterablePredicateProvider builder = new SObjectIterablePredicateProvider();
Account acc = new Account(Name = 'AAA;BBB');
builder.is(Account.Name).exc(new List<String>{ 'AAA' }).test(acc); // false
builder.is(Account.Name).exc(new Set<String>{ 'AAA;BBB' }).test(acc); // false
builder.is(Account.Name).exc(new Set<String>{ 'BBB;CCC' }).test(acc); // true
builder.is('Name').exc(new Set<String>{ 'AAA;CCC', 'BBB' }).test(acc); // false
builder.is('Name').exc(new List<String>{ 'AAA;BBB;CCC' }).test(acc); // true
// safe navigation
builder.is('Parent?.Name').exc(new List<String>{ 'AAA' });
```


---

---
