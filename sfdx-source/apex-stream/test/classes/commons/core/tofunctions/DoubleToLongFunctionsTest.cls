/**
 * @see DoubleToLongFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DoubleToLongFunctionsTest {
    
    private static final List<Double> INPUT = IterTestUtils.generateDoubles();

    static {
        new DoubleToLongFunctions();
    }
    
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
        for (Double d : INPUT) {
            Validate.assertEquals(d.longValue(), longValue.apply(d));
            Validate.assertEquals(Math.roundToLong(d), round.apply(d));
        }
    }
    
}
