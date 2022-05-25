# SObjectIterable

`APIVERSION: 54`

`STATUS: ACTIVE`

Provides a skeletal implementation of [ISObjectIterable](/docs/Iterables/ISObjectIterable.md).


**Author** O. Berehovskyi


**Group** Iterables

## Methods
### `append(Iterable<SObject> iterable)`
#### Parameters
|Param|Description|
|---|---|

### `union(Iterable<SObject> iterable)`

Returns a new `ISObjectIterable` as a set union of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Example
```apex
List<Account> accounts1 = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
List<Account> accounts2 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc0 };
List<Account> union = accountsIterable1.union(accounts2).toList();
// [acc5, acc3, acc9, acc7, acc8, acc6, acc4, acc1, acc0]
```

### `intersect(Iterable<SObject> iterable)`

Returns a new `ISObjectIterable` as a set intersection of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Example
```apex
List<Account> accounts1 = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
List<Account> accounts2 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc0 };
List<Account> intersection = accountsIterable1.intersect(accounts2).toList(); // [acc3, acc9]
```

### `except(Iterable<SObject> iterable)`

Returns a new `ISObjectIterable` as a set difference of the current and another iterables.

#### Parameters
|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Example
```apex
List<Account> accounts1 = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
List<Account> accounts2 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc0 };
List<Account> diff = accountsIterable1.except(accounts2).toList(); // [acc5, acc7]
```

### `filter(ISObjectPredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `filter(String fieldName, Object value)`

Returns a new `ISObjectIterable` with `SObject` elements that have field&apos;s value. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the value|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
List<Account> accountsWithHotRating = accountsIterable
    .filter('Rating', 'Hot')
    .toList();
List<Contact> contactsWithHotRatingAccount = contactsIterable
    .filter('Account?.Rating', 'Hot')
    .toList();
```

### `filter(SObjectField field, Object value)`

Returns a new `ISObjectIterable` with `SObject` elements that have field&apos;s value. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
List<Account> accountsWithHotRating = accountsIterable
    .filter(Account.Rating, 'Hot')
    .toList();
```

### `take(ISObjectPredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `take(String fieldName, Object value)`

Returns a new `ISObjectIterable` that takes `SObject` elements while `fieldName` equals to `value`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the value|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
List<Account> firstAccountsWithHotRating = accountsIterable
    .take('Rating', 'Hot')
    .toList();
```

### `take(SObjectField field, Object value)`

Returns a new `ISObjectIterable` that takes `SObject` elements while `field` equals to `value`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
List<Account> firstAccountsWithHotRating = accountsIterable
    .take(Account.Rating, 'Hot')
    .toList();
```

### `drop(ISObjectPredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `drop(String fieldName, Object value)`

Returns a new `ISObjectIterable` that drops `SObject` elements while `fieldName` equals to `value`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the value|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
List<Account> restAccounts = accountsIterable
    .drop('Rating', 'Hot')
    .toList();
```

### `drop(SObjectField field, Object value)`

Returns a new `ISObjectIterable` that drops `SObject` elements while `field` equals to `value`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
List<Account> restAccounts = accountsIterable
    .drop(Account.Rating, 'Hot')
    .toList();
```

### `withoutNulls()`

Returns a new `ISObjectIterable` without null elements. <p>Intermediate Operation.</p> List<Account> accounts = contactsIterable     .mapTo(&apos;Account&apos;)     .withoutNulls()     .toList();

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `mapTo(ISObjectUnaryOperator mapper)`
#### Parameters
|Param|Description|
|---|---|

### `mapTo(String fieldName)`

Returns a new `ISObjectIterable` with `SObject` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to be set for new SObject|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
List<Account> accounts = contactsIterable
    .mapTo('Account')
    .toList();
```

### `mapTo(SObjectField field)`

Returns a new `ISObjectIterable` with `SObject` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field value to be set for new SObject|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
List<Account> accounts = contactsIterable
    .mapTo(Contact.AccountId)
    .toList();
```

### `mapToInt(ISObjectToIntFunction mapper)`
#### Parameters
|Param|Description|
|---|---|

### `mapToInt(String fieldName)`

Returns a new `IIntIterable` with `Integer` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
List<Integer> numberOfEmployees = accountsIterable
    .mapToInt('NumberOfEmployees')
    .toList();
```

### `mapToInt(SObjectField field)`

Returns a new `IIntIterable` with `Integer` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

IIntIterable

**Description**

the new `IIntIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
List<Integer> numberOfEmployees = accountsIterable
    .mapToInt(Account.NumberOfEmployees)
    .toList();
