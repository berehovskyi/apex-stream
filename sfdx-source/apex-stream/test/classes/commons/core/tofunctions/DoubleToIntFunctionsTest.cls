/**
 * @see DoubleToIntFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DoubleToIntFunctionsTest {
    
    private static List<Double> doubles = IterTestUtils.generateDoubles();

    /**
     * @see DoubleToIntFunctions.intValue
     * @see DoubleToIntFunctions.round
     */
    @IsTest
    static void default() {
        // Given
        IDoubleToIntFunction intValue = DoubleToIntFunctions.intValue();
        IDoubleToIntFunction round = DoubleToIntFunctions.round();
        // Then
        new DoubleToIntFunctions();
        for (Double d : doubles) {
            Validate.assertEquals(d.intValue(), intValue.apply(d));
            Validate.assertEquals(Math.round(d), round.apply(d));
        }
    }
    
}
