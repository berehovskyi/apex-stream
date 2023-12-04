# virtual StringFunctions

`SUPPRESSWARNINGS`

`APIVERSION: 59`

`STATUS: ACTIVE`

Provides common implementations of `String` [Function](/docs/Functional-Abstract-Classes/Function.md)
and related utilities.


**See** [Function](/docs/Functional-Abstract-Classes/Function.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### String Functions
##### `public static Function abbreviate(Integer maxWidth)`

Returns a `Function` that abbreviates the string input argument, of the specified `maxWidth` and with ellipses appended if the current String is longer than the specified `maxWidth`, otherwise returns the original String without ellipses.

###### Parameters

|Param|Description|
|---|---|
|`maxWidth`|the length|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `maxWidth` is null|


**See** [String.abbreviate](String.abbreviate)

##### `public static Function abbreviate(Integer maxWidth, Integer offset)`

Returns a `Function` that abbreviates the string input argument, starting at the specified character `offset` and of the specified `maxWidth`. The returned String has ellipses appended at the start and the end if characters have been removed at these locations.

###### Parameters

|Param|Description|
|---|---|
|`maxWidth`|the length|
|`offset`|the offset|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `maxWidth` or `offset` is null|


**See** [String.abbreviate](String.abbreviate)

##### `public static Function append(String suffix)`

Returns a `Function` that appends `suffix` to the string input argument.

###### Parameters

|Param|Description|
|---|---|
|`suffix`|the string to append|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `suffix` is null|

##### `public static Function capitalize()`

Returns a `Function` that returns the string input argument with the first letter changed to title case.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.capitalize](String.capitalize)

##### `public static Function center(Integer size)`

Returns a `Function` that returns a version of the string input argument of the specified `size` padded with spaces on the left and right, so that it appears in the center. If the specified size is smaller than the current String size, the entire String is returned without added spaces.

###### Parameters

|Param|Description|
|---|---|
|`size`|the size|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `size` is null|


**See** [String.center](String.center)

##### `public static Function center(Integer size, String padStr)`

Returns a `Function` that returns a version of the string input argument of the specified `size` padded with the specified `padStr` on the left and right, so that it appears in the center. If the specified size is smaller than the current String size, the entire String is returned without padding.

###### Parameters

|Param|Description|
|---|---|
|`size`|the size|
|`padStr`|the padding string|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `size` or `padStr` is null|


**See** [String.center](String.center)

##### `public static Function deleteWhitespace()`

Returns a `Function` that returns a version of the string input argument with all white space characters removed.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.deleteWhitespace](String.deleteWhitespace)

##### `public static Function difference(String str)`

Returns a `Function` that returns the difference between the string input argument and the specified `str`.

###### Parameters

|Param|Description|
|---|---|
|`str`|the string to compare|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `str` is null|


**See** [String.difference](String.difference)

##### `public static Function escapeCsv()`

Returns a `Function` that returns a String for a CSV column enclosed in Double quotes, if required.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.escapeCsv](String.escapeCsv)

##### `public static Function escapeEcmaScript()`

Returns a `Function` that escapes the characters in the string input argument using EcmaScript String rules.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.escapeEcmaScript](String.escapeEcmaScript)

##### `public static Function escapeHtml3()`

Returns a `Function` that escapes the characters in the string input argument using HTML 3.0 entities.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.escapeHtml3](String.escapeHtml3)

##### `public static Function escapeHtml4()`

Returns a `Function` that escapes the characters in the string input argument using HTML 3.0 entities.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.escapeHtml4](String.escapeHtml4)

##### `public static Function escapeJava()`

Returns a `Function` that escapes the characters in the string input argument using using Java String rules. Characters escaped include quotes and control characters, such as tab, backslash, and carriage return characters.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.escapeJava](String.escapeJava)

##### `public static Function escapeSingleQuotes()`

Returns a `Function` that return a String with the escape character (\) added before any single quotation marks in the string input argument.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.escapeSingleQuotes](String.escapeSingleQuotes)

##### `public static Function escapeUnicode()`

Returns a `Function` that returns a String whose Unicode characters are escaped to a Unicode escape sequence.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.escapeUnicode](String.escapeUnicode)

##### `public static Function escapeXml()`

Returns a `Function` that escapes the characters in the string input argument using XML entities.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.escapeXml](String.escapeXml)

##### `public static Function format(List<Object> arguments)`

Returns a `Function` that treats the string input argument as a pattern and returns a string using the `arguments` for substitution and formatting.

###### Parameters

|Param|Description|
|---|---|
|`arguments`|the objects for substitution|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `arguments` is null|