```

### `mapToLong(ISObjectToLongFunction mapper)`
#### Parameters
|Param|Description|
|---|---|

### `mapToLong(String fieldName)`

Returns a new `ILongIterable` with `Long` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
List<Long> numberOfEmployees = accountsIterable
    .mapToLong('NumberOfEmployees')
    .toList();
```

### `mapToLong(SObjectField field)`

Returns a new `ILongIterable` with `Long` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

ILongIterable

**Description**

the new `ILongIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
List<Long> numberOfEmployees = accountsIterable
    .mapToLong(Account.NumberOfEmployees)
    .toList();
```

### `mapToDouble(ISObjectToDoubleFunction mapper)`
#### Parameters
|Param|Description|
|---|---|

### `mapToDouble(String fieldName)`

Returns a new `IDoubleIterable` with `Double` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

IDoubleIterable

**Description**

the new `IDoubleIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
List<Double> annualRevenues = accountsIterable
    .mapToDouble('AnnualRevenue')
    .toList();
```

### `mapToDouble(SObjectField field)`

Returns a new `ILongIterable` with `Double` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

IDoubleIterable

**Description**

the new `field`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
List<Double> annualRevenues = accountsIterable
    .mapToDouble(Account.AnnualRevenue)
    .toList();
```

### `mapToObject(ISObjectFunction mapper)`
#### Parameters
|Param|Description|
|---|---|

### `mapToObject(String fieldName)`

Returns a new `IObjectIterable` with `Object` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
List<Object> birthdates = contactsIterable
    .mapToObject('Birthdate')
    .toList();
```

### `mapToObject(SObjectField field)`

Returns a new `IObjectIterable` with `Object` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

IObjectIterable

**Description**

the new `IObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
List<Object> birthdates = contactsIterable
    .mapToObject(Contact.Birthdate)
    .toList();
```

### `forEach(ISObjectConsumer consumer)`
#### Parameters
|Param|Description|
|---|---|

### `forEach(String fieldName, Object value)`

Returns a new `ISObjectIterable` after setting `value` for `fieldName` on each `SObject` element. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the value|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
List<Account> accountsWithResetAnnualRevenue = accountsIterable
    .forEach('AnnualRevenue', 0)
    .toList();
```

### `forEach(SObjectField field, Object value)`

Returns a new `ISObjectIterable` after setting `value` for `field` on each `SObject` element. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
List<Account> accountsWithResetAnnualRevenue = accountsIterable
    .forEach(Account.AnnualRevenue, 0)
    .toList();
```

### `distinct(ISObjectFunction classifier)`
#### Parameters
|Param|Description|
|---|---|

### `distinct(String fieldName)`

Returns a new `ISObjectIterable` with distinct `SObject` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
List<Account> distinctAccountsByName = accountsIterable
    .distinct('Name')
    .toList();
```

### `distinct(SObjectField field)`

Returns a new `ISObjectIterable` with distinct `SObject` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
List<Account> distinctAccountsByName = accountsIterable
    .distinct(Account.Name)
    .toList();
```

### `sort(ISObjectComparator comparator)`
#### Parameters
|Param|Description|
|---|---|

### `sort(SortOrder order)`

Returns a new `ISObjectIterable` with sorted `SObject` elements considering `order`. <p>Intermediate Operation.</p> List<Account> sortedAccountsByNameDesc = accountsIterable     .sort(SortOrder.DESCENDING)     .toList();

#### Parameters
|Param|Description|
|---|---|
|`order`|the sort order|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

### `sort(String fieldName)`

Returns a new `ISObjectIterable` with sorted `SObject` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
List<Account> sortedAccountsByName = accountsIterable
    .sort('Name')
    .toList();
```

### `sort(String fieldName, SortOrder order)`

Returns a new `ISObjectIterable` with sorted `SObject` elements taken from `fieldName` values considering `order`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`order`|the sort order|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank or `order` is null|

#### Example
```apex
List<Account> sortedAccountsByNameDesc = accountsIterable
    .sort('Name', SortOrder.DESCENDING)
    .toList();
```

### `sort(SObjectField field)`

Returns a new `ISObjectIterable` with sorted `SObject` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
List<Account> sortedAccountsByName = accountsIterable
    .sort(Account.Name)
    .toList();
```

### `sort(SObjectField field, SortOrder order)`

Returns a new `ISObjectIterable` with sorted `SObject` elements taken from `field` values considering `order`. <p>Intermediate Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`order`|the sort order|

