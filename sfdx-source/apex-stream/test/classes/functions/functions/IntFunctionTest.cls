/**
 * @author O. Berehovskyi
 * @see IntFunction
 */
@IsTest(IsParallel = true)
private class IntFunctionTest {

    /**
     * @see IntFunction.toString
     * @see IntFunction.toObject
     */
    @IsTest
    static void default() {
        // Given
        List<Integer> input = new List<Integer>{ 1, 2, 3, 4, 4, 6, -10, -3 };
        IIntFunction toString = IntFunction.toString();
        IIntFunction toObject = IntFunction.toObject();
        // Then
        for (Integer i : input) {
            Validate.assertEquals(String.valueOf(i), toString.apply(i));
            Validate.assertEquals((Object) i, toObject.apply(i));
        }
    }

}
