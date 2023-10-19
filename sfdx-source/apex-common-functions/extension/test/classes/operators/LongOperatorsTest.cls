/**
 * @see LongOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class LongOperatorsTest {

    private static final List<Long> INPUT = AfTestData.generateLongs();

    static {
        new LongOperators();
    }

    /**
     * @see LongOperators.abs
     * @see LongOperators.add
     * @see LongOperators.decrement
     * @see LongOperators.divide
     * @see LongOperators.increment
     * @see LongOperators.max
     * @see LongOperators.min
     * @see LongOperators.mod
     * @see LongOperators.multiply
     * @see LongOperators.subtract
     */
    @IsTest
    static void longUnaryOperators() {
        // Given
        Long inc = 10L;
        Long div = 2L;
        Long lim = 5L;
        // Then
        for (Long l : INPUT) {
            Assert.areEqual(Math.abs(l), LongOperators.abs().apply(l));
            Assert.areEqual(l + inc, LongOperators.add(inc).apply(l));
            Assert.areEqual(l - 1, LongOperators.decrement().apply(l));
            Assert.areEqual(l / div, LongOperators.divide(div).apply(l));
            Assert.areEqual(l + 1, LongOperators.increment().apply(l));
            Assert.areEqual(Math.max(l, lim), LongOperators.max(lim).apply(l));
            Assert.areEqual(Math.min(l, lim), LongOperators.min(lim).apply(l));
            Assert.areEqual(Math.mod(l, div), LongOperators.mod(div).apply(l));
            Assert.areEqual(l * div, LongOperators.multiply(div).apply(l));
            Assert.areEqual(l - inc, LongOperators.subtract(inc).apply(l));
        }
    }
    
}