#### Return

**Type**

ISObjectIterable

**Description**

the new `ISObjectIterable`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `order` is null|

#### Example
```apex
List<Account> sortedAccountsByNameDesc = accountsIterable
    .sort(Account.Name, SortOrder.DESCENDING)
    .toList();
```

### `distinct()`
### `reduce(ISObjectBinaryOperator accumulator)`
#### Parameters
|Param|Description|
|---|---|

### `find(ISObjectPredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `find(String fieldName, Object value)`

Returns an `OptionalSObject` describing the first element which has `value` of `fieldName`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the field value|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
Account firstAccountWithHotRating = accountsIterable
    .find('Rating', 'Hot')
    .get();
```

### `find(SObjectField field, Object value)`

Returns an `OptionalSObject` describing the first element which has `value` of `field`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the field value|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account firstAccountWithHotRating = accountsIterable
    .find(Account.Rating, 'Hot')
    .get();
```

### `every(ISObjectPredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `every(String fieldName, Object value)`

Returns whether all `SObject` elements have `field` `value`. If `ISObjectIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the field value|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
Boolean isEveryAccountWithHotRating = accountsIterable
    .every('Rating', 'Hot');
```

### `every(SObjectField field, Object value)`

Returns whether all `SObject` elements have `field` `value`. If `ISObjectIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the field value|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Boolean isEveryAccountWithHotRating = accountsIterable
    .every(Account.Rating, 'Hot');
```

### `some(ISObjectPredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `some(String fieldName, Object value)`

Returns whether some `SObject` element has `field` `value`. If `ISObjectIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the field value|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
Boolean isSomeAccountWithHotRating = accountsIterable
    .some('Rating', 'Hot');
```

### `some(SObjectField field, Object value)`

Returns whether some `SObject` element has `field` `value`. If `ISObjectIterable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the field value|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Boolean isSomeAccountWithHotRating = accountsIterable
    .some(Account.Rating, 'Hot');
```

### `none(ISObjectPredicate predicate)`

Returns whether no `SObject` elements match `predicate`. If `ISObjectIterable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
Boolean isNoAccountWithHotRating = accountsIterable
    .none(SObjectPredicate.isEqual(Account.Rating, 'Hot'));
```

### `none(String fieldName, Object value)`

Returns whether no `SObject` elements have `field` `value`. If `ISObjectIterable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the field value|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
Boolean isNoAccountWithHotRating = accountsIterable
    .none('Rating', 'Hot');
```

### `none(SObjectField field, Object value)`

Returns whether no `SObject` elements have `field` `value`. If `ISObjectIterable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the field value|

#### Return

**Type**

Boolean

**Description**

`true` or `false`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Boolean isNoAccountWithHotRating = accountsIterable
    .none(Account.Rating, 'Hot');
```

### `max(ISObjectComparator comparator)`

Returns an `OptionalSObject` describing the maximum `SObject` element according to `comparator`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`comparator`|the comparator|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject` describing the result

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `comparator` is null|

#### Example
```apex
Account accountWithMaxAnnualRevenue = accountsIterable
    .max(SObjectComparator.comparing(Account.AnnualRevenue))
    .get();
```

### `max(String fieldName)`

Returns an `OptionalSObject` describing the maximum `SObject` element according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject` describing the result

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
Account accountWithMaxAnnualRevenue = accountsIterable
    .max('AnnualRevenue')
    .get();
```

### `max(SObjectField field)`

Returns an `OptionalSObject` describing the maximum `SObject` element according to `field`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject` describing the result

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account accountWithMaxAnnualRevenue = accountsIterable
    .max(Account.AnnualRevenue)
    .get();
```

### `min(ISObjectComparator comparator)`

Returns an `OptionalSObject` describing the minimum `SObject` element according to `comparator`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`comparator`|the comparator|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject` describing the result

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `comparator` is null|

#### Example
```apex
Account accountWithMinAnnualRevenue = accountsIterable
    .min(SObjectComparator.comparing(Account.AnnualRevenue))
    .get();
```

### `min(String fieldName)`

Returns an `OptionalSObject` describing the minimum `SObject` element according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject` describing the result

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
Account accountWithMinAnnualRevenue = accountsIterable
    .min('AnnualRevenue')
    .get();
```

### `min(SObjectField field)`

Returns an `OptionalSObject` describing the minimum `SObject` element according to `field`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject` describing the result

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account accountWithMaxAnnualRevenue = accountsIterable
    .min(Account.AnnualRevenue)
    .get();
```

