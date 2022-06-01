/**
 * @author Oleh Berehovskyi
 * @see TimeToIntFunction
 */
@IsTest(IsParallel = true)
private class TimeToIntFunctionTest {

    private static List<Time> times = IterTestUtils.generateTimes();

    /**
     * @see TimeToIntFunction.hour
     * @see TimeToIntFunction.millisecond
     * @see TimeToIntFunction.minute
     * @see TimeToIntFunction.second
     */
    @IsTest
    static void default() {
        // When
        IToIntFunction hour = TimeToIntFunction.hour();
        IToIntFunction millisecond = TimeToIntFunction.millisecond();
        IToIntFunction minute = TimeToIntFunction.minute();
        IToIntFunction second = TimeToIntFunction.second();
        // Then
        for (Time t : times) {
            Validate.assertEquals(t.hour(), hour.apply(t));
            Validate.assertEquals(t.millisecond(), millisecond.apply(t));
            Validate.assertEquals(t.minute(), minute.apply(t));
            Validate.assertEquals(t.second(), second.apply(t));
        }
    }

}
