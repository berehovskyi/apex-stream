/**
 * @see DateToIntFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DateToIntFunctionsTest {

    private static final List<Date> INPUT = IterTestUtils.generateDates1();

    static {
        new DateToIntFunctions();
    }

    /**
     * @see DateToIntFunctions.day
     * @see DateToIntFunctions.dayOfYear
     * @see DateToIntFunctions.daysBetween
     * @see DateToIntFunctions.month
     * @see DateToIntFunctions.monthsBetween
     * @see DateToIntFunctions.year
     */
    @IsTest
    static void convert() {
        // Given
        Date other = Date.today();
        // When
        IToIntFunction day = DateToIntFunctions.day();
        IToIntFunction dayOfYear = DateToIntFunctions.dayOfYear();
        IToIntFunction daysBetween = DateToIntFunctions.daysBetween(other);
        IToIntFunction month = DateToIntFunctions.month();
        IToIntFunction monthsBetween = DateToIntFunctions.monthsBetween(other);
        IToIntFunction year = DateToIntFunctions.year();
        // Then
        for (Date d : INPUT) {
            Validate.assertEquals(d.day(), day.apply(d));
            Validate.assertEquals(d.dayOfYear(), dayOfYear.apply(d));
            Validate.assertEquals(d.daysBetween(other), daysBetween.apply(d));
            Validate.assertEquals(d.month(), month.apply(d));
            Validate.assertEquals(d.monthsBetween(other), monthsBetween.apply(d));
            Validate.assertEquals(d.year(), year.apply(d));
        }
    }

}
