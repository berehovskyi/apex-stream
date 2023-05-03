# Validate

`SUPPRESSWARNINGS`

`APIVERSION: 57`

`STATUS: ACTIVE`

A lightweight, stateless utility class that manages validating arguments. Provides an easy way to follow a fail-fast principle and a design-by-contract programming approach.


**Author** Oleh Berehovskyi


**Group** Utils

## Methods
### Nullability
##### `static notNull(Object obj)`

Checks that the argument reference `obj` is not null.

###### Parameters
|Param|Description|
|---|---|
|`obj`|the object to check for nullity|

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `obj` is null with the default exception message 'Argument object is null'|


**See** Validate.isNotNull

###### Example
```apex
Validate.notNull('foo'); // valid
Object obj;
Validate.notNull(obj); // throws a NullPointerException
```

##### `static notNull(Object obj, String message)`

Checks that the argument reference `obj` is not null.

###### Parameters
|Param|Description|
|---|---|
|`obj`|the object to check for nullity|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `obj` is null with the custom exception `message`|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isNotNull

###### Example
```apex
Validate.notNull('foo', 'The argument cannot be null'); // valid
Object obj;
Validate.notNull(obj, 'The argument cannot be null'); // throws a NullPointerException
```

##### `static notNull(Object obj, String message, List<Object> arguments)`

Checks that the argument reference `obj` is not null.

###### Parameters
|Param|Description|
|---|---|
|`obj`|the object to check for nullity|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `obj` is null with the custom exception `message`|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isNotNull

###### Example
```apex
Validate.notNull(
    obj,
    'The argument {0} cannot be null',
    new List<String>{ 'obj' }
); // throws a NullPointerException
```

---
### Conditions
##### `static isTrue(Boolean condition)`

Checks that the argument `condition` is true.

###### Parameters
|Param|Description|
|---|---|
|`condition`|the boolean expression to check|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `condition` evaluates to false with the default exception message 'Argument condition is false'|
|`NullPointerException`|if `condition` is null with the default exception message 'Argument object is null'|


**See** Validate.isFalse


**See** Assert.isTrue

###### Example
```apex
Validate.isTrue(i > 0);
Validate.isTrue(response.getStatusCode() == 200);
```

##### `static isTrue(Boolean condition, String message)`

Checks that the argument `condition` is true.

###### Parameters
|Param|Description|
|---|---|
|`condition`|the boolean expression to check|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `condition` evaluates to false with the custom exception `message`|
|`NullPointerException`|if `condition` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isFalse


**See** Assert.isTrue

###### Example
```apex
Validate.isTrue(i > 0, 'The argument value must be positive');
Validate.isTrue(response.getStatusCode() == 200, 'The status code must be 200');
```

##### `static isTrue(Boolean condition, Exception exc)`

Checks that the argument `condition` is true.

###### Parameters
|Param|Description|
|---|---|
|`condition`|the boolean expression to check|
|`exc`|the exception to throw|

###### Throws
|Exception|Description|
|---|---|
|`Exception`|if `condition` evaluates to false|
|`NullPointerException`|if `condition` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `exc` is null with the default exception message 'Argument object is null'|


**See** Validate.isFalse


**See** Assert.isTrue

###### Example
```apex
Validate.isTrue(i > 0, new CustomException());
Validate.isTrue(response.getStatusCode() == 200, new CalloutException());
```

##### `static isTrue(Boolean condition, String message, List<Object> arguments)`

Checks that the argument `condition` is true.

###### Parameters
|Param|Description|
|---|---|
|`condition`|the boolean expression to check|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `condition` evaluates to false with the custom exception `message`|
|`NullPointerException`|if `condition` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isFalse


**See** Assert.isTrue

###### Example
```apex
Validate.isTrue(
    n >= 0,
    'The argument should be positive, actual: {0}.',
    new List<Object>{ n }
);
```

---
### Iterables
##### `static notEmpty(List<Object> objs)`

Checks that the argument list `objs` is not empty.

###### Parameters
|Param|Description|
|---|---|
|`objs`|the list to check for emptiness|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `objs` is empty with the default exception message 'Argument list is empty'|
|`NullPointerException`|if `objs` is null with the default exception message 'Argument object is null'|


**See** Validate.noNullElements

###### Example
```apex
Validate.notEmpty(someList);
```

##### `static notEmpty(List<Object> objs, String message)`

Checks that the argument list `objs` is not empty.

###### Parameters
|Param|Description|
|---|---|
|`objs`|the list to check for emptiness|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `objs` is empty with the custom exception `message`|
|`NullPointerException`|if `objs` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.noNullElements

###### Example
```apex
Validate.notEmpty(someList, 'The list cannot be empty');
```

##### `static notEmpty(List<Object> objs, String message, List<Object> arguments)`

Checks that the argument list `objs` is not empty.

###### Parameters
|Param|Description|
|---|---|
|`objs`|the list to check for emptiness|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `objs` is empty with the custom exception `message`|
|`NullPointerException`|if `objs` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.noNullElements

###### Example
```apex
Validate.notEmpty(
    someList,
    'The list {0} cannot be empty',
    new List<String>{ 'someList' }
);
```