**See** [String.format](String.format)

##### `public static Function getChars()`

Returns a `Function` that returns an array of character values that represent the characters in the string input argument.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.getChars](String.getChars)

##### `public static Function left(Integer length)`

Returns a `Function` that returns the leftmost characters of the string input argument of the specified `length`.

###### Parameters

|Param|Description|
|---|---|
|`length`|the length|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `length` is null|


**See** [String.left](String.left)

##### `public static Function leftPad(Integer length)`

Returns a `Function` that returns the string input argument padded with spaces on the left and of the specified `length`.

###### Parameters

|Param|Description|
|---|---|
|`length`|the length|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `length` is null|


**See** [String.leftPad](String.leftPad)

##### `public static Function leftPad(Integer length, String padStr)`

Returns a `Function` that returns the string input argument padded with `padStr` on the left and of the specified `length`.

###### Parameters

|Param|Description|
|---|---|
|`length`|the length|
|`padStr`|the padding string|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `length` or `padStr` is null|


**See** [String.leftPad](String.leftPad)

##### `public static Function mid(Integer startIndex, Integer length)`

Returns a `Function` that returns a new String that begins with the character at the specified zero-based `startIndex` with the number of characters specified by `length`.

###### Parameters

|Param|Description|
|---|---|
|`startIndex`|the start index|
|`length`|the length|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `startIndex` or `length` is null|


**See** [String.mid](String.mid)

##### `public static Function normalizeSpace()`

Returns a `Function` that returns the string input argument with leading, trailing, and repeating white space characters removed.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.normalizeSpace](String.normalizeSpace)

##### `public static Function prepend(String prefix)`

Returns a `Function` that prepends `prefix` to the string input argument.

###### Parameters

|Param|Description|
|---|---|
|`prefix`|the string to prepend|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `prefix` is null|

##### `public static Function remove(String substring)`

Returns a `Function` that removes all occurrences of the specified `substring` and returns the String result.

###### Parameters

|Param|Description|
|---|---|
|`substring`|the string to remove|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** [String.remove](String.remove)

##### `public static Function removeEnd(String substring)`

Returns a `Function` that removes the specified `substring` only if it occurs at the end of the String.

###### Parameters

|Param|Description|
|---|---|
|`substring`|the string to remove|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** [String.removeEnd](String.removeEnd)

##### `public static Function removeEndIgnoreCase(String substring)`

Returns a `Function` that removes the specified `substring` only if it occurs at the end of the String using a case-insensitive match.

###### Parameters

|Param|Description|
|---|---|
|`substring`|the string to remove|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** [String.removeEndIgnoreCase](String.removeEndIgnoreCase)

##### `public static Function removeStart(String substring)`

Returns a `Function` that removes the specified `substring` only if it occurs at the beginning of the String.

###### Parameters

|Param|Description|
|---|---|
|`substring`|the string to remove|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** [String.removeStart](String.removeStart)

##### `public static Function removeStartIgnoreCase(String substring)`

Returns a `Function` that removes the specified `substring` only if it occurs at the beginning of the String using a case-insensitive match.

###### Parameters

|Param|Description|
|---|---|
|`substring`|the string to remove|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** [String.removeStartIgnoreCase](String.removeStartIgnoreCase)

##### `public static Function repeat(Integer numTimes)`

Returns a `Function` that returns the string input argument repeated the specified number of times.

###### Parameters

|Param|Description|
|---|---|
|`numTimes`|the number of times to repeat|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `numTimes` is null|


**See** [String.repeat](String.repeat)

##### `public static Function repeat(String separator, Integer numTimes)`

Returns a `Function` that returns the string input argument repeated the specified `numTimes` using the specified `separator` to separate the repeated Strings.

###### Parameters

|Param|Description|
|---|---|
|`separator`|the separator|
|`numTimes`|the number of times to repeat|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `separator` or `numTimes` is null|


**See** [String.repeat](String.repeat)

##### `public static Function replace(String target, String replacement)`

Returns a `Function` that replaces each substring of the string input argument that matches the literal `target` sequence with the specified literal `replacement` sequence.

###### Parameters

|Param|Description|
|---|---|
|`target`|the target|
|`replacement`|the replacement sequence|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `target` or `replacement` is null|


**See** [String.replace](String.replace)

##### `public static Function replaceAll(String regExp, String replacement)`

Returns a `Function` that replaces each substring of the string input argument that matches the regular expression `regExp` with the `replacement` sequence.

###### Parameters

|Param|Description|
|---|---|
|`regExp`|the regular expression|
|`replacement`|the replacement sequence|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `regExp` or `replacement` is null|


