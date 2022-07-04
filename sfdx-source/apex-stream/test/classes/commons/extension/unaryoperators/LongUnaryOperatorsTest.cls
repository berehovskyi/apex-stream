/**
 * @see LongUnaryOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class LongUnaryOperatorsTest {

    private static List<Long> input = IterTestUtils.generateLongs();

    /**
     * @see LongUnaryOperators.abs
     * @see LongUnaryOperators.add
     * @see LongUnaryOperators.decrement
     * @see LongUnaryOperators.divide
     * @see LongUnaryOperators.increment
     * @see LongUnaryOperators.max
     * @see LongUnaryOperators.min
     * @see LongUnaryOperators.mod
     * @see LongUnaryOperators.multiply
     * @see LongUnaryOperators.subtract
     */
    @IsTest
    static void longUnaryOperators() {
        // Given
        Long inc = 10L;
        Long div = 2L;
        Long lim = 5L;
        // Then
        new LongUnaryOperators();
        for (Long l : input) {
            Validate.assertEquals(Math.abs(l), LongUnaryOperators.abs().apply(l));
            Validate.assertEquals(l + inc, LongUnaryOperators.add(inc).apply(l));
            Validate.assertEquals(l - 1, LongUnaryOperators.decrement().apply(l));
            Validate.assertEquals(l / div, LongUnaryOperators.divide(div).apply(l));
            Validate.assertEquals(l + 1, LongUnaryOperators.increment().apply(l));
            Validate.assertEquals(Math.max(l, lim), LongUnaryOperators.max(lim).apply(l));
            Validate.assertEquals(Math.min(l, lim), LongUnaryOperators.min(lim).apply(l));
            Validate.assertEquals(Math.mod(l, div), LongUnaryOperators.mod(div).apply(l));
            Validate.assertEquals(l * div, LongUnaryOperators.multiply(div).apply(l));
            Validate.assertEquals(l - inc, LongUnaryOperators.subtract(inc).apply(l));
        }
    }
    
}