##### `static notEmpty(Iterable<Object> iterable)`

Checks that the argument `iterable` is not empty.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the iterable to check for emptiness|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `iterable` is empty with the default exception message 'Argument iterable is empty'|
|`NullPointerException`|if `iterable` is null with the default exception message 'Argument object is null'|


**See** Validate.noNullElements

###### Example
```apex
Validate.notEmpty(someIterable);
Validate.notEmpty((Iterable<String>) someStringSet);
```

##### `static notEmpty(Iterable<Object> iterable, String message)`

Checks that the argument `iterable` is not empty.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the iterable to check for emptiness|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `iterable` is empty with the custom exception `message`|
|`NullPointerException`|if `iterable` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.noNullElements

###### Example
```apex
Validate.notEmpty(someIterable, 'The iterable cannot be empty');
Validate.notEmpty((Iterable<String>) someStringSet, 'The set cannot be empty');
```

##### `static notEmpty(Iterable<Object> iterable, String message, List<Object> arguments)`

Checks that the argument `iterable` is not empty.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the iterable to check for emptiness|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `iterable` is empty with the custom exception `message`|
|`NullPointerException`|if `iterable` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.noNullElements

###### Example
```apex
Validate.notEmpty(
    someIterable,
    'The iterable {0} cannot be empty',
    new List<String>{ 'someIterable' }
);
```

##### `static noNullElements(List<Object> objs)`

Checks that the argument list `objs` contains no null elements.

###### Parameters
|Param|Description|
|---|---|
|`objs`|the list to check for null elements|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `objs` contains a null element with the default exception message 'Argument list contains null element'|
|`NullPointerException`|if `objs` is null with the default exception message 'Argument object is null'|


**See** Validate.notEmpty

###### Example
```apex
Validate.noNullElements(someList);
```

##### `static noNullElements(List<Object> objs, String message)`

Checks that the argument list `objs` contains no null elements.

###### Parameters
|Param|Description|
|---|---|
|`objs`|the list to check for null elements|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `objs` contains a null element with the custom exception `message`|
|`NullPointerException`|if `objs` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.notEmpty

###### Example
```apex
Validate.noNullElements(someList, 'The list cannot contain null elements');
```

##### `static noNullElements(List<Object> objs, String message, List<Object> arguments)`

Checks that the argument list `objs` contains no null elements.

###### Parameters
|Param|Description|
|---|---|
|`objs`|the list to check for null elements|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `objs` contains a null element with the custom exception `message`|
|`NullPointerException`|if `objs` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.notEmpty

###### Example
```apex
Validate.noNullElements(
    someList,
    'The list {0} cannot contain null elements',
    new List<String>{ 'someList' }
);
```

##### `static noNullElements(Iterable<Object> iterable)`

Checks that the argument `iterable` contains no null elements.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the iterable to check for null elements|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `iterable` contains a null element with the default exception message 'Argument iterable contains null element'|
|`NullPointerException`|if `iterable` is null with the default exception message 'Argument object is null'|


**See** Validate.notEmpty

###### Example
```apex
Validate.noNullElements(someIterable);
Validate.noNullElements((Iterable<String>) someStringSet);
```

##### `static noNullElements(Iterable<Object> iterable, String message)`

Checks that the argument `iterable` contains no null elements.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the iterable to check for null elements|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `iterable` contains a null element with the custom exception `message`|
|`NullPointerException`|if `iterable` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.notEmpty

###### Example
```apex
Validate.noNullElements(someIterable, 'The iterable cannot contain null elements');
Validate.noNullElements(
    (Iterable<String>) someStringSet,
    'The set cannot contain null elements'
);
```

##### `static noNullElements(Iterable<Object> iterable, String message, List<Object> arguments)`

Checks that the argument `iterable` contains no null elements.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the iterable to check for null elements|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `iterable` contains a null element with the custom exception `message`|
|`NullPointerException`|if `iterable` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.notEmpty

###### Example
```apex
Validate.noNullElements(
    someIterable,
    'The iterable {0} cannot contain null elements',
    new List<String>{ 'someIterable' }
);
```

##### `static index(List<Object> objs, Integer index)`

Checks that the `index` is within the bounds of the argument list `objs`.

###### Parameters
|Param|Description|
|---|---|
|`objs`|the list to check|
|`index`|the index to check|

###### Throws
|Exception|Description|
|---|---|
|`IndexOutOfBoundsException`|if `index` is invalid with the default formatted exception message 'List index out of bounds: {0}'|
|`NullPointerException`|if `objs` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `index` is null with the default exception message 'Argument object is null'|


**See** Validate.isTrue

###### Example
```apex
Validate.index(
    new List<String>{ 'foo', 'bar' },
    3
); // throws an IndexOutOfBoundsException
```

##### `static index(List<Object> objs, Integer index, String message)`

Checks that the `index` is within the bounds of the argument list `objs`.

###### Parameters
|Param|Description|
|---|---|
|`objs`|the list to check|
|`index`|the index to check|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IndexOutOfBoundsException`|if `index` is invalid with the custom exception `message`|
|`NullPointerException`|if `objs` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `index` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.index(
    new List<String>{ 'foo', 'bar' },
    3,
    'Invalid index'
); // throws an IndexOutOfBoundsException
```

