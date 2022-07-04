/**
 * @see IntUnaryOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class IntUnaryOperatorsTest {

    private static List<Integer> input = IterTestUtils.generateInts();

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
        new IntUnaryOperators();
        for (Integer i : input) {
            Validate.assertEquals(Math.abs(i), IntUnaryOperators.abs().apply(i));
            Validate.assertEquals(i + inc, IntUnaryOperators.add(inc).apply(i));
            Validate.assertEquals(i - 1, IntUnaryOperators.decrement().apply(i));
            Validate.assertEquals(i / div, IntUnaryOperators.divide(div).apply(i));
            Validate.assertEquals(i + 1, IntUnaryOperators.increment().apply(i));
            Validate.assertEquals(Math.max(i, lim), IntUnaryOperators.max(lim).apply(i));
            Validate.assertEquals(Math.min(i, lim), IntUnaryOperators.min(lim).apply(i));
            Validate.assertEquals(Math.mod(i, div), IntUnaryOperators.mod(div).apply(i));
            Validate.assertEquals(i * div, IntUnaryOperators.multiply(div).apply(i));
            Validate.assertEquals(i - inc, IntUnaryOperators.subtract(inc).apply(i));
        }
    }
    
}