**See** [String.replaceAll](String.replaceAll)

##### `public static Function replaceFirst(String regExp, String replacement)`

Returns a `Function` that replaces the first substring of the string input argument that matches the regular expression `regExp` with the `replacement` sequence.

###### Parameters

|Param|Description|
|---|---|
|`regExp`|the regular expression|
|`replacement`|the replacement sequence|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `regExp` or `replacement` is null|


**See** [String.replaceAll](String.replaceAll)

##### `public static Function reverse()`

Returns a `Function` that returns a String with all the characters reversed.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.reverse](String.reverse)

##### `public static Function right(Integer length)`

Returns a `Function` that returns the rightmost characters of the string input argument of the specified `length`.

###### Parameters

|Param|Description|
|---|---|
|`length`|the length|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `length` is null|


**See** [String.right](String.right)

##### `public static Function rightPad(Integer length)`

Returns a `Function` that returns the string input argument padded with spaces on the right and of the specified `length`.

###### Parameters

|Param|Description|
|---|---|
|`length`|the length|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `length` is null|


**See** [String.rightPad](String.rightPad)

##### `public static Function rightPad(Integer length, String padStr)`

Returns a `Function` that returns the string input argument padded with `padStr` on the right and of the specified `length`.

###### Parameters

|Param|Description|
|---|---|
|`length`|the length|
|`padStr`|the padding string|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `length` or `padStr` is null|


**See** [String.rightPad](String.rightPad)

##### `public static Function split(String regExp)`

Returns a `Function` that returns a list that contains each substring of the string input argument that is terminated by either the regular expression `regExp` or the end.

###### Parameters

|Param|Description|
|---|---|
|`regExp`|the regular expression|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `regExp` is null|


**See** [String.split](String.split)

##### `public static Function split(String regExp, Integer lim)`

Returns a `Function` that returns a list that contains each substring of the string input argument that is terminated by either the regular expression `regExp` or `lim`.

###### Parameters

|Param|Description|
|---|---|
|`regExp`|the regular expression|
|`lim`|the limit|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `regExp` or `lim` is null|


**See** [String.split](String.split)

##### `public static Function splitByCharacterType()`

Returns a `Function` that splits the string input argument by character type and returns a list of contiguous character groups of the same type as complete tokens.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.splitByCharacterType](String.splitByCharacterType)

##### `public static Function splitByCharacterTypeCamelCase()`

Returns a `Function` that splits the string input argument by character type and returns a list of contiguous character groups of the same type as complete tokens, with the following exception: the uppercase character, if any, immediately preceding a lowercase character token belongs to the following character token rather than to the preceding.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.splitByCharacterTypeCamelCase](String.splitByCharacterTypeCamelCase)

##### `public static Function stripHtmlTags()`

Returns a `Function` that removes HTML markup and returns plain text.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.stripHtmlTags](String.stripHtmlTags)

##### `public static Function substring(Integer startIndex)`

Returns a `Function` that returns a new String that begins with the character at the specified zero-based `startIndex` and extends to the end of the string input argument.

###### Parameters

|Param|Description|
|---|---|
|`startIndex`|the start index|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `startIndex` is null|


**See** [String.substring](String.substring)

##### `public static Function substring(Integer startIndex, Integer endIndex)`

Returns a `Function` that returns a new String that begins with the character at the specified zero-based `startIndex` and extends to the character at `endIndex` - 1.

###### Parameters

|Param|Description|
|---|---|
|`startIndex`|the start index|
|`endIndex`|the end index|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `startIndex` or `endIndex` is null|


**See** [String.substring](String.substring)

##### `public static Function substringAfter(String separator)`

Returns a `Function` that returns the substring that occurs after the first occurrence of the specified `separator`.

###### Parameters

|Param|Description|
|---|---|
|`separator`|the separator|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `separator` is null|


**See** [String.substringAfter](String.substringAfter)

##### `public static Function substringAfterLast(String separator)`

Returns a `Function` that returns the substring that occurs after the last occurrence of the specified `separator`.

###### Parameters

|Param|Description|
|---|---|
|`separator`|the separator|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `separator` is null|


**See** [String.substringAfterLast](String.substringAfterLast)

##### `public static Function substringBefore(String separator)`

Returns a `Function` that returns the substring that occurs before the first occurrence of the specified `separator`.

###### Parameters

|Param|Description|
|---|---|
|`separator`|the separator|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `separator` is null|


**See** [String.substringBefore](String.substringBefore)

##### `public static Function substringBeforeLast(String separator)`

Returns a `Function` that returns the substring that occurs before the last occurrence of the specified `separator`.

