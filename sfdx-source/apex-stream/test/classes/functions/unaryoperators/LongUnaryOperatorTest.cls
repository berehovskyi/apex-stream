/**
 * @see LongUnaryOperator
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class LongUnaryOperatorTest {

    private static final List<Long> INPUT = IterTestUtils.generateLongs();

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
        for (Long l : INPUT) {
            Assert.areEqual(l, identity.apply(l));
            Assert.areEqual(constant, of10.apply(l));
            Assert.areEqual(l + 1, incOperator.apply(l));
            Assert.areEqual(l * factor, multiply.apply(l));
            Assert.areEqual((l + 1) * 2, operator.apply(l));
            Assert.areEqual((l + 1) * 2, operator1.apply(l));
            Assert.areEqual((l + 1) * 2, operator2.apply(l));
        }
    }

}
