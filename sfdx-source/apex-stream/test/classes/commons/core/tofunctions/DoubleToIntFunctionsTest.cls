/**
 * @see DoubleToIntFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DoubleToIntFunctionsTest {
    
    private static final List<Double> INPUT = IterTestUtils.generateDoubles();

    static {
        new DoubleToIntFunctions();
    }

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
        for (Double d : INPUT) {
            Validate.assertEquals(d.intValue(), intValue.apply(d));
            Validate.assertEquals(Math.round(d), round.apply(d));
        }
    }
    
}
