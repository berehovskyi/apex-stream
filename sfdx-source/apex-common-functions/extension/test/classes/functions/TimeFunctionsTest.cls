/**
 * @see TimeFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class TimeFunctionsTest {

    // Given
    private static final List<Time> TIMES = new List<Time>{
            Time.newInstance(10, 10, 10, 10),
            Time.newInstance(11, 11, 11, 11),
            Time.newInstance(12, 12, 12, 12),
            Time.newInstance(13, 13, 13, 13)
    };

    static {
        new TimeFunctions();
    }
    
    /**
     * @see TimeFunctions.addHours
     * @see TimeFunctions.addMilliseconds
     * @see TimeFunctions.addMinutes
     * @see TimeFunctions.addSeconds
     */
    @IsTest
    static void timeFunctions() {
        // Given
        Integer inc = 1;
        // Then
        for (Time t : TIMES) {
            Assert.areEqual(t.addHours(inc), TimeFunctions.addHours(inc).apply(t));
            Assert.areEqual(t.addMilliseconds(inc), TimeFunctions.addMilliseconds(inc).apply(t));
            Assert.areEqual(t.addMinutes(inc), TimeFunctions.addMinutes(inc).apply(t));
            Assert.areEqual(t.addSeconds(inc), TimeFunctions.addSeconds(inc).apply(t));
        }
    }
    
}
