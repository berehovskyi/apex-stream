# SObjectSequence

`APIVERSION: 54`

`STATUS: ACTIVE`

A sequence of `SObject` elements supporting aggregate operations. Sequence operations are composed of sequence chain. A sequence chain consists of: <ul>     <li>A Source (which might be an iterable (such as list or set)).</li>     <li>Zero or more Intermediate Operations (which transform a sequence into another sequence,     such as SObjectSequence.filter(ISObjectPredicate)).</li>     <li>A Terminal Operation (which produces a result such as     SObjectSequence.count() or SObjectSequence.collect(ISObjectCollector)).</li> </ul> <p>Sequences are <strong>eager</strong>:</p> <ul>     <li>Intermediate operations describe how a sequence is processed eagerly performing every action.</li>     <li>Computation is performed every time when the intermediate or the terminal operation is initiated.</li> </ul> <p>A sequence may not consume all elements. It may not be infinite.</p> <p>A sequence can be operated on (invoking an intermediate or terminal sequence operation) <strong>multiple times</strong>. <p>Contract:</p> <ul>     <li>Must be non-interfering (do not modify the sequence source but may mutate its elements).</li> </ul> <p>There are primitive specializations for [IntSequence](/Iterables/IntSequence.md), [LongSequence](/Iterables/LongSequence.md), and [DoubleSequence](/Iterables/DoubleSequence.md) and [ObjectSequence](/Iterables/ObjectSequence.md) for Object references.</p> <p>Sequences and streams equally ensure the fulfillment of the set goals, but are implemented in different ways.</p>


**Author** O. Berehovskyi.


**Group** Iterables


**See** [SObjectStream](/docs/Iterables/SObjectStream.md)


**See** [ObjectSequence](/docs/Iterables/ObjectSequence.md)


**See** [IntSequence](/docs/Iterables/IntSequence.md)


**See** [LongSequence](/docs/Iterables/LongSequence.md)


**See** [DoubleSequence](/docs/Iterables/DoubleSequence.md)

## Methods
### Other
##### `iterator()`

Returns an internal iterator for the elements of this sequence. <p>Terminal Operation.</p>

###### Return

**Type**

Iterator<SObject>

**Description**

the internal `Iterator<SObject>`

---
### Sources
##### `static of(List<SObject> sObjects)`

Returns a `SObjectSequence` created from `sObjects` list.

###### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list of SObjects|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` is null|

###### Example
```apex
ISObjectIterable accSeq = SObjectSequence.of(new List<Account>(accounts));
```

##### `static of(Set<SObject> sObjects)`

Returns a `SObjectSequence` created from `sObjects` set.

###### Parameters
|Param|Description|
|---|---|
|`sObjects`|the set of SObjects|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` is null|

###### Example
```apex
ISObjectIterable sObjSeq = SObjectSequence.of(new Set<SObject>(sObjects));
```

##### `static ofNullable(List<SObject> sObjects)`

Returns a `SObjectSequence` created from `sObjects` list if non-null, otherwise returns an empty `SObjectSequence`.

###### Parameters
|Param|Description|
|---|---|
|`sObjects`|the list of SObjects|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence` if `sObjects` is non-null, otherwise an empty `SObjectSequence`

###### Example
```apex
ISObjectIterable accSeq = SObjectSequence.ofNullable(new List<Account>(accounts));
```

##### `static ofNullable(Set<SObject> sObjects)`

Returns a `SObjectSequence` created from `sObjects` set if non-null, otherwise returns an empty `SObjectSequence`.