### `sum(ISObjectToDoubleFunction classifier)`

Returns the arithmetic sum of values returned by `classifier` function. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`classifier`|the classifier function|

#### Return

**Type**

Double

**Description**

the sum of elements returned by function

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

#### Example
```apex
Double sumOfAnnualRevenue = accountsIterable
    .sum(SObjectToDoubleFunction.get(Account.AnnualRevenue));
```

### `sum(String fieldName)`

Returns the arithmetic sum of field values of `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field to sum values|

#### Return

**Type**

Double

**Description**

the sum of field values

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
Double sumOfAnnualRevenue = accountsIterable
    .sum('AnnualRevenue');
```

### `sum(SObjectField field)`

Returns the arithmetic sum of field values of `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field to sum values|

#### Return

**Type**

Double

**Description**

field sum of field values

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Double sumOfAnnualRevenue = accountsIterable
    .sum(Account.AnnualRevenue);
```

### `avg(ISObjectToDoubleFunction classifier)`

Returns the arithmetic mean of values returned by `classifier` function. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`classifier`|the classifier function|

#### Return

**Type**

OptionalDouble

**Description**

the arithmetic mean of elements returned by function

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

#### Example
```apex
Double avgAnnualRevenue = accountsIterable
    .avg(SObjectToDoubleFunction.get(Account.AnnualRevenue))
    .get();
```

### `avg(String fieldName)`

Returns the arithmetic mean of field values of `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field to sum values|

#### Return

**Type**

OptionalDouble

**Description**

the arithmetic mean of field values

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
Double avgAnnualRevenue = accountsIterable
    .avg('AnnualRevenue')
    .get();
```

### `avg(SObjectField field)`

Returns the arithmetic mean of field values of `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field to sum values|

#### Return

**Type**

OptionalDouble

**Description**

field arithmetic mean of field values

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Double avgAnnualRevenue = accountsIterable
    .avg(Account.AnnualRevenue)
    .get();
```

### `toList(ISObjectFunction mapper)`

Accumulates elements returned by `mapper` into a `List<Object>`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Return

**Type**

List<Object>

**Description**

the `List<Object>` containing the collected elements

#### Example
```apex
List<Object> accountNames = accountsIterable.toList(SObjectFunction.get('Name'));
```

### `toList(String fieldName)`

Accumulates `Object` elements into a `List<Object>` according to `fieldName`.

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

List<Object>

**Description**

the `List<Object>` containing the collected elements

#### Example
```apex
List<Object> accountNames = accountsIterable.toList('Name');
<p>Terminal Operation.</p>
```

### `toList(SObjectField field)`

Accumulates `Object` elements into a `List<Object>` according to `field`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

List<Object>

**Description**

the `List<Object>` containing the collected elements

#### Example
```apex
List<Object> accountNames = accountsIterable.toList(Account.Name);
```

### `toList(ISObjectFunction mapper, Type listType)`
#### Parameters
|Param|Description|
|---|---|

### `toList(String fieldName, Type listType)`

Accumulates `Object` elements into a `List<Object>` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`listType`|result type|

#### Return

**Type**

List<Object>

**Description**

the `List<Object>` containing the collected elements, which can be casted to `listType`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank or `listType` is null|

#### Example
```apex
List<String> accountNames = (List<String>) accountsIterable
    .toList('Name', List<String>.class);
```

### `toList(SObjectField field, Type listType)`

Accumulates `Object` elements into a `List<Object>` according to `field`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`listType`|result type|

#### Return

**Type**

List<Object>

**Description**

the `List<Object>` containing the collected elements, which can be casted to `listType`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `listType` is null|

#### Example
```apex
List<String> accountNames = (List<String>) accountsIterable
    .toList(Account.Name, List<String>.class);
```

### `toIdSet(ISObjectFunction mapper)`
#### Parameters
|Param|Description|
|---|---|

### `toIdSet(String fieldName)`

Accumulates `Id` elements into a `Set<Id>` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

Set<Id>

**Description**

the `Set<Id>` containing the collected elements field values

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
Set<Id> accountIds = contactsIterable.toIdSet('AccountId');
```

### `toIdSet(SObjectField field)`

Accumulates `Id` elements into a `Set<Id>` according to `field`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

Set<Id>

**Description**

the `Set<Id>` containing the collected elements field values

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Set<Id> accountIds = contactsIterable.toIdSet(Contact.AccountId);
```