##### `static index(List<Object> objs, Integer index, String message, List<Object> arguments)`

Checks that the `index` is within the bounds of the argument list `objs`.

###### Parameters
|Param|Description|
|---|---|
|`objs`|the list to check|
|`index`|the index to check|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IndexOutOfBoundsException`|if `index` is invalid with the custom exception `message`|
|`NullPointerException`|if `objs` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `index` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.index(
    new List<String>{ 'foo', 'bar' },
    3,
    'Invalid index: {0}',
    new List<Integer>{ 3 }
); // throws an IndexOutOfBoundsException
```

---
### Strings
##### `static notBlank(String str)`

Checks that the argument string `str` is not whitespace nor empty (&apos;&apos;), nor null.

###### Parameters
|Param|Description|
|---|---|
|`str`|the string to check for not being blank|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `str` is whitespace or empty ('') with the default exception message 'Argument string is blank'|
|`NullPointerException`|if `str` is null with the default exception message 'Argument object is null'|


**See** Validate.notEmpty

###### Example
```apex
Validate.notBlank(' '); // throws an IllegalArgumentException
```

##### `static notBlank(String str, String message)`

Checks that the argument string `str` is not whitespace nor empty (&apos;&apos;), nor null.

###### Parameters
|Param|Description|
|---|---|
|`str`|the string to check for not being blank|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `str` is whitespace or empty ('') with the custom exception `message`|
|`NullPointerException`|if `str` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.notEmpty

###### Example
```apex
Validate.notBlank(
    ' ',
    'The string cannot be blank'
); // throws an IllegalArgumentException
```

##### `static notBlank(String str, String message, List<Object> arguments)`

Checks that the argument string `str` is not whitespace nor empty (&apos;&apos;), nor null.

###### Parameters
|Param|Description|
|---|---|
|`str`|the string to check for not being blank|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `str` is whitespace or empty ('') with the custom exception `message`|
|`NullPointerException`|if `str` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.notEmpty

###### Example
```apex
Validate.notBlank(
    ' ',
    'The string cannot be blank. {0}',
    new List<String>{ 'Status code: 400' }
); // throws an IllegalArgumentException
```

##### `static notEmpty(String str)`

Checks that the argument string `str` is not empty (&apos;&apos;), nor null.

###### Parameters
|Param|Description|
|---|---|
|`str`|the string to check for not being empty|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `str` is empty ('') with the default exception message 'Argument string is empty'|
|`NullPointerException`|if `str` is null with the default exception message 'Argument object is null'|


**See** Validate.notBlank

###### Example
```apex
Validate.notEmpty(''); // throws an IllegalArgumentException
```

##### `static notEmpty(String str, String message)`

Checks that the argument string `str` is not empty (&apos;&apos;), nor null.

###### Parameters
|Param|Description|
|---|---|
|`str`|the string to check for not being empty|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `str` is empty ('') with the custom exception `message`|
|`NullPointerException`|if `str` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.notBlank

###### Example
```apex
Validate.notEmpty(
    '',
    'The string cannot be empty'
); // throws an IllegalArgumentException
```

##### `static notEmpty(String str, String message, List<Object> arguments)`

Checks that the argument string `str` is not empty (&apos;&apos;), nor null.

###### Parameters
|Param|Description|
|---|---|
|`str`|the string to check for not being empty|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `str` is empty ('') with the custom exception `message`|
|`NullPointerException`|if `str` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.notBlank

###### Example
```apex
Validate.notEmpty(
    '',
    'The string cannot be empty. {0}',
    new List<String>{ 'Status code: 400' }
); // throws an IllegalArgumentException
```

##### `static index(String str, Integer index)`

Checks that the `index` is within the bounds of the argument string `str`.

###### Parameters
|Param|Description|
|---|---|
|`str`|the string to check|
|`index`|the index to check|

###### Throws
|Exception|Description|
|---|---|
|`IndexOutOfBoundsException`|if `index` is invalid with the default formatted exception message 'String index out of bounds: {0}'|
|`NullPointerException`|if `str` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `index` is null with the default exception message 'Argument object is null'|


**See** Validate.isTrue

###### Example
```apex
Validate.index('foo', 3); // throws an IndexOutOfBoundsException
```

##### `static index(String str, Integer index, String message)`

Checks that the `index` is within the bounds of the argument string `str`.

###### Parameters
|Param|Description|
|---|---|
|`str`|the string to check|
|`index`|the index to check|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IndexOutOfBoundsException`|if `index` is invalid with the custom exception `message`|
|`NullPointerException`|if `str` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `index` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.index(
    'foo',
    3,
    'Invalid index'
); // throws an IndexOutOfBoundsException
```

##### `static index(String str, Integer index, String message, List<Object> arguments)`

Checks that the `index` is within the bounds of the argument string `str`.

###### Parameters
|Param|Description|
|---|---|
|`str`|the string to check|
|`index`|the index to check|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IndexOutOfBoundsException`|if `index` is invalid with the custom exception `message`|
|`NullPointerException`|if `str` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `index` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.index(
   'foo',
    3,
    'Invalid index: {0}',
    new List<Integer>{ 3 }
); // throws an IndexOutOfBoundsException
```

