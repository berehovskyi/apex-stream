/**
 * @author O. Berehovskyi
 * @see DateToIntFunction
 */
@IsTest(IsParallel = true)
private class DateToIntFunctionTest {

    private static List<Date> dates = IterTestUtils.generateDates1();

    /**
     * @see DateToIntFunction.day
     * @see DateToIntFunction.dayOfYear
     * @see DateToIntFunction.daysBetween
     * @see DateToIntFunction.month
     * @see DateToIntFunction.monthsBetween
     * @see DateToIntFunction.year
     */
    @IsTest
    static void default() {
        // Given
        Date other = Date.today();
        // When
        IToIntFunction day = DateToIntFunction.day();
        IToIntFunction dayOfYear = DateToIntFunction.dayOfYear();
        IToIntFunction daysBetween = DateToIntFunction.daysBetween(other);
        IToIntFunction month = DateToIntFunction.month();
        IToIntFunction monthsBetween = DateToIntFunction.monthsBetween(other);
        IToIntFunction year = DateToIntFunction.year();
        // Then
        for (Date d : dates) {
            Validate.assertEquals(d.day(), day.apply(d));
            Validate.assertEquals(d.dayOfYear(), dayOfYear.apply(d));
            Validate.assertEquals(d.daysBetween(other), daysBetween.apply(d));
            Validate.assertEquals(d.month(), month.apply(d));
            Validate.assertEquals(d.monthsBetween(other), monthsBetween.apply(d));
            Validate.assertEquals(d.year(), year.apply(d));
        }
    }

}
