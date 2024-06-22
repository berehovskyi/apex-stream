/**
 * @see StringFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage')
private class StringFunctionsTest {

    // Given
    private static final List<String> STRINGS = new List<String>{
        'publisher ', 'sustain', 'Triangle', ' activity', 'Invite', ' back ', 'Shop', 'stu mble'
    };
    private static final List<Integer> INTS = new List<Integer>{ 1, 2, 3, 4, 4, 6, -10, -3 };
    private static final List<String> DATETIMES_TO_PARSE = new List<String>{
        Datetime.newInstance(2020, 10, 14, 11, 46, 0).format(),
        Datetime.newInstance(2021, 10, 14, 11, 46, 0).format(),
        Datetime.newInstance(2022, 10, 14, 11, 46, 0).format(),
        Datetime.newInstance(2023, 10, 14, 11, 46, 0).format()
    };
    private static final List<String> DATETIMES_AS_STRINGS = new List<String>{
        '2008-10-5 12:20:20',
        '2008-10-15 12:20:20',
        '2008-12-10 12:20:20',
        '2008-20-58 12:20:20'
    };
    private static final List<String> DATES_AS_STRINGS = new List<String>{
        Date.newInstance(2020, 5, 5).format(),
        Date.newInstance(2021, 5, 5).format(),
        Date.newInstance(2022, 5, 5).format()
    };

    static {
        new StringFunctions();
    }

    /**
     * @see StringFunctions.abbreviate
     * @see StringFunctions.append
     * @see StringFunctions.capitalize
     * @see StringFunctions.center
     * @see StringFunctions.deleteWhitespace
     * @see StringFunctions.difference
     * @see StringFunctions.escapeCsv
     * @see StringFunctions.escapeEcmaScript
     * @see StringFunctions.escapeHtml3
     * @see StringFunctions.escapeHtml4
     * @see StringFunctions.escapeJava
     * @see StringFunctions.escapeSingleQuotes
     * @see StringFunctions.escapeUnicode
     * @see StringFunctions.escapeXml
     * @see StringFunctions.getChars
     * @see StringFunctions.format
     * @see StringFunctions.left
     * @see StringFunctions.leftPad
     * @see StringFunctions.mid
     * @see StringFunctions.normalizeSpace
     * @see StringFunctions.prepend
     * @see StringFunctions.remove
     * @see StringFunctions.removeEnd
     * @see StringFunctions.removeEndIgnoreCase
     * @see StringFunctions.removeStart
     * @see StringFunctions.removeStartIgnoreCase
     * @see StringFunctions.repeat
     * @see StringFunctions.replaceAll
     * @see StringFunctions.replaceFirst
     * @see StringFunctions.reverse
     * @see StringFunctions.right
     * @see StringFunctions.rightPad
     * @see StringFunctions.split
     * @see StringFunctions.splitByCharacterType
     * @see StringFunctions.splitByCharacterTypeCamelCase
     * @see StringFunctions.stripHtmlTags
     * @see StringFunctions.substring
     * @see StringFunctions.substringAfter
     * @see StringFunctions.substringAfterLast
     * @see StringFunctions.substringBefore
     * @see StringFunctions.substringBeforeLast
     * @see StringFunctions.substringBetween
     * @see StringFunctions.swapCase
     * @see StringFunctions.toLowerCase
     * @see StringFunctions.toUpperCase
     * @see StringFunctions.trim
     * @see StringFunctions.uncapitalize
     * @see StringFunctions.unescapeCsv
     * @see StringFunctions.unescapeEcmaScript
     * @see StringFunctions.unescapeHtml3
     * @see StringFunctions.unescapeHtml4
     * @see StringFunctions.unescapeJava
     * @see StringFunctions.unescapeUnicode
     * @see StringFunctions.unescapeXml
     * @see StringFunctions.stringValueOf
     * @see StringFunctions.dateValueOf
     * @see StringFunctions.datetimeValueOf
     * @see StringFunctions.datetimeValueOfGmt
     * @see StringFunctions.parseDate
     * @see StringFunctions.parseDatetime
     */
    @IsTest
    @SuppressWarnings('PMD.NcssMethodCount, PMD.ApexUnitTestClassShouldHaveRunAs')
    static void stringFunctions() {
        // Given
        List<Object> format = new List<Object>{ 'test' };
        String enUs = 'en_US';
        Integer maxWidth = 7;
        Integer offset = 2;
        String suffix = 'suffix';
        String prefix = 'prefix';
        Integer size = 1;
        String padStr = 'pad';
        String sample = 'sample';
        Integer len = 2;
        Integer pos = 2;
        String toRemove = 'a';
        String separator = 'a';
        // Then
        for (String str : STRINGS) {
            Assert.areEqual(str.abbreviate(maxWidth), StringFunctions.abbreviate(maxWidth).apply(str));
            Assert.areEqual(str.abbreviate(maxWidth, offset), StringFunctions.abbreviate(maxWidth, offset).apply(str));
            Assert.areEqual(str + suffix, StringFunctions.append(suffix).apply(str));
            Assert.areEqual(str.capitalize(), StringFunctions.capitalize().apply(str));
            Assert.areEqual(str.center(size), StringFunctions.center(size).apply(str));
            Assert.areEqual(str.center(size, padStr), StringFunctions.center(size, padStr).apply(str));
            Assert.areEqual(str.deleteWhitespace(), StringFunctions.deleteWhitespace().apply(str));
            Assert.areEqual(str.difference(sample), StringFunctions.difference(sample).apply(str));
            Assert.areEqual(str.escapeCsv(), StringFunctions.escapeCsv().apply(str));
            Assert.areEqual(str.escapeEcmaScript(), StringFunctions.escapeEcmaScript().apply(str));
            Assert.areEqual(str.escapeHtml3(), StringFunctions.escapeHtml3().apply(str));
            Assert.areEqual(str.escapeHtml4(), StringFunctions.escapeHtml4().apply(str));
            Assert.areEqual(str.escapeJava(), StringFunctions.escapeJava().apply(str));
            Assert.areEqual(String.escapeSingleQuotes(str), StringFunctions.escapeSingleQuotes().apply(str));
            Assert.areEqual(str.escapeUnicode(), StringFunctions.escapeUnicode().apply(str));
            Assert.areEqual(str.escapeXml(), StringFunctions.escapeXml().apply(str));
            Assert.areEqual(str.getChars(), StringFunctions.getChars().apply(str));
            Assert.areEqual(String.format(str, format), StringFunctions.format(format).apply(str));
            Assert.areEqual(str.left(len), StringFunctions.left(len).apply(str));
            Assert.areEqual(str.leftPad(len), StringFunctions.leftPad(len).apply(str));
            Assert.areEqual(str.leftPad(len, padStr), StringFunctions.leftPad(len, padStr).apply(str));
            Assert.areEqual(str.mid(pos, len), StringFunctions.mid(pos, len).apply(str));
            Assert.areEqual(str.normalizeSpace(), StringFunctions.normalizeSpace().apply(str));
            Assert.areEqual(prefix + str, StringFunctions.prepend(prefix).apply(str));
            Assert.areEqual(str.remove(toRemove), StringFunctions.remove(toRemove).apply(str));
            Assert.areEqual(str.removeEnd(toRemove), StringFunctions.removeEnd(toRemove).apply(str));
            Assert.areEqual(str.removeEndIgnoreCase(toRemove), StringFunctions.removeEndIgnoreCase(toRemove).apply(str));
            Assert.areEqual(str.removeStart(toRemove), StringFunctions.removeStart(toRemove).apply(str));
            Assert.areEqual(str.removeStartIgnoreCase(toRemove), StringFunctions.removeStartIgnoreCase(toRemove).apply(str));
            Assert.areEqual(str.repeat(pos), StringFunctions.repeat(pos).apply(str));
            Assert.areEqual(str.repeat(separator, pos), StringFunctions.repeat(separator, pos).apply(str));
            Assert.areEqual(str.replace(separator, sample), StringFunctions.replace(separator, sample).apply(str));
            Assert.areEqual(str.replaceAll(separator, sample), StringFunctions.replaceAll(separator, sample).apply(str));
            Assert.areEqual(str.replaceFirst(separator, sample), StringFunctions.replaceFirst(separator, sample).apply(str));
            Assert.areEqual(str.reverse(), StringFunctions.reverse().apply(str));
            Assert.areEqual(str.right(len), StringFunctions.right(len).apply(str));
            Assert.areEqual(str.rightPad(len), StringFunctions.rightPad(len).apply(str));
            Assert.areEqual(str.rightPad(len, padStr), StringFunctions.rightPad(len, padStr).apply(str));
            Assert.areEqual(str.split(padStr), StringFunctions.split(padStr).apply(str));
            Assert.areEqual(str.split(padStr, len), StringFunctions.split(padStr, len).apply(str));
            Assert.areEqual(str.splitByCharacterType(), StringFunctions.splitByCharacterType().apply(str));
            Assert.areEqual(str.splitByCharacterTypeCamelCase(), StringFunctions.splitByCharacterTypeCamelCase().apply(str));
            Assert.areEqual(str.stripHtmlTags(), StringFunctions.stripHtmlTags().apply(str));
            Assert.areEqual(str.substring(pos), StringFunctions.substring(pos).apply(str));
            Assert.areEqual(str.substring(pos, pos * 2), StringFunctions.substring(pos, pos * 2).apply(str));
            Assert.areEqual(str.substringAfter(separator), StringFunctions.substringAfter(separator).apply(str));
            Assert.areEqual(str.substringAfterLast(separator), StringFunctions.substringAfterLast(separator).apply(str));
            Assert.areEqual(str.substringBefore(separator), StringFunctions.substringBefore(separator).apply(str));
            Assert.areEqual(str.substringBeforeLast(separator), StringFunctions.substringBeforeLast(separator).apply(str));
            Assert.areEqual(str.substringBetween(separator), StringFunctions.substringBetween(separator).apply(str));
            Assert.areEqual(str.substringBetween(separator, sample), StringFunctions.substringBetween(separator, sample).apply(str));
            Assert.areEqual(str.swapCase(), StringFunctions.swapCase().apply(str));
            Assert.areEqual(str.toLowerCase(), StringFunctions.toLowerCase().apply(str));
            Assert.areEqual(str.toLowerCase(enUs), StringFunctions.toLowerCase(enUs).apply(str));
            Assert.areEqual(str.toUpperCase(), StringFunctions.toUpperCase().apply(str));
            Assert.areEqual(str.toUpperCase(enUs), StringFunctions.toUpperCase(enUs).apply(str));
            Assert.areEqual(str.trim(), StringFunctions.trim().apply(str));
            Assert.areEqual(str.uncapitalize(), StringFunctions.uncapitalize().apply(str));
            Assert.areEqual(str.unescapeCsv(), StringFunctions.unescapeCsv().apply(str));
            Assert.areEqual(str.unescapeEcmaScript(), StringFunctions.unescapeEcmaScript().apply(str));
            Assert.areEqual(str.unescapeHtml3(), StringFunctions.unescapeHtml3().apply(str));
            Assert.areEqual(str.unescapeHtml4(), StringFunctions.unescapeHtml4().apply(str));
            Assert.areEqual(str.unescapeJava(), StringFunctions.unescapeJava().apply(str));
            Assert.areEqual(str.unescapeUnicode(), StringFunctions.unescapeUnicode().apply(str));
            Assert.areEqual(str.unescapeXml(), StringFunctions.unescapeXml().apply(str));
        }
        for (Integer i : INTS) {
            Assert.areEqual(String.valueOf(i), StringFunctions.valueOf().apply(i));
        }
        for (String str : DATETIMES_AS_STRINGS) {
            Assert.areEqual(Date.valueOf(str), StringFunctions.dateValueOf().apply(str));
            Assert.areEqual(Datetime.valueOf(str), StringFunctions.datetimeValueOf().apply(str));
            Assert.areEqual(Datetime.valueOfGmt(str), StringFunctions.datetimeValueOfGmt().apply(str));
        }
        for (String str : DATES_AS_STRINGS) {
            Assert.areEqual(Date.parse(str), StringFunctions.parseDate().apply(str));
        }
        for (String str : DATETIMES_TO_PARSE) {
            Assert.areEqual(Datetime.parse(str), StringFunctions.parseDatetime().apply(str));
        }
    }

}