##### `static matches(String str, String regex)`

Checks that the argument string `str` matches the `regex`.

###### Parameters
|Param|Description|
|---|---|
|`str`|the string to check for matching|
|`regex`|the regular expression to match against|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `str` does not match the `regex` with the default formatted exception message 'Argument string {0} does not match the pattern {1}'|
|`NullPointerException`|if `str` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `regex` is null with the default exception message 'Argument object is null'|


**See** Validate.isTrue

###### Example
```apex
Validate.matches('foo', '\\d+'); // throws an IllegalArgumentException
```

##### `static matches(String str, String regex, String message)`

Checks that the argument string `str` matches the `regex`.

###### Parameters
|Param|Description|
|---|---|
|`str`|the string to check for matching|
|`regex`|the regular expression to match against|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `str` does not match the `regex` with the custom exception `message`|
|`NullPointerException`|if `str` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `regex` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.matches(
    'foo',
    '\\d+',
    'Custom message'
); // throws an IllegalArgumentException
```

##### `static matches(String str, String regex, String message, List<Object> arguments)`

Checks that the argument string `str` matches the `regex`.

###### Parameters
|Param|Description|
|---|---|
|`str`|the string to check for matching|
|`regex`|the regular expression to match against|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `str` does not match the `regex` with the custom exception `message`|
|`NullPointerException`|if `str` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `regex` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|

###### Example
```apex
Validate.matches(
    'foo',
    '\\d+',
    'The string {0} does not match the pattern {1}.',
    new List<String>{ 'foo', '\\d+' }
); // throws an IllegalArgumentException
```

##### `static email(String email)`

Checks that the argument `email` is valid. Please note that this validation method isn&apos;t fully RFC 5322 and RFC 6531 complaint e.g. does not support non-ASCII characters.

###### Parameters
|Param|Description|
|---|---|
|`email`|the email to validate|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `email` is invalid with the default formatted exception message 'Argument email {0} is invalid'|
|`NullPointerException`|if `email` is null with the default exception message 'Argument object is null'|


**See** Validate.matches

###### Example
```apex
Validate.email('john.doe＠example.com'); // valid
Validate.email('john.doe.example.com'); // throws an IllegalArgumentException
Validate.email('＠example.com'); // throws an IllegalArgumentException
```

##### `static email(String email, String message)`

Checks that the argument `email` is valid. Please note that this validation method isn&apos;t fully RFC 5322 and RFC 6531 complaint e.g. does not support non-ASCII characters.

###### Parameters
|Param|Description|
|---|---|
|`email`|the email to validate|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `email` is invalid with the custom exception `message`|
|`NullPointerException`|if `email` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.matches

###### Example
```apex
Validate.email(
    'john.doe.example.com',
    'Invalid email address'
); // throws an IllegalArgumentException
```

##### `static email(String email, String message, List<Object> arguments)`

Checks that the argument `email` is valid. Please note that this validation method isn&apos;t fully RFC 5322 and RFC 6531 complaint e.g. does not support non-ASCII characters.

###### Parameters
|Param|Description|
|---|---|
|`email`|the email to validate|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `email` is invalid with the custom exception `message`|
|`NullPointerException`|if `email` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.matches

###### Example
```apex
Validate.email(
    'john.doe.example.com',
    'The email address {0} is not valid',
    new List<String>{ 'john.doe.example.com' }
); // throws an IllegalArgumentException
```

##### `static creditCard(String card)`

Checks that the argument `card` is valid using <a href=&quot;https://en.wikipedia.org/wiki/Luhn_algorithm&quot;>Luhn algorithm</a>.

###### Parameters
|Param|Description|
|---|---|
|`card`|the credit card to validate|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `card` is invalid with the default formatted exception message 'Argument credit card {0} is invalid'|
|`NullPointerException`|if `card` is null with the default exception message 'Argument object is null'|


**See** Validate.matches

###### Example
```apex
Validate.creditCard('1234-5678-9012-3452'); // valid
Validate.creditCard('4417123456789113'); // valid
Validate.creditCard('0000000000000001'); // throws an IllegalArgumentException
```

##### `static creditCard(String card, String message)`

Checks that the argument `card` is valid using <a href=&quot;https://en.wikipedia.org/wiki/Luhn_algorithm&quot;>Luhn algorithm</a>.

###### Parameters
|Param|Description|
|---|---|
|`card`|the credit card to validate|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `card` is invalid with the custom exception `message`|
|`NullPointerException`|if `card` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.matches

###### Example
```apex
Validate.creditCard(
    '0000000000000001',
    'Invalid credit card number'
); // throws an IllegalArgumentException
```

##### `static creditCard(String card, String message, List<Object> arguments)`

Checks that the argument `card` is valid using <a href=&quot;https://en.wikipedia.org/wiki/Luhn_algorithm&quot;>Luhn algorithm</a>.

###### Parameters
|Param|Description|
|---|---|
|`card`|the credit card to validate|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `card` is invalid with the custom exception `message`|
|`NullPointerException`|if `card` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.matches

###### Example
```apex
Validate.creditCard(
    '0000000000000001',
    'Invalid credit card number {0}',
    new List<String>{ '0000000000000001' }
); // throws an IllegalArgumentException
```

---
### State
##### `static state(Boolean condition)`

Checks that the stateful argument `condition` is true.

###### Parameters
|Param|Description|
|---|---|
|`condition`|the boolean expression to check|

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `condition` evaluates to false with the default exception message 'Argument state is invalid'|
|`NullPointerException`|if `condition` is null with the default exception message 'Argument object is null'|


**See** Validate.isTrue

###### Example
```apex
Validate.state(response.getStatusCode() == 200);
```

##### `static state(Boolean condition, String message)`

Checks that the stateful argument `condition` is true.

###### Parameters
|Param|Description|
|---|---|
|`condition`|the boolean expression to check|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `condition` evaluates to false with custom exception `message`|
|`NullPointerException`|if `condition` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.state(response.getStatusCode() == 200, 'Custom message');
```

