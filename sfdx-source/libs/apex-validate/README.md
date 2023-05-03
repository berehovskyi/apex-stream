# Apex Validate

![](https://img.shields.io/github/v/release/berehovskyi/apex-validate?include_prereleases) 
![](https://img.shields.io/badge/build-passing-brightgreen.svg) 
![](https://img.shields.io/badge/coverage-100%25-brightgreen.svg)

A lightweight Apex library that helps with validating arguments.
Provides an easy way to follow a fail-fast principle and a design-by-contract programming approach.

## Installation

<a href="https://githubsfdeploy.herokuapp.com?owner=berehovskyi&repo=apex-validate&ref=main">
  <img alt="Deploy to Salesforce" src="https://img.shields.io/badge/Deploy%20to-Salesforce-%2300a1e0?style=for-the-badge&logo=appveyor">
</a>

or install as an Unlocked Package using the CLI:

```sh
sf package install -p 04t1t000003HVTRAA4 -o me@example.com -r -w 10
```

## Key Features

- Provides a utility `Validate` class with a set of reusable void methods that throw relevant exceptions if validation fails.
- API consistency with the standard `System.Assert` class. Unlike assertion failures, thrown exceptions can be caught.
- Missing from the standard `System` namespace exception classes `IndexOutOfBoundsException` and `IllegalStateException`.
- Every single validation method has **3** overloaded variations:
    - Method with the **default** exception message.
    - Method with a **custom** exception message passed as an argument.
    - Method with a **custom formatted** exception message and **formatting arguments** both passed as arguments.

## Get Started

### Validate vs. Assert

- **Assertions** are typically used to indicate **unrecoverable** conditions in an application,
  that are not supposed to be handled or recovered.
- **Validations** check the inputs of public APIs and use `NullPointerException` or `IllegalArgumentException`
  that can be normally handled.

```apex
User someUser = new User(IsActive = false);

Assert.isTrue(someUser.IsActive); // causes a fatal error that cannot be handled

try {
    Validate.isTrue(someUser.IsActive); // throws an IllegalArgumentException that can be handled
} catch (IllegalArgumentException exc) {
    // handle the exception
}
```

The `Validate` class supports all the methods that the `System.Assert` class has.


### Validate Condition

The `Validate.isTrue` method is used to validate that the argument condition is **true**:

```apex
User someUser = new User(IsActive = false);
Validate.isTrue(someUser.IsActive); // throws an IllegalArgumentException
```

Also, the `Validate.isFalse` method is used to validate that the argument condition is **false**:

```apex
User someUser = new User(IsActive = true);
Validate.isFalse(someUser.IsActive); // throws an IllegalArgumentException
```

Note that if the condition is **null**, both `Validate.isTrue` and `Validate.isFalse` methods
will throw a `NullPointerException` with the default message `Argument object is null`:

```apex
User someUser = new User();
Validate.isTrue(someUser.IsActive); // throws a NullPointerException

// but
User someUser = new User();
Validate.isTrue(someUser.IsActive == true); // throws an IllegalArgumentException
```

### Validate the Condition and Throw a Specific Exception

The `Validate.isTrue` method can also be used to validate the argument condition and throw a specific exception if it
evaluates to **false**:

```apex
User someUser = new User(IsActive = false);
Validate.isTrue(someUser.IsActive, new CustomException('Error message')); // throws an CustomException
```

### Validate Nullity

The `Validate.notNull` method is used to validate that the argument is **not null**:

```apex
User someUser;
Validate.notNull(someUser); // throws a NullPointerException
```

### Validate Iterable

The `Validate.notEmpty` method is used to validate that the argument iterable is **not empty**:

```apex
List<Account> accounts = new List<Account>();
Validate.notEmpty(accounts); // throws an IllegalArgumentException

// but
List<Account> accounts;
Validate.notEmpty(accounts); // throws an NullPointerException
```

The `Validate.noNullElements` method is used to validate that the argument iterable does **not contain a null** element:

```apex
List<Account> accounts = new List<Account>{ acc1, acc2, null };
Validate.noNullElements(accounts); // throws an IllegalArgumentException

// but
List<Account> accounts;
Validate.noNullElements(accounts); // throws an NullPointerException
```

Both methods can be applied to `Sets`:

```apex
Set<String> strings = new Set<String>{ 'foo', 'bar', null };
Validate.notEmpty(strings); // valid
Validate.noNullElements(strings); // throws an IllegalArgumentException
```

The `Validate.index` method is used to validate that the index is within the bounds of the argument list:

```apex
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Validate.index(accounts, 3); // throws an IllegalArgumentException
```

### Validate String

The `Validate.notEmpty` method is used to validate that the argument string is **not empty**:

```apex
String str = '';
Validate.notEmpty(str); // throws an IllegalArgumentException

// but
String str;
Validate.notEmpty(str); // throws a NullPointerException
```

The `Validate.notBlank` method is used to validate that the argument string is **not blank**:

```apex
String str = ' ';
Validate.notBlank(str); // throws an IllegalArgumentException

// but
String str;
Validate.notBlank(str); // throws a NullPointerException
```

The `Validate.index` method is used to validate that the index is within the bounds of the argument string:

```apex
String str = 'foo';
Validate.index(str, 3); // throws an IllegalArgumentException

// but
String str;
Validate.index(str, 3); // throws a NullPointerException
```

The `Validate.matches` method is used to validate that the argument string matches the regex:

```apex
String str = 'foo';
Validate.matches(str, '\\d+'); // throws an IllegalArgumentException

// but
String str;
Validate.matches(str, '\\d+'); // throws a NullPointerException
```

### Validate Email

The `Validate.email` method is used to validate that the argument email is valid:

```apex
Validate.email('john.doe＠example.com'); // valid
Validate.email('john.doe.example.com'); // throws an IllegalArgumentException
```

Please note that this validation method isn't fully RFC 5322 and RFC 6531 compliant
e.g. does not support non-ASCII characters.

### Validate Range

The `Validate.between` method is used to validate that the value is between the two inclusive values.
Supported types:

- `Integer`
- `Long`
- `Double`
- `Date`
- `Datetime`
- `Time`

For instance:

```apex
Integer i = 8;
Validate.between(1, 9, i); // valid
Validate.between(1, 8, i); // valid
Validate.between(8, 10, i); // valid

Validate.between(1, 7, i); // throws an IllegalArgumentException

// but
Integer i;
Validate.between(1, 7, i); // throws a NullPointerException
```

### Custom and Formatted Messages

Every single validation method has overloaded methods that take either a **custom** error message string
or a **formatted** error message string with optional values for it.
Use it when a **default** error message is not enough.

For instance:

```apex
User someUser = new User(
    Id = 'someUserId',
    IsActive = false
);

// throws an IllegalArgumentException with the default 'Argument condition is false' error message
Validate.isTrue(someUser.IsActive);

// throws an IllegalArgumentException with the 'The User must be active' error message
Validate.isTrue(someUser.IsActive, 'The User must be active');

// throws an IllegalArgumentException with the 'The User someUserId must be active' error message
Validate.isTrue(
    someUser.IsActive,
    'The User {0} must be active',
    new List<Id>{ someUser.Id }
);
```

## Documentation

[Full Apex Validate Documentation](/docs/README.md).