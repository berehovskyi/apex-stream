# StringFunction

`APIVERSION: 54`

`STATUS: ACTIVE`

Extends `Function` functions and provides `StringFunction` common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions

## Methods
### String Functions
##### `static abbreviate(Integer maxWidth)`

Returns a `Function` that abbreviates the string input argument, of the specified `maxWidth` and with ellipses appended if the current String is longer than the specified `maxWidth`; otherwise, returns the original String without ellipses.

###### Parameters
|Param|Description|
|---|---|
|`maxWidth`|the length|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `maxWidth` is null|


**See** String.abbreviate

##### `static abbreviate(Integer maxWidth, Integer offset)`

Returns a `Function` that abbreviates the string input argument, starting at the specified character `offset` and of the specified `maxWidth`. The returned String has ellipses appended at the start and the end if characters have been removed at these locations.

###### Parameters
|Param|Description|
|---|---|
|`maxWidth`|the length|
|`offset`|the offset|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `maxWidth` or `offset` is null|


**See** String.abbreviate

##### `static append(String suffix)`

Returns a `Function` that appends `suffix` to the string input argument.

###### Parameters
|Param|Description|
|---|---|
|`suffix`|the string to append|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `suffix` is null|

##### `static capitalize()`

Returns a `Function` that returns the string input argument with the first letter changed to title case.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.capitalize

##### `static center(Integer size)`

Returns a `Function` that returns a version of the string input argument of the specified `size` padded with spaces on the left and right, so that it appears in the center. If the specified size is smaller than the current String size, the entire String is returned without added spaces.

###### Parameters
|Param|Description|
|---|---|
|`size`|the size|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `size` is null|


**See** String.center

##### `static center(Integer size, String padStr)`

Returns a `Function` that returns a version of the string input argument of the specified `size` padded with the specified `padStr` on the left and right, so that it appears in the center. If the specified size is smaller than the current String size, the entire String is returned without padding.

###### Parameters
|Param|Description|
|---|---|
|`size`|the size|
|`padStr`|the padding string|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `size` or `padStr` is null|


**See** String.center

##### `static deleteWhitespace()`

Returns a `Function` that returns a version of the string input argument with all white space characters removed.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.deleteWhitespace

##### `static difference(String str)`

Returns a `Function` that returns the difference between the string input argument and the specified `str`.

###### Parameters
|Param|Description|
|---|---|
|`str`|the string to compare|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `str` is null|


**See** String.difference

##### `static escapeCsv()`

Returns a `Function` that returns a String for a CSV column enclosed in Double quotes, if required.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.escapeCsv

##### `static escapeEcmaScript()`

Returns a `Function` that escapes the characters in the string input argument using EcmaScript String rules.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.escapeEcmaScript

##### `static escapeHtml3()`

Returns a `Function` that escapes the characters in the string input argument using HTML 3.0 entities.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.escapeHtml3

##### `static escapeHtml4()`

Returns a `Function` that escapes the characters in the string input argument using HTML 3.0 entities.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.escapeHtml4

##### `static escapeJava()`

Returns a `Function` that escapes the characters in the string input argument using using Java String rules. Characters escaped include quotes and control characters, such as tab, backslash, and carriage return characters.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.escapeJava

##### `static escapeSingleQuotes()`

Returns a `Function` that return a String with the escape character (\) added before any single quotation marks in the string input argument.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.escapeSingleQuotes

##### `static escapeUnicode()`

Returns a `Function` that returns a String whose Unicode characters are escaped to a Unicode escape sequence.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.escapeUnicode

##### `static escapeXml()`

Returns a `Function` that escapes the characters in the string input argument using XML entities.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.escapeXml

##### `static format(List<Object> arguments)`

Returns a `Function` that treats the string input argument as a pattern and returns a string using the `arguments` for substitution and formatting.

###### Parameters
|Param|Description|
|---|---|
|`arguments`|the objects for substitution|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `arguments` is null|


**See** String.format

##### `static getChars()`

Returns a `Function` that returns an array of character values that represent the characters in the string input argument.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.getChars

##### `static left(Integer length)`

Returns a `Function` that returns the leftmost characters of the string input argument of the specified `length`.

###### Parameters
|Param|Description|
|---|---|
|`length`|the length|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `length` is null|


**See** String.left

##### `static leftPad(Integer length)`

Returns a `Function` that returns the string input argument padded with spaces on the left and of the specified `length`.

###### Parameters
|Param|Description|
|---|---|
|`length`|the length|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `length` is null|


**See** String.leftPad

##### `static leftPad(Integer length, String padStr)`

Returns a `Function` that returns the string input argument padded with `padStr` on the left and of the specified `length`.

###### Parameters
|Param|Description|
|---|---|
|`length`|the length|
|`padStr`|the padding string|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `length` or `padStr` is null|


**See** String.leftPad

##### `static mid(Integer startIndex, Integer length)`

Returns a `Function` that returns a new String that begins with the character at the specified zero-based `startIndex` with the number of characters specified by `length`.

###### Parameters
|Param|Description|
|---|---|
|`startIndex`|the start index|
|`length`|the length|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `startIndex` or `length` is null|


**See** String.mid

##### `static normalizeSpace()`

Returns a `Function` that returns the string input argument with leading, trailing, and repeating white space characters removed.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.normalizeSpace

##### `static prepend(String prefix)`

Returns a `Function` that prepends `prefix` to the string input argument.

###### Parameters
|Param|Description|
|---|---|
|`prefix`|the string to prepend|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `prefix` is null|

##### `static remove(String substring)`

Returns a `Function` that removes all occurrences of the specified `substring` and returns the String result.

###### Parameters
|Param|Description|
|---|---|
|`substring`|the string to remove|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** String.remove

##### `static removeEnd(String substring)`

Returns a `Function` that removes the specified `substring` only if it occurs at the end of the String.

###### Parameters
|Param|Description|
|---|---|
|`substring`|the string to remove|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** String.removeEnd

##### `static removeEndIgnoreCase(String substring)`

Returns a `Function` that removes the specified `substring` only if it occurs at the end of the String using a case-insensitive match.

###### Parameters
|Param|Description|
|---|---|
|`substring`|the string to remove|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** String.removeEndIgnoreCase

##### `static removeStart(String substring)`

Returns a `Function` that removes the specified `substring` only if it occurs at the beginning of the String.

###### Parameters
|Param|Description|
|---|---|
|`substring`|the string to remove|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** String.removeStart

##### `static removeStartIgnoreCase(String substring)`

Returns a `Function` that removes the specified `substring` only if it occurs at the beginning of the String using a case-insensitive match.

###### Parameters
|Param|Description|
|---|---|
|`substring`|the string to remove|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** String.removeStartIgnoreCase

##### `static repeat(Integer numTimes)`

Returns a `Function` that returns the string input argument repeated the specified number of times.

###### Parameters
|Param|Description|
|---|---|
|`numTimes`|the number of times to repeat|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `numTimes` is null|


**See** String.repeat

##### `static repeat(String separator, Integer numTimes)`

Returns a `Function` that returns the string input argument repeated the specified `numTimes` using the specified `separator` to separate the repeated Strings.

###### Parameters
|Param|Description|
|---|---|
|`separator`|the separator|
|`numTimes`|the number of times to repeat|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `separator` or `numTimes` is null|


**See** String.repeat

##### `static replace(String target, String replacement)`

Returns a `Function` that replaces each substring of the string input argument that matches the literal `target` sequence with the specified literal `replacement` sequence.

###### Parameters
|Param|Description|
|---|---|
|`target`|the target|
|`replacement`|the replacement sequence|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `target` or `replacement` is null|


**See** String.replace

##### `static replaceAll(String regExp, String replacement)`

Returns a `Function` that replaces each substring of the string input argument that matches the regular expression `regExp` with the `replacement` sequence.

###### Parameters
|Param|Description|
|---|---|
|`regExp`|the regular expression|
|`replacement`|the replacement sequence|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `regExp` or `replacement` is null|


**See** String.replaceAll

##### `static replaceFirst(String regExp, String replacement)`

Returns a `Function` that replaces the first substring of the string input argument that matches the regular expression `regExp` with the `replacement` sequence.

###### Parameters
|Param|Description|
|---|---|
|`regExp`|the regular expression|
|`replacement`|the replacement sequence|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `regExp` or `replacement` is null|


**See** String.replaceAll

##### `static reverse()`

Returns a `Function` that returns a String with all the characters reversed.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.reverse

##### `static right(Integer length)`

Returns a `Function` that returns the rightmost characters of the string input argument of the specified `length`.

###### Parameters
|Param|Description|
|---|---|
|`length`|the length|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `length` is null|


**See** String.right

##### `static rightPad(Integer length)`

Returns a `Function` that returns the string input argument padded with spaces on the right and of the specified `length`.

###### Parameters
|Param|Description|
|---|---|
|`length`|the length|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `length` is null|


**See** String.rightPad

##### `static rightPad(Integer length, String padStr)`

Returns a `Function` that returns the string input argument padded with `padStr` on the right and of the specified `length`.

###### Parameters
|Param|Description|
|---|---|
|`length`|the length|
|`padStr`|the padding string|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `length` or `padStr` is null|


**See** String.rightPad

##### `static split(String regExp)`

Returns a `Function` that returns a list that contains each substring of the string input argument that is terminated by either the regular expression `regExp` or the end.

###### Parameters
|Param|Description|
|---|---|
|`regExp`|the regular expression|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `regExp` is null|


**See** String.split

##### `static split(String regExp, Integer lim)`

Returns a `Function` that returns a list that contains each substring of the string input argument that is terminated by either the regular expression `regExp` or `lim`.

###### Parameters
|Param|Description|
|---|---|
|`regExp`|the regular expression|
|`lim`|the limit|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `regExp` or `lim` is null|


**See** String.split

##### `static splitByCharacterType()`

Returns a `Function` that splits the string input argument by character type and returns a list of contiguous character groups of the same type as complete tokens.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.splitByCharacterType

##### `static splitByCharacterTypeCamelCase()`

Returns a `Function` that splits the string input argument by character type and returns a list of contiguous character groups of the same type as complete tokens, with the following exception: the uppercase character, if any, immediately preceding a lowercase character token belongs to the following character token rather than to the preceding.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.splitByCharacterTypeCamelCase

##### `static stripHtmlTags()`

Returns a `Function` that removes HTML markup and returns plain text.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.stripHtmlTags

##### `static substring(Integer startIndex)`

Returns a `Function` that returns a new String that begins with the character at the specified zero-based `startIndex` and extends to the end of the string input argument.

###### Parameters
|Param|Description|
|---|---|
|`startIndex`|the start index|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `startIndex` is null|


**See** String.substring

##### `static substring(Integer startIndex, Integer endIndex)`

Returns a `Function` that returns a new String that begins with the character at the specified zero-based `startIndex` and extends to the character at `endIndex` - 1.

###### Parameters
|Param|Description|
|---|---|
|`startIndex`|the start index|
|`endIndex`|the end index|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `startIndex` or `endIndex` is null|


**See** String.substring

##### `static substringAfter(String separator)`

Returns a `Function` that returns the substring that occurs after the first occurrence of the specified `separator`.

###### Parameters
|Param|Description|
|---|---|
|`separator`|the separator|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `separator` is null|


**See** String.substringAfter

##### `static substringAfterLast(String separator)`

Returns a `Function` that returns the substring that occurs after the last occurrence of the specified `separator`.

###### Parameters
|Param|Description|
|---|---|
|`separator`|the separator|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `separator` is null|


**See** String.substringAfterLast

##### `static substringBefore(String separator)`

Returns a `Function` that returns the substring that occurs before the first occurrence of the specified `separator`.

###### Parameters
|Param|Description|
|---|---|
|`separator`|the separator|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `separator` is null|


**See** String.substringBefore

##### `static substringBeforeLast(String separator)`

Returns a `Function` that returns the substring that occurs before the last occurrence of the specified `separator`.

###### Parameters
|Param|Description|
|---|---|
|`separator`|the separator|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `separator` is null|


