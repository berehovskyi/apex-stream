/**
 * @see ToLongFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ToLongFunctionsTest {

    static {
        new ToLongFunctions();
    }
    
    /**
     * @see DatetimeToLongFunctions.getTime
     * @see ToLongFunctions.asLong
     * @see StringToLongFunctions.longValueOf
     */
    @IsTest
    static void convert() {
        // Given
        List<Datetime> datetimes = IterTestUtils.generateDatetimes1();
        List<Object> input = new List<Object>{ 1, 2, 3 };
        List<String> input1 = new List<String>{ '123', '1', '2', '-3', '33' };
        // When
        IToLongFunction getTime = DatetimeToLongFunctions.getTime();
        IToLongFunction asLong = ToLongFunctions.asLong();
        IToLongFunction longValue = StringToLongFunctions.valueOf();
        // Then
        for (Datetime o : datetimes) {
            Assert.areEqual(o.getTime(), getTime.apply(o));
        }
        for (Object o : input) {
            Assert.areEqual((Long) o, asLong.apply(o));
        }
        for (String s : input1) {
            Assert.areEqual(Long.valueOf(s), longValue.apply(s));
        }
    }
    
}
