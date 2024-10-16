# virtual SObjectStringPredicateProvider

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides a fluent interface for building string-related predicates
that operate on SObject fields using currying. This builder allows you to create predicates
for checking various string conditions such as whether a string is blank, contains a value, starts with a value, etc.


**Group** Functional Built-In Classes V2

## Methods
### `public virtual StringOperator is(IFunction mapper)`

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
## Classes
### StringOperator

Represents a builder for string-related predicates that operate on SObject fields,
supporting operations like checking if a string is blank, contains a value, or starts/ends with a value.

#### Methods
##### `public virtual StringOperator notx()`

Toggles the negation flag, allowing predicates to check for the opposite condition.

###### Returns

|Type|Description|
|---|---|
|`StringOperator`|a new instance of `StringOperator` with the negation flag toggled|

###### Example
```apex
IPredicate isNameNotContainingJohn = new SObjectStringPredicateProvider()
    .is(Account.Name)
    .notx()
    .containing('John');
isNameNotContainingJohn.test(new Account(Name = 'Jane Doe')); // true
```


##### `public virtual Predicate blank()`

Creates a predicate that checks if the mapped string value is blank.

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the mapped string value is blank|

###### Example
```apex
IPredicate isNameBlank = new SObjectStringPredicateProvider()
    .is(Account.Name)
    .blank();
isNameBlank.test(new Account(Name = ' ')); // true
```


##### `public virtual Predicate empty()`

Creates a predicate that checks if the mapped string value is empty.

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the mapped string value is empty|

###### Example
```apex
IPredicate isNameEmpty = new SObjectStringPredicateProvider()
    .is(Account.Name)
    .empty();
isNameEmpty.test(new Account(Name = '')); // true
```


##### `public virtual Predicate containing(String value)`

Creates a predicate that checks if the mapped string value contains the specified value.

###### Parameters

|Param|Description|
|---|---|
|`value`|the string value to check for|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the mapped string value contains the specified value|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
IPredicate isNameContainingJohn = new SObjectStringPredicateProvider()
    .is(Account.Name)
    .containing('John');
isNameContainingJohn.test(new Account(Name = 'John Doe')); // true
```


##### `public virtual Predicate containingIc(String value)`

Creates a predicate that checks if the mapped string value contains the specified value, ignoring case.

###### Parameters

|Param|Description|
|---|---|
|`value`|the string value to check for, ignoring case|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the mapped string value contains the specified value, ignoring case|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
IPredicate isNameContainingJohnIgnoreCase = new SObjectStringPredicateProvider()
    .is(Account.Name)
    .containingIc('john');
isNameContainingJohnIgnoreCase.test(new Account(Name = 'JOHN DOE')); // true
```


##### `public virtual Predicate startingWith(String value)`

Creates a predicate that checks if the mapped string value starts with the specified value.

###### Parameters

|Param|Description|
|---|---|
|`value`|the string value to check for at the start|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the mapped string value starts with the specified value|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
IPredicate isNameStartingWithJohn = new SObjectStringPredicateProvider()
    .is(Account.Name)
    .startingWith('John');
isNameStartingWithJohn.test(new Account(Name = 'John Doe')); // true
```


##### `public virtual Predicate startingWithIc(String value)`

Creates a predicate that checks if the mapped string value starts with the specified value, ignoring case.

###### Parameters

|Param|Description|
|---|---|
|`value`|the string value to check for at the start, ignoring case|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the mapped string value starts with the specified value, ignoring case|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
IPredicate isNameStartingWithJohnIgnoreCase = new SObjectStringPredicateProvider()
    .is(Account.Name)
    .startingWithIc('john');
isNameStartingWithJohnIgnoreCase.test(new Account(Name = 'JOHN DOE')); // true
```


##### `public virtual Predicate endingWith(String value)`

Creates a predicate that checks if the mapped string value ends with the specified value.

###### Parameters

|Param|Description|
|---|---|
|`value`|the string value to check for at the end|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the mapped string value ends with the specified value|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
IPredicate isNameEndingWithDoe = new SObjectStringPredicateProvider()
    .is(Account.Name)
    .endingWith('Doe');
isNameEndingWithDoe.test(new Account(Name = 'John Doe')); // true
```


##### `public virtual Predicate endingWithIc(String value)`

Creates a predicate that checks if the mapped string value ends with the specified value, ignoring case.

###### Parameters

|Param|Description|
|---|---|
|`value`|the string value to check for at the end, ignoring case|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the mapped string value ends with the specified value, ignoring case|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
IPredicate isNameEndingWithDoeIgnoreCase = new SObjectStringPredicateProvider()
    .is(Account.Name)
    .endingWithIc('doe');
isNameEndingWithDoeIgnoreCase.test(new Account(Name = 'JOHN DOE')); // true
```


##### `public virtual Predicate likex(String likeString)`

Creates a predicate that checks if the mapped string value matches a given pattern (`LIKE`).

###### Parameters

|Param|Description|
|---|---|
|`likeString`|the pattern to match against|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|a predicate that returns true if the mapped string value matches the pattern|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `likeString` is null|

###### Example
```apex
IPredicate isNameLikePattern = new SObjectStringPredicateProvider()
    .is(Account.Name)
    .likex('%Doe');
isNameLikePattern.test(new Account(Name = 'John Doe')); // true
```


---

---
