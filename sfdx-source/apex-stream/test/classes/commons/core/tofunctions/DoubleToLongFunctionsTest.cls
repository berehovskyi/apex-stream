/**
 * @see DoubleToLongFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DoubleToLongFunctionsTest {
    
    private static List<Double> doubles = IterTestUtils.generateDoubles();

    /**
     * @see DoubleToLongFunctions.longValue
     * @see DoubleToLongFunctions.roundToLong
     */
    @IsTest
    static void default() {
        // Given
        IDoubleToLongFunction longValue = DoubleToLongFunctions.longValue();
        IDoubleToLongFunction round = DoubleToLongFunctions.roundToLong();
        // Then
        new DoubleToLongFunctions();
        for (Double d : doubles) {
            Validate.assertEquals(d.longValue(), longValue.apply(d));
            Validate.assertEquals(Math.roundToLong(d), round.apply(d));
        }
    }
    
}
