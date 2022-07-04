# StringToIntFunctions

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides common implementations of `String` [ToIntFunction](/docs/Functional-Abstract-Classes/ToIntFunction.md) and related utilities.


**See** [ToIntFunction](/docs/Functional-Abstract-Classes/ToIntFunction.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### String To Int Functions
##### `static charAt(Integer index)`

Returns a `ToIntFunction` that returns the value of the character at the specified `index`.

###### Parameters
|Param|Description|
|---|---|
|`index`|the index|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `index` is null|


**See** String.charAt

##### `static codePointAt(Integer index)`

Returns a `ToIntFunction` that returns the Unicode code point value at the specified `index`.

###### Parameters
|Param|Description|
|---|---|
|`index`|the index|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `index` is null|


**See** String.codePointAt

##### `static codePointBefore(Integer index)`

Returns a `ToIntFunction` that returns the Unicode code point value that occurs before the specified `index`.

###### Parameters
|Param|Description|
|---|---|
|`index`|the index|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `index` is null|


**See** String.codePointBefore

##### `static codePointCount(Integer beginIndex, Integer endIndex)`

Returns a `ToIntFunction` that returns the number of Unicode code points within the specified text range.

###### Parameters
|Param|Description|
|---|---|
|`beginIndex`|the starting index|
|`endIndex`|the ending index|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `beginIndex` or `endIndex` is null|


**See** String.codePointCount

##### `static compareTo(String str)`

Returns a `ToIntFunction` that compares two strings lexicographically, based on the Unicode value of each character in the Strings.

###### Parameters
|Param|Description|
|---|---|
|`str`|the String to compare|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `str` is null|


**See** String.compareTo

##### `static countMatches(String searchStr)`

Returns a `ToIntFunction` that returns the number of times the specified substring occurs in the String input argument.

###### Parameters
|Param|Description|
|---|---|
|`searchStr`|the String to compare|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `searchStr` is null|


**See** String.countMatches

##### `static getLevenshteinDistance(String other)`

Returns a `ToIntFunction` that returns the Levenshtein distance between the String input argument and the specified `other` String.

###### Parameters
|Param|Description|
|---|---|
|`other`|the String to compare|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|


**See** String.getLevenshteinDistance

##### `static getLevenshteinDistance(String other, Integer threshold)`

Returns a `ToIntFunction` that returns the Levenshtein distance between the String input argument and the specified `other` String if it is less than or equal than the given threshold; otherwise, returns -1.

###### Parameters
|Param|Description|
|---|---|
|`other`|the String to compare|
|`threshold`|the threshold|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` or `threshold` is null|


**See** String.getLevenshteinDistance

##### `static indexOf(String substring)`

Returns a `ToIntFunction` that returns the index of the first occurrence of the specified `substring`. If the `substring` does not occur, this method returns -1.

###### Parameters
|Param|Description|
|---|---|
|`substring`|the String|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** String.indexOf

##### `static indexOf(String substring, Integer index)`

Returns a `ToIntFunction` that returns the index of the first occurrence of the specified `substring` from the point of the given `index`. If the `substring` does not occur, this method returns -1.

###### Parameters
|Param|Description|
|---|---|
|`substring`|the String|
|`index`|the starting position|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` or `index` is null|


**See** String.indexOf

##### `static indexOfAny(String substring)`

Returns a `ToIntFunction` that returns the zero-based index of the first occurrence of any character specified in the `substring`. If the `substring` does not occur, this method returns -1.

###### Parameters
|Param|Description|
|---|---|
|`substring`|the String|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** String.indexOfAny

##### `static indexOfAnyBut(String substring)`

Returns a `ToIntFunction` that returns the zero-based index of the first occurrence of a character that is not in the specified `substring`. Otherwise, returns -1.

###### Parameters
|Param|Description|
|---|---|
|`substring`|the String|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** String.indexOfAnyBut

##### `static indexOfChar(Integer ch)`

Returns a `ToIntFunction` that returns the index of the first occurrence of the character that corresponds to the specified character value. If the `substring` does not occur, this method returns -1.

###### Parameters
|Param|Description|
|---|---|
|`ch`|the character|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `ch` is null|


**See** String.indexOfChar

##### `static indexOfChar(Integer ch, Integer fromIndex)`

Returns a `ToIntFunction` that returns the index of the first occurrence of the character that corresponds to the specified character value, starting from the specified index.

###### Parameters
|Param|Description|
|---|---|
|`ch`|the character|
|`fromIndex`|the starting index|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `ch` or `fromIndex` is null|


**See** String.indexOfChar

##### `static indexOfDifference(String other)`

Returns a `ToIntFunction` that returns the zero-based index of the character where the String input argument begins to differ from the specified `other` String.

###### Parameters
|Param|Description|
|---|---|
|`other`|the String|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|


**See** String.indexOfDifference

##### `static indexOfIgnoreCase(String searchStr)`

Returns a `ToIntFunction` that returns the zero-based index of the first occurrence of the specified substring without regard to case. If the substring does not occur, this method returns -1.

###### Parameters
|Param|Description|
|---|---|
|`searchStr`|the String|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `searchStr` is null|


**See** String.indexOfIgnoreCase

##### `static indexOfIgnoreCase(String searchStr, Integer startPos)`

Returns a `ToIntFunction` that returns the zero-based index of the first occurrence of the specified substring without regard to case, starting from the specified index. If the substring does not occur, this method returns -1.

###### Parameters
|Param|Description|
|---|---|
|`searchStr`|the String|
|`startPos`|the starting index|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `searchStr` or `startPos` is null|


**See** String.indexOfIgnoreCase

##### `static lastIndexOf(String substring)`

Returns a `ToIntFunction` that returns the index of the last occurrence of the specified `substring`. If the `substring` does not occur, this method returns -1.

###### Parameters
|Param|Description|
|---|---|
|`substring`|the String|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` is null|


**See** String.lastIndexOf

##### `static lastIndexOf(String substring, Integer startPos)`

Returns a `ToIntFunction` that returns the index of the last occurrence of the specified `substring` from the point of the given `index`. If the `substring` does not occur, this method returns -1.

###### Parameters
|Param|Description|
|---|---|
|`substring`|the String|
|`startPos`|the starting index|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `substring` or `index` is null|


**See** String.lastIndexOf

##### `static lastIndexOfChar(Integer ch)`

Returns a `ToIntFunction` that returns the index of the last occurrence of the character that corresponds to the specified character value. If the `substring` does not occur, this method returns -1.

###### Parameters
|Param|Description|
|---|---|
|`ch`|the character|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `ch` is null|


**See** String.lastIndexOfChar

##### `static lastIndexOfChar(Integer ch, Integer fromIndex)`

Returns a `ToIntFunction` that returns the index of the last occurrence of the character that corresponds to the specified character value, starting from the specified index.

###### Parameters
|Param|Description|
|---|---|
|`ch`|the character|
|`fromIndex`|the starting index|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `ch` or `fromIndex` is null|


**See** String.lastIndexOfChar

##### `static lastIndexOfIgnoreCase(String searchStr)`

Returns a `ToIntFunction` that returns the zero-based index of the last occurrence of the specified substring without regard to case. If the substring does not occur, this method returns -1.

###### Parameters
|Param|Description|
|---|---|
|`searchStr`|the String|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `searchStr` is null|


**See** String.lastIndexOfIgnoreCase

##### `static lastIndexOfIgnoreCase(String searchStr, Integer startPos)`

Returns a `ToIntFunction` that returns the zero-based index of the last occurrence of the specified substring without regard to case, starting from the specified index. If the substring does not occur, this method returns -1.

###### Parameters
|Param|Description|
|---|---|
|`searchStr`|the String|
|`startPos`|the starting index|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `searchStr` or `startPos` is null|


**See** String.lastIndexOfIgnoreCase

##### `static length()`

Returns a `ToIntFunction` that returns the number of 16-bit Unicode characters contained in the String inout argument.

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`


**See** String.length

##### `static offsetByCodePoints(Integer index, Integer codePointOffset)`

Returns a `ToIntFunction` that returns the index of the Unicode code point that is offset by the specified number of code points, starting from the given `index`.

###### Parameters
|Param|Description|
|---|---|
|`index`|the String|
|`codePointOffset`|the number of code points|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `index` or `codePointOffset` is null|


**See** String.offsetByCodePoints

---