###### Parameters
|Param|Description|
|---|---|
|`sObjects`|the set of SObjects|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence` if `sObjects` is non-null, otherwise an empty `SObjectSequence`

###### Example
```apex
ISObjectIterable accSeq = SObjectSequence.ofNullable(new Set<SObject>(sObjects));
```

##### `static empty()`

Returns an empty `SObjectSequence`.

###### Return

**Type**

ISObjectIterable

**Description**

the empty `SObjectSequence`

##### `static concat(ISObjectIterable iterable1, ISObjectIterable iterable2)`

Returns eagerly concatenated `SObjectSequence` whose elements are all the elements of the first `ISObjectIterable` followed by all the elements of the second `ISObjectIterable`.

###### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `ISObjectIterable`|
|`iterable2`|the second `ISObjectIterable`|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

###### Example
```apex
ISObjectIterable accSeq = SObjectSequence.concat(seq1, seq2);
```

##### `static concat(List<ISObjectIterable> iterables)`

Returns eagerly concatenates `List<ISObjectIterable>`.

###### Parameters
|Param|Description|
|---|---|
|`iterables`|the list of `ISObjectIterable`|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some of `ISObjectIterable` in a list is null|

###### Example
```apex
ISObjectIterable accSeq = SObjectSequence.concat(sequences);
```

##### `static zip(ISObjectIterable iterable1, ISObjectIterable iterable2, ISObjectBinaryOperator combiner)`

Returns a combined `SObjectSequence` by applying `combiner` function to each element at the same position.

###### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `ISObjectIterable`|
|`iterable2`|the second `ISObjectIterable`|
|`combiner`|the binary operator to be applied to each element at the same position|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

###### Example
```apex
ISObjectIterable accountsWithMinAnnualRevenueSeq = SObjectSequence.zip(
    SObjectSequence.of(Trigger.old),
    SObjectSequence.of(Trigger.new),
    SObjectBinaryOperator.minBy(Account.AnnualRevenue)
);
```

##### `static zip(ISObjectIterable iterable1, ISObjectIterable iterable2, ISObjectBiPredicate predicate, ISObjectBinaryOperator combiner)`

Returns a combined `SObjectSequence` by applying `combiner` function to each element at the same position, conditioned on satisfying `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `ISObjectIterable`|
|`iterable2`|the second `ISObjectIterable`|
|`predicate`|the binary predicate|
|`combiner`|the binary operator to be applied to each element at the same position|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2`, `predicate` or `combiner` is null|

###### Example
```apex
ISObjectIterable newAccountsWithChangedAnnualRevenueSeq = SObjectSequence.zip(
    SObjectSequence.of(Trigger.old),
    SObjectSequence.of(Trigger.new),
    SObjectBiPredicate.areEqual(Account.AnnualRevenue).negate(),
    SObjectBinaryOperator.right()
);
```

##### `append(ISObjectIterable iterable)`

Returns new `SObjectSequence` by appending `iterable` to the current sequence.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the `ISObjectIterable` to append to the current sequence|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
ISObjectIterable accSeq = seq.append(seq1);
```

##### `prepend(ISObjectIterable iterable)`

Returns new `SObjectSequence` by prepending `iterable` to the current sequence.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the `ISObjectIterable` to prepend to the current sequence|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
ISObjectIterable accSeq = seq.prepend(seq2);
```

---
### Intermediate Operations
##### `stream()`

Returns new `SObjectStream` from the current sequence. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

###### Example
```apex
ISObjectIterable accStream = SObjectSequence.of(accounts).stream();
```

##### `override filter(ISObjectPredicate predicate)`

Returns a `SObjectSequence` with elements that match `predicate`. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Account> accountsWithHotRating = SObjectSequence.of(accounts)
    .filter(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
    .toList();
```

##### `override take(ISObjectPredicate predicate)`

