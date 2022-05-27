# SObjectStream

`APIVERSION: 54`

`STATUS: ACTIVE`

A sequence of `SObject` elements supporting aggregate operations. Stream operations are composed of stream chain. A stream chain consists of: <ul>     <li>A Source (which might be an iterable (such as list or set), an iterator, a generator function, etc).</li>     <li>Zero or more Intermediate Operations (which transform a stream into another stream,     such as SObjectStream.filter(ISObjectPredicate)).</li>     <li>A Terminal Operation (which produces a result such as     SObjectStream.count() or SObjectStream.collect(ISObjectCollector)).</li> </ul> <p>Streams are <strong>lazy</strong>:</p> <ul>     <li>Intermediate operations describe how a stream is processed without performing any action.</li>     <li>Computation is only performed when the terminal operation is initiated, and source elements are consumed only as needed.</li> </ul> <p>A stream may not consume all elements. It may be infinite and complete in finite time.</p> <p>A stream should be operated on (invoking an intermediate or terminal stream operation) only <strong>once</strong>. A stream throws [IllegalStateException](/docs/Exceptions/IllegalStateException.md) if it detects that the stream is being reused.</p> <p>Contract:</p> <ul>     <li>Must be non-interfering (do not modify the stream source but may mutate its elements).</li>     <li>Should be stateless in most cases.</li> </ul> <p>Unlike in Java, an Apex Streams may execute only <strong>sequentially</strong>, i.e. do not support `spliterator()`.</p> <p>There are primitive specializations for [IntStream](/docs/Iterables/IntStream.md), [LongStream](/docs/Iterables/LongStream.md), and [DoubleStream](/docs/Iterables/DoubleStream.md) and [ObjectStream](/docs/Iterables/ObjectStream.md) for Object references.</p> <p>Sequences and streams equally ensure the fulfillment of the set goals, but are implemented in different ways.</p>


**Author** O. Berehovskyi


**Group** Iterables


**See** [SObjectSequence](/docs/Iterables/SObjectSequence.md)


**See** [ObjectStream](/docs/Iterables/ObjectStream.md)


**See** [IntStream](/docs/Iterables/IntStream.md)


**See** [LongStream](/docs/Iterables/LongStream.md)


**See** [DoubleStream](/docs/Iterables/DoubleStream.md)

## Properties

### `isOperated` → `Boolean`


A flag defining whether this stream has been linked or consumed.

---
## Methods
### Other
##### `iterator()`

Returns an internal iterator for the elements of this stream. <p>Terminal Operation.</p>

###### Return

**Type**

Iterator<SObject>

**Description**

the internal `Iterator<SObject>`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if this stream has been operated (linked or consumed)|

---
### Sources
##### `static of(Iterator<SObject> iterator)`

Returns a `SObjectStream` created from `iterator`.

###### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

###### Example
```apex
ISObjectIterable accStream = SObjectStream.of(new List<Account>(accounts).iterator());
ISObjectIterable accStream = SObjectStream.of(new Set<Account>(accounts).iterator());
ISObjectIterable accStream = SObjectStream.of(
    (Iterator<Account>) Database.getQueryLocator('SELECT Id FROM Account').iterator()
);
ISObjectIterable accStream = SObjectStream.of(otherStream.iterator());
```

##### `static of(Iterable<SObject> iterable)`

Returns a `SObjectStream` created from `iterable`.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the iterable|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
ISObjectIterable accStream = SObjectStream.of(new List<Account>(accounts));
ISObjectIterable accStream = SObjectStream.of((Iterable<Account>) new Set<Account>(accounts));
ISObjectIterable accStream = SObjectStream.of(stream1);
```

##### `static ofNullable(Iterable<SObject> iterable)`

Returns a `SObjectStream` created from `iterable` if non-null, otherwise returns an empty `SObjectStream`.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the iterable|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream` if `iterable` is non-null, otherwise an empty `SObjectStream`

