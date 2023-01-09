/**
 * @see DatePredicates
 * @see DatetimePredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DatePredicatesTest {

    private static final List<Date> DATES = new List<Date>{
            Date.newInstance(2020, 1, 1),
            Date.newInstance(2021, 2, 2),
            Date.newInstance(2023, 3, 3),
            Date.newInstance(2024, 4, 4)
    };
    private static final List<Datetime> DATETIMES = new List<Datetime>{
            Datetime.newInstance(2020, 1, 1, 1, 1, 1),
            Datetime.newInstance(2021, 2, 2, 2, 2, 2),
            Datetime.newInstance(2023, 3, 3, 3, 3, 3),
            Datetime.newInstance(2024, 4, 4, 4, 4, 4)
    };

    static {
        new DatePredicates();
        new DatetimePredicates();
    }
    
    /**
     * @see DatePredicates.isSameDay
     * @see DatePredicates.isLeapYear
     */
    @IsTest
    static void datePredicates() {
        // Given
        Date d1 = Date.newInstance(2020, 1, 1);
        // When
        IPredicate isSameDay = DatePredicates.isSameDay(d1);
        IPredicate isLeapYear = DatePredicates.isLeapYear();
        // Then
        for (Date d : DATES) {
            Assert.areEqual(d.isSameDay(d1), isSameDay.test(d));
            Assert.areEqual(Date.isLeapYear(d.year()), isLeapYear.test(d));
        }
    }

    /**
     * @see DatetimePredicates.isSameDay
     */
    @IsTest
    static void datetimePredicates() {
        // Given
        Datetime dt1 = Datetime.newInstance(2020, 1, 1, 2, 2, 2);
        // When
        IPredicate isSameDay = DatetimePredicates.isSameDay(dt1);
        // Then
        for (Datetime dt : DATETIMES) {
            Assert.areEqual(dt.isSameDay(dt1), isSameDay.test(dt));
        }
    }
    
}
