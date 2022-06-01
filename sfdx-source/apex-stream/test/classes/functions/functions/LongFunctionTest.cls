/**
 * @author Oleh Berehovskyi
 * @see LongFunction
 */
@IsTest(IsParallel = true)
private class LongFunctionTest {

    /**
     * @see LongFunction.toString
     * @see LongFunction.toObject
     */
    @IsTest
    static void default() {
        // Given
        List<Long> input = new List<Long>{ 1L, 2L, 3L, 4L, 4L, 6L };
        ILongFunction toString = LongFunction.toString();
        ILongFunction toObject = LongFunction.toObject();
        // When
        for (Long l : input) {
            Validate.assertEquals(String.valueOf(l), toString.apply(l));
            Validate.assertEquals((Object) l, toObject.apply(l));
        }
    }

}