###### Example
```apex
ISObjectIterable accStream = SObjectStream.ofNullable(new List<Account>(accounts));
ISObjectIterable accStream = SObjectStream.ofNullable((Iterable<Account>) new Set<Account>(accounts));
ISObjectIterable accStream = SObjectStream.ofNullable(stream1);
```

##### `static empty()`

Returns an empty `SObjectStream`.

###### Return

**Type**

ISObjectIterable

**Description**

the empty `SObjectStream`

##### `static generate(ISObjectSupplier supplier)`

Returns an infinite `SObjectStream` where each element is generated by `supplier`.

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier of generated elements|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

###### Example
```apex
ISObjectIterable accStream = SObjectStream.generate(SObjectSupplier.of(Account.SObjectType));
```

##### `static iterate(SObject seed, ISObjectUnaryOperator operator)`

Returns an infinite `SObjectStream` produced by iterative application of `operator` to an initial element `seed`, producing a `SObjectStream` consisting of `seed`, `operator(seed)`, `operator(operator(seed))`, etc.

###### Parameters
|Param|Description|
|---|---|
|`seed`|the initial element|
|`operator`|the operator to be applied to the previous element to produce a new element|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

##### `static iterate(SObject seed, ISObjectPredicate predicate, ISObjectUnaryOperator operator)`

Returns an infinite `SObjectStream` produced by iterative application of `operator` to an initial element `seed`, conditioned on satisfying `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`seed`|the initial element|
|`predicate`|the predicate to determine when the stream must be terminated|
|`operator`|the operator to be applied to the previous element to produce a new element|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `supplier` is null|

##### `static concat(Iterable<SObject> iterable1, Iterable<SObject> iterable2)`

Returns lazily concatenated `SObjectStream` whose elements are all the elements of the first `Iterable<SObject>` followed by all the elements of the second `Iterable<SObject>`.

###### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<SObject>`|
|`iterable2`|the second `Iterable<SObject>`|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

###### Example
```apex
ISObjectIterable accStream = SObjectStream.concat(stream1, stream2);
ISObjectIterable accStream = SObjectStream.concat(accounts1, accounts2);
```

##### `static concat(List<Iterable<SObject>> iterables)`

Returns lazily concatenated `List<Iterable<SObject>>`.

###### Parameters
|Param|Description|
|---|---|
|`iterables`|the list of `Iterable<SObject>`|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some element in a list is null|

###### Example
```apex
ISObjectIterable accStream = SObjectStream.concat(streams);
```

##### `static zip(Iterable<SObject> iterable1, Iterable<SObject> iterable2, ISObjectBinaryOperator combiner)`

Returns a combined `SObjectStream` by applying `combiner` function to each element at the same position.

###### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<SObject>`|
|`iterable2`|the second `Iterable<SObject>`|
|`combiner`|the binary operator to be applied to each element at the same position|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

###### Example
```apex
ISObjectIterable accountsWithMinAnnualRevenueStream = SObjectStream.zip(
    Trigger.old,
    Trigger.new,
    SObjectBinaryOperator.minBy(Account.AnnualRevenue)
);
```

##### `static zip(Iterable<SObject> iterable1, Iterable<SObject> iterable2, ISObjectBiPredicate predicate, ISObjectBinaryOperator combiner)`

Returns a combined `SObjectStream` by applying `combiner` function to each element at the same position, conditioned on satisfying `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<SObject>`|
|`iterable2`|the second `Iterable<SObject>`|
|`predicate`|the binary predicate|
|`combiner`|the binary operator to be applied to each element at the same position|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2`, `predicate` or `combiner` is null|

###### Example
```apex
ISObjectIterable newAccountsWithChangedAnnualRevenueStream = SObjectStream.zip(
    Trigger.old,
    Trigger.new,
    SObjectBiPredicate.areEqual(Account.AnnualRevenue).negate(),
    SObjectBinaryOperator.right()
);
```

##### `override append(Iterable<SObject> iterable)`

Returns new `SObjectStream` by appending `iterable` to the current stream.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the `Iterable<SObject>` to append to the current stream|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
ISObjectIterable accStream = stream1.append(stream2);
```

