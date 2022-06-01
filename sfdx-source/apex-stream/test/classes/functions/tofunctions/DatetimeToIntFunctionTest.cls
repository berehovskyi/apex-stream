/**
 * @author Oleh Berehovskyi
 * @see DatetimeToIntFunction
 */
@IsTest(IsParallel = true)
private class DatetimeToIntFunctionTest {

    private static List<Datetime> datetimes = IterTestUtils.generateDatetimes1();

    /**
     * @see DatetimeToIntFunction.day
     * @see DatetimeToIntFunction.dayGmt
     * @see DatetimeToIntFunction.dayOfYear
     * @see DatetimeToIntFunction.dayOfYearGmt
     * @see DatetimeToIntFunction.hour
     * @see DatetimeToIntFunction.hourGmt
     * @see DatetimeToIntFunction.millisecond
     * @see DatetimeToIntFunction.millisecondGmt
     * @see DatetimeToIntFunction.minute
     * @see DatetimeToIntFunction.minuteGmt
     * @see DatetimeToIntFunction.month
     * @see DatetimeToIntFunction.monthGmt
     * @see DatetimeToIntFunction.second
     * @see DatetimeToIntFunction.secondGmt
     * @see DatetimeToIntFunction.year
     * @see DatetimeToIntFunction.yearGmt
     */
    @IsTest
    static void default() {
        // When
        IToIntFunction day = DatetimeToIntFunction.day();
        IToIntFunction dayGmt = DatetimeToIntFunction.dayGmt();
        IToIntFunction dayOfYear = DatetimeToIntFunction.dayOfYear();
        IToIntFunction dayOfYearGmt = DatetimeToIntFunction.dayOfYearGmt();
        IToIntFunction hour = DatetimeToIntFunction.hour();
        IToIntFunction hourGmt = DatetimeToIntFunction.hourGmt();
        IToIntFunction millisecond = DatetimeToIntFunction.millisecond();
        IToIntFunction millisecondGmt = DatetimeToIntFunction.millisecondGmt();
        IToIntFunction minute = DatetimeToIntFunction.minute();
        IToIntFunction minuteGmt = DatetimeToIntFunction.minuteGmt();
        IToIntFunction month = DatetimeToIntFunction.month();
        IToIntFunction monthGmt = DatetimeToIntFunction.monthGmt();
        IToIntFunction second = DatetimeToIntFunction.second();
        IToIntFunction secondGmt = DatetimeToIntFunction.secondGmt();
        IToIntFunction year = DatetimeToIntFunction.year();
        IToIntFunction yearGmt = DatetimeToIntFunction.yearGmt();
        // Then
        for (Datetime dt : datetimes) {
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
