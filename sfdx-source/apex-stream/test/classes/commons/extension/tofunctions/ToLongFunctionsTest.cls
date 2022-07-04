/**
 * @see ToLongFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ToLongFunctionsTest {
    
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
        new ToLongFunctions();
        IToLongFunction getTime = DatetimeToLongFunctions.getTime();
        IToLongFunction asLong = ToLongFunctions.asLong();
        IToLongFunction longValue = StringToLongFunctions.valueOf();
        // Then
        for (Datetime o : datetimes) {
            Validate.assertEquals(o.getTime(), getTime.apply(o));
        }
        for (Object o : input) {
            Validate.assertEquals((Long) o, asLong.apply(o));
        }
        for (String s : input1) {
            Validate.assertEquals(Long.valueOf(s), longValue.apply(s));
        }
    }
    
}
