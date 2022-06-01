/**
 * @author Oleh Berehovskyi
 * @see LongUnaryOperator
 */
@IsTest(IsParallel = true)
private class LongUnaryOperatorTest {

    private static List<Long> input = IterTestUtils.generateLongs();

    /**
     * @see LongUnaryOperator.andThen
     * @see LongUnaryOperator.compose
     * @see LongUnaryOperator.identity
     * @see LongUnaryOperator.constant
     */
    @IsTest
    static void defaultMethods() {
        // Given
        Long constant = 10L;
        Long factor = 2L;
        // When
        ILongUnaryOperator identity = LongUnaryOperator.identity();
        ILongUnaryOperator of10 = LongUnaryOperator.constant(constant);
        LongUnaryOperator incOperator = LongUnaryOperator.increment();
        LongUnaryOperator multiply = LongUnaryOperator.multiply(factor);
        ILongUnaryOperator operator = incOperator.andThen(multiply);
        ILongUnaryOperator operator1 = multiply.compose(incOperator);
        ILongUnaryOperator operator2 = LongUnaryOperator.compose(new List<ILongUnaryOperator>{ incOperator, multiply });
        // Then
        for (Long l : input) {
            Validate.assertEquals(l, identity.apply(l));
            Validate.assertEquals(constant, of10.apply(l));
            Validate.assertEquals(l + 1, incOperator.apply(l));
            Validate.assertEquals(l * factor, multiply.apply(l));
            Validate.assertEquals((l + 1) * 2, operator.apply(l));
            Validate.assertEquals((l + 1) * 2, operator1.apply(l));
            Validate.assertEquals((l + 1) * 2, operator2.apply(l));
        }
    }

    /**
     * @see LongUnaryOperator.abs
     * @see LongUnaryOperator.add
     * @see LongUnaryOperator.decrement
     * @see LongUnaryOperator.divide
     * @see LongUnaryOperator.increment
     * @see LongUnaryOperator.max
     * @see LongUnaryOperator.min
     * @see LongUnaryOperator.mod
     * @see LongUnaryOperator.multiply
     * @see LongUnaryOperator.subtract
     */
    @IsTest
    static void longUnaryOperators() {
        // Given
        Long inc = 10L;
        Long div = 2L;
        Long lim = 5L;
        // Then
        for (Long l : input) {
            Validate.assertEquals(Math.abs(l), LongUnaryOperator.abs().apply(l));
            Validate.assertEquals(l + inc, LongUnaryOperator.add(inc).apply(l));
            Validate.assertEquals(l - 1, LongUnaryOperator.decrement().apply(l));
            Validate.assertEquals(l / div, LongUnaryOperator.divide(div).apply(l));
            Validate.assertEquals(l + 1, LongUnaryOperator.increment().apply(l));
            Validate.assertEquals(Math.max(l, lim), LongUnaryOperator.max(lim).apply(l));
            Validate.assertEquals(Math.min(l, lim), LongUnaryOperator.min(lim).apply(l));
            Validate.assertEquals(Math.mod(l, div), LongUnaryOperator.mod(div).apply(l));
            Validate.assertEquals(l * div, LongUnaryOperator.multiply(div).apply(l));
            Validate.assertEquals(l - inc, LongUnaryOperator.subtract(inc).apply(l));
        }
    }

}
