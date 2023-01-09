/**
 * @see IntUnaryOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class IntUnaryOperatorsTest {

    private static final List<Integer> INPUT = IterTestUtils.generateInts();

    static {
        new IntUnaryOperators();
    }


    /**
     * @see IntUnaryOperators.abs
     * @see IntUnaryOperators.add
     * @see IntUnaryOperators.decrement
     * @see IntUnaryOperators.divide
     * @see IntUnaryOperators.increment
     * @see IntUnaryOperators.max
     * @see IntUnaryOperators.min
     * @see IntUnaryOperators.mod
     * @see IntUnaryOperators.multiply
     * @see IntUnaryOperators.subtract
     */
    @IsTest
    static void intUnaryOperators() {
        // Given
        Integer inc = 10;
        Integer div = 2;
        Integer lim = 5;
        // Then
        for (Integer i : INPUT) {
            Assert.areEqual(Math.abs(i), IntUnaryOperators.abs().apply(i));
            Assert.areEqual(i + inc, IntUnaryOperators.add(inc).apply(i));
            Assert.areEqual(i - 1, IntUnaryOperators.decrement().apply(i));
            Assert.areEqual(i / div, IntUnaryOperators.divide(div).apply(i));
            Assert.areEqual(i + 1, IntUnaryOperators.increment().apply(i));
            Assert.areEqual(Math.max(i, lim), IntUnaryOperators.max(lim).apply(i));
            Assert.areEqual(Math.min(i, lim), IntUnaryOperators.min(lim).apply(i));
            Assert.areEqual(Math.mod(i, div), IntUnaryOperators.mod(div).apply(i));
            Assert.areEqual(i * div, IntUnaryOperators.multiply(div).apply(i));
            Assert.areEqual(i - inc, IntUnaryOperators.subtract(inc).apply(i));
        }
    }
    
}
