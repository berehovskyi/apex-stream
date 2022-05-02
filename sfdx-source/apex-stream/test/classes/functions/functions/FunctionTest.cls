/**
 * @author O. Berehovskyi
 * @see Function
 */
@IsTest(IsParallel = true)
private class FunctionTest {

    // Given
    private static List<String> stringInput = new List<String>{
            'publisher ', 'sustain', 'Triangle', ' activity', 'Invite', ' back ', 'Shop', 'stu mble'
    };
    private static List<Integer> intInput = new List<Integer>{ 1, 2, 3, 4, 4, 6, -10, -3 };
    private static List<Long> longInput = new List<Long>{ 1L, 2L, 3L, 4L, 4L, 6L };
    private static List<Double> doubleInput = new List<Double>{ -5.5, 0, 1.0, 3, 8.99, Math.PI };
    private static List<Date> dateInput = new List<Date>{
            Date.newInstance(2020, 2, 2),
            Date.today(),
            Date.today().addDays(1),
            Date.today().addDays(-1)
    };
    private static List<Datetime> datetimeInput = new List<Datetime>{
            Datetime.newInstance(2020, 2, 2),
            Datetime.now(),
            Datetime.now().addDays(1),
            Datetime.now().addDays(-1)
    };
    private static List<Time> timeInput = new List<Time>{
            Time.newInstance(10, 10, 10, 10),
            Time.newInstance(11, 11, 11, 11),
            Time.newInstance(12, 12, 12, 12),
            Time.newInstance(13, 13, 13, 13)
    };
    private static List<String> datetimeAsStringInput = new List<String>{
            '2008-10-5 12:20:20',
            '2008-10-15 12:20:20',
            '2008-12-10 12:20:20',
            '2008-20-58 12:20:20'
    };
    private static List<String> datetimeToParseInput = new List<String>{
            '10/14/2020, 11:46 AM',
            '10/14/2021, 11:46 AM',
            '10/14/2022, 11:46 AM',
            '10/14/2023, 11:46 AM'
    };
    private static List<String> dateAsStringInput = new List<String>{
            '05/05/2020',
            '05/05/2021',
            '05/05/2022'
    };

    /**
     * @see Function.identity
     * @see Function.upcast
     * @see Function.constant
     * @see Function.andThen
     * @see Function.compose
     * @see Function.forPredicate
     */
    @IsTest
    static void defaultMethods() {
        // Given
        Object constant = 42;
        Integer maxWidth = 5;
        Integer val = 4;
        // When
        IFunction identity = Function.identity();
        IFunction get42 = Function.constant(constant);
        IFunction startsWithS = Function.forPredicate(StringPredicate.startsWith('s'));
        IFunction isGreaterThan4Int = Function.forPredicate(Predicate.upcast(IntPredicate.isGreater(val)));
        IFunction isGreaterThan4Long = Function.forPredicate(Predicate.upcast(LongPredicate.isGreater(val)));
        IFunction isGreaterThan4Double = Function.forPredicate(Predicate.upcast(DoublePredicate.isGreater(val)));
        Function capitalize = StringFunction.capitalize();
        Function abbreviate5 = StringFunction.abbreviate(maxWidth);
        IFunction capitalizeAndAbbreviate = capitalize.andThen(abbreviate5);
        IFunction capitalizeAndAbbreviate1 = abbreviate5.compose(capitalize);
        IFunction capitalizeAndAbbreviate2 = Function.compose(new List<IFunction>{ capitalize, abbreviate5 });
        // Then
        for (String str : stringInput) {
            Validate.assertEquals(str, identity.apply(str));
            Validate.assertEquals(constant, get42.apply(str));
            Validate.assertEquals(str.startsWith('s'), startsWithS.apply(str));
            Validate.assertEquals(str.capitalize().abbreviate(maxWidth), capitalizeAndAbbreviate.apply(str));
            Validate.assertEquals(str.capitalize().abbreviate(maxWidth), capitalizeAndAbbreviate1.apply(str));
            Validate.assertEquals(str.capitalize().abbreviate(maxWidth), capitalizeAndAbbreviate2.apply(str));
        }
        for (Integer i : intInput) {
            Validate.assertEquals(i > 4, isGreaterThan4Int.apply(i));
        }
        for (Long l : longInput) {
            Validate.assertEquals(l > 4, isGreaterThan4Long.apply(l));
        }
        for (Double d : doubleInput) {
            Validate.assertEquals(d > 4, isGreaterThan4Double.apply(d));
        }
    }

