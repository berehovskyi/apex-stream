/**
 * @see DatePredicates
 * @see DatetimePredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DatePredicatesTest {

    private static List<Date> dateInput = new List<Date>{
            Date.newInstance(2020, 1, 1),
            Date.newInstance(2021, 2, 2),
            Date.newInstance(2023, 3, 3),
            Date.newInstance(2024, 4, 4)
    };
    private static List<Datetime> datetimeInput = new List<Datetime>{
            Datetime.newInstance(2020, 1, 1, 1, 1, 1),
            Datetime.newInstance(2021, 2, 2, 2, 2, 2),
            Datetime.newInstance(2023, 3, 3, 3, 3, 3),
            Datetime.newInstance(2024, 4, 4, 4, 4, 4)
    };
    
    /**
     * @see DatePredicates.isSameDay
     * @see DatePredicates.isLeapYear
     */
    @IsTest
    static void datePredicates() {
        // Given
        Date d1 = Date.newInstance(2020, 1, 1);
        // When
        new DatePredicates();
        IPredicate isSameDay = DatePredicates.isSameDay(d1);
        IPredicate isLeapYear = DatePredicates.isLeapYear();
        // Then
        for (Date d : dateInput) {
            Validate.assertEquals(d.isSameDay(d1), isSameDay.test(d));
            Validate.assertEquals(Date.isLeapYear(d.year()), isLeapYear.test(d));
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
        new DatetimePredicates();
        IPredicate isSameDay = DatetimePredicates.isSameDay(dt1);
        // Then
        for (Datetime dt : datetimeInput) {
            Validate.assertEquals(dt.isSameDay(dt1), isSameDay.test(dt));
        }
    }
    
}
