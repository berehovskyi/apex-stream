/**
 * @see ToIntFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ToIntFunctionsTest {

    static {
        new ToIntFunctions();
    }

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
        IToIntFunction asInt = ToIntFunctions.asInt();
        IToIntFunction intValue = ToIntFunctions.valueOf();
        // Then
        for (Object o : input) {
            Assert.areEqual((Integer) o, asInt.apply(o));
        }
        for (Object o : input1) {
            Assert.areEqual(Integer.valueOf(o), intValue.apply(o));
        }
    }

}
