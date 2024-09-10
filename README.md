# Apex Stream Framework

![](https://img.shields.io/github/v/release/berehovskyi/apex-stream?include_prereleases)
![](https://img.shields.io/badge/build-passing-brightgreen.svg)
![](https://img.shields.io/badge/coverage-100%25-brightgreen.svg)

Apex Stream is a framework for processing sequences of elements that takes advantage of the functional programming paradigm.

Inspired by [Java Stream API](https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/stream/package-summary.html),
slightly influenced by [C# Linq.Enumerable](https://docs.microsoft.com/en-us/dotnet/api/system.linq.enumerable) and
[js Array.prototype](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array).

## Table of Contents
<details>
  <summary>Click to expand!</summary>

- [Apex Stream Framework](#apex-stream-framework)
  * [Installation](#installation)
    + [Dependencies](#dependencies)
  * [Modules and Key Features](#modules-and-key-features)
  * [Introduction](#introduction)
  * [Get Started](#get-started)
    + [Note](#note)
  * [Stream Sources](#stream-sources)
    + [Stream of Iterable](#stream-of-iterable)
    + [Empty Stream](#empty-stream)
    + [Infinite Stream](#infinite-stream)
  * [Merging Streams](#merging-streams)
    + [Concatenation](#concatenation)
    + [Zipping](#zipping)
  * [Intermediate Operations](#intermediate-operations)
    + [Set Operations](#set-operations)
    + [Filtering](#filtering)
    + [Iterating](#iterating)
    + [Mapping](#mapping)
    + [Limit and Skip](#limit-and-skip)
    + [Sorting](#sorting)
  * [Terminal Operations](#terminal-operations)
    + [Matching](#matching)
    + [Reduction](#reduction)
    + [Collecting](#collecting)
    + [Fast Collecting](#fast-collecting)
    + [Run](#run)
  * [Optional](#optional)
  * [Examples](#examples)
  * [Documentation](#documentation)
  * [User Guide (in development)](#user-guide-in-development)
</details>

## Installation

<a href="https://githubsfdeploy.herokuapp.com?owner=berehovskyi&repo=apex-stream&ref=main">
  <img alt="Deploy to Salesforce" src="https://img.shields.io/badge/Deploy%20to-Salesforce-%2300a1e0?style=for-the-badge&logo=appveyor">
</a>

or install as an Unlocked Package using the CLI:

### Dependencies

- [Apex Validate](https://github.com/berehovskyi/apex-validate)

Install dependencies first:

```sh
sf package install -p 04t1t000003f3UVAAY -o me@example.com -r -w 5
```

Install the Apex Stream. The framework consists of several Unlocked Packages:

- Apex Functions (required):

```sh
sf package install -p 04tJ5000000D4SIIA0 -o me@example.com -r -w 10
```

- Apex Enumerables (required):

```sh
sf package install -p 04tJ5000000D4SNIA0 -o me@example.com -r -w 10
```

- Apex Streams (required):

```sh
sf package install -p 04tJ5000000D4SSIA0 -o me@example.com -r -w 10
```

- Apex Sequences (recommended):

```sh
sf package install -p 04tJ5000000D4SXIA0 -o me@example.com -r -w 10
```

- Apex Common Functions Core (recommended):

```sh
sf package install -p 04tJ5000000D4ScIAK -o me@example.com -r -w 10
```

- Apex Common Functions Extension (optional):

```sh
sf package install -p 04t1t000000koWNAAY -o me@example.com -r -w 10
```

## Modules and Key Features

- Apex Functions:
  - Functional Interfaces
  - Functional Abstract Classes with
    - inherited abstract methods
    - default and static methods for functional composition

- Apex Enumerables:
  - Enumerables with implementations:
    - Streams (`SObjectStream`, `ObjectStream` and number `DoubleStream`, `IntStream`, `LongStream`)
    - Sequences (`SObjectSequence`, `ObjectSequence` and number `DoubleSequence`, `IntSequence`, `LongSequence`)
  - Optionals 

- Apex Common Functions:
  - Functional Built-in Classes with common Functional Abstract Classes implementations
  - Built-in Collectors (`SObjectCollectors`, `Collectors`)

## Introduction

**Apex Stream Framework** is built on custom `Iterables` (hereinafter - `Enumerables`) that allows processing
a sequence of elements supporting sequential aggregate operations,
providing a convenient declarative API. 

There are `2` implementations of `Enumerable` - `Stream` and `Sequence`.

`Stream` is lazy. Computation on the source data is only performed when the terminal operation is initiated,
and source elements are consumed only as needed. Also, a `Stream` can be operated on
(invoking an intermediate or terminal stream operation) only **once**.

`Sequence` is eager. Computation on the source data is performed every time an intermediate or terminal operation is invoked.
Since `Sequence` is stateful, it can be reused multiple times.

There are a reference and primitive specializations of `Streams` and `Sequences`

- Reference: `ObjectStream`, `SObjectStream`, `ObjectSequence`, `SObjectSequence`
- Primitive: `IntStream`, `LongStream`, `DoubleStream`, `IntStream`, `LongStream`, `DoubleStream`

`Enumerables` are operated by `functions`.

In terms of Apex Stream Framework, `function` is an instance of `Functional Interface` or `Functional Abstract Class`.

A `Functional Interface` is an interface that contains only one *single* `abstract` method.

A `Functional Abstract Class` is an `abstract` class that contains only one *single* `abstract` method,
but may or may not contain `final`, `virtual`, or `static` methods to make functional composition possible.

**Apex Stream Framework** contains most of the **built-in** functions, common implementations of `functions`
so you don't have to recreate them every time you need them.

`Enumerable` operations are composed of a chain, which consists of:

- A **Source** which might be an enumerable (such as list or set, an iterator, a generator function, etc.).
- Zero or more **intermediate** operations that transform an enumerable into another enumerable.
- A **terminal** operation that produces a result.

Operations on enumerables **don't** change the source (but can mutate its elements).

## Get Started

### Note

All examples will be shown based on `Streams`,
but all of them are also valid for `Sequences`, except for **infinite** `Streams`.

## Stream Sources

- ### Stream of Iterable

Create a `Stream` depending on the input argument type:

```apex
SObjectEnumerable accountStream = Stream.of(new List<Account>{ acc1, acc2, acc3 });
SObjectEnumerable triggerNewStream = Stream.of(Trigger.new);
IntEnumerable intStream = Stream.of(new Set<Integer>{ 1, 2, 3, -5, 42 });
```

Create a `Stream` explicitly specifying its type:

```apex
SObjectEnumerable accountStream = SObjectStream.of(new List<Account>{ acc1, acc2, acc3 });
SObjectEnumerable triggerNewStream = SObjectStream.of(Trigger.new);
IntEnumerable intStream = IntStream.of(new Set<Integer>{ 1, 2, 3, -5, 42 });
```

- ### Empty Stream

Create a `Stream` with no elements:

```apex
SObjectEnumerable emptySObjectStream = SObjectStream.empty();
```

- ### Infinite Stream[*](#note)

Create an infinite `Stream` by passing `Supplier` to a `generate` method:

```apex
DoubleEnumerable infiniteRandomStream = Stream.generate(DoubleSuppliers.random());

Iterator<Double> streamIterator = infiniteRandomStream.iterator();

streamIterator.next(); // 0.1662399481554503
streamIterator.next(); // 0.2853449086423472
streamIterator.next(); // 0.5196704529392165
// so on...
```

To prevent hitting the CPU time limit, an infinite stream can be limited:

```apex
DoubleEnumerable firstTenRandomStream = Stream.generate(DoubleSuppliers.random()).lim(10);
```

Another way to create an infinite stream is passing an `Operator` and a `seed` to an `iterate` method.
A `Stream` is produced by iterative application of `Operator` to an initial element `seed`,
producing a `Stream` consisting of `seed`, `operator(seed)`, `operator(operator(seed))`, etc.:

```apex
IntEnumerable incrementalStream = Stream.iterate(5, IntOperators.increment());

Iterator<Integer> streamIterator = incrementalStream.iterator();

streamIterator.next(); // 5
streamIterator.next(); // 6
streamIterator.next(); // 7
// so on...
```

## Merging Streams

- ### Concatenation

The simplest way to concat two streams is by using the static `concat` method,
or instance `append`, `prepend` methods:

```apex
SObjectEnumerable accountStream1 = Stream.of(new List<Account>{ acc1, acc2, acc3 });
SObjectEnumerable accountStream2 = Stream.of(new List<Account>{ acc4, acc5, acc6 });

SObjectEnumerable mergedStream = Stream.concat(accountStream1, accountStream2); // [acc1, acc2, acc3, acc4, acc5, acc6]
SObjectEnumerable mergedStream1 = accountStream1.append(accountStream2); // [acc1, acc2, acc3, acc4, acc5, acc6]
SObjectEnumerable mergedStream2 = accountStream1.prepend(accountStream2); // [acc4, acc5, acc6, acc1, acc2, acc3]
```

To concat multiple streams, use the static `concat` method that takes a list of streams:

```apex
SObjectEnumerable mergedStream = Stream.concat(
    new List<ISObjectEnumerable>(accountStream1, accountStream2, accountStream3)
);
```

- ### Zipping

A `zip` operation takes an element from each `Iterable` and combines them by `BiOperator`:

```apex
List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };

IntEnumerable zippedStream = Stream.zip(ints1, ints2, IntBiOperators.sum());
zippedStream.toList(); // [13, 6, 15, 11, 9, 18, 4, 7]
```

For reference streams, `zip` operation has a variation that additionally takes a `BiPredicate` argument
to filter elements before zipping.

Get all `Account` records from `Trigger.new` list on update if `Rating` field has changed:

```apex
SObjectEnumerable newAccountStreamWithChangedRating = Stream.zip(
    Trigger.old, // The first argument is considered as left
    Trigger.new,  // The second argument is considered as right
    // Checks if oldAccount[i].Rating != newAccount[i].Rating
    SObjectBiPredicates.areEqual(Account.Rating).negate(),
    // Always return the right argument i.e elements from Trigger.new in this case
    BiOperator.right()
);
```

## Intermediate Operations

**Intermediate Operation** transforms a stream into another stream.

*Please note that, unlike for `Sequence`, for `Stream` an intermediate operation is not invoked
until a terminal operation is invoked.*

- ### Set Operations

**Set operations** produce a result iterable that is based on the presence or absence of equivalent elements
within the same or separate iterables.

A `union` operation returns the set union, which means unique elements
that appear in *either* of two iterables.

An `intersect` operation returns the set intersection, which means unique elements
that appear *in each* of two iterables.

An `except` operation returns the set difference, which means the elements of one iterable
that *does not appear* in the second iterable.

A `distinct` operation returns an iterable without duplicates.

For example:

```apex
List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };

Stream.of(ints1).union(ints2).toList(); // [5, 3, 9, 7, 8, 6, 4, 1, 0]
Stream.of(ints1).intersect(ints2).toList(); // [3, 9]
Stream.of(ints1).except(ints2).toList(); // [5, 7]
Stream.of(ints1).distinct().toList(); // [5, 3, 9, 7]
```

Get `Share` records to delete and to insert on `Account` update,
based on `Share` records' composite keys:

```apex
// Implement function that returns a UserOrGroupId-AccountId composite key
class CompositeKeyFunction implements IFunction {
    public Object apply(Object o) {
        SObject sObj = (SObject) o;
        return sObj.get(AccountShare.UserOrGroupId) + sObj.get(AccountShare.AccountId);
    }
}

List<AccountShare> sharesToInsert = new List<AccountShare>{ sh1, sh2, sh3, sh4, sh5 };
List<AccountShare> sharesToDelete = new List<AccountShare>{ sh3, sh4, sh6 };

// Get shares based on set differences according to a composite key classifying function:
Stream.of(sharesToInsert).except(sharesToDelete, new CompositeKeyFunction()).toList();
Stream.of(sharesToDelete).except(sharesToInsert, new CompositeKeyFunction()).toList();
```

- ### Filtering

A `filter` operation picks only elements that satisfy a `predicate`.

Get accounts with `AnnualRevenue` greater than `10000`:

```apex
SObjectEnumerable accountStreamWithAnnualRevenueGreaterThan10k = Stream.of(accounts)
    .filter(SObjectPredicates.isGreater(Account.AnnualRevenue, 10000));
```

Get accounts with `AnnualRevenue` greater than `1000000` and with `Rating` == `Hot`
using function composition:

```apex
SObjectEnumerable filteredAccountStream = Stream.of(accounts)
    .filter(
        SObjectPredicates.isGreater(Account.AnnualRevenue, 10000)
            .andAlso(SObjectPredicates.isEqual(Account.Rating, 'Hot'))
    );
```

- ### Iterating

A `forEach` operation iterates over the stream of elements,
instead of using `for`, `for-each`, and `while` loops. A `forEach` is expected to mutate elements.

Set `Rating` to `Hot` for each account:

```apex
SObjectEnumerable mutatedAccountStream = Stream.of(accounts)
    .forEach(SObjectConsumers.set(Account.Rating, 'Hot'));
```

Set `Rating` to `Hot` and set `AnnualRevenue` to `0` for each account using function composition:

```apex
SObjectEnumerable mutatedAccountStream = Stream.of(accounts)
    .forEach(
        SObjectConsumers.set(Account.Rating, 'Hot')
            .andThen(SObjectConsumers.set(Account.AnnualRevenue, 0))
    );
```

- ### Mapping

A `mapTo` operation converts elements by applying a function to them
and collects these new elements into a new stream.

Create a stream of parent `Accounts` from the contact stream:

```apex
SObjectEnumerable accountStream = Stream.of(contacts)
    .mapTo(SObjectOperators.getSObject('Account'));
```

Create a `DoubleStream` from `Account.AnnualRevenue` values:

```apex
DoubleEnumerable revenueStream = Stream.of(accounts)
    .mapToDouble(SObjectToDoubleFunctions.get(Account.AnnualRevenue));
```

A `flatMapTo` operation converts elements by applying a function that returns an `Iterable` to them
and collects these new *inner* elements into a new stream.

Create a stream of related child contacts from the account stream:

```apex
SObjectEnumerable contactStream = Stream.of(accounts)
    .flatMapTo(SObjectFunctions.getSObjects('Contacts'));
```

Create a stream of flattened ints from a nested `List<List<Integer>>` list:

```apex
List<List<Integer>> containedInts = new List<List<Integer>>{
    new List<Integer>{ 1 },
    null,
    new List<Integer>(),
    new List<Integer>{ 0, 10 },
    new List<Integer>{ null }
}; // [ [1], null, [], [0, 10], [null] ]

List<Integer> flattenedInts = Stream.of(containedInts)
    .flatMapToInt(Function.identity())
    .toList(); // [1, 0, 10, null]
```

- ### Limit and Skip

A `limit` operation returns a stream not longer than the requested size.

A `skip` operation discards the first `n` elements of a stream.

Get the second page of accounts with `10` elements size:

```apex
Integer page = 2;
Integer pageSize = 10;

List<Account> accountsForTheSecondPage = Stream.of(accounts)
    .skip(pageSize * (page - 1))
    .lim(pageSize)
    .toList();
```

- ### Sorting

A `sort` operation returns a sorted stream considering the sort order and `Comparer` function.

Sort accounts according to default order:

```apex
SObjectEnumerable sortedAccountStream = Stream.of(accounts)
    .sort();
```

Sort accounts according to order:

```apex
SObjectEnumerable sortedDescAccountStream = Stream.of(accounts)
    .sort(SortOrder.DESCENDING);
```

Sort accounts by `Name`:

```apex
SObjectEnumerable sortedAccountStream = Stream.of(accounts)
    .sort(Account.Name);
```

Sort accounts by `Rating` and then, if ratings are equal, sort
by `NumberOfEmployees` considering `nulls` greater than any value and then sort
by `AnnualRevenue` in descending order:

```apex
SObjectEnumerable sortedAccountStream = Stream.of(accounts)
    .sort(
        Comparer.comparing(SObjectFunctions.get(Account.Rating))
            .thenComparing(SObjectFunctions.get(Account.NumberOfEmployees).nullsLast())
            .thenComparing(SObjectFunctions.get(Account.AnnualRevenue).reversed())
    );
```

## Terminal Operations

**Terminal Operations** produces a stream result and can be invoked only *once*.

- ### Matching

`find`, `every`, `some`, and `none` operations validate elements according to a predicate.

A `find` operation returns the *first* element that matches a predicate as [Optional](#optional).

An `every` operation checks if *all* elements match a predicate.

An `some` operation checks if *some* element matches a predicate.

A `none` operation checks if *no* elements match a predicate.

Check if all accounts have `Hot` `Rating`:

```apex
Boolean isEveryAccountHot = Stream.of(accounts)
    .every(Account.Rating, 'Hot');
```

Find a first `Warm` account:

```apex
Optional optionalWarmAccount = Stream.of(accounts)
    .find(Account.Rating, 'Warm');
```

- ### Reduction

A `reduce` operation performs a stream reduction,
using the provided `identity` value and an associative `accumulation` function,
and returns the reduced value.

`reduce` is equivalent to:

```apex
T result = identity;
for (T element : thisStream) {
    result = accumulator.apply(result, element);
}
return result;
```

Calculate a factorial of `n` (up to 20):

```apex
Long factorial(Long n) {
    return LongStream.range(1, n).reduce(1, LongBiOperators.product());
}

factorial(20L); // 2432902008176640000
```

`min`, `max` operations on a primitive stream find a minimal or maximal element
according to the default order as [Optional](#optional):

```apex
Integer maxInt = (Integer) Stream.of(integers)
    .max()  // returns an Optional
    .get(); // returns a value if present or throws NoSuchElementException otherwise
```

On a reference stream, search reduction is operated according to
a comparer and returns a result as [Optional](#optional).

Find an optional account with a max `AnnualRevenue`:

```apex
Optional optionalAccountWithMaxAnnualRevenue = Stream.of(accounts)
    .max(Account.AnnualRevenue);
```

`sum`, `avg` operations on a primitive stream calculate an arithmetic *sum* and *mean*.

Calculate the sum of elements of the stream:

```apex
Double sum = Stream.of(doubles).sum();
```

`sum`, `avg` operations on a reference stream calculate an arithmetic sum and mean
of elements returned by a mapping function.

Find an optional account with a max `AnnualRevenue`:

```apex
Double sumOfAnnualRevenue = Stream.of(accounts).sum(Account.AnnualRevenue);
```

- ### Collecting

A `collect` operation performs a mutable reduction operation on stream elements,
collecting elements into a container using `Collector` or (`Suppier` and `BiConsumer`) functions.

`collect` is equivalent to:

```apex
R result = supplier.get();
for (T element : thisStream) {
    accumulator.accept(result, element);
}
if (finisher != null) {
    return finisher.apply(result);
}
return result;
```

Collect accounts to List:

```apex
List<Account> sumOfAnnualRevenue = (List<Account>) Stream.of(accounts)
    .collect(Collectors.toList(Account.class));
// The same as
List<Account> sumOfAnnualRevenue = Stream.of(accounts).toList();
```

Group accounts by `Rating`:

```apex
Map<Object, List<Account>> accountsByRating = (Map<Object, List<Account>>) Stream.of(accounts)
    .collect(SObjectCollectors.groupingByObject(Account.Rating));
```

Type interference is "broken" in Apex for `Set` and `Map` keys:

```apex
List<Object> o = new List<String>{ 'foo', 'bar' };
List<String> asStrings = (List<String>) o; // Valid cast

Set<Object> o = new Set<String>{ 'foo', 'bar' }; // Illegal assignment from Set<String> to Set<Object>
```

```apex
Map<String, Object> o = new Map<String, String>{ 'foo' => 'bar' };
Map<String, String> asStrings = (Map<String, String>) o; // Valid cast

// Illegal assignment from Map<String,String> to Map<Object,Object>
Map<Object, Object> o = new Map<String, String>{ 'foo' => 'bar' };
```

This is why we should explicitly set a specific collecting function according to an
expected container type:

Group accounts by `Rating` as a string:

```apex
Map<String, List<Account>> accountsByRating = (Map<String, List<Account>>) Stream.of(accounts)
    .collect(SObjectCollectors.groupingByString(Account.Rating));
```

Apex Stream Framework provides built-in collectors for each primitive type:

```apex
Map<Datetime, List<Account>> accountsByRating = (Map<Datetime, List<Account>>) Stream.of(accounts)
    .collect(SObjectCollectors.groupingByDatetime(Account.CreatedDate));
```

Map accounts by `ParentId`:

```apex
Map<Id, SObject> accountByRating = (Map<Id, SObject>) Stream.of(accounts)
    .collect(SObjectCollectors.mapById(Account.ParentId));
```

`accountByRating` map cannot be cast to `Map<String, Account>` directly, because:

```apex
List<SObject> sObjects = new List<Account>();
List<Account> accounts = sObjects; // Cast implicitly

SObject sObj = new Account();
Account acc = (Account) sObj; // Should be cast explicitly
```

To make `accountByRating` castable to `Map<String, Account>` it is possible either

- to specify the type of `Supplier` and `BiOperator` explicitly:

```apex
Map<Id, Account> accountByParentId = (Map<Id, Account>) Stream.of(accounts)
    .collect(
        Collector.of(
            Supplier.of(Map<Id, Account>.class),
            MapObjectConsumers.putToObjectByIdMap(
                SObjectFunctions.get(Account.ParentId), // key mapping function
                SObjectFunction.identity() // value mapping function
            )
        )
    );
```

- or to use `cast` function:

```apex
Map<Id, Account> accountByParentId = (Map<Id, Account>) Stream.of(accounts)
    .collect(SObjectCollectors.mapById(Account.ParentId).cast(Map<Id, Account>.class));
```

Collectors also allow the reusing of complex collection strategies
and composition of collect operations such as multiple-level grouping or partitioning by
using *downstream* collectors.

Classify account names by `BillingCountry` and by `BillingCity` cascading two collectors together:

```apex
ICollector groupNamesByBillingCityDownstreamCollector
    = SObjectCollectors.groupingByString(Account.BillingCity, Account.Name);

Map<String, Map<String, List<String>>> accountNamesByCityByCountry =
    (Map<String, Map<String, List<String>>>) Stream.of(contacts)
        .collect(SObjectCollectors.groupingByString(
            SObjectFunctions.get(Account.BillingCountry),
            groupNamesByBillingCityDownstreamCollector
        ).cast(Map<String, Map<String, List<String>>>.class));

/* The result json structure: 
{
  'US' : {
    'New York' : ['Behance', 'Spotify'],
    'Los Angeles' : ['Universal Pictures', 'CBRE Group']
  },
  'UK' : {
    'London' : ['Aviva', 'Schroders'],
    'Glasgow' : ['Aggreko']
  }
}
*/
```

Few `Collector` functions such as `reducing`, `maximizing`, `minimizing`,
`summing`, `averaging`, and `counting` does **not** support type casting.

Classify accounts with max `AnnualRevenue` per `BillingCountry`:

```apex
IBiOperator accumulator = BiOperator.maxBy(SObjectFunctions.get(Account.AnnualRevenue));
ICollector maximizeAnnualRevenueDownstreamCollector = Collectors.reducing(accumulator);
Map<String, Object> optionalAccountWithMaxRevenueByCity = (Map<String, Object>) Stream.of(accounts)
    .collect(SObjectCollectors.groupingByString(
        SObjectFunctions.get(Account.BillingCity),
        maximizeAnnualRevenueDownstreamCollector
    )); // Cannot be cast to Map<String, Optional>

Optional optionalAccount = (Optional) optionalAccountWithMaxRevenueByCity.get('London');
Account acc = (Account) optionalAccount.get();
```

- ### Fast Collecting

`SObjectIterable` also supports simple fast collecting methods if you don't want to use `collect` operation:

- `toList`
- `toSet`
- `toIdSet`
- `toStringSet`
- `toMap`
- `toByIdMap`
- `toByStringMap`
- `groupById`
- `groupByString`
- `partition`

Collect all `AccountId` values:

```apex
Set<Object> accountIds = Stream.of(contact).toSet(Contact.AccountId);
// Or
Set<Id> accountIds = Stream.of(contact).toIdSet(Contact.AccountId);
// Or
List<Id> accountIds = (List<Id>) Stream.of(contact).toList(Contact.AccountId, Id.class);
```

Group accounts by `Rating`:

```apex
Map<String, List<Account>> accountsByRating = Stream.of(accounts).groupByString(Account.Rating);
```

- ### Run

`Streams` implement `IRunnable` to apply a terminal operation to the `Stream`.

```apex
// The accounts are not mutated until a terminal operation is invoked
SObjectStream accountStream = (SObjectStream) Stream.of(accounts)
    .forEach(SObjectConsumers.set(Account.Rating, 'Hot'));

// Applies the terminal operation to mutate accounts
accountStream.run();
```

## Optional

An `Optional` is a container that may or may not contain a non-null value.

To create an empty `Optional`:

```apex
Optional emptyOptional = Optional.empty();
```

To create an `Optional` from account:

```apex
// Throws NPE if account is null
Optional optionalAccount = Optional.of(account);
// Does not throw NPE if account is null
Optional optionalAccount = Optional.ofNullable(account);
```

To check if `Optional` contains a value, use `isPresent` or `isEmpty` methods:

```apex
Boolean isNonNullAccount = optionalAccount.isPresent();
Boolean isNullAccount = optionalAccount.isEmpty();
```

To act with value if the value is present, use `ifPresent` method:

```apex
optionalAccount.ifPresent(SObjectConsumers.addError('Error Message'));
```

`get` method returns a value if present, otherwise throws `NoSuchElementException`:

```apex
Account acc = (Account) optionalAccount.get(); 
```

To return a default value if `Optional` is empty, otherwise, return value, use `orElse` method:

```apex
Account acc = (Account) optionalAccount.orElse(new Account()); 
```

`orElseGet` is similar to `orElse` but returns a value from a provided `Supplier`:

```apex
Account acc = (Account) optionalAccount.orElseGet(SObjectSuppliers.of(Account.SObjectType)); 
```

## Examples

Calculate the sum of `AnnualRevenue` of distinct by `Name` field accounts with hot rating:

```apex
Double annualRevenueSum = Stream.of(accounts)
    .filter(Account.Rating, 'Hot')
    .distinct(Account.Name)
    .sum(Account.AnnualRevenue);
```

Set `NumberOfEmployees` to `0` for each parent `Account` taken from `contacts`:

```apex
List<Account> accounts = Stream.of(contacts)
    .mapTo('Account')
    .forEach('NumberOfEmployees', 0)
    .toList();
```

Create and relate `contacts` to parent `accounts` and set the `Descripton` field:

```apex
List<Contact> contacts = Stream.of(accounts)
    .mapTo(
        SObjectOperators.newSObject(
            Contact.SObjectType,
            Contact.AccountId,
            SObjectFunction.get(Account.Id)
        ).andThen(SObjectOperators.set(Contact.Description, 'Some Description'))
    )
    .toList();
```

Filter `accounts` having `AnnualRevenue > 10000` sort by `AnnualRevenue` in descending order and group by `Rating`:

```apex
Map<String, List<Account>> accountsByRating = Stream.of(accounts)
    .filter(SObjectPredicates.isGreater('AnnualRevenue', 10000))
    .sort('AnnualRevenue', SortOrder.DESCENDING)
    .groupByString('Rating');
```

Group `LastName` field values by `OtherCountry`:

```apex
Map<String, List<String>> lastNamesByOtherCountry = (Map<String, List<String>>) Stream.of(contacts)
    .collect(
        SObjectCollectors.groupingByString(
            Contact.OtherCountry,
            Contact.LastName
        ).cast(Map<String, List<String>>.class)
    );
```

Filter `input` allowing not blank strings, convert all the characters to uppercase, sort,
skip the first element and return a list containing the first 2 elements:

```apex
List<Object> input = new List<Object>{
    new Account(), 1, 1L, null, '  ', '', 'hello',
    'world', 'Amen', 'Doo', 'baz', 'Bar', 'World', 1.5
};

List<String> result = (List<String>) Stream.of(input)
    .filter(TypePredicates.isInstanceOfString().andAlso(StringPredicates.isNotBlank()))
    .mapTo(StringFunctions.toUpperCase())
    .sort()
    .skip(1)
    .lim(2)
    .toList(String.class); // ['BAR', 'BAZ']
```

And more!

Find more examples [here](/sfdx-source/apex-stream/streams/test/classes).

## Documentation

[Full Apex Stream Framework Documentation](/docs/README.md).

## User Guide (in development)

If you want to know more, take a look at the [User Guide](https://github.com/berehovskyi/apex-stream/wiki) for a brief introduction to the Apex Stream Framework.