Returns a `SObjectSequence` which takes elements while elements match `predicate`. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Account> firstAccountsWithHotRating = SObjectSequence.of(accounts)
    .take(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
    .toList();
```

##### `override drop(ISObjectPredicate predicate)`

Returns a `SObjectSequence` which drops elements while elements match `predicate`, then takes the rest. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Account> restAccounts = SObjectSequence.of(accounts)
    .drop(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
    .toList();
```

##### `override mapTo(ISObjectUnaryOperator mapper)`

Returns a `SObjectSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Account> accounts = SObjectSequence.of(contacts)
    .mapTo(SObjectUnaryOperator.getSObject(Contact.AccountId))
    .toList();
```

##### `override mapToInt(ISObjectToIntFunction mapper)`

Returns a `IntSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IIntIterable

**Description**

the `IntSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Integer> numberOfEmployees = SObjectSequence.of(accounts)
    .mapToInt(SObjectToIntFunction.get(Account.NumberOfEmployees))
    .toList();
```

##### `override mapToLong(ISObjectToLongFunction mapper)`

Returns a `LongSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

ILongIterable

**Description**

the `LongSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Long> numberOfEmployees = SObjectSequence.of(accounts)
    .mapToLong(SObjectToLongFunction.get(Account.NumberOfEmployees))
    .toList();
```

##### `override mapToDouble(ISObjectToDoubleFunction mapper)`

Returns a `DoubleSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IDoubleIterable

**Description**

the `DoubleSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Double> annualRevenues = SObjectSequence.of(accounts)
    .mapToDouble(SObjectToDoubleFunction.get(Account.AnnualRevenue))
    .toList();
```

##### `override mapToObject(ISObjectFunction mapper)`

Returns a `ObjectSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Object> birthdates = SObjectSequence.of(contacts)
    .mapToObject(SObjectToDoubleFunction.get(Contact.Birthdate))
    .toList();
```

##### `override forEach(ISObjectConsumer consumer)`

Returns a `SObjectSequence` after performing `consumer` action on each element. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`consumer`|the non-interfering, stateless action to be performed on each element. Expected to operate via side effects.|

###### Return

**Type**

ISObjectIterable

**Description**

this `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

###### Example
```apex
List<Account> accountsWithResetAnnualRevenue = SObjectSequence.of(accounts)
    .forEach(SObjectConsumer.set(Account.AnnualRevenue, 0))
    .toList();
```

##### `distinct()`

Returns a `SObjectSequence` with distinct elements. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectSequence`

###### Example
```apex
List<Account> distinctAccounts = SObjectSequence.of(accounts)
    .distinct()
    .toList();
```

##### `override distinct(ISObjectFunction classifier)`

Returns a `SObjectSequence` with distinct elements according to `classifier` function. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the classifier function|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
List<Account> distinctAccountsByName = SObjectSequence.of(accounts)
    .distinct(SObjectFunction.get(Account.Name))
    .toList();
```

##### `sort()`

Returns a `SObjectSequence` with sorted elements in ascending order. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectSequence`

###### Example
```apex
List<Account> sortedAccounts = SObjectSequence.of(accounts)
    .sort()
    .toList();
```

##### `override sort(ISObjectComparator comparator)`

Returns a `SObjectSequence` with sorted elements according to `comparator`. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`comparator`|the non-interfering, stateless comparator to compare sequence elements|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `comparator` is null|

###### Example
```apex
List<Account> sortedAccountsByName = SObjectSequence.of(accounts)
    .sort(SObjectComparator.comparing(Account.Name))
    .toList();
```

##### `lim(Integer lim)`

Returns a `SObjectSequence` with first `lim` elements. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `lim` is null|
|`IllegalStateException`|if `lim` is less than 0|

###### Example
```apex
List<Account> first100Accounts = SObjectSequence.of(accounts)
    .lim(100)
    .toList();
```

##### `skip(Integer n)`

Returns a new `SObjectSequence` that skips first `n` elements and returns remaining elements. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`n`|the number of elements to skip|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `n` is null|
|`IllegalStateException`|if `n` is less than 0|

###### Example
```apex
List<Account> restAccounts = SObjectSequence.of(accounts)
    .skip(100)
    .toList();
```

---
### Terminal Operations
##### `reduce(SObject identity, ISObjectBinaryOperator accumulator)`

Performs a reduction on `SObject` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Return

**Type**

SObject

**Description**

the `SObject` result of the reduction

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
Account accountWithMaxNumberOfEmployees = SObjectSequence.of(accounts)
    .reduce(seedAcc, SObjectBinaryOperator.maxBy(Account.NumberOfEmployees));
```

##### `override reduce(ISObjectBinaryOperator accumulator)`

Performs a reduction on `SObject` elements, using `identity` value and associative `accumulator` function, and returns an `OptionalSObject` describing the reduced value. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject` result of the reduction

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
Account accountWithMaxNumberOfEmployees = SObjectSequence.of(accounts)
    .reduce(SObjectBinaryOperator.maxBy(Account.NumberOfEmployees))
    .get();
```

##### `collect(ISupplier supplier, IObjectSObjectConsumer accumulator)`

Performs a mutable reduction operation on elements, collecting elements to a container returned by `supplier` by applying `accumulator` function. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the function that returns a mutable result container|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Return

**Type**

Object

**Description**

the `Object` result of the collection

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `accumulator` is null|

###### Example
```apex
List<String> accountNames = (List<String>) SObjectSequence.of(accounts)
    .collect(
        Supplier.of(List<String>.class),
        ListSObjectConsumer.addToList(SObjectFunction.get(Account.Name))
    );
```

##### `collect(ISObjectCollector collector)`

Performs a mutable reduction operation on elements, collecting elements to a container using `collector`. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`collector`|the collector|

###### Return

**Type**

Object

**Description**

the `Object` result of the collection

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `collector` is null|

###### Example
```apex
// Group contacts by AccountId
Map<Id, List<Contact>> contactsByAccountId = (Map<Id, List<Contact>>)
    SObjectSequence.of(contacts)
        .collect(SObjectCollector.groupingById(Contact.AccountId));
// Group contacts by Department and by Account.Rating, cascading two collectors
Map<String, Map<String, List<Contact>>> contactsByAccountRatingByDepartment
    = (Map<String, Map<String, List<Contact>>>)
        SObjectSequence.of(contacts)
            .collect(SObjectCollector.groupingByString(
                SObjectFunction.get(Contact.Department),
                SObjectCollector.groupingByString(
                    SObjectFunction.get('Account?.Rating')
                )
            ).cast(Map<String, Map<String, List<Contact>>>.class));
```

##### `override find(ISObjectPredicate predicate)`

Returns an `OptionalSObject` describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

OptionalSObject

**Description**

the `OptionalSObject`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Account firstAccountWithMoreThan100NumberOfEmployees = SObjectSequence.of(accounts)
    .find(SObjectPredicate.isGreater(Account.NumberOfEmployees, 100))
    .get();
```

##### `override every(ISObjectPredicate predicate)`

Returns whether all elements match `predicate`. If `SObjectSequence` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

Boolean

**Description**

`true` or `false`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Boolean isEveryAccountWithMoreThan100NumberOfEmployees = SObjectSequence.of(accounts)
    .every(SObjectPredicate.isGreater(Account.NumberOfEmployees, 100));
```

##### `override some(ISObjectPredicate predicate)`

Returns whether some element matches `predicate`. If `SObjectSequence` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

Boolean

**Description**

`true` or `false`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Boolean isSomeAccountWithMoreThan100NumberOfEmployees = SObjectSequence.of(accounts)
    .some(SObjectPredicate.isGreater(Account.NumberOfEmployees, 100));
```

##### `count()`

Returns the count of elements. <p>Terminal Operation.</p>

###### Return

**Type**

Integer

**Description**

the count of elements

##### `isEmpty()`

Returns whether the count of elements is 0. <p>Terminal Operation.</p>

###### Return

**Type**

Boolean

**Description**

`true` or `false`

##### `toList()`

Accumulates elements into a `List<SObject>`. <p>Terminal Operation.</p>

###### Return

**Type**

List<SObject>

**Description**

the `List<SObject>` containing the sequence elements

###### Example
```apex
List<Account> accountsWithHotRating = SObjectSequence.of(accounts)
    .filter(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
    .toList();
```

##### `toList(String fieldName, Type listType)`

Accumulates `Object` elements into a `List<Object>` according to `fieldName`. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`listType`|result type|

###### Return

**Type**

List<Object>

**Description**

the `List<Object>` containing the sequence elements

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank or `listType` is null|

###### Example
```apex
List<String> accountNames = (List<String>) SObjectSequence.of(accounts)
    .toList('Name', List<String>.class);
```

##### `toList(SObjectField field, Type listType)`

Accumulates `Object` elements into a `List<Object>` according to `field`. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`listType`|result type|

###### Return

**Type**

List<Object>

**Description**

the `List<Object>` containing the sequence elements

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `listType` is null|

###### Example
```apex
List<String> accountNames = (List<String>) SObjectSequence.of(accounts)
    .toList(Account.Name, List<String>.class);
```

##### `toSet()`

Accumulates elements into a `Set<SObject>`. <p>Terminal Operation.</p>

###### Return

**Type**

Set<SObject>

**Description**

the `Set<SObject>` containing the sequence elements

###### Example
```apex
Set<SObject> accountsWithHotRating = SObjectSequence.of(accounts)
    .filter(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
    .toSet();
```

##### `toIdSet()`

Accumulates `Id` elements into a `Set<Id>`. <p>Terminal Operation.</p>

###### Return

**Type**

Set<Id>

**Description**

the `Set<Id>` containing the sequence element field values

###### Example
```apex
Set<Id> accountIds = SObjectSequence.of(accounts).toIdSet();
```

##### `toIdSet(String fieldName)`

Accumulates `Id` elements into a `Set<Id>` according to `fieldName`. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

###### Return

**Type**

Set<Id>

**Description**

the `Set<Id>` containing the sequence element field values

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
Set<Id> accountIds = SObjectSequence.of(contacts).toIdSet('AccountId');
```

##### `toIdSet(SObjectField field)`

Accumulates `Id` elements into a `Set<Id>` according to `field`. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the field|

###### Return

**Type**

Set<Id>

**Description**

the `Set<Id>` containing the sequence element field values

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Set<Id> accountIds = SObjectSequence.of(contacts).toIdSet(Contact.AccountId);
```

##### `toStringSet(String fieldName)`

Accumulates `String` elements into a `Set<String>` according to `fieldName`. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

###### Return

**Type**

Set<String>

**Description**

the `Set<String>` containing the sequence element field values

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
Set<String> accountNames = SObjectSequence.of(accounts).toStringSet('Name');
```

##### `toStringSet(SObjectField field)`

Accumulates `String` elements into a `Set<String>` according to `field`. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the field|

###### Return

**Type**

Set<String>

**Description**

the `Set<String>`containing the sequence element field values

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Set<String> accountNames = SObjectSequence.of(accounts).toStringSet(Account.Name);
```

##### `toMap()`

Accumulates elements into a `Map<Id, SObject>`. <p>Terminal Operation.</p>

###### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>` containing the sequence elements

###### Example
```apex
Map<Id, SObject> accountsWithHotRating = SObjectSequence.of(accounts)
    .filter(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
    .toMap();
```

##### `toByIdMap(String fieldName, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, SObject>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`mapType`|result type|

###### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>` containing the sequence elements

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank or `mapType` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) SObjectSequence.of(contacts)
    .toByIdMap('AccountId', Map<Id, Contact>.class);
```

##### `toByIdMap(SObjectField field, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, SObject>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`mapType`|result type|

###### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>` containing the sequence elements

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank or `mapType` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) SObjectSequence.of(contacts)
    .toByIdMap(Contact.AccountId, Map<Id, Contact>.class);
```

##### `toByStringMap(String fieldName, Type mapType)`

Accumulates `SObject` elements into a `Map<String, SObject>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|
|`mapType`|result type|

###### Return

**Type**

Map<String,SObject>

**Description**

the `Map<String, SObject>` containing the sequence elements

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank or `mapType` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
Map<String, Account> accountByName = (Map<String, Account>) SObjectSequence.of(accounts)
    .toByStringMap('Name', Map<String, Account>.class);
```

##### `toByStringMap(SObjectField field, Type mapType)`

Accumulates `SObject` elements into a `Map<String, SObject>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the field|
|`mapType`|result type|

###### Return

**Type**

Map<String,SObject>

**Description**

the `Map<String, SObject>` containing the sequence elements

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `mapType` is null|
|`IllegalStateException`|if mapped keys contain duplicates|

###### Example
```apex
Map<String, Account> accountByName = (Map<String, Account>) SObjectSequence.of(accounts)
    .toByStringMap(Account.Name, Map<String, Account>.class);
```

##### `groupById(String fieldName)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

###### Return

**Type**

Map<Id,List<SObject>>

**Description**

the `Map<Id, List<SObject>>` containing the sequence elements

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
Map<Id, List<Contact>> contactsByAccountId = SObjectSequence.of(contacts).groupById('AccountId');
```

##### `groupById(SObjectField field)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the field|

###### Return

**Type**

Map<Id,List<SObject>>

**Description**

the `Map<Id, List<SObject>>` containing the sequence elements

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Map<Id, List<Contact>> contactsByAccountId = SObjectSequence.of(contacts).groupById(Contact.AccountId);
```

##### `groupByString(String fieldName)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field|

###### Return

**Type**

Map<String,List<SObject>>

**Description**

the `Map<String, List<SObject>>` containing the sequence elements

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

###### Example
```apex
Map<String, List<Account>> accountsByRating = SObjectSequence.of(accounts).groupByString('Rating');
```

##### `groupByString(SObjectField field)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`field`|the field|

###### Return

**Type**

Map<String,List<SObject>>

**Description**

the `Map<String, List<SObject>>` containing the sequence elements

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Map<String, List<Account>> accountsByRating = SObjectSequence.of(accounts).groupByString(Account.Rating);
```

##### `partition(ISObjectPredicate predicate)`

Partition `SObject` elements by `predicate`. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

Map<Boolean,List<SObject>>

**Description**

the `Map<Boolean, List<SObject>>` containing the sequence elements

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
    = SObjectSequence.of(accounts).partition(SObjectPredicate.isEqual(Account.Rating, 'Hot'));
```

---