    /**
     * @see StringFunction.abbreviate
     * @see StringFunction.append
     * @see StringFunction.capitalize
     * @see StringFunction.center
     * @see StringFunction.deleteWhitespace
     * @see StringFunction.difference
     * @see StringFunction.escapeCsv
     * @see StringFunction.escapeEcmaScript
     * @see StringFunction.escapeHtml3
     * @see StringFunction.escapeHtml4
     * @see StringFunction.escapeJava
     * @see StringFunction.escapeSingleQuotes
     * @see StringFunction.escapeUnicode
     * @see StringFunction.escapeXml
     * @see StringFunction.getChars
     * @see StringFunction.format
     * @see StringFunction.left
     * @see StringFunction.leftPad
     * @see StringFunction.mid
     * @see StringFunction.normalizeSpace
     * @see StringFunction.prepend
     * @see StringFunction.remove
     * @see StringFunction.removeEnd
     * @see StringFunction.removeEndIgnoreCase
     * @see StringFunction.removeStart
     * @see StringFunction.removeStartIgnoreCase
     * @see StringFunction.repeat
     * @see StringFunction.replaceAll
     * @see StringFunction.replaceFirst
     * @see StringFunction.reverse
     * @see StringFunction.right
     * @see StringFunction.rightPad
     * @see StringFunction.split
     * @see StringFunction.splitByCharacterType
     * @see StringFunction.splitByCharacterTypeCamelCase
     * @see StringFunction.stripHtmlTags
     * @see StringFunction.substring
     * @see StringFunction.substringAfter
     * @see StringFunction.substringAfterLast
     * @see StringFunction.substringBefore
     * @see StringFunction.substringBeforeLast
     * @see StringFunction.substringBetween
     * @see StringFunction.swapCase
     * @see StringFunction.toLowerCase
     * @see StringFunction.toUpperCase
     * @see StringFunction.trim
     * @see StringFunction.uncapitalize
     * @see StringFunction.unescapeCsv
     * @see StringFunction.unescapeEcmaScript
     * @see StringFunction.unescapeHtml3
     * @see StringFunction.unescapeHtml4
     * @see StringFunction.unescapeJava
     * @see StringFunction.unescapeUnicode
     * @see StringFunction.unescapeXml
     * @see StringFunction.stringValueOf
     * @see StringFunction.dateValueOf
     * @see StringFunction.datetimeValueOf
     * @see StringFunction.datetimeValueOfGmt
     * @see StringFunction.parseDate
     * @see StringFunction.parseDatetime
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
        for (String str : stringInput) {
            Validate.assertEquals(str.abbreviate(maxWidth), StringFunction.abbreviate(maxWidth).apply(str));
            Validate.assertEquals(str.abbreviate(maxWidth, offset), StringFunction.abbreviate(maxWidth, offset).apply(str));
            Validate.assertEquals(str + suffix, StringFunction.append(suffix).apply(str));
            Validate.assertEquals(str.capitalize(), StringFunction.capitalize().apply(str));
            Validate.assertEquals(str.center(size), StringFunction.center(size).apply(str));
            Validate.assertEquals(str.center(size, padStr), StringFunction.center(size, padStr).apply(str));
            Validate.assertEquals(str.deleteWhitespace(), StringFunction.deleteWhitespace().apply(str));
            Validate.assertEquals(str.difference(sample), StringFunction.difference(sample).apply(str));
            Validate.assertEquals(str.escapeCsv(), StringFunction.escapeCsv().apply(str));
            Validate.assertEquals(str.escapeEcmaScript(), StringFunction.escapeEcmaScript().apply(str));
            Validate.assertEquals(str.escapeHtml3(), StringFunction.escapeHtml3().apply(str));
            Validate.assertEquals(str.escapeHtml4(), StringFunction.escapeHtml4().apply(str));
            Validate.assertEquals(str.escapeJava(), StringFunction.escapeJava().apply(str));
            Validate.assertEquals(String.escapeSingleQuotes(str), StringFunction.escapeSingleQuotes().apply(str));
            Validate.assertEquals(str.escapeUnicode(), StringFunction.escapeUnicode().apply(str));
            Validate.assertEquals(str.escapeXml(), StringFunction.escapeXml().apply(str));
            Validate.assertEquals(str.getChars(), StringFunction.getChars().apply(str));
            Validate.assertEquals(String.format(str, format), StringFunction.format(format).apply(str));
            Validate.assertEquals(str.left(len), StringFunction.left(len).apply(str));
            Validate.assertEquals(str.leftPad(len), StringFunction.leftPad(len).apply(str));
            Validate.assertEquals(str.leftPad(len, padStr), StringFunction.leftPad(len, padStr).apply(str));
            Validate.assertEquals(str.mid(pos, len), StringFunction.mid(pos, len).apply(str));
            Validate.assertEquals(str.normalizeSpace(), StringFunction.normalizeSpace().apply(str));
            Validate.assertEquals(prefix + str, StringFunction.prepend(prefix).apply(str));
            Validate.assertEquals(str.remove(toRemove), StringFunction.remove(toRemove).apply(str));
            Validate.assertEquals(str.removeEnd(toRemove), StringFunction.removeEnd(toRemove).apply(str));
            Validate.assertEquals(str.removeEndIgnoreCase(toRemove), StringFunction.removeEndIgnoreCase(toRemove).apply(str));
            Validate.assertEquals(str.removeStart(toRemove), StringFunction.removeStart(toRemove).apply(str));
            Validate.assertEquals(str.removeStartIgnoreCase(toRemove), StringFunction.removeStartIgnoreCase(toRemove).apply(str));
            Validate.assertEquals(str.repeat(pos), StringFunction.repeat(pos).apply(str));
            Validate.assertEquals(str.repeat(separator, pos), StringFunction.repeat(separator, pos).apply(str));
            Validate.assertEquals(str.replace(separator, sample), StringFunction.replace(separator, sample).apply(str));
            Validate.assertEquals(str.replaceAll(separator, sample), StringFunction.replaceAll(separator, sample).apply(str));
            Validate.assertEquals(str.replaceFirst(separator, sample), StringFunction.replaceFirst(separator, sample).apply(str));
            Validate.assertEquals(str.reverse(), StringFunction.reverse().apply(str));
            Validate.assertEquals(str.right(len), StringFunction.right(len).apply(str));
            Validate.assertEquals(str.rightPad(len), StringFunction.rightPad(len).apply(str));
            Validate.assertEquals(str.rightPad(len, padStr), StringFunction.rightPad(len, padStr).apply(str));
            Validate.assertEquals(str.split(padStr), StringFunction.split(padStr).apply(str));
            Validate.assertEquals(str.split(padStr, len), StringFunction.split(padStr, len).apply(str));
            Validate.assertEquals(str.splitByCharacterType(), StringFunction.splitByCharacterType().apply(str));
            Validate.assertEquals(str.splitByCharacterTypeCamelCase(), StringFunction.splitByCharacterTypeCamelCase().apply(str));
            Validate.assertEquals(str.stripHtmlTags(), StringFunction.stripHtmlTags().apply(str));
            Validate.assertEquals(str.substring(pos), StringFunction.substring(pos).apply(str));
            Validate.assertEquals(str.substring(pos, pos * 2), StringFunction.substring(pos, pos * 2).apply(str));
            Validate.assertEquals(str.substringAfter(separator), StringFunction.substringAfter(separator).apply(str));
            Validate.assertEquals(str.substringAfterLast(separator), StringFunction.substringAfterLast(separator).apply(str));
            Validate.assertEquals(str.substringBefore(separator), StringFunction.substringBefore(separator).apply(str));
            Validate.assertEquals(str.substringBeforeLast(separator), StringFunction.substringBeforeLast(separator).apply(str));
            Validate.assertEquals(str.substringBetween(separator), StringFunction.substringBetween(separator).apply(str));
            Validate.assertEquals(str.substringBetween(separator, sample), StringFunction.substringBetween(separator, sample).apply(str));
            Validate.assertEquals(str.swapCase(), StringFunction.swapCase().apply(str));
            Validate.assertEquals(str.toLowerCase(), StringFunction.toLowerCase().apply(str));
            Validate.assertEquals(str.toLowerCase(enUs), StringFunction.toLowerCase(enUs).apply(str));
            Validate.assertEquals(str.toUpperCase(), StringFunction.toUpperCase().apply(str));
            Validate.assertEquals(str.toUpperCase(enUs), StringFunction.toUpperCase(enUs).apply(str));
            Validate.assertEquals(str.trim(), StringFunction.trim().apply(str));
            Validate.assertEquals(str.uncapitalize(), StringFunction.uncapitalize().apply(str));
            Validate.assertEquals(str.unescapeCsv(), StringFunction.unescapeCsv().apply(str));
            Validate.assertEquals(str.unescapeEcmaScript(), StringFunction.unescapeEcmaScript().apply(str));
            Validate.assertEquals(str.unescapeHtml3(), StringFunction.unescapeHtml3().apply(str));
            Validate.assertEquals(str.unescapeHtml4(), StringFunction.unescapeHtml4().apply(str));
            Validate.assertEquals(str.unescapeJava(), StringFunction.unescapeJava().apply(str));
            Validate.assertEquals(str.unescapeUnicode(), StringFunction.unescapeUnicode().apply(str));
            Validate.assertEquals(str.unescapeXml(), StringFunction.unescapeXml().apply(str));
        }
        for (Integer i : intInput) {
            Validate.assertEquals(String.valueOf(i), StringFunction.valueOf().apply(i));
        }
        for (String str : datetimeAsStringInput) {
            Validate.assertEquals(Date.valueOf(str), StringFunction.dateValueOf().apply(str));
            Validate.assertEquals(Datetime.valueOf(str), StringFunction.datetimeValueOf().apply(str));
            Validate.assertEquals(Datetime.valueOfGmt(str), StringFunction.datetimeValueOfGmt().apply(str));
        }
        for (String str : dateAsStringInput) {
            Validate.assertEquals(Date.parse(str), StringFunction.parseDate().apply(str));
        }
        for (String str : datetimeToParseInput) {
            Validate.assertEquals(Datetime.parse(str), StringFunction.parseDatetime().apply(str));
        }
    }

    /**
     * @see DateFunction.addDays
     * @see DateFunction.addMonths
     * @see DateFunction.addYears
     * @see DateFunction.format
     * @see DateFunction.toStartOfMonth
     * @see DateFunction.toStartOfWeek
     */
    @IsTest
    static void dateFunctions() {
        // Given
        Integer inc = 1;
        // Then
        for (Date d : dateInput) {
            Validate.assertEquals(d.addDays(inc), DateFunction.addDays(inc).apply(d));
            Validate.assertEquals(d.addMonths(inc), DateFunction.addMonths(inc).apply(d));
            Validate.assertEquals(d.addYears(inc), DateFunction.addYears(inc).apply(d));
            Validate.assertEquals(d.format(), DateFunction.format().apply(d));
            Validate.assertEquals(d.toStartOfMonth(), DateFunction.toStartOfMonth().apply(d));
            Validate.assertEquals(d.toStartOfWeek(), DateFunction.toStartOfWeek().apply(d));
        }
    }

