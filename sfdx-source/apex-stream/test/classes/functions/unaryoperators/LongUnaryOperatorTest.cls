/**
 * @see LongUnaryOperator
 *
 * @author Oleh Berehovskyi
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
    static void default() {
        // Given
        Long constant = 10L;
        Long factor = 2L;
        // When
        ILongUnaryOperator identity = LongUnaryOperator.identity();
        ILongUnaryOperator of10 = LongUnaryOperator.constant(constant);
        LongUnaryOperator incOperator = new IterTestUtils.AddLongOp(1);
        LongUnaryOperator multiply = new IterTestUtils.MultiplyLongOp(factor);
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

}