**See** String.substringBeforeLast

##### `static substringBetween(String tag)`

Returns a `Function` that returns the substring that occurs between two instances of the specified `tag` String.

###### Parameters
|Param|Description|
|---|---|
|`tag`|the tag|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `tag` is null|


**See** String.substringBetween

##### `static substringBetween(String open, String close)`

Returns a `Function` that returns the substring that occurs between the two specified Strings.

###### Parameters
|Param|Description|
|---|---|
|`open`|the start string|
|`close`|the end string|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `open` or `close` is null|


**See** String.substringBetween

##### `static swapCase()`

Returns a `Function` that swaps the case of all characters and returns the resulting String by using the default (English US) locale.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.swapCase

##### `static toLowerCase()`

Returns a `Function` that converts all of the characters in the string input argument to lowercase using the rules of the default (English US) locale.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.toLowerCase

##### `static toLowerCase(String locale)`

Returns a `Function` that converts all of the characters in the string input argument to lowercase using the rules of the specified `locale`.

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `locale` is null|


**See** String.toLowerCase

##### `static toUpperCase()`

Returns a `Function` that converts all of the characters in the string input argument to uppercase using the rules of the default (English US) locale.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.toUpperCase

##### `static toUpperCase(String locale)`

Returns a `Function` that converts all of the characters in the string input argument to uppercase using the rules of the specified `locale`.

###### Parameters
|Param|Description|
|---|---|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `locale` is null|


**See** String.toUpperCase

##### `static trim()`

Returns a `Function` that returns a copy of the string that no longer contains any leading or trailing white space characters.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.trim

##### `static uncapitalize()`

Returns a `Function` that returns the string input argument with the first letter in lowercase.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.uncapitalize

##### `static unescapeCsv()`

Returns a `Function` that returns a String representing an unescaped CSV column.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.unescapeCsv

##### `static unescapeEcmaScript()`

Returns a `Function` that unescapes any EcmaScript literals found in the String.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.unescapeEcmaScript

##### `static unescapeHtml3()`

Returns a `Function` that unescapes the characters in the string input argument using HTML 3.0 entities.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.unescapeHtml3

##### `static unescapeHtml4()`

Returns a `Function` that unescapes the characters in the string input argument using HTML 4.0 entities.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.unescapeHtml4

##### `static unescapeJava()`

Returns a `Function` that returns a String whose Java literals are unescaped. Literals unescaped include escape sequences for quotes (\\&quot;) and control characters, such as tab (\\t), and carriage return (\\n).

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.unescapeJava

##### `static unescapeUnicode()`

Returns a `Function` that returns a String whose escaped Unicode characters are unescaped.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.unescapeUnicode

##### `static unescapeXml()`

Returns a `Function` that unescapes the characters in a String using XML entities.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.unescapeXml

##### `static valueOf()`

Returns a `Function` that returns a string representation of the string input argument.

###### Return

**Type**

Function

**Description**

the `Function`


**See** String.valueOf

##### `static dateValueOf()`

Returns a `Function` that returns a date representation of the string input argument.

###### Return

**Type**

Function

**Description**

the `Function`


**See** Date.valueOf

##### `static datetimeValueOf()`

Returns a `Function` that returns a datetime representation of the string input argument.

###### Return

**Type**

Function

**Description**

the `Function`


**See** Datetime.valueOf

##### `static datetimeValueOfGmt()`

Returns a `Function` that returns a datetime representation of the string input argument in GMT format &apos;yyyy-MM-dd HH:mm:ss&apos; in the local time zone.

###### Return

**Type**

Function

**Description**

the `Function`


**See** Datetime.valueOfGmt

##### `static parseDate()`

Returns a `Function` that returns a Date from the string input argument in the local time zone and in the format of the user locale.

###### Return

**Type**

Function

**Description**

the `Function`


**See** Date.parse

##### `static parseDatetime()`

Returns a `Function` that returns a Datetime from the string input argument in the local time zone and in the format of the user locale.

###### Return

**Type**

Function

**Description**

the `Function`


**See** Datetime.parse

---
