/**
 * @description Provides common implementations of `String` {@link Function}
 * and related utilities.
 *
 * @see Function
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class StringFunctions {
    @TestVisible
    protected StringFunctions() {
    }

    //<editor-fold desc="String Functions">
    // @start-group String Functions
    /**
     * @description Returns a `Function` that abbreviates the string input argument,
     * of the specified `maxWidth` and with ellipses appended if the current String is longer
     * than the specified `maxWidth`, otherwise returns the original String without ellipses.
     *
     * @param maxWidth the length
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `maxWidth` is null
     *
     * @see String.abbreviate
     */
    public static Function abbreviate(final Integer maxWidth) {
        return new Abbreviate(maxWidth);
    }

    /**
     * @description Returns a `Function` that abbreviates the string input argument,
     * starting at the specified character `offset` and of the specified `maxWidth`.
     * The returned String has ellipses appended at the start and the end if characters
     * have been removed at these locations.
     *
     * @param maxWidth the length
     * @param offset the offset
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `maxWidth` or `offset` is null
     *
     * @see String.abbreviate
     */
    public static Function abbreviate(final Integer maxWidth, final Integer offset) {
        return new AbbreviateOffset(maxWidth, offset);
    }

    /**
     * @description Returns a `Function` that appends `suffix` to the string input argument.
     *
     * @param suffix the string to append
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `suffix` is null
     */
    public static Function append(final String suffix) {
        return new Append(suffix);
    }

    /**
     * @description Returns a `Function` that returns the string input argument with
     * the first letter changed to title case.
     *
     * @return the `Function`
     *
     * @see String.capitalize
     */
    public static Function capitalize() {
        return new Capitalize();
    }

    /**
     * @description Returns a `Function` that returns a version of the string input argument
     * of the specified `size` padded with spaces on the left and right,
     * so that it appears in the center. If the specified size is smaller than the current String size,
     * the entire String is returned without added spaces.
     *
     * @param size the size
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `size` is null
     *
     * @see String.center
     */
    public static Function center(final Integer size) {
        return new Center(size);
    }

    /**
     * @description Returns a `Function` that returns a version of the string input argument
     * of the specified `size` padded with the specified `padStr` on the left and right,
     * so that it appears in the center. If the specified size is smaller than the current String size,
     * the entire String is returned without padding.
     *
     * @param size the size
     * @param padStr the padding string
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `size` or `padStr` is null
     *
     * @see String.center
     */
    public static Function center(final Integer size, final String padStr) {
        return new CenterPad(size, padStr);
    }

    /**
     * @description Returns a `Function` that returns a version of the string input argument
     * with all white space characters removed.
     *
     * @return the `Function`
     *
     * @see String.deleteWhitespace
     */
    public static Function deleteWhitespace() {
        return new DeleteWhitespace();
    }

    /**
     * @description Returns a `Function` that returns the difference between
     * the string input argument and the specified `str`.
     *
     * @param str the string to compare
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `str` is null
     *
     * @see String.difference
     */
    public static Function difference(final String str) {
        return new Difference(str);
    }

    /**
     * @description Returns a `Function` that returns a String for a CSV
     * column enclosed in Double quotes, if required.
     *
     * @return the `Function`
     *
     * @see String.escapeCsv
     */
    public static Function escapeCsv() {
        return new EscapeCsv();
    }

    /**
     * @description Returns a `Function` that escapes the characters in the string input argument
     * using EcmaScript String rules.
     *
     * @return the `Function`
     *
     * @see String.escapeEcmaScript
     */
    public static Function escapeEcmaScript() {
        return new EscapeEcmaScript();
    }

    /**
     * @description Returns a `Function` that escapes the characters in the string input argument
     * using HTML 3.0 entities.
     *
     * @return the `Function`
     *
     * @see String.escapeHtml3
     */
    public static Function escapeHtml3() {
        return new EscapeHtml3();
    }

    /**
     * @description Returns a `Function` that escapes the characters in the string input argument
     * using HTML 3.0 entities.
     *
     * @return the `Function`
     *
     * @see String.escapeHtml4
     */
    public static Function escapeHtml4() {
        return new EscapeHtml4();
    }

    /**
     * @description Returns a `Function` that escapes the characters in the string input argument
     * using using Java String rules. Characters escaped include quotes and control characters,
     * such as tab, backslash, and carriage return characters.
     *
     * @return the `Function`
     *
     * @see String.escapeJava
     */
    public static Function escapeJava() {
        return new EscapeJava();
    }

    /**
     * @description Returns a `Function` that return a String with the escape character (\)
     * added before any single quotation marks in the string input argument.
     *
     * @return the `Function`
     *
     * @see String.escapeSingleQuotes
     */
    public static Function escapeSingleQuotes() {
        return new EscapeSingleQuotes();
    }

    /**
     * @description Returns a `Function` that returns a String whose Unicode characters
     * are escaped to a Unicode escape sequence.
     *
     * @return the `Function`
     *
     * @see String.escapeUnicode
     */
    public static Function escapeUnicode() {
        return new EscapeUnicode();
    }

    /**
     * @description Returns a `Function` that escapes the characters in the string input argument
     * using XML entities.
     *
     * @return the `Function`
     *
     * @see String.escapeXml
     */
    public static Function escapeXml() {
        return new EscapeXml();
    }

    /**
     * @description Returns a `Function` that treats the string input argument as a pattern and
     * returns a string using the `arguments` for substitution and formatting.
     *
     * @param arguments the objects for substitution
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `arguments` is null
     *
     * @see String.format
     */
    public static Function format(final List<Object> arguments) {
        return new StringFormat(arguments);
    }

    /**
     * @description Returns a `Function` that returns an array of character values
     * that represent the characters in the string input argument.
     *
     * @return the `Function`
     *
     * @see String.getChars
     */
    public static Function getChars() {
        return new GetChars();
    }

    /**
     * @description Returns a `Function` that returns the leftmost characters of
     * the string input argument of the specified `length`.
     *
     * @param length the length
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `length` is null
     *
     * @see String.left
     */
    public static Function left(final Integer length) {
        return new Left(length);
    }

    /**
     * @description Returns a `Function` that returns the string input argument
     * padded with spaces on the left and of the specified `length`.
     *
     * @param length the length
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `length` is null
     *
     * @see String.leftPad
     */
    public static Function leftPad(final Integer length) {
        return new LeftPad(length);
    }

    /**
     * @description Returns a `Function` that returns the string input argument
     * padded with `padStr` on the left and of the specified `length`.
     *
     * @param length the length
     * @param padStr the padding string
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `length` or `padStr` is null
     *
     * @see String.leftPad
     */
    public static Function leftPad(final Integer length, final String padStr) {
        return new LeftPadPad(length, padStr);
    }

    /**
     * @description Returns a `Function` that returns a new String that begins
     * with the character at the specified zero-based `startIndex` with the number
     * of characters specified by `length`.
     *
     * @param startIndex the start index
     * @param length the length
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `startIndex` or `length` is null
     *
     * @see String.mid
     */
    public static Function mid(final Integer startIndex, final Integer length) {
        return new Mid(startIndex, length);
    }

    /**
     * @description Returns a `Function` that returns the string input argument
     * with leading, trailing, and repeating white space characters removed.
     *
     * @return the `Function`
     *
     * @see String.normalizeSpace
     */
    public static Function normalizeSpace() {
        return new NormalizeSpace();
    }

    /**
     * @description Returns a `Function` that prepends `prefix` to the string input argument.
     *
     * @param prefix the string to prepend
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `prefix` is null
     */
    public static Function prepend(final String prefix) {
        return new Prepend(prefix);
    }

    /**
     * @description Returns a `Function` that removes all occurrences of the specified
     * `substring` and returns the String result.
     *
     * @param substring the string to remove
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `substring` is null
     *
     * @see String.remove
     */
    public static Function remove(final String substring) {
        return new Remove(substring);
    }

    /**
     * @description Returns a `Function` that removes the specified
     * `substring` only if it occurs at the end of the String.
     *
     * @param substring the string to remove
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `substring` is null
     *
     * @see String.removeEnd
     */
    public static Function removeEnd(final String substring) {
        return new RemoveEnd(substring);
    }

    /**
     * @description Returns a `Function` that removes the specified
     * `substring` only if it occurs at the end of the String using a case-insensitive match.
     *
     * @param substring the string to remove
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `substring` is null
     *
     * @see String.removeEndIgnoreCase
     */
    public static Function removeEndIgnoreCase(final String substring) {
        return new RemoveEndIgnoreCase(substring);
    }

    /**
     * @description Returns a `Function` that removes the specified
     * `substring` only if it occurs at the beginning of the String.
     *
     * @param substring the string to remove
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `substring` is null
     *
     * @see String.removeStart
     */
    public static Function removeStart(final String substring) {
        return new RemoveStart(substring);
    }

    /**
     * @description Returns a `Function` that removes the specified
     * `substring` only if it occurs at the beginning of the String using a case-insensitive match.
     *
     * @param substring the string to remove
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `substring` is null
     *
     * @see String.removeStartIgnoreCase
     */
    public static Function removeStartIgnoreCase(final String substring) {
        return new RemoveStartIgnoreCase(substring);
    }

    /**
     * @description Returns a `Function` that returns the string input argument
     * repeated the specified number of times.
     *
     * @param numTimes the number of times to repeat
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `numTimes` is null
     *
     * @see String.repeat
     */
    public static Function repeat(final Integer numTimes) {
        return new Repeat(numTimes);
    }

    /**
     * @description Returns a `Function` that returns the string input argument
     * repeated the specified `numTimes` using the specified `separator`
     * to separate the repeated Strings.
     *
     * @param separator the separator
     * @param numTimes the number of times to repeat
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `separator` or `numTimes` is null
     *
     * @see String.repeat
     */
    public static Function repeat(final String separator, final Integer numTimes) {
        return new RepeatSeparator(separator, numTimes);
    }

    /**
     * @description Returns a `Function` that replaces each substring of the string input argument
     * that matches the literal `target` sequence with the specified
     * literal `replacement` sequence.
     *
     * @param target the target
     * @param replacement the replacement sequence
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `target` or `replacement` is null
     *
     * @see String.replace
     */
    public static Function replace(final String target, final String replacement) {
        return new Replace(target, replacement);
    }

    /**
     * @description Returns a `Function` that replaces each substring of the string input argument
     * that matches the regular expression `regExp` with the `replacement` sequence.
     *
     * @param regExp the regular expression
     * @param replacement the replacement sequence
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `regExp` or `replacement` is null
     *
     * @see String.replaceAll
     */
    public static Function replaceAll(final String regExp, final String replacement) {
        return new ReplaceAll(regExp, replacement);
    }

    /**
     * @description Returns a `Function` that replaces the first substring of the string input argument
     * that matches the regular expression `regExp` with the `replacement` sequence.
     *
     * @param regExp the regular expression
     * @param replacement the replacement sequence
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `regExp` or `replacement` is null
     *
     * @see String.replaceAll
     */
    public static Function replaceFirst(final String regExp, final String replacement) {
        return new ReplaceFirst(regExp, replacement);
    }

    /**
     * @description Returns a `Function` that returns a String with all the characters reversed.
     *
     * @return the `Function`
     *
     * @see String.reverse
     */
    public static Function reverse() {
        return new Reverse();
    }

    /**
     * @description Returns a `Function` that returns the rightmost characters of
     * the string input argument of the specified `length`.
     *
     * @param length the length
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `length` is null
     *
     * @see String.right
     */
    public static Function right(final Integer length) {
        return new Right(length);
    }

    /**
     * @description Returns a `Function` that returns the string input argument
     * padded with spaces on the right and of the specified `length`.
     *
     * @param length the length
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `length` is null
     *
     * @see String.rightPad
     */
    public static Function rightPad(final Integer length) {
        return new RightPad(length);
    }

    /**
     * @description Returns a `Function` that returns the string input argument
     * padded with `padStr` on the right and of the specified `length`.
     *
     * @param length the length
     * @param padStr the padding string
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `length` or `padStr` is null
     *
     * @see String.rightPad
     */
    public static Function rightPad(final Integer length, final String padStr) {
        return new RightPadPad(length, padStr);
    }

    /**
     * @description Returns a `Function` that returns a list that contains each substring
     * of the string input argument that is terminated by either the regular expression `regExp`
     * or the end.
     *
     * @param regExp the regular expression
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `regExp` is null
     *
     * @see String.split
     */
    public static Function split(final String regExp) {
        return new Split(regExp);
    }

    /**
     * @description Returns a `Function` that returns a list that contains each substring
     * of the string input argument that is terminated by either the regular expression `regExp`
     * or `lim`.
     *
     * @param regExp the regular expression
     * @param lim the limit
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `regExp` or `lim` is null
     *
     * @see String.split
     */
    public static Function split(final String regExp, final Integer lim) {
        return new SplitLim(regExp, lim);
    }

    /**
     * @description Returns a `Function` that splits the string input argument
     * by character type and returns a list of contiguous character groups of the same type
     * as complete tokens.
     *
     * @return the `Function`
     *
     * @see String.splitByCharacterType
     */
    public static Function splitByCharacterType() {
        return new SplitByCharacterType();
    }

    /**
     * @description Returns a `Function` that splits the string input argument
     * by character type and returns a list of contiguous character groups of the same type
     * as complete tokens, with the following exception: the uppercase character, if any,
     * immediately preceding a lowercase character token belongs to the following character
     * token rather than to the preceding.
     *
     * @return the `Function`
     *
     * @see String.splitByCharacterTypeCamelCase
     */
    public static Function splitByCharacterTypeCamelCase() {
        return new SplitByCharacterTypeCamelCase();
    }

    /**
     * @description Returns a `Function` that removes HTML markup and returns plain text.
     *
     * @return the `Function`
     *
     * @see String.stripHtmlTags
     */
    public static Function stripHtmlTags() {
        return new StripHtmlTags();
    }

    /**
     * @description Returns a `Function` that returns a new String that begins with
     * the character at the specified zero-based `startIndex` and extends to the end
     * of the string input argument.
     *
     * @param startIndex the start index
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `startIndex` is null
     *
     * @see String.substring
     */
    public static Function substring(final Integer startIndex) {
        return new Substring(startIndex);
    }

    /**
     * @description Returns a `Function` that returns a new String that begins with
     * the character at the specified zero-based `startIndex` and extends to the character
     * at `endIndex` - 1.
     *
     * @param startIndex the start index
     * @param endIndex the end index
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `startIndex` or `endIndex` is null
     *
     * @see String.substring
     */
    public static Function substring(final Integer startIndex, final Integer endIndex) {
        return new SubstringEndIndex(startIndex, endIndex);
    }

    /**
     * @description Returns a `Function` that returns the substring that occurs
     * after the first occurrence of the specified `separator`.
     *
     * @param separator the separator
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `separator` is null
     *
     * @see String.substringAfter
     */
    public static Function substringAfter(final String separator) {
        return new SubstringAfter(separator);
    }

    /**
     * @description Returns a `Function` that returns the substring that occurs
     * after the last occurrence of the specified `separator`.
     *
     * @param separator the separator
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `separator` is null
     *
     * @see String.substringAfterLast
     */
    public static Function substringAfterLast(final String separator) {
        return new SubstringAfterLast(separator);
    }

    /**
     * @description Returns a `Function` that returns the substring that occurs
     * before the first occurrence of the specified `separator`.
     *
     * @param separator the separator
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `separator` is null
     *
     * @see String.substringBefore
     */
    public static Function substringBefore(final String separator) {
        return new SubstringBefore(separator);
    }

    /**
     * @description Returns a `Function` that returns the substring that occurs
     * before the last occurrence of the specified `separator`.
     *
     * @param separator the separator
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `separator` is null
     *
     * @see String.substringBeforeLast
     */
    public static Function substringBeforeLast(final String separator) {
        return new SubstringBeforeLast(separator);
    }

    /**
     * @description Returns a `Function` that returns the substring that occurs between
     * two instances of the specified `tag` String.
     *
     * @param tag the tag
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `tag` is null
     *
     * @see String.substringBetween
     */
    public static Function substringBetween(final String tag) {
        return new SubstringBetween(tag);
    }

    /**
     * @description Returns a `Function` that returns the substring that occurs between
     * the two specified Strings.
     *
     * @param open the start string
     * @param close the end string
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `open` or `close` is null
     *
     * @see String.substringBetween
     */
    public static Function substringBetween(final String open, final String close) {
        return new SubstringBetweenOpenClose(open, close);
    }

    /**
     * @description Returns a `Function` that swaps the case of all characters and returns
     * the resulting String by using the default (English US) locale.
     *
     * @return the `Function`
     *
     * @see String.swapCase
     */
    public static Function swapCase() {
        return new SwapCase();
    }

    /**
     * @description Returns a `Function` that converts all of the characters in the string input argument
     * to lowercase using the rules of the default (English US) locale.
     *
     * @return the `Function`
     *
     * @see String.toLowerCase
     */
    public static Function toLowerCase() {
        return new ToLowerCase();
    }

    /**
     * @description Returns a `Function` that converts all of the characters in the string input argument
     * to lowercase using the rules of the specified `locale`.
     *
     * @param locale the locale
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `locale` is null
     *
     * @see String.toLowerCase
     */
    public static Function toLowerCase(final String locale) {
        return new ToLowerCaseLocale(locale);
    }

    /**
     * @description Returns a `Function` that converts all of the characters in the string input argument
     * to uppercase using the rules of the default (English US) locale.
     *
     * @return the `Function`
     *
     * @see String.toUpperCase
     */
    public static Function toUpperCase() {
        return new ToUpperCase();
    }

    /**
     * @description Returns a `Function` that converts all of the characters in the string input argument
     * to uppercase using the rules of the specified `locale`.
     *
     * @param locale the locale
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `locale` is null
     *
     * @see String.toUpperCase
     */
    public static Function toUpperCase(final String locale) {
        return new ToUpperCaseLocale(locale);
    }

    /**
     * @description Returns a `Function` that returns a copy of the string that no longer contains
     * any leading or trailing white space characters.
     *
     * @return the `Function`
     *
     * @see String.trim
     */
    public static Function trim() {
        return new Trim();
    }

    /**
     * @description Returns a `Function` that returns the string input argument
     * with the first letter in lowercase.
     *
     * @return the `Function`
     *
     * @see String.uncapitalize
     */
    public static Function uncapitalize() {
        return new Uncapitalize();
    }

    /**
     * @description Returns a `Function` that returns a String representing an unescaped CSV column.
     *
     * @return the `Function`
     *
     * @see String.unescapeCsv
     */
    public static Function unescapeCsv() {
        return new UnescapeCsv();
    }

    /**
     * @description Returns a `Function` that unescapes any EcmaScript literals found in the String.
     *
     * @return the `Function`
     *
     * @see String.unescapeEcmaScript
     */
    public static Function unescapeEcmaScript() {
        return new UnescapeEcmaScript();
    }

    /**
     * @description Returns a `Function` that unescapes the characters in the string input argument
     * using HTML 3.0 entities.
     *
     * @return the `Function`
     *
     * @see String.unescapeHtml3
     */
    public static Function unescapeHtml3() {
        return new UnescapeHtml3();
    }

    /**
     * @description Returns a `Function` that unescapes the characters in the string input argument
     * using HTML 4.0 entities.
     *
     * @return the `Function`
     *
     * @see String.unescapeHtml4
     */
    public static Function unescapeHtml4() {
        return new UnescapeHtml4();
    }

    /**
     * @description Returns a `Function` that returns a String whose Java literals are unescaped.
     * Literals unescaped include escape sequences for quotes (\\") and control characters,
     * such as tab (\\t), and carriage return (\\n).
     *
     * @return the `Function`
     *
     * @see String.unescapeJava
     */
    public static Function unescapeJava() {
        return new UnescapeJava();
    }

    /**
     * @description Returns a `Function` that returns a String whose escaped
     * Unicode characters are unescaped.
     *
     * @return the `Function`
     *
     * @see String.unescapeUnicode
     */
    public static Function unescapeUnicode() {
        return new UnescapeUnicode();
    }

    /**
     * @description Returns a `Function` that unescapes the characters in a String using XML entities.
     *
     * @return the `Function`
     *
     * @see String.unescapeXml
     */
    public static Function unescapeXml() {
        return new UnescapeXml();
    }

    /**
     * @description Returns a `Function` that returns a string representation of the string input argument.
     *
     * @return the `Function`
     *
     * @see String.valueOf
     */
    public static Function valueOf() {
        return new StringValueOf();
    }

    /**
     * @description Returns a `Function` that returns a date representation of the string input argument.
     *
     * @return the `Function`
     *
     * @see Date.valueOf
     */
    public static Function dateValueOf() {
        return new DateValueOf();
    }

    /**
     * @description Returns a `Function` that returns a datetime representation of the string input argument.
     *
     * @return the `Function`
     *
     * @see Datetime.valueOf
     */
    public static Function datetimeValueOf() {
        return new DatetimeValueOf();
    }

    /**
     * @description Returns a `Function` that returns a datetime representation of the string input argument
     * in GMT format 'yyyy-MM-dd HH:mm:ss' in the local time zone.
     *
     * @return the `Function`
     *
     * @see Datetime.valueOfGmt
     */
    public static Function datetimeValueOfGmt() {
        return new DatetimeValueOfGmt();
    }

    /**
     * @description Returns a `Function` that returns a Date from the string input argument
     * in the local time zone and in the format of the user locale.
     *
     * @return the `Function`
     *
     * @see Date.parse
     */
    public static Function parseDate() {
        return new ParseDate();
    }

    /**
     * @description Returns a `Function` that returns a Datetime from the string input argument
     * in the local time zone and in the format of the user locale.
     *
     * @return the `Function`
     *
     * @see Datetime.parse
     */
    public static Function parseDatetime() {
        return new ParseDatetime();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Abbreviate extends Function {
        private final Integer maxWidth;
        // prettier-ignore
        private Abbreviate(Integer maxWidth) { AfSupport.notNull(maxWidth); this.maxWidth = maxWidth; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).abbreviate(maxWidth); }
    }

    private class AbbreviateOffset extends Function {
        private final Integer maxWidth;
        private final Integer offset;
        // prettier-ignore
        private AbbreviateOffset(Integer maxWidth, Integer offset) {
            AfSupport.notNull(maxWidth); AfSupport.notNull(offset); this.maxWidth = maxWidth; this.offset = offset;
        }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).abbreviate(maxWidth, offset); }
    }

    private class Append extends Function {
        private final String suffix;
        // prettier-ignore
        private Append(String suffix) { AfSupport.notNull(suffix); this.suffix = suffix; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o) + suffix; }
    }

    private class Capitalize extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).capitalize(); }
    }

    private class Center extends Function {
        private final Integer size;
        // prettier-ignore
        private Center(Integer size) { AfSupport.notNull(size); this.size = size; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).center(size); }
    }

    private class CenterPad extends Function {
        private final Integer size;
        private final String padStr;
        // prettier-ignore
        private CenterPad(Integer size, String padStr) {
            AfSupport.notNull(size); AfSupport.notNull(padStr); this.size = size; this.padStr = padStr;
        }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).center(size, padStr); }
    }

    private class DeleteWhitespace extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).deleteWhitespace(); }
    }

    private class Difference extends Function {
        private final String str;
        // prettier-ignore
        private Difference(String str) { AfSupport.notNull(str); this.str = str; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).difference(str); }
    }

    private class EscapeCsv extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).escapeCsv(); }
    }

    private class EscapeEcmaScript extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).escapeEcmaScript(); }
    }

    private class EscapeHtml3 extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).escapeHtml3(); }
    }

    private class EscapeHtml4 extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).escapeHtml4(); }
    }

    private class EscapeJava extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).escapeJava(); }
    }

    private class EscapeSingleQuotes extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return String.escapeSingleQuotes((String) o); }
    }

    private class EscapeUnicode extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).escapeUnicode(); }
    }

    private class EscapeXml extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).escapeXml(); }
    }

    private class StringFormat extends Function {
        private final List<Object> arguments;
        // prettier-ignore
        private StringFormat(List<Object> arguments) { AfSupport.notNull(arguments); this.arguments = arguments; }
        // prettier-ignore
        public override Object apply(Object o) { return String.format((String) o, arguments); }
    }

    private class GetChars extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).getChars(); }
    }

    private class Left extends Function {
        private final Integer len;
        // prettier-ignore
        private Left(Integer len) { AfSupport.notNull(len); this.len = len; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).left(len); }
    }

    private class LeftPad extends Function {
        private final Integer len;
        // prettier-ignore
        private LeftPad(Integer len) { AfSupport.notNull(len); this.len = len; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).leftPad(len); }
    }

    private class LeftPadPad extends Function {
        private final Integer len;
        private final String padStr;
        // prettier-ignore
        private LeftPadPad(Integer len, String padStr) {
            AfSupport.notNull(len); AfSupport.notNull(padStr); this.len = len; this.padStr = padStr;
        }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).leftPad(len, padStr); }
    }

    private class Mid extends Function {
        private final Integer pos;
        private final Integer len;
        // prettier-ignore
        private Mid(Integer pos, Integer len) {
            AfSupport.notNull(pos); AfSupport.notNull(len); this.pos = pos; this.len = len;
        }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).mid(pos, len); }
    }

    private class NormalizeSpace extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).normalizeSpace(); }
    }

    private class Prepend extends Function {
        private final String prefix;
        // prettier-ignore
        private Prepend(String prefix) { AfSupport.notNull(prefix); this.prefix = prefix; }
        // prettier-ignore
        public override Object apply(Object o) { return prefix + ((String) o); }
    }

    private class Remove extends Function {
        private final String toRemove;
        // prettier-ignore
        private Remove(String toRemove) { AfSupport.notNull(toRemove); this.toRemove = toRemove; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).remove(toRemove); }
    }

    private class RemoveEnd extends Function {
        private final String toRemove;
        // prettier-ignore
        private RemoveEnd(String toRemove) { AfSupport.notNull(toRemove); this.toRemove = toRemove; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).removeEnd(toRemove); }
    }

    private class RemoveEndIgnoreCase extends Function {
        private final String toRemove;
        // prettier-ignore
        private RemoveEndIgnoreCase(String toRemove) { AfSupport.notNull(toRemove); this.toRemove = toRemove; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).removeEndIgnoreCase(toRemove); }
    }

    private class RemoveStart extends Function {
        private final String toRemove;
        // prettier-ignore
        private RemoveStart(String toRemove) { AfSupport.notNull(toRemove); this.toRemove = toRemove; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).removeStart(toRemove); }
    }

    private class RemoveStartIgnoreCase extends Function {
        private final String toRemove;
        // prettier-ignore
        private RemoveStartIgnoreCase(String toRemove) { AfSupport.notNull(toRemove); this.toRemove = toRemove; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).removeStartIgnoreCase(toRemove); }
    }

    private class Repeat extends Function {
        private final Integer numTimes;
        // prettier-ignore
        private Repeat(Integer numTimes) { AfSupport.notNull(numTimes); this.numTimes = numTimes; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).repeat(numTimes); }
    }

    private class RepeatSeparator extends Function {
        private final String separator;
        private final Integer numTimes;
        // prettier-ignore
        private RepeatSeparator(String separator, Integer numTimes) {
            AfSupport.notNull(separator); AfSupport.notNull(numTimes);
            this.separator = separator; this.numTimes = numTimes;
        }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).repeat(separator, numTimes); }
    }

    private class Replace extends Function {
        private final String target;
        private final String replacement;
        // prettier-ignore
        private Replace(String target, String replacement) {
            AfSupport.notNull(target); AfSupport.notNull(replacement);
            this.target = target; this.replacement = replacement;
        }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).replace(target, replacement); }
    }

    private class ReplaceAll extends Function {
        private final String regex;
        private final String replacement;
        // prettier-ignore
        private ReplaceAll(String regex, String replacement) {
            AfSupport.notNull(regex); AfSupport.notNull(replacement);
            this.regex = regex; this.replacement = replacement;
        }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).replaceAll(regex, replacement); }
    }

    private class ReplaceFirst extends Function {
        private final String regex;
        private final String replacement;
        // prettier-ignore
        private ReplaceFirst(String regex, String replacement) {
            AfSupport.notNull(regex); AfSupport.notNull(replacement);
            this.regex = regex; this.replacement = replacement;
        }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).replaceFirst(regex, replacement); }
    }

    private class Reverse extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).reverse(); }
    }

    private class Right extends Function {
        private final Integer len;
        // prettier-ignore
        private Right(Integer len) { AfSupport.notNull(len); this.len = len; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).right(len); }
    }

    private class RightPad extends Function {
        private final Integer len;
        // prettier-ignore
        private RightPad(Integer len) { AfSupport.notNull(len); this.len = len; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).rightPad(len); }
    }

    private class RightPadPad extends Function {
        private final Integer len;
        private final String padStr;
        // prettier-ignore
        private RightPadPad(Integer len, String padStr) {
            AfSupport.notNull(len); AfSupport.notNull(padStr); this.len = len; this.padStr = padStr;
        }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).rightPad(len, padStr); }
    }

    private class Split extends Function {
        private final String regex;
        // prettier-ignore
        private Split(String regex) { AfSupport.notNull(regex); this.regex = regex; }
        // prettier-ignore
        public override Object apply(Object o) { return((String) o).split(regex); }
    }

    private class SplitLim extends Function {
        private final String regex;
        private final Integer lim;
        // prettier-ignore
        private SplitLim(String regex, Integer lim) {
            AfSupport.notNull(regex); AfSupport.notNull(lim); this.regex = regex; this.lim = lim;
        }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).split(regex, lim); }
    }

    private class SplitByCharacterType extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).splitByCharacterType(); }
    }

    private class SplitByCharacterTypeCamelCase extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).splitByCharacterTypeCamelCase(); }
    }

    private class StripHtmlTags extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).stripHtmlTags(); }
    }

    private class Substring extends Function {
        private final Integer startIndex;
        // prettier-ignore
        private Substring(Integer start) { AfSupport.notNull(start); this.startIndex = start; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).substring(startIndex); }
    }

    private class SubstringEndIndex extends Function {
        private final Integer startIndex;
        private final Integer endIndex;
        private SubstringEndIndex(Integer startIndex, Integer endIndex) {
            AfSupport.notNull(startIndex);
            AfSupport.notNull(endIndex);
            this.startIndex = startIndex;
            this.endIndex = endIndex;
        }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).substring(startIndex, endIndex); }
    }

    private class SubstringAfter extends Function {
        private final String separator;
        // prettier-ignore
        private SubstringAfter(String separator) { AfSupport.notNull(separator); this.separator = separator; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).substringAfter(separator); }
    }

    private class SubstringAfterLast extends Function {
        private final String separator;
        // prettier-ignore
        private SubstringAfterLast(String separator) { AfSupport.notNull(separator); this.separator = separator; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).substringAfterLast(separator); }
    }

    private class SubstringBefore extends Function {
        private final String separator;
        // prettier-ignore
        private SubstringBefore(String separator) { AfSupport.notNull(separator); this.separator = separator; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).substringBefore(separator); }
    }

    private class SubstringBeforeLast extends Function {
        private final String separator;
        // prettier-ignore
        private SubstringBeforeLast(String separator) { AfSupport.notNull(separator); this.separator = separator; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).substringBeforeLast(separator); }
    }

    private class SubstringBetween extends Function {
        private final String tag;
        // prettier-ignore
        private SubstringBetween(String tag) { AfSupport.notNull(tag); this.tag = tag; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).substringBetween(tag); }
    }

    private class SubstringBetweenOpenClose extends Function {
        private final String open;
        private final String close;
        // prettier-ignore
        private SubstringBetweenOpenClose(String open, String close) {
            AfSupport.notNull(open); AfSupport.notNull(close); this.open = open; this.close = close;
        }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).substringBetween(open, close); }
    }

    private class SwapCase extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).swapCase(); }
    }

    private class ToLowerCase extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).toLowerCase(); }
    }

    private class ToLowerCaseLocale extends Function {
        private final String locale;
        // prettier-ignore
        private ToLowerCaseLocale(String locale) { AfSupport.notNull(locale); this.locale = locale; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).toLowerCase(locale); }
    }

    private class ToUpperCase extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).toUpperCase(); }
    }

    private class ToUpperCaseLocale extends Function {
        private final String locale;
        // prettier-ignore
        private ToUpperCaseLocale(String locale) { AfSupport.notNull(locale); this.locale = locale; }
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).toUpperCase(locale); }
    }

    private class Trim extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).trim(); }
    }

    private class Uncapitalize extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).uncapitalize(); }
    }

    private class UnescapeCsv extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).unescapeCsv(); }
    }

    private class UnescapeEcmaScript extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).unescapeEcmaScript(); }
    }

    private class UnescapeHtml3 extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).unescapeHtml3(); }
    }

    private class UnescapeHtml4 extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).unescapeHtml4(); }
    }

    private class UnescapeJava extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).unescapeJava(); }
    }

    private class UnescapeUnicode extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).unescapeUnicode(); }
    }

    private class UnescapeXml extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return ((String) o).unescapeXml(); }
    }

    private class StringValueOf extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return String.valueOf(o); }
    }

    private class DateValueOf extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return Date.valueOf((String) o); }
    }

    private class DatetimeValueOf extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return Datetime.valueOf((String) o); }
    }

    private class DatetimeValueOfGmt extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return Datetime.valueOfGmt((String) o); }
    }

    private class ParseDate extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return Date.parse((String) o); }
    }

    private class ParseDatetime extends Function {
        // prettier-ignore
        public override Object apply(Object o) { return Datetime.parse((String) o); }
    }
    // @end-group
    //</editor-fold>
}
