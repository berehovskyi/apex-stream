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
            Assert.areEqual(t.hour(), hour.apply(t));
            Assert.areEqual(t.millisecond(), millisecond.apply(t));
            Assert.areEqual(t.minute(), minute.apply(t));
            Assert.areEqual(t.second(), second.apply(t));
        }
    }

}
