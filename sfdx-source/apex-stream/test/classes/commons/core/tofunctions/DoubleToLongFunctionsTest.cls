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
            Assert.areEqual(d.longValue(), longValue.apply(d));
            Assert.areEqual(Math.roundToLong(d), round.apply(d));
        }
    }
    
}
