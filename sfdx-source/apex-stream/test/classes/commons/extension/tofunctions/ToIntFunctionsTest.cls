/**
 * @see ToIntFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ToIntFunctionsTest {

    /**
     * @see ToIntFunctions.asInt
     * @see ToIntFunctions.valueOf
     */
    @IsTest
    static void convert() {
        // Given
        List<Object> input = new List<Object>{ 1, 2, 3 };
        List<Object> input1 = new List<Object>{ '123', 1, 2L, 3.0, '33' };
        // When
        new ToIntFunctions();
        IToIntFunction asInt = ToIntFunctions.asInt();
        IToIntFunction intValue = ToIntFunctions.valueOf();
        // Then
        for (Object o : input) {
            Validate.assertEquals((Integer) o, asInt.apply(o));
        }
        for (Object o : input1) {
            Validate.assertEquals(Integer.valueOf(o), intValue.apply(o));
        }
    }

}
