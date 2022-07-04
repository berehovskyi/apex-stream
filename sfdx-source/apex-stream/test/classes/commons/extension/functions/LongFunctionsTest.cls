/**
 * @see LongFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class LongFunctionsTest {

    /**
     * @see LongFunctions.toString
     * @see LongFunctions.toObject
     */
    @IsTest
    static void default() {
        // Given
        List<Long> input = new List<Long>{ 1L, 2L, 3L, 4L, 4L, 6L };
        ILongFunction toString = LongFunctions.toString();
        ILongFunction toObject = LongFunctions.toObject();
        new LongFunctions();
        // When
        for (Long l : input) {
            Validate.assertEquals(String.valueOf(l), toString.apply(l));
            Validate.assertEquals((Object) l, toObject.apply(l));
        }
    }

}