##### `static state(Boolean condition, String message, List<Object> arguments)`

Checks that the stateful argument `condition` is true.

###### Parameters
|Param|Description|
|---|---|
|`condition`|the boolean expression to check|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `condition` evaluates to false with the custom exception `message`|
|`NullPointerException`|if `condition` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|

###### Example
```apex
Validate.state(
    !map.containsKey(key),
    'Duplicate key {0} (attempted merging values {1} and {2}).',
    new List<Object>{ key, oldValue, newValue }
); // throws an IllegalStateException
```

---
### Numbers
##### `static between(Long startInclusive, Long endInclusive, Long value)`

Checks that the argument long `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `value` is not within the specified range with the default formatted exception message 'Argument {0} is not between inclusive range from {1} to {2}'|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between(1L, 10L, 5L); // valid
```

##### `static between(Long startInclusive, Long endInclusive, Long value, String message)`

Checks that the argument long `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `value` is not within the specified range with the custom exception `message`|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between(
    1L,
    10L,
    11L,
    'The value is out of range'
); //throws an IllegalArgumentException
```

##### `static between(Long startInclusive, Long endInclusive, Long value, String message, List<Object> arguments)`

`SUPPRESSWARNINGS`

Checks that the argument long `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `value` is not within the specified range with the custom exception `message`|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between(
    1L,
    10L,
    11L,
    'The value {0} is out of range {1} - {2}',
    new List<Long>{ 11L, 1L, 10L }
); // throws an IllegalArgumentException
```

##### `static between(Integer startInclusive, Integer endInclusive, Integer value)`

Checks that the argument int `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `value` is not within the specified range with the default formatted exception message 'Argument {0} is not between inclusive range from {1} to {2}'|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between(1, 10, 5); // valid
```

##### `static between(Integer startInclusive, Integer endInclusive, Integer value, String message)`

Checks that the argument int `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `value` is not within the specified range with the custom exception `message`|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between(
    1,
    10,
    11,
    'The value is out of range'
); //throws an IllegalArgumentException
```

##### `static between(Integer startInclusive, Integer endInclusive, Integer value, String message, List<Object> arguments)`

`SUPPRESSWARNINGS`

Checks that the argument int `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if the `value` is not within the specified range with the custom exception `message`|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between(
    1,
    10,
    11,
    'The value {0} is out of range {1} - {2}',
    new List<Integer>{ 11, 1, 10 }
); // throws an IllegalArgumentException
```

##### `static between(Double startInclusive, Double endInclusive, Double value)`

Checks that the argument double `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `value` is not within the specified range with the default formatted exception message 'Argument {0} is not between inclusive range from {1} to {2}'|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between((Double) 1.1, (Double) 10.2, (Double) 5.2); // valid
```

##### `static between(Double startInclusive, Double endInclusive, Double value, String message)`

Checks that the argument double `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `value` is not within the specified range with the custom exception `message`|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between(
    (Double) 1.1,
    (Double) 10.2,
    (Double) 11.2,
    'The value is out of range'
); //throws an IllegalArgumentException
```

##### `static between(Double startInclusive, Double endInclusive, Double value, String message, List<Object> arguments)`

`SUPPRESSWARNINGS`

Checks that the argument double `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `value` is not within the specified range with the custom exception `message`|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between(
    (Double) 1.1,
    (Double) 10.2,
    (Double) 11.2,
    'The value {0} is out of range {1} - {2}',
    new List<Double>{ 11.2, 1.1, 10.2 }
); // throws an IllegalArgumentException
```

##### `static between(Date startInclusive, Date endInclusive, Date value)`

Checks that the argument date `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `value` is not within the specified range with the default formatted exception message 'Argument {0} is not between inclusive range from {1} to {2}'|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between(
   Date.today(),
   Date.today().addDays(2),
   Date.today().addDays(1)
); // valid
```

##### `static between(Date startInclusive, Date endInclusive, Date value, String message)`

Checks that the argument date `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `value` is not within the specified range with the custom exception `message`|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between(
    Date.today(),
    Date.today().addDays(2),
    Date.today().addDays(3),
    'The value is out of range'
); //throws an IllegalArgumentException
```

##### `static between(Date startInclusive, Date endInclusive, Date value, String message, List<Object> arguments)`

`SUPPRESSWARNINGS`

