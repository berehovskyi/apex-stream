/**
 * @see TimeToIntFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class TimeToIntFunctionsTest {

    private static List<Time> times = IterTestUtils.generateTimes();

    /**
     * @see TimeToIntFunctions.hour
     * @see TimeToIntFunctions.millisecond
     * @see TimeToIntFunctions.minute
     * @see TimeToIntFunctions.second
     */
    @IsTest
    static void convert() {
        // When
        new TimeToIntFunctions();
        IToIntFunction hour = TimeToIntFunctions.hour();
        IToIntFunction millisecond = TimeToIntFunctions.millisecond();
        IToIntFunction minute = TimeToIntFunctions.minute();
        IToIntFunction second = TimeToIntFunctions.second();
        // Then
        for (Time t : times) {
            Validate.assertEquals(t.hour(), hour.apply(t));
            Validate.assertEquals(t.millisecond(), millisecond.apply(t));
            Validate.assertEquals(t.minute(), minute.apply(t));
            Validate.assertEquals(t.second(), second.apply(t));
        }
    }

}
