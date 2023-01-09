/**
 * @see LongUnaryOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class LongUnaryOperatorsTest {

    private static final List<Long> INPUT = IterTestUtils.generateLongs();

    static {
        new LongUnaryOperators();
    }

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
        for (Long l : INPUT) {
            Assert.areEqual(Math.abs(l), LongUnaryOperators.abs().apply(l));
            Assert.areEqual(l + inc, LongUnaryOperators.add(inc).apply(l));
            Assert.areEqual(l - 1, LongUnaryOperators.decrement().apply(l));
            Assert.areEqual(l / div, LongUnaryOperators.divide(div).apply(l));
            Assert.areEqual(l + 1, LongUnaryOperators.increment().apply(l));
            Assert.areEqual(Math.max(l, lim), LongUnaryOperators.max(lim).apply(l));
            Assert.areEqual(Math.min(l, lim), LongUnaryOperators.min(lim).apply(l));
            Assert.areEqual(Math.mod(l, div), LongUnaryOperators.mod(div).apply(l));
            Assert.areEqual(l * div, LongUnaryOperators.multiply(div).apply(l));
            Assert.areEqual(l - inc, LongUnaryOperators.subtract(inc).apply(l));
        }
    }
    
}