Checks that the argument date `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `value` is not within the specified range with the custom exception `message`|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between(
    Date.today(),
    Date.today().addDays(2),
    Date.today().addDays(3),
    'The value {0} is out of range {1} - {2}',
    new List<Date>{
        Date.today(),
        Date.today().addDays(2),
        Date.today().addDays(3)
    }
); // throws an IllegalArgumentException
```

##### `static between(Datetime startInclusive, Datetime endInclusive, Datetime value)`

Checks that the argument datetime `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `value` is not within the specified range with the default formatted exception message 'Argument {0} is not between inclusive range from {1} to {2}'|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between(
   Datetime.now(),
   Datetime.now().addDays(2),
   Datetime.now().addDays(1)
); // valid
```

##### `static between(Datetime startInclusive, Datetime endInclusive, Datetime value, String message)`

Checks that the argument datetime `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `value` is not within the specified range with the custom exception `message`|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between(
    Datetime.now(),
    Datetime.now().addDays(2),
    Datetime.now().addDays(3),
    'The value is out of range'
); //throws an IllegalArgumentException
```

##### `static between(Datetime startInclusive, Datetime endInclusive, Datetime value, String message, List<Object> arguments)`

`SUPPRESSWARNINGS`

Checks that the argument datetime `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `value` is not within the specified range with the custom exception `message`|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between(
    Datetime.now(),
    Datetime.now().addDays(2),
    Datetime.now().addDays(3),
    'The value {0} is out of range {1} - {2}',
    new List<Datetime>{
        Datetime.now(),
        Datetime.now().addDays(2),
        Datetime.now().addDays(3)
    }
); // throws an IllegalArgumentException
```

##### `static between(Time startInclusive, Time endInclusive, Time value)`

Checks that the argument time `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `value` is not within the specified range with the default formatted exception message 'Argument {0} is not between inclusive range from {1} to {2}'|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between(
   Time.newInstance(0, 0, 0, 0),
   Time.newInstance(0, 0, 0, 0).addHours(2),
   Time.newInstance(0, 0, 0, 0).addHours(1)
); // valid
```

##### `static between(Time startInclusive, Time endInclusive, Time value, String message)`

Checks that the argument time `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `value` is not within the specified range with the custom exception `message`|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between(
    Time.newInstance(0, 0, 0, 0),
    Time.newInstance(0, 0, 0, 0).addHours(2),
    Time.newInstance(0, 0, 0, 0).addHours(3),
    'The value is out of range'
); //throws an IllegalArgumentException
```

##### `static between(Time startInclusive, Time endInclusive, Time value, String message, List<Object> arguments)`

`SUPPRESSWARNINGS`

Checks that the argument time `value` is between the two inclusive values.

