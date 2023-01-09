/**
 * @see LongFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class LongFunctionsTest {

    static {
        new LongFunctions();
    }

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
        // When
        for (Long l : input) {
            Assert.areEqual(String.valueOf(l), toString.apply(l));
            Assert.areEqual((Object) l, toObject.apply(l));
        }
    }

}
