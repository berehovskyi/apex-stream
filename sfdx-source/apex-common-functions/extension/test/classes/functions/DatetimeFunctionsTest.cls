/**
 * @see DatetimeFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage')
private class DatetimeFunctionsTest {

    // Given
    private static final List<Datetime> DATETIMES = new List<Datetime>{
        Datetime.newInstance(2020, 2, 2),
        Datetime.now(),
        Datetime.now().addDays(1),
        Datetime.now().addDays(-1)
    };

    static {
        new DatetimeFunctions();
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
    @SuppressWarnings('PMD.ApexUnitTestClassShouldHaveRunAs')
    static void datetimeFunctions() {
        // Given
        Integer inc = 1;
        String dateFormat = 'h:mm a';
        String tz = 'America/New_York';
        // Then
        for (Datetime dt : DATETIMES) {
            Assert.areEqual(dt.addDays(inc), DatetimeFunctions.addDays(inc).apply(dt));
            Assert.areEqual(dt.addHours(inc), DatetimeFunctions.addHours(inc).apply(dt));
            Assert.areEqual(dt.addMinutes(inc), DatetimeFunctions.addMinutes(inc).apply(dt));
            Assert.areEqual(dt.addMonths(inc), DatetimeFunctions.addMonths(inc).apply(dt));
            Assert.areEqual(dt.addSeconds(inc), DatetimeFunctions.addSeconds(inc).apply(dt));
            Assert.areEqual(dt.addYears(inc), DatetimeFunctions.addYears(inc).apply(dt));
            Assert.areEqual(dt.date(), DatetimeFunctions.getDate().apply(dt));
            Assert.areEqual(dt.dateGmt(), DatetimeFunctions.dateGmt().apply(dt));
            Assert.areEqual(dt.format(), DatetimeFunctions.format().apply(dt));
            Assert.areEqual(dt.format(dateFormat), DatetimeFunctions.format(dateFormat).apply(dt));
            Assert.areEqual(dt.format(dateFormat, tz), DatetimeFunctions.format(dateFormat, tz).apply(dt));
            Assert.areEqual(dt.formatGmt(dateFormat), DatetimeFunctions.formatGmt(dateFormat).apply(dt));
            Assert.areEqual(dt.formatLong(), DatetimeFunctions.formatLong().apply(dt));
            Assert.areEqual(dt.time(), DatetimeFunctions.getTime().apply(dt));
            Assert.areEqual(dt.timeGmt(), DatetimeFunctions.timeGmt().apply(dt));
            Assert.areEqual(String.valueOfGmt(dt), DatetimeFunctions.stringValueOfGmt().apply(dt));
        }
    }

}
