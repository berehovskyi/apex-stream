/**
 * @see StringFunctions
 * @see DateFunctions
 * @see DatetimeFunctions
 * @see TimeFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class FunctionsTest {

    // Given
    private static final List<String> STRINGS = new List<String>{
            'publisher ', 'sustain', 'Triangle', ' activity', 'Invite', ' back ', 'Shop', 'stu mble'
    };
    private static final List<Integer> INTS = new List<Integer>{ 1, 2, 3, 4, 4, 6, -10, -3 };
    private static final List<Date> DATES = new List<Date>{
            Date.newInstance(2020, 2, 2),
            Date.today(),
            Date.today().addDays(1),
            Date.today().addDays(-1)
    };
    private static final List<Datetime> DATETIMES = new List<Datetime>{
            Datetime.newInstance(2020, 2, 2),
            Datetime.now(),
            Datetime.now().addDays(1),
            Datetime.now().addDays(-1)
    };
    private static final List<Time> TIMES = new List<Time>{
            Time.newInstance(10, 10, 10, 10),
            Time.newInstance(11, 11, 11, 11),
            Time.newInstance(12, 12, 12, 12),
            Time.newInstance(13, 13, 13, 13)
    };
    private static final List<String> DATETIMES_AS_STRINGS = new List<String>{
            '2008-10-5 12:20:20',
            '2008-10-15 12:20:20',
            '2008-12-10 12:20:20',
            '2008-20-58 12:20:20'
    };
    private static final List<String> DATETIMES_TO_PARSE = new List<String>{
            '10/14/2020, 11:46 AM',
            '10/14/2021, 11:46 AM',
            '10/14/2022, 11:46 AM',
            '10/14/2023, 11:46 AM'
    };
    private static final List<String> DATES_AS_STRINGS = new List<String>{
            '05/05/2020',
            '05/05/2021',
            '05/05/2022'
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
            Validate.assertEquals(str.abbreviate(maxWidth), StringFunctions.abbreviate(maxWidth).apply(str));
            Validate.assertEquals(str.abbreviate(maxWidth, offset), StringFunctions.abbreviate(maxWidth, offset).apply(str));
            Validate.assertEquals(str + suffix, StringFunctions.append(suffix).apply(str));
            Validate.assertEquals(str.capitalize(), StringFunctions.capitalize().apply(str));
            Validate.assertEquals(str.center(size), StringFunctions.center(size).apply(str));
            Validate.assertEquals(str.center(size, padStr), StringFunctions.center(size, padStr).apply(str));
            Validate.assertEquals(str.deleteWhitespace(), StringFunctions.deleteWhitespace().apply(str));
            Validate.assertEquals(str.difference(sample), StringFunctions.difference(sample).apply(str));
            Validate.assertEquals(str.escapeCsv(), StringFunctions.escapeCsv().apply(str));
            Validate.assertEquals(str.escapeEcmaScript(), StringFunctions.escapeEcmaScript().apply(str));
            Validate.assertEquals(str.escapeHtml3(), StringFunctions.escapeHtml3().apply(str));
            Validate.assertEquals(str.escapeHtml4(), StringFunctions.escapeHtml4().apply(str));
            Validate.assertEquals(str.escapeJava(), StringFunctions.escapeJava().apply(str));
            Validate.assertEquals(String.escapeSingleQuotes(str), StringFunctions.escapeSingleQuotes().apply(str));
            Validate.assertEquals(str.escapeUnicode(), StringFunctions.escapeUnicode().apply(str));
            Validate.assertEquals(str.escapeXml(), StringFunctions.escapeXml().apply(str));
            Validate.assertEquals(str.getChars(), StringFunctions.getChars().apply(str));
            Validate.assertEquals(String.format(str, format), StringFunctions.format(format).apply(str));
            Validate.assertEquals(str.left(len), StringFunctions.left(len).apply(str));
            Validate.assertEquals(str.leftPad(len), StringFunctions.leftPad(len).apply(str));
            Validate.assertEquals(str.leftPad(len, padStr), StringFunctions.leftPad(len, padStr).apply(str));
            Validate.assertEquals(str.mid(pos, len), StringFunctions.mid(pos, len).apply(str));
            Validate.assertEquals(str.normalizeSpace(), StringFunctions.normalizeSpace().apply(str));
            Validate.assertEquals(prefix + str, StringFunctions.prepend(prefix).apply(str));
            Validate.assertEquals(str.remove(toRemove), StringFunctions.remove(toRemove).apply(str));
            Validate.assertEquals(str.removeEnd(toRemove), StringFunctions.removeEnd(toRemove).apply(str));
            Validate.assertEquals(str.removeEndIgnoreCase(toRemove), StringFunctions.removeEndIgnoreCase(toRemove).apply(str));
            Validate.assertEquals(str.removeStart(toRemove), StringFunctions.removeStart(toRemove).apply(str));
            Validate.assertEquals(str.removeStartIgnoreCase(toRemove), StringFunctions.removeStartIgnoreCase(toRemove).apply(str));
            Validate.assertEquals(str.repeat(pos), StringFunctions.repeat(pos).apply(str));
            Validate.assertEquals(str.repeat(separator, pos), StringFunctions.repeat(separator, pos).apply(str));
            Validate.assertEquals(str.replace(separator, sample), StringFunctions.replace(separator, sample).apply(str));
            Validate.assertEquals(str.replaceAll(separator, sample), StringFunctions.replaceAll(separator, sample).apply(str));
            Validate.assertEquals(str.replaceFirst(separator, sample), StringFunctions.replaceFirst(separator, sample).apply(str));
            Validate.assertEquals(str.reverse(), StringFunctions.reverse().apply(str));
            Validate.assertEquals(str.right(len), StringFunctions.right(len).apply(str));
            Validate.assertEquals(str.rightPad(len), StringFunctions.rightPad(len).apply(str));
            Validate.assertEquals(str.rightPad(len, padStr), StringFunctions.rightPad(len, padStr).apply(str));
            Validate.assertEquals(str.split(padStr), StringFunctions.split(padStr).apply(str));
            Validate.assertEquals(str.split(padStr, len), StringFunctions.split(padStr, len).apply(str));
            Validate.assertEquals(str.splitByCharacterType(), StringFunctions.splitByCharacterType().apply(str));
            Validate.assertEquals(str.splitByCharacterTypeCamelCase(), StringFunctions.splitByCharacterTypeCamelCase().apply(str));
            Validate.assertEquals(str.stripHtmlTags(), StringFunctions.stripHtmlTags().apply(str));
            Validate.assertEquals(str.substring(pos), StringFunctions.substring(pos).apply(str));
            Validate.assertEquals(str.substring(pos, pos * 2), StringFunctions.substring(pos, pos * 2).apply(str));
            Validate.assertEquals(str.substringAfter(separator), StringFunctions.substringAfter(separator).apply(str));
            Validate.assertEquals(str.substringAfterLast(separator), StringFunctions.substringAfterLast(separator).apply(str));
            Validate.assertEquals(str.substringBefore(separator), StringFunctions.substringBefore(separator).apply(str));
            Validate.assertEquals(str.substringBeforeLast(separator), StringFunctions.substringBeforeLast(separator).apply(str));
            Validate.assertEquals(str.substringBetween(separator), StringFunctions.substringBetween(separator).apply(str));
            Validate.assertEquals(str.substringBetween(separator, sample), StringFunctions.substringBetween(separator, sample).apply(str));
            Validate.assertEquals(str.swapCase(), StringFunctions.swapCase().apply(str));
            Validate.assertEquals(str.toLowerCase(), StringFunctions.toLowerCase().apply(str));
            Validate.assertEquals(str.toLowerCase(enUs), StringFunctions.toLowerCase(enUs).apply(str));
            Validate.assertEquals(str.toUpperCase(), StringFunctions.toUpperCase().apply(str));
            Validate.assertEquals(str.toUpperCase(enUs), StringFunctions.toUpperCase(enUs).apply(str));
            Validate.assertEquals(str.trim(), StringFunctions.trim().apply(str));
            Validate.assertEquals(str.uncapitalize(), StringFunctions.uncapitalize().apply(str));
            Validate.assertEquals(str.unescapeCsv(), StringFunctions.unescapeCsv().apply(str));
            Validate.assertEquals(str.unescapeEcmaScript(), StringFunctions.unescapeEcmaScript().apply(str));
            Validate.assertEquals(str.unescapeHtml3(), StringFunctions.unescapeHtml3().apply(str));
            Validate.assertEquals(str.unescapeHtml4(), StringFunctions.unescapeHtml4().apply(str));
            Validate.assertEquals(str.unescapeJava(), StringFunctions.unescapeJava().apply(str));
            Validate.assertEquals(str.unescapeUnicode(), StringFunctions.unescapeUnicode().apply(str));
            Validate.assertEquals(str.unescapeXml(), StringFunctions.unescapeXml().apply(str));
        }
        for (Integer i : INTS) {
            Validate.assertEquals(String.valueOf(i), StringFunctions.valueOf().apply(i));
        }
        for (String str : DATETIMES_AS_STRINGS) {
            Validate.assertEquals(Date.valueOf(str), StringFunctions.dateValueOf().apply(str));
            Validate.assertEquals(Datetime.valueOf(str), StringFunctions.datetimeValueOf().apply(str));
            Validate.assertEquals(Datetime.valueOfGmt(str), StringFunctions.datetimeValueOfGmt().apply(str));
        }
        for (String str : DATES_AS_STRINGS) {
            Validate.assertEquals(Date.parse(str), StringFunctions.parseDate().apply(str));
        }
        for (String str : DATETIMES_TO_PARSE) {
            Validate.assertEquals(Datetime.parse(str), StringFunctions.parseDatetime().apply(str));
        }
    }

    /**
     * @see DateFunctions.addDays
     * @see DateFunctions.addMonths
     * @see DateFunctions.addYears
     * @see DateFunctions.format
     * @see DateFunctions.toStartOfMonth
     * @see DateFunctions.toStartOfWeek
     */
    @IsTest
    static void dateFunctions() {
        // Given
        Integer inc = 1;
        // Then
        new DateFunctions();
        for (Date d : DATES) {
            Validate.assertEquals(d.addDays(inc), DateFunctions.addDays(inc).apply(d));
            Validate.assertEquals(d.addMonths(inc), DateFunctions.addMonths(inc).apply(d));
            Validate.assertEquals(d.addYears(inc), DateFunctions.addYears(inc).apply(d));
            Validate.assertEquals(d.format(), DateFunctions.format().apply(d));
            Validate.assertEquals(d.toStartOfMonth(), DateFunctions.toStartOfMonth().apply(d));
            Validate.assertEquals(d.toStartOfWeek(), DateFunctions.toStartOfWeek().apply(d));
        }
    }

    /**
     * @see DatetimeFunctions.addDays
     * @see DatetimeFunctions.addHours
     * @see DatetimeFunctions.addMinutes
     * @see DatetimeFunctions.addMonths
     * @see DatetimeFunctions.addSeconds
     * @see DatetimeFunctions.addYears
     * @see DatetimeFunctions.getDate
     * @see DatetimeFunctions.dateGmt
     * @see DatetimeFunctions.format
     * @see DatetimeFunctions.formatGmt
     * @see DatetimeFunctions.formatLong
     * @see DatetimeFunctions.getTime
     * @see DatetimeFunctions.timeGmt
     * @see DatetimeFunctions.stringValueOfGmt
     */
    @IsTest
    static void datetimeFunctions() {
        // Given
        Integer inc = 1;
        String dateFormat = 'h:mm a';
        String tz = 'America/New_York';
        // Then
        new DatetimeFunctions();
        for (Datetime dt : DATETIMES) {
            Validate.assertEquals(dt.addDays(inc), DatetimeFunctions.addDays(inc).apply(dt));
            Validate.assertEquals(dt.addHours(inc), DatetimeFunctions.addHours(inc).apply(dt));
            Validate.assertEquals(dt.addMinutes(inc), DatetimeFunctions.addMinutes(inc).apply(dt));
            Validate.assertEquals(dt.addMonths(inc), DatetimeFunctions.addMonths(inc).apply(dt));
            Validate.assertEquals(dt.addSeconds(inc), DatetimeFunctions.addSeconds(inc).apply(dt));
            Validate.assertEquals(dt.addYears(inc), DatetimeFunctions.addYears(inc).apply(dt));
            Validate.assertEquals(dt.date(), DatetimeFunctions.getDate().apply(dt));
            Validate.assertEquals(dt.dateGmt(), DatetimeFunctions.dateGmt().apply(dt));
            Validate.assertEquals(dt.format(), DatetimeFunctions.format().apply(dt));
            Validate.assertEquals(dt.format(dateFormat), DatetimeFunctions.format(dateFormat).apply(dt));
            Validate.assertEquals(dt.format(dateFormat, tz), DatetimeFunctions.format(dateFormat, tz).apply(dt));
            Validate.assertEquals(dt.formatGmt(dateFormat), DatetimeFunctions.formatGmt(dateFormat).apply(dt));
            Validate.assertEquals(dt.formatLong(), DatetimeFunctions.formatLong().apply(dt));
            Validate.assertEquals(dt.time(), DatetimeFunctions.getTime().apply(dt));
            Validate.assertEquals(dt.timeGmt(), DatetimeFunctions.timeGmt().apply(dt));
            Validate.assertEquals(String.valueOfGmt(dt), DatetimeFunctions.stringValueOfGmt().apply(dt));
        }
    }

    /**
     * @see TimeFunctions.addHours
     * @see TimeFunctions.addMilliseconds
     * @see TimeFunctions.addMinutes
     * @see TimeFunctions.addSeconds
     */
    @IsTest
    static void timeFunctions() {
        // Given
        Integer inc = 1;
        // Then
        new TimeFunctions();
        for (Time t : TIMES) {
            Validate.assertEquals(t.addHours(inc), TimeFunctions.addHours(inc).apply(t));
            Validate.assertEquals(t.addMilliseconds(inc), TimeFunctions.addMilliseconds(inc).apply(t));
            Validate.assertEquals(t.addMinutes(inc), TimeFunctions.addMinutes(inc).apply(t));
            Validate.assertEquals(t.addSeconds(inc), TimeFunctions.addSeconds(inc).apply(t));
        }
    }
    
}
