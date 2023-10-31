/**
 * @see DateFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage')
private class DateFunctionsTest {

    // Given
    private static final List<Date> DATES = new List<Date>{
        Date.newInstance(2020, 2, 2),
        Date.today(),
        Date.today().addDays(1),
        Date.today().addDays(-1)
    };

    static {
        new DateFunctions();
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
        for (Date d : DATES) {
            Assert.areEqual(d.addDays(inc), DateFunctions.addDays(inc).apply(d));
            Assert.areEqual(d.addMonths(inc), DateFunctions.addMonths(inc).apply(d));
            Assert.areEqual(d.addYears(inc), DateFunctions.addYears(inc).apply(d));
            Assert.areEqual(d.format(), DateFunctions.format().apply(d));
            Assert.areEqual(d.toStartOfMonth(), DateFunctions.toStartOfMonth().apply(d));
            Assert.areEqual(d.toStartOfWeek(), DateFunctions.toStartOfWeek().apply(d));
        }
    }
    
}
