/**
 * @see DatetimeToIntFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DatetimeToIntFunctionsTest {

    private static final List<Datetime> INPUT = IterTestUtils.generateDatetimes1();

    static {
        new DatetimeToIntFunctions();
    }

    /**
     * @see DatetimeToIntFunctions.day
     * @see DatetimeToIntFunctions.dayGmt
     * @see DatetimeToIntFunctions.dayOfYear
     * @see DatetimeToIntFunctions.dayOfYearGmt
     * @see DatetimeToIntFunctions.hour
     * @see DatetimeToIntFunctions.hourGmt
     * @see DatetimeToIntFunctions.millisecond
     * @see DatetimeToIntFunctions.millisecondGmt
     * @see DatetimeToIntFunctions.minute
     * @see DatetimeToIntFunctions.minuteGmt
     * @see DatetimeToIntFunctions.month
     * @see DatetimeToIntFunctions.monthGmt
     * @see DatetimeToIntFunctions.second
     * @see DatetimeToIntFunctions.secondGmt
     * @see DatetimeToIntFunctions.year
     * @see DatetimeToIntFunctions.yearGmt
     */
    @IsTest
    static void convert() {
        // When
        IToIntFunction day = DatetimeToIntFunctions.day();
        IToIntFunction dayGmt = DatetimeToIntFunctions.dayGmt();
        IToIntFunction dayOfYear = DatetimeToIntFunctions.dayOfYear();
        IToIntFunction dayOfYearGmt = DatetimeToIntFunctions.dayOfYearGmt();
        IToIntFunction hour = DatetimeToIntFunctions.hour();
        IToIntFunction hourGmt = DatetimeToIntFunctions.hourGmt();
        IToIntFunction millisecond = DatetimeToIntFunctions.millisecond();
        IToIntFunction millisecondGmt = DatetimeToIntFunctions.millisecondGmt();
        IToIntFunction minute = DatetimeToIntFunctions.minute();
        IToIntFunction minuteGmt = DatetimeToIntFunctions.minuteGmt();
        IToIntFunction month = DatetimeToIntFunctions.month();
        IToIntFunction monthGmt = DatetimeToIntFunctions.monthGmt();
        IToIntFunction second = DatetimeToIntFunctions.second();
        IToIntFunction secondGmt = DatetimeToIntFunctions.secondGmt();
        IToIntFunction year = DatetimeToIntFunctions.year();
        IToIntFunction yearGmt = DatetimeToIntFunctions.yearGmt();
        // Then
        for (Datetime dt : INPUT) {
            Validate.assertEquals(dt.day(), day.apply(dt));
            Validate.assertEquals(dt.dayGmt(), dayGmt.apply(dt));
            Validate.assertEquals(dt.dayOfYear(), dayOfYear.apply(dt));
            Validate.assertEquals(dt.dayOfYearGmt(), dayOfYearGmt.apply(dt));
            Validate.assertEquals(dt.hour(), hour.apply(dt));
            Validate.assertEquals(dt.hourGmt(), hourGmt.apply(dt));
            Validate.assertEquals(dt.millisecond(), millisecond.apply(dt));
            Validate.assertEquals(dt.millisecondGmt(), millisecondGmt.apply(dt));
            Validate.assertEquals(dt.minute(), minute.apply(dt));
            Validate.assertEquals(dt.minuteGmt(), minuteGmt.apply(dt));
            Validate.assertEquals(dt.month(), month.apply(dt));
            Validate.assertEquals(dt.monthGmt(), monthGmt.apply(dt));
            Validate.assertEquals(dt.second(), second.apply(dt));
            Validate.assertEquals(dt.secondGmt(), secondGmt.apply(dt));
            Validate.assertEquals(dt.year(), year.apply(dt));
            Validate.assertEquals(dt.yearGmt(), yearGmt.apply(dt));
        }
    }

}