### `toStringSet(ISObjectFunction mapper)`
#### Parameters
|Param|Description|
|---|---|

### `toStringSet(String fieldName)`

Accumulates `String` elements into a `Set<String>` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

Set<String>

**Description**

the `Set<String>` containing the collected elements field values

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
Set<String> accountNames = accountsIterable.toStringSet('Name');
```

### `toStringSet(SObjectField field)`

Accumulates `String` elements into a `Set<String>` according to `field`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

Set<String>

**Description**

the `Set<String>`containing the collected elements field values

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Set<String> accountNames = accountsIterable.toStringSet(Account.Name);
```

### `toByIdMap(ISObjectFunction keyMapper, Type mapType)`
#### Parameters
|Param|Description|
|---|---|

### `toByIdMap(String fieldName, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, SObject>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`mapType`|result type|

#### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>` containing the collected elements, which can be casted to `mapType`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank or `mapType` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

#### Example
```apex
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) contactsIterable
    .toByIdMap('AccountId', Map<Id, Contact>.class);
```

### `toByIdMap(SObjectField field, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, SObject>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`mapType`|result type|

#### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>` containing the collected elements, which can be casted to `mapType`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank or `mapType` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

#### Example
```apex
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) contactsIterable
    .toByIdMap(Contact.AccountId, Map<Id, Contact>.class);
```

### `toByStringMap(ISObjectFunction keyMapper, Type mapType)`
#### Parameters
|Param|Description|
|---|---|

### `toByStringMap(String fieldName, Type mapType)`

Accumulates `SObject` elements into a `Map<String, SObject>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`mapType`|result type|

#### Return

**Type**

Map<String,SObject>

**Description**

the `Map<String, SObject>` containing the collected elements, which can be casted to `mapType`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank or `mapType` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

#### Example
```apex
Map<String, Account> accountByName = (Map<String, Account>) accountsIterable
    .toByStringMap('Name', Map<String, Account>.class);
```

### `toByStringMap(SObjectField field, Type mapType)`

Accumulates `SObject` elements into a `Map<String, SObject>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`mapType`|result type|

#### Return

**Type**

Map<String,SObject>

**Description**

the `Map<String, SObject>` containing the collected elements, which can be casted to `mapType`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `mapType` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

#### Example
```apex
Map<String, Account> accountByName = (Map<String, Account>) accountsIterable
    .toByStringMap(Account.Name, Map<String, Account>.class);
```

### `groupById(ISObjectFunction keyMapper)`
#### Parameters
|Param|Description|
|---|---|

### `groupById(String fieldName)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

Map<Id,List<SObject>>

**Description**

the `Map<Id, List<SObject>>` containing the iterable elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
Map<Id, List<Contact>> contactsByAccountId = contactsIterable.groupById('AccountId');
```

### `groupById(SObjectField field)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

Map<Id,List<SObject>>

**Description**

the `Map<Id, List<SObject>>` containing the iterable elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Map<Id, List<Contact>> contactsByAccountId = contactsIterable.groupById(Contact.AccountId);
```

### `groupByString(ISObjectFunction keyMapper)`
#### Parameters
|Param|Description|
|---|---|

### `groupByString(String fieldName)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

#### Return

**Type**

Map<String,List<SObject>>

**Description**

the `Map<String, List<SObject>>` containing the iterable elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
Map<String, List<Account>> accountsByRating = accountsIterable.groupByString('Rating');
```

### `groupByString(SObjectField field)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|

#### Return

**Type**

Map<String,List<SObject>>

**Description**

the `Map<String, List<SObject>>` containing the iterable elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Map<String, List<Account>> accountsByRating = accountsIterable.groupByString(Account.Rating);
```

### `partition(ISObjectPredicate predicate)`
#### Parameters
|Param|Description|
|---|---|

### `partition(String fieldName, Object value)`

Partition `SObject` elements by `fieldName` having `value`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the satisfying value|

#### Return

**Type**

Map<Boolean,List<SObject>>

**Description**

the `Map<Boolean, List<SObject>>` containing the iterable elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

#### Example
```apex
Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
    = accountsIterable.partition('Rating', 'Hot');
```

### `partition(SObjectField field, Object value)`

Partition `SObject` elements by `field` having `value`. <p>Terminal Operation.</p>

#### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Return

**Type**

Map<Boolean,List<SObject>>

**Description**

the `Map<Boolean, List<SObject>>` containing the iterable elements

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
    = accountsIterable.partition(Account.Rating, 'Hot');
```

---
