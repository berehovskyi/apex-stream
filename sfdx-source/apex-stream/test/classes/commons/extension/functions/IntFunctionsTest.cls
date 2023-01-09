/**
 * @see IntFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class IntFunctionsTest {

    static {
        new IntFunctions();
    }

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
        // Then
        for (Integer i : input) {
            Assert.areEqual(String.valueOf(i), toString.apply(i));
            Assert.areEqual((Object) i, toObject.apply(i));
        }
    }

}