    /**
     * @see DatetimeFunction.addDays
     * @see DatetimeFunction.addHours
     * @see DatetimeFunction.addMinutes
     * @see DatetimeFunction.addMonths
     * @see DatetimeFunction.addSeconds
     * @see DatetimeFunction.addYears
     * @see DatetimeFunction.getDate
     * @see DatetimeFunction.dateGmt
     * @see DatetimeFunction.format
     * @see DatetimeFunction.formatGmt
     * @see DatetimeFunction.formatLong
     * @see DatetimeFunction.getTime
     * @see DatetimeFunction.timeGmt
     * @see DatetimeFunction.stringValueOfGmt
     */
    @IsTest
    static void datetimeFunctions() {
        // Given
        Integer inc = 1;
        String dateFormat = 'h:mm a';
        String tz = 'America/New_York';
        // Then
        for (Datetime dt : datetimeInput) {
            Validate.assertEquals(dt.addDays(inc), DatetimeFunction.addDays(inc).apply(dt));
            Validate.assertEquals(dt.addHours(inc), DatetimeFunction.addHours(inc).apply(dt));
            Validate.assertEquals(dt.addMinutes(inc), DatetimeFunction.addMinutes(inc).apply(dt));
            Validate.assertEquals(dt.addMonths(inc), DatetimeFunction.addMonths(inc).apply(dt));
            Validate.assertEquals(dt.addSeconds(inc), DatetimeFunction.addSeconds(inc).apply(dt));
            Validate.assertEquals(dt.addYears(inc), DatetimeFunction.addYears(inc).apply(dt));
            Validate.assertEquals(dt.date(), DatetimeFunction.getDate().apply(dt));
            Validate.assertEquals(dt.dateGmt(), DatetimeFunction.dateGmt().apply(dt));
            Validate.assertEquals(dt.format(), DatetimeFunction.format().apply(dt));
            Validate.assertEquals(dt.format(dateFormat), DatetimeFunction.format(dateFormat).apply(dt));
            Validate.assertEquals(dt.format(dateFormat, tz), DatetimeFunction.format(dateFormat, tz).apply(dt));
            Validate.assertEquals(dt.formatGmt(dateFormat), DatetimeFunction.formatGmt(dateFormat).apply(dt));
            Validate.assertEquals(dt.formatLong(), DatetimeFunction.formatLong().apply(dt));
            Validate.assertEquals(dt.time(), DatetimeFunction.getTime().apply(dt));
            Validate.assertEquals(dt.timeGmt(), DatetimeFunction.timeGmt().apply(dt));
            Validate.assertEquals(String.valueOfGmt(dt), DatetimeFunction.stringValueOfGmt().apply(dt));
        }
    }

    /**
     * @see TimeFunction.addHours
     * @see TimeFunction.addMilliseconds
     * @see TimeFunction.addMinutes
     * @see TimeFunction.addSeconds
     */
    @IsTest
    static void timeFunctions() {
        // Given
        Integer inc = 1;
        // Then
        for (Time t : timeInput) {
            Validate.assertEquals(t.addHours(inc), TimeFunction.addHours(inc).apply(t));
            Validate.assertEquals(t.addMilliseconds(inc), TimeFunction.addMilliseconds(inc).apply(t));
            Validate.assertEquals(t.addMinutes(inc), TimeFunction.addMinutes(inc).apply(t));
            Validate.assertEquals(t.addSeconds(inc), TimeFunction.addSeconds(inc).apply(t));
        }
    }

}