##### `prepend(Iterable<SObject> iterable)`

Returns new `SObjectStream` by prepending `iterable` to the current stream.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the `Iterable<SObject>` to prepend to the current stream|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
ISObjectIterable accStream = stream1.prepend(stream2);
```

---
### Intermediate Operations
##### `sequence()`

Returns new `SObjectSequence` from the current stream. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence`

###### Example
```apex
ISObjectIterable accSeq = SObjectStream.of(accounts).sequence();
```

##### `override filter(ISObjectPredicate predicate)`

Returns a `SObjectStream` with elements that match `predicate`. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Account> accountsWithHotRating = SObjectStream.of(accounts)
    .filter(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
    .toList();
```

##### `override take(ISObjectPredicate predicate)`

Returns a `SObjectStream` which takes elements while elements match `predicate`. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Account> firstAccountsWithHotRating = SObjectStream.of(accounts)
    .take(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
    .toList();
```

##### `override drop(ISObjectPredicate predicate)`

Returns a `SObjectStream` which drops elements while elements match `predicate`, then takes the rest. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Account> restAccounts = SObjectStream.of(accounts)
    .drop(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
    .toList();
```

##### `override mapTo(ISObjectUnaryOperator mapper)`

Returns a `SObjectStream` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Account> accounts = SObjectStream.of(contacts)
    .mapTo(SObjectUnaryOperator.getSObject(Contact.AccountId))
    .toList();
```

##### `override mapToInt(ISObjectToIntFunction mapper)`

Returns a `IntStream` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IIntIterable

**Description**

the `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Integer> numberOfEmployees = SObjectStream.of(accounts)
    .mapToInt(SObjectToIntFunction.get(Account.NumberOfEmployees))
    .toList();
```

##### `override mapToLong(ISObjectToLongFunction mapper)`

Returns a `LongStream` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

ILongIterable

**Description**

the `LongStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Long> numberOfEmployees = SObjectStream.of(accounts)
    .mapToLong(SObjectToLongFunction.get(Account.NumberOfEmployees))
    .toList();
```

##### `override mapToDouble(ISObjectToDoubleFunction mapper)`

Returns a `DoubleStream` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IDoubleIterable

**Description**

the `DoubleStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Double> annualRevenues = SObjectStream.of(accounts)
    .mapToDouble(SObjectToDoubleFunction.get(Account.AnnualRevenue))
    .toList();
```

##### `override mapToObject(ISObjectFunction mapper)`

Returns a `ObjectStream` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Object> birthdates = SObjectStream.of(contacts)
    .mapToObject(SObjectToDoubleFunction.get(Contact.Birthdate))
    .toList();
```

##### `override flatMapTo(ISObjectFunction mapper)`

Returns a new `SObjectStream` with `SObject` elements as a result of replacing each element of this stream with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<SObject>`|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Contact> contacts = SObjectStream.of(accounts)
    .flatMapTo(SObjectFunction.getSObjects('Contacts'))
    .toList();
```

##### `flatMapToInt(ISObjectFunction mapper)`

Returns a new `IntStream` with `Integer` elements as a result of replacing each element of this stream with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Integer>`|

###### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

##### `flatMapToLong(ISObjectFunction mapper)`

Returns a new `LongStream` with `Long` elements as a result of replacing each element of this stream with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Long>`|

###### Return

**Type**

ILongIterable

**Description**

the new `LongStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

##### `flatMapToDouble(ISObjectFunction mapper)`

Returns a new `DoubleStream` with `Double` elements as a result of replacing each element of this stream with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Double>`|

###### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

##### `flatMapToObject(ISObjectFunction mapper)`

Returns a new `ObjectStream` with `Object` elements as a result of replacing each element of this stream with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Object>`|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

##### `override forEach(ISObjectConsumer consumer)`

Returns a `SObjectStream` after performing `consumer` action on each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`consumer`|the non-interfering, stateless action to be performed on each element. Expected to operate via side effects.|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

###### Example
```apex
List<Account> accountsWithResetAnnualRevenue = SObjectStream.of(accounts)
    .forEach(SObjectConsumer.set(Account.AnnualRevenue, 0))
    .toList();
```

##### `override distinct()`

Returns a `SObjectStream` with distinct elements. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectStream`

###### Example
```apex
List<Account> distinctAccounts = SObjectStream.of(accounts)
    .distinct()
    .toList();
```

##### `override distinct(ISObjectFunction classifier)`

Returns a `SObjectStream` with distinct elements according to `classifier` function. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the classifier function|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
List<Account> distinctAccountsByName = SObjectStream.of(accounts)
    .distinct(SObjectFunction.get(Account.Name))
    .toList();
```

##### `sort()`

Returns a `SObjectStream` with sorted elements in ascending order. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectStream`

###### Example
```apex
List<Account> sortedAccounts = SObjectStream.of(accounts)
    .sort()
    .toList();
```

##### `override sort(ISObjectComparator comparator)`

Returns a `SObjectStream` with sorted elements according to `comparator`. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`comparator`|the non-interfering, stateless comparator to compare stream elements|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `comparator` is null|

###### Example
```apex
List<Account> sortedAccountsByName = SObjectStream.of(accounts)
    .sort(SObjectComparator.comparing(Account.Name))
    .toList();
```

##### `lim(Integer lim)`

Returns a `SObjectStream` with first `lim` elements. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `lim` is null|
|`IllegalStateException`|if `lim` is less than 0|

###### Example
```apex
List<Account> first100Accounts = SObjectStream.of(accounts)
    .lim(100)
    .toList();
```

##### `skip(Integer n)`

Returns a new `SObjectStream` that skips first `n` elements and returns remaining elements. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`n`|the number of elements to skip|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `n` is null|
|`IllegalStateException`|if `n` is less than 0|

###### Example
```apex
List<Account> restAccounts = SObjectStream.of(accounts)
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
Account accountWithMaxNumberOfEmployees = SObjectStream.of(accounts)
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
Account accountWithMaxNumberOfEmployees = SObjectStream.of(accounts)
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
List<String> accountNames = (List<String>) SObjectStream.of(accounts)
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
    SObjectStream.of(contacts)
        .collect(SObjectCollector.groupingById(Contact.AccountId));
// Group contacts by Department and by Account.Rating, cascading two collectors
Map<String, Map<String, List<Contact>>> contactsByAccountRatingByDepartment
    = (Map<String, Map<String, List<Contact>>>)
        SObjectStream.of(contacts)
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
Account firstAccountWithMoreThan100NumberOfEmployees = SObjectStream.of(accounts)
    .find(SObjectPredicate.isGreater(Account.NumberOfEmployees, 100))
    .get();
```

##### `override every(ISObjectPredicate predicate)`

Returns whether all elements match `predicate`. If `SObjectStream` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

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
Boolean isEveryAccountWithMoreThan100NumberOfEmployees = SObjectStream.of(accounts)
    .every(SObjectPredicate.isGreater(Account.NumberOfEmployees, 100));
```

##### `override some(ISObjectPredicate predicate)`

Returns whether some element matches `predicate`. If `SObjectStream` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

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
Boolean isSomeAccountWithMoreThan100NumberOfEmployees = SObjectStream.of(accounts)
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

the `List<SObject>` containing the stream elements

###### Example
```apex
List<Account> accountsWithHotRating = SObjectStream.of(accounts)
    .filter(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
    .toList();
```

##### `override toList(ISObjectFunction mapper, Type listType)`

Accumulates elements returned by `mapper` into a `List<?>` of specific `listType`. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|
|`listType`|result type|

###### Return

**Type**

List<Object>

**Description**

the `List<Object>` containing the stream elements

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `listType` is null|

###### Example
```apex
List<String> accountNames = (List<String>) SObjectStream.of(accounts)
    .toList(SObjectFunction.get('Name'), List<String>.class);
```

##### `toSet()`

Accumulates elements into a `Set<SObject>`. <p>Terminal Operation.</p>

###### Return

**Type**

Set<SObject>

**Description**

the `Set<SObject>` containing the stream elements

###### Example
```apex
Set<SObject> accountsWithHotRating = SObjectStream.of(accounts)
    .filter(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
    .toSet();
```

##### `toIdSet()`

Accumulates `Id` elements into a `Set<Id>`. <p>Terminal Operation.</p>

###### Return

**Type**

Set<Id>

**Description**

the `Set<Id>` containing the stream elements field values

###### Example
```apex
Set<Id> accountIds = SObjectStream.of(accounts).toIdSet();
```

##### `override toIdSet(ISObjectFunction mapper)`

Accumulates `Id` elements returned by `mapper` into a `Set<Id>`. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Return

**Type**

Set<Id>

**Description**

the `Set<Id>` containing the stream elements field values

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Set<Id> accountIds = SObjectStream.of(contacts).toIdSet(SObjectFunction.get('AccountId'));
```

##### `override toStringSet(ISObjectFunction mapper)`

Accumulates `String` elements returned by `mapper` into a `Set<String>`. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Return

**Type**

Set<String>

**Description**

the `Set<String>`containing the stream elements field values

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Set<String> accountNames = SObjectStream.of(accounts).toStringSet(SObjectFunction.get('Name'));
```

##### `toMap()`

Accumulates elements into a `Map<Id, SObject>`. <p>Terminal Operation.</p>

###### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>` containing the stream elements

###### Example
```apex
Map<Id, SObject> accountsWithHotRating = SObjectStream.of(accounts)
    .filter(SObjectPredicate.isEqual(Account.Rating, 'Hot'))
    .toMap();
```

##### `override toByIdMap(ISObjectFunction keyMapper, Type mapType)`

Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType` whose keys are produced by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`mapType`|result type|

###### Return

**Type**

Map<Id,SObject>

**Description**

the `Map<Id, SObject>` containing the stream elements

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `mapType` is null|
|`IllegalStateException`|if mapped keys contain duplicates, which can be casted to `mapType`|

###### Example
```apex
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) SObjectStream.of(contacts)
    .toByIdMap(SObjectFunction.get('AccountId'), Map<Id, Contact>.class);
```

##### `override toByStringMap(ISObjectFunction keyMapper, Type mapType)`

Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType` whose keys are produced by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`mapType`|result type|

###### Return

**Type**

Map<String,SObject>

**Description**

the `Map<String, SObject>` containing the stream elements

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` or `mapType` is null|
|`IllegalStateException`|if mapped keys contain duplicates, which can be casted to `mapType`|

###### Example
```apex
Map<String, Account> accountByName = (Map<String, Account>) SObjectStream.of(accounts)
    .toByStringMap(SObjectFunction.get('Name'), Map<String, Account>.class);
```

##### `override groupById(ISObjectFunction keyMapper)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are values returned by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|

###### Return

**Type**

Map<Id,List<SObject>>

**Description**

the `Map<Id, List<SObject>>` containing the stream elements

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Map<Id, List<Contact>> contactsByAccountId = SObjectStream.of(contacts)
    .groupById(SObjectFunction.get('AccountId'));
```

##### `override groupByString(ISObjectFunction keyMapper)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are values returned by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|

###### Return

**Type**

Map<String,List<SObject>>

**Description**

the `Map<String, List<SObject>>` containing the stream elements

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
Map<String, List<Account>> accountsByRating = SObjectStream.of(accounts)
    .groupByString(SObjectFunction.get('Rating'));
```

##### `override partition(ISObjectPredicate predicate)`

Partition `SObject` elements by `predicate`. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

Map<Boolean,List<SObject>>

**Description**

the `Map<Boolean, List<SObject>>` containing the stream elements

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
    = SObjectStream.of(accounts).partition(SObjectPredicate.isEqual(Account.Rating, 'Hot'));
```

---
