# StringPredicates

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides common implementations of `String` [Predicate](/docs/Functional-Abstract-Classes/Predicate.md) and related utilities.


**See** [Predicate](/docs/Functional-Abstract-Classes/Predicate.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### String Predicates
##### `static contains(String substring)`

Returns a `Predicate` that tests the input string if it contains the `substring`.

###### Parameters
|Param|Description|
|---|---|
|`substring`|string|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** String.contains

##### `static containsAny(String substring)`

Returns a `Predicate` that tests the input string if it contains any `substring`.

###### Parameters
|Param|Description|
|---|---|
|`substring`|string|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** String.containsAny

##### `static containsIgnoreCase(String substring)`

Returns a `Predicate` that tests the input string if it contains the `substring` ignoring case.

###### Parameters
|Param|Description|
|---|---|
|`substring`|string|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** String.containsIgnoreCase

##### `static containsNone(String substring)`

Returns a `Predicate` that tests the input string if it does not contain any of the characters in the `substring`.

###### Parameters
|Param|Description|
|---|---|
|`substring`|string|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** String.containsNone

##### `static containsOnly(String substring)`

Returns a `Predicate` that tests the input string if it contains characters only from the `substring`.

###### Parameters
|Param|Description|
|---|---|
|`substring`|string|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** String.containsOnly

##### `static containsWhitespace()`

Returns a `Predicate` that tests the input string if it contains any white space.

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** String.containsWhitespace

##### `static endsWith(String suffix)`

Returns a `Predicate` that tests the input string if it ends with the `suffix`.

###### Parameters
|Param|Description|
|---|---|
|`suffix`|string|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `suffix` is null|


**See** String.endsWith

##### `static endsWithIgnoreCase(String suffix)`

Returns a `Predicate` that tests the input string if it ends with the `suffix` ignoring case.

###### Parameters
|Param|Description|
|---|---|
|`suffix`|string|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `suffix` is null|


**See** String.endsWithIgnoreCase

##### `static equalsIgnoreCase(String that)`

Returns a `Predicate` that tests the input string if it equals to the `that` ignoring case.

###### Parameters
|Param|Description|
|---|---|
|`that`|string|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `that` is null|


**See** String.equalsIgnoreCase

##### `static isAllLowerCase()`

Returns a `Predicate` that tests the input string if all characters are lowercase.

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** String.isAllLowerCase

##### `static isAllUpperCase()`

Returns a `Predicate` that tests the input string if all characters are uppercase.

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** String.IsAllUpperCase

##### `static isAlpha()`

Returns a `Predicate` that tests the input string if all characters are Unicode letters only.

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** String.isAlpha

##### `static isAlphaSpace()`

Returns a `Predicate` that tests the input string if all characters are Unicode letters or spaces only.

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** String.isAlphaSpace

##### `static isAlphaNumeric()`

Returns a `Predicate` that tests the input string if all characters are Unicode letters or numbers only.

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** String.isAlphaNumeric

##### `static isAlphaNumericSpace()`

Returns a `Predicate` that tests the input string if all characters are Unicode letters, spaces or numbers only.

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** String.isAlphaNumericSpace

##### `static isAsciiPrintable()`

Returns a `Predicate` that tests the input string if all characters are ASCII printable only.

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** String.isAsciiPrintable

##### `static isBlank()`

Returns a `Predicate` that tests the input string if it is white space, empty (&apos;&apos;), or null.

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** String.isBlank

##### `static isEmpty()`

Returns a `Predicate` that tests the input string if it is empty (&apos;&apos;), or null.

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** String.isEmpty

##### `static isLike(String likeString)`

Returns a `Predicate` that tests the input string if it is like the `likeString`. Supports `%` and `_` wildcards and is case-insensitive.

###### Parameters
|Param|Description|
|---|---|
|`likeString`|string|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `likeString` is null|

##### `static isNotBlank()`

Returns a `Predicate` that tests the input string if it is not white space, empty (&apos;&apos;), or null.

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** String.isNotBlank

##### `static isNotEmpty()`

Returns a `Predicate` that tests the input string if it is not empty (&apos;&apos;), or null.

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** String.isNotEmpty

##### `static isNumeric()`

Returns a `Predicate` that tests the input string if all characters are numbers only.

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** String.isNumeric

##### `static isNumericSpace()`

Returns a `Predicate` that tests the input string if all characters are spaces or numbers only.

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** String.isNumericSpace

##### `static isWhitespace()`

Returns a `Predicate` that tests the input string if all characters are spaces only.

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** String.isWhitespace

##### `static startsWith(String prefix)`

Returns a `Predicate` that tests the input string if it starts with the `prefix`.

###### Parameters
|Param|Description|
|---|---|
|`prefix`|string|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `prefix` is null|


**See** String.startsWith

##### `static startsWithIgnoreCase(String prefix)`

Returns a `Predicate` that tests the input string if it starts with the `prefix` ignoring case.

###### Parameters
|Param|Description|
|---|---|
|`prefix`|string|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `prefix` is null|


**See** String.startsWithIgnoreCase

---
