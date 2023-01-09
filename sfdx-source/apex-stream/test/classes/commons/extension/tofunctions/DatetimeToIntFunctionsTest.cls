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
            Assert.areEqual(dt.day(), day.apply(dt));
            Assert.areEqual(dt.dayGmt(), dayGmt.apply(dt));
            Assert.areEqual(dt.dayOfYear(), dayOfYear.apply(dt));
            Assert.areEqual(dt.dayOfYearGmt(), dayOfYearGmt.apply(dt));
            Assert.areEqual(dt.hour(), hour.apply(dt));
            Assert.areEqual(dt.hourGmt(), hourGmt.apply(dt));
            Assert.areEqual(dt.millisecond(), millisecond.apply(dt));
            Assert.areEqual(dt.millisecondGmt(), millisecondGmt.apply(dt));
            Assert.areEqual(dt.minute(), minute.apply(dt));
            Assert.areEqual(dt.minuteGmt(), minuteGmt.apply(dt));
            Assert.areEqual(dt.month(), month.apply(dt));
            Assert.areEqual(dt.monthGmt(), monthGmt.apply(dt));
            Assert.areEqual(dt.second(), second.apply(dt));
            Assert.areEqual(dt.secondGmt(), secondGmt.apply(dt));
            Assert.areEqual(dt.year(), year.apply(dt));
            Assert.areEqual(dt.yearGmt(), yearGmt.apply(dt));
        }
    }

}