###### Parameters
|Param|Description|
|---|---|
|`startInclusive`|the inclusive start value|
|`endInclusive`|the inclusive end value|
|`value`|tha value to validate|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `value` is not within the specified range with the custom exception `message`|
|`NullPointerException`|if `startInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `endInclusive` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `value` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Validate.isTrue

###### Example
```apex
Validate.between(
    Time.newInstance(0, 0, 0, 0),
    Time.newInstance(0, 0, 0, 0).addHours(2),
    Time.newInstance(0, 0, 0, 0).addHours(3),
    'The value {0} is out of range {1} - {2}',
    new List<Datetime>{
        Time.newInstance(0, 0, 0, 0),
        Time.newInstance(0, 0, 0, 0).addHours(2),
        Time.newInstance(0, 0, 0, 0).addHours(3)
    }
); // throws an IllegalArgumentException
```

---
### Methods consistent with System.Assert class
##### `static areEqual(Object obj1, Object obj2)`

Checks that the arguments `obj1` and `obj2` are equal.

###### Parameters
|Param|Description|
|---|---|
|`obj1`|the first object to compare|
|`obj2`|the second object to compare|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `obj1` and `obj2` are not equal with the default formatted exception message 'Arguments {0} and {1} are not equal'|


**See** Assert.areEqual

###### Example
```apex
Validate.areEqual('foo', 'foo'); // valid
Validate.areEqual('foo', 'bar'); // throws an IllegalArgumentException
```

##### `static areEqual(Object obj1, Object obj2, String message)`

Checks that the arguments `obj1` and `obj2` are equal.

###### Parameters
|Param|Description|
|---|---|
|`obj1`|the first object to compare|
|`obj2`|the second object to compare|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `obj1` and `obj2` are not equal with the custom `message`|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Assert.areEqual

###### Example
```apex
Validate.areEqual(
   'foo',
   'bar',
   'Arguments are not equal'
); // throws an IllegalArgumentException
```

##### `static areEqual(Object obj1, Object obj2, String message, List<Object> arguments)`

Checks that the arguments `obj1` and `obj2` are equal.

###### Parameters
|Param|Description|
|---|---|
|`obj1`|the first object to compare|
|`obj2`|the second object to compare|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `obj1` and `obj2` are not equal with the custom `message`|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Assert.areEqual

###### Example
```apex
Validate.areEqual(
   'foo',
   'bar',
   'Arguments {0} and {1} are not equal',
   new List<String>{ 'foo', 'bar' }
); // throws an IllegalArgumentException
```

##### `static areNotEqual(Object obj1, Object obj2)`

Checks that the arguments `obj1` and `obj2` are not equal.

###### Parameters
|Param|Description|
|---|---|
|`obj1`|the first object to compare|
|`obj2`|the second object to compare|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `obj1` and `obj2` are equal with the default formatted exception message 'Arguments {0} and {1} are equal'|


**See** Assert.areNotEqual

###### Example
```apex
Validate.areNotEqual('foo', 'bar'); // valid
Validate.areNotEqual('foo', 'foo'); // throws an IllegalArgumentException
```

##### `static areNotEqual(Object obj1, Object obj2, String message)`

Checks that the arguments `obj1` and `obj2` are not equal.

###### Parameters
|Param|Description|
|---|---|
|`obj1`|the first object to compare|
|`obj2`|the second object to compare|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `obj1` and `obj2` are equal with the custom `message`|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Assert.areNotEqual

###### Example
```apex
Validate.areNotEqual(
   'foo',
   'foo',
   'Arguments are equal'
); // throws an IllegalArgumentException
```

##### `static areNotEqual(Object obj1, Object obj2, String message, List<Object> arguments)`

Checks that the arguments `obj1` and `obj2` are not equal.

###### Parameters
|Param|Description|
|---|---|
|`obj1`|the first object to compare|
|`obj2`|the second object to compare|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `obj1` and `obj2` are equal with the custom `message`|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Assert.areNotEqual

###### Example
```apex
Validate.areNotEqual(
   'foo',
   'foo',
   'Arguments {0} and {1} are equal',
   new List<String>{ 'foo', 'bar' }
); // throws an IllegalArgumentException
```

##### `static isFalse(Boolean condition)`

Checks that the argument `condition` is false.

###### Parameters
|Param|Description|
|---|---|
|`condition`|the boolean expression to check|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `condition` evaluates to true with the default exception message 'Argument condition is true'|
|`NullPointerException`|if `condition` is null with the default exception message 'Argument object is null'|


**See** Assert.isFalse


**See** Validate.isTrue

###### Example
```apex
Validate.isFalse(i > 0);
Validate.isFalse(response.getStatusCode() != 200);
```

##### `static isFalse(Boolean condition, String message)`

Checks that the argument `condition` is false.

###### Parameters
|Param|Description|
|---|---|
|`condition`|the boolean expression to check|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `condition` evaluates to true with the custom exception `message`|
|`NullPointerException`|if `condition` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Assert.isFalse


**See** Validate.isTrue

###### Example
```apex
Validate.isFalse(
    i < 0,
    'The argument value must be positive'
);
Validate.isFalse(
    response.getStatusCode() == 400,
    'The status code must not be 400'
);
```

##### `static isFalse(Boolean condition, String message, List<Object> arguments)`

Checks that the argument `condition` is false.

###### Parameters
|Param|Description|
|---|---|
|`condition`|the boolean expression to check|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `condition` evaluates to true with the custom exception `message`|
|`NullPointerException`|if `condition` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Assert.isFalse


**See** Validate.isTrue

###### Example
```apex
Validate.isFalse(
    response.getStatusCode() == 400,
    'The status code must not be {0}',
    new List<Integer>{ 400 }
);
```

##### `static isInstanceOfType(Object obj, Type expectedType)`

Checks that the argument `obj` is the instance of type.

###### Parameters
|Param|Description|
|---|---|
|`obj`|the object to validate|
|`expectedType`|the expected type for the object|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `obj` is not an instance of `expectedType` with the default formatted exception message 'Argument object is not an instance of {0}. Actual type: {1}'|
|`NullPointerException`|if `expectedType` is null with the default exception message 'Argument object is null'|


**See** Assert.isInstanceOfType

###### Example
```apex
Validate.isInstanceOfType('hello', String.class); // valid
Validate.isInstanceOfType('hello', Integer.class); // throws an IllegalArgumentException
```

##### `static isInstanceOfType(Object obj, Type expectedType, String message)`

Checks that the argument `obj` is the instance of type.

###### Parameters
|Param|Description|
|---|---|
|`obj`|the object to validate|
|`expectedType`|the expected type for the object|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `obj` is not an instance of `expectedType` with the custom exception `message`|
|`NullPointerException`|if `expectedType` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Assert.isInstanceOfType

###### Example
```apex
Validate.isInstanceOfType(
    'hello',
    Integer.class,
    'Invalid type'
); // throws an IllegalArgumentException
```

##### `static isInstanceOfType(Object obj, Type expectedType, String message, List<Object> arguments)`

Checks that the argument `obj` is the instance of type.

###### Parameters
|Param|Description|
|---|---|
|`obj`|the object to validate|
|`expectedType`|the expected type for the object|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `obj` is not an instance of `expectedType` with the custom exception `message`|
|`NullPointerException`|if `expectedType` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Assert.isInstanceOfType

###### Example
```apex
Validate.isInstanceOfType(
    'hello',
    Integer.class,
    'Expected Type: {0}',
    new List<String>{ 'Integer' }
); // throws an IllegalArgumentException
```

##### `static isNotInstanceOfType(Object obj, Type notExpectedType)`

Checks that the argument `obj` is not the instance of type.

###### Parameters
|Param|Description|
|---|---|
|`obj`|the object to validate|
|`notExpectedType`|the not expected type for the object|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `obj` is an instance of `notExpectedType` with the default formatted exception message 'Argument object is an instance of {0}'|
|`NullPointerException`|if `notExpectedType` is null with the default exception message 'Argument object is null'|


**See** Assert.isNotInstanceOfType

###### Example
```apex
Validate.isNotInstanceOfType('hello', Integer.class); // valid
Validate.isNotInstanceOfType('hello', String.class); // throws an IllegalArgumentException
```

##### `static isNotInstanceOfType(Object obj, Type notExpectedType, String message)`

Checks that the argument `obj` is not the instance of type.

###### Parameters
|Param|Description|
|---|---|
|`obj`|the object to validate|
|`notExpectedType`|the not expected type for the object|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `obj` is an instance of `notExpectedType` with the custom exception `message`|
|`NullPointerException`|if `notExpectedType` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Assert.isNotInstanceOfType

###### Example
```apex
Validate.isNotInstanceOfType(
    'hello',
    String.class,
    'Invalid type'
); // throws an IllegalArgumentException
```

##### `static isNotInstanceOfType(Object obj, Type notExpectedType, String message, List<Object> arguments)`

Checks that the argument `obj` is not the instance of type.

###### Parameters
|Param|Description|
|---|---|
|`obj`|the object to validate|
|`notExpectedType`|the expected type for the object|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if the `obj` is not an instance of `notExpectedType` with the custom exception `message`|
|`NullPointerException`|if `notExpectedType` is null with the default exception message 'Argument object is null'|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Assert.isNotInstanceOfType

###### Example
```apex
Validate.isNotInstanceOfType(
    'hello',
    String.class,
    'Unexpected Type: {0}',
    new List<String>{ 'String' }
); // throws an IllegalArgumentException
```

##### `static isNotNull(Object obj)`

Checks that the argument reference `obj` is not null. Unlike Validate.notNull throws `IllegalArgumentException` when the `obj` is null.

###### Parameters
|Param|Description|
|---|---|
|`obj`|the object to check for nullity|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `obj` is null with the default exception message 'Argument object is null'|


**See** Assert.isNotNull


**See** Validate.notNull


**See** Validate.isTrue

###### Example
```apex
Validate.isNotNull('foo'); // valid
Object obj;
Validate.isNotNull(obj); // throws an IllegalArgumentException
```

##### `static isNotNull(Object obj, String message)`

Checks that the argument reference `obj` is not null. Unlike Validate.notNull throws `IllegalArgumentException` when the `obj` is null.

###### Parameters
|Param|Description|
|---|---|
|`obj`|the object to check for nullity|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `obj` is null with the custom exception `message`|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Assert.isNotNull


**See** Validate.notNull


**See** Validate.isTrue

###### Example
```apex
Object obj;
Validate.isNotNull(
    obj,
    'The object cannot be null'
); // throws an IllegalArgumentException
```

##### `static isNotNull(Object obj, String message, List<Object> arguments)`

Checks that the argument reference `obj` is not null. Unlike Validate.notNull throws `IllegalArgumentException` when the `obj` is null.

###### Parameters
|Param|Description|
|---|---|
|`obj`|the object to check for nullity|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `obj` is null with the custom exception `message`|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Assert.isNotNull


**See** Validate.notNull


**See** Validate.isTrue

###### Example
```apex
Object obj;
Validate.isNotNull(
    obj,
    'Custom exception {0}',
    new List<String>{ 'argument' }
); // throws an IllegalArgumentException
```

##### `static isNull(Object obj)`

Checks that the argument reference `obj` is null.

###### Parameters
|Param|Description|
|---|---|
|`obj`|the object to check for nullity|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `obj` is not null with the default formatted exception message 'Argument object is not null. Actual value: {0}'|


**See** Assert.isNull


**See** Validate.isTrue

###### Example
```apex
Object obj;
Validate.isNull(obj); // valid
Validate.isNull('foo'); // throws an IllegalArgumentException
```

##### `static isNull(Object obj, String message)`

Checks that the argument reference `obj` is null.

###### Parameters
|Param|Description|
|---|---|
|`obj`|the object to check for nullity|
|`message`|the required custom exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `obj` is not null with the custom exception `message`|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Assert.isNull


**See** Validate.isTrue

###### Example
```apex
Validate.isNull('foo', 'Custom message'); // throws an IllegalArgumentException
```

##### `static isNull(Object obj, String message, List<Object> arguments)`

Checks that the argument reference `obj` is null.

###### Parameters
|Param|Description|
|---|---|
|`obj`|the object to check for nullity|
|`message`|the required formatted exception message|
|`arguments`|the optional values for the formatted exception message|

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `obj` is not null with the custom exception `message`|
|`NullPointerException`|if `message` is null with the default exception message 'Exception message cannot be null'|


**See** Assert.isNull


**See** Validate.isTrue

###### Example
```apex
Validate.isNull(
    'foo',
    'Argument is not null. Actual value: {0}',
    new List<String>{ 'foo' }
); // throws an IllegalArgumentException
```

---
