/**
 * @see IntFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class IntFunctionsTest {

    /**
     * @see IntFunctions.toString
     * @see IntFunctions.toObject
     */
    @IsTest
    static void default() {
        // Given
        List<Integer> input = new List<Integer>{ 1, 2, 3, 4, 4, 6, -10, -3 };
        IIntFunction toString = IntFunctions.toString();
        IIntFunction toObject = IntFunctions.toObject();
        new IntFunctions();
        // Then
        for (Integer i : input) {
            Validate.assertEquals(String.valueOf(i), toString.apply(i));
            Validate.assertEquals((Object) i, toObject.apply(i));
        }
    }

}