###### Parameters

|Param|Description|
|---|---|
|`separator`|the separator|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `separator` is null|


**See** [String.substringBeforeLast](String.substringBeforeLast)

##### `public static Function substringBetween(String tag)`

Returns a `Function` that returns the substring that occurs between two instances of the specified `tag` String.

###### Parameters

|Param|Description|
|---|---|
|`tag`|the tag|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `tag` is null|


**See** [String.substringBetween](String.substringBetween)

##### `public static Function substringBetween(String open, String close)`

Returns a `Function` that returns the substring that occurs between the two specified Strings.

###### Parameters

|Param|Description|
|---|---|
|`open`|the start string|
|`close`|the end string|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `open` or `close` is null|


**See** [String.substringBetween](String.substringBetween)

##### `public static Function swapCase()`

Returns a `Function` that swaps the case of all characters and returns the resulting String by using the default (English US) locale.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.swapCase](String.swapCase)

##### `public static Function toLowerCase()`

Returns a `Function` that converts all of the characters in the string input argument to lowercase using the rules of the default (English US) locale.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.toLowerCase](String.toLowerCase)

##### `public static Function toLowerCase(String locale)`

Returns a `Function` that converts all of the characters in the string input argument to lowercase using the rules of the specified `locale`.

###### Parameters

|Param|Description|
|---|---|
|`locale`|the locale|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `locale` is null|


**See** [String.toLowerCase](String.toLowerCase)

##### `public static Function toUpperCase()`

Returns a `Function` that converts all of the characters in the string input argument to uppercase using the rules of the default (English US) locale.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.toUpperCase](String.toUpperCase)

##### `public static Function toUpperCase(String locale)`

Returns a `Function` that converts all of the characters in the string input argument to uppercase using the rules of the specified `locale`.

###### Parameters

|Param|Description|
|---|---|
|`locale`|the locale|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `locale` is null|


**See** [String.toUpperCase](String.toUpperCase)

##### `public static Function trim()`

Returns a `Function` that returns a copy of the string that no longer contains any leading or trailing white space characters.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.trim](String.trim)

##### `public static Function uncapitalize()`

Returns a `Function` that returns the string input argument with the first letter in lowercase.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.uncapitalize](String.uncapitalize)

##### `public static Function unescapeCsv()`

Returns a `Function` that returns a String representing an unescaped CSV column.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.unescapeCsv](String.unescapeCsv)

##### `public static Function unescapeEcmaScript()`

Returns a `Function` that unescapes any EcmaScript literals found in the String.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.unescapeEcmaScript](String.unescapeEcmaScript)

##### `public static Function unescapeHtml3()`

Returns a `Function` that unescapes the characters in the string input argument using HTML 3.0 entities.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.unescapeHtml3](String.unescapeHtml3)

##### `public static Function unescapeHtml4()`

Returns a `Function` that unescapes the characters in the string input argument using HTML 4.0 entities.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.unescapeHtml4](String.unescapeHtml4)

##### `public static Function unescapeJava()`

Returns a `Function` that returns a String whose Java literals are unescaped. Literals unescaped include escape sequences for quotes (\\") and control characters, such as tab (\\t), and carriage return (\\n).

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.unescapeJava](String.unescapeJava)

##### `public static Function unescapeUnicode()`

Returns a `Function` that returns a String whose escaped Unicode characters are unescaped.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.unescapeUnicode](String.unescapeUnicode)

##### `public static Function unescapeXml()`

Returns a `Function` that unescapes the characters in a String using XML entities.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.unescapeXml](String.unescapeXml)

##### `public static Function valueOf()`

Returns a `Function` that returns a string representation of the string input argument.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.valueOf](String.valueOf)

##### `public static Function dateValueOf()`

Returns a `Function` that returns a date representation of the string input argument.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Date.valueOf](Date.valueOf)

##### `public static Function datetimeValueOf()`

Returns a `Function` that returns a datetime representation of the string input argument.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Datetime.valueOf](Datetime.valueOf)

##### `public static Function datetimeValueOfGmt()`

Returns a `Function` that returns a datetime representation of the string input argument in GMT format 'yyyy-MM-dd HH:mm:ss' in the local time zone.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Datetime.valueOfGmt](Datetime.valueOfGmt)

##### `public static Function parseDate()`

Returns a `Function` that returns a Date from the string input argument in the local time zone and in the format of the user locale.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Date.parse](Date.parse)

##### `public static Function parseDatetime()`

Returns a `Function` that returns a Datetime from the string input argument in the local time zone and in the format of the user locale.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Datetime.parse](Datetime.parse)

---
