/**
 * @see TimeToIntFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class TimeToIntFunctionsTest {

    private static final List<Time> INPUT = IterTestUtils.generateTimes();

    static {
        new TimeToIntFunctions();
    }

    /**
     * @see TimeToIntFunctions.hour
     * @see TimeToIntFunctions.millisecond
     * @see TimeToIntFunctions.minute
     * @see TimeToIntFunctions.second
     */
    @IsTest
    static void convert() {
        // When
        IToIntFunction hour = TimeToIntFunctions.hour();
        IToIntFunction millisecond = TimeToIntFunctions.millisecond();
        IToIntFunction minute = TimeToIntFunctions.minute();
        IToIntFunction second = TimeToIntFunctions.second();
        // Then
        for (Time t : INPUT) {
            Validate.assertEquals(t.hour(), hour.apply(t));
            Validate.assertEquals(t.millisecond(), millisecond.apply(t));
            Validate.assertEquals(t.minute(), minute.apply(t));
            Validate.assertEquals(t.second(), second.apply(t));
        }
    }

}
