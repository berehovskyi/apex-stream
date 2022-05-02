# Apex Stream Framework

![](https://img.shields.io/github/v/release/berehovskyi/apex-stream) ![](https://img.shields.io/badge/build-passing-brightgreen.svg) ![](https://img.shields.io/badge/coverage-99%25-brightgreen.svg)

Apex Stream is a framework for processing sequences of elements taking advantage of the functional programming paradigm.

Inspired by [Java Stream API](https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/stream/package-summary.html).

<a href="https://githubsfdeploy.herokuapp.com?owner=berehovskyi&repo=apex-stream&ref=master">
  <img alt="Deploy to Salesforce" src="https://img.shields.io/badge/Deploy%20to-Salesforce-%2300a1e0?style=for-the-badge&logo=appveyor">
</a>

## Apex Stream Framework Features:

- Iterables with implementations:
  - Streams (`SObjectStream`, `ObjectStream` and primitive `DoubleStream`, `IntStream`, `LongStream`)
  - Sequences (`SObjectSequence`, `ObjectSequence` and primitive `DoubleSequence`, `IntSequence`, `LongSequence`)
- Functional Interfaces
- Functional Abstract Classes with
  - inherited abstract methods
  - default methods
  - common built-in static methods
- Collectors (`SObjectCollector`, `Collector`) with common built-in static methods
- Optionals (`OptionalSObject`, `Optional` and primitive `OptionalDouble`, `OptionalInt`, `OptionalLong`)
- Utils (`Lists`, `Iterators`, `Validate`)

## Examples
Calculate sum of `AnnualRevenue` of distinct by `Name` field `accounts` with hot rating:
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
Create and relate `contacts` to parent `accounts` and set `Descripton` field:
```apex
List<Contact> contacts = Stream.of(accounts)
        .mapTo(
                SObjectUnaryOperator.newSObject(Contact.SObjectType, Contact.AccountId, SObjectFunction.get(Account.Id))
                    .andThen(SObjectUnaryOperator.set(Contact.Description, 'Some Description'))
        )
        .toList();
```
Filter `accounts` having `AnnualRevenue > 10000` sort by `AnnualRevenue` in descending order, and group by `Rating`:
```apex
Map<String, List<Account>> accountsByRating = Stream.of(accounts)
        .filter(SObjectPredicate.isGreater('AnnualRevenue', 10000))
        .sort('AnnualRevenue', SortOrder.DESCENDING)
        .groupByString('Rating');
```
Group `LastName` field values by `OtherCity`:
```apex
Map<String, List<String>> lastNamesByOtherCountry = (Map<String, List<String>>) Stream.of(contacts)
        .collect(
                SObjectCollector.groupingByString(
                        Contact.OtherCountry,
                        Contact.LastName
                ).cast(Map<String, List<String>>.class)
        );
```
Calculate factorial:
```apex
Long factorial(Long n) {
    return LongStream.range(1, n).reduce(1, LongBinaryOperator.product());
}

factorial(20L); // 2432902008176640000
```
Filter `input` allowing not blank strings, convert all the characters to uppercase, sort, 
skip the first element and return as list containing first 2 elements:
```apex
List<Object> input = new List<Object>{
        new Account(), 1, 1L, null, '  ', '', 'hello',
        'world', 'Amen', 'Doo', 'baz', 'Bar', 'World', 1.5
};

List<String> result = (List<String>) Stream.of(input)
        .filter(Predicate.isInstanceOfString().andAlso(StringPredicate.isNotBlank()))
        .mapTo(StringFunction.toUpperCase())
        .sort()
        .skip(1)
        .lim(2)
        .toList(List<String>.class); // ['BAR', 'BAZ']
```
And more!

Find more examples [here](/sfdx-source/apex-stream/test/classes).

## Documentation

[Full Apex Stream Framework Documentation](/docs/README.md).

## User Guide
If you want to know more take a look at the [User Guide](/wiki/) for brief introduction to the Apex Stream Framework.

