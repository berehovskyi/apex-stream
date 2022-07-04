/**
 * @see IntUnaryOperator
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class IntUnaryOperatorTest {

    private static List<Integer> input = IterTestUtils.generateInts();

    /**
     * @see IntUnaryOperator.andThen
     * @see IntUnaryOperator.compose
     * @see IntUnaryOperator.identity
     * @see IntUnaryOperator.constant
     */
    @IsTest
    static void default() {
        // Given
        Integer constant = 10;
        Integer factor = 2;
        // When
        IIntUnaryOperator identity = IntUnaryOperator.identity();
        IIntUnaryOperator of10 = IntUnaryOperator.constant(constant);
        IntUnaryOperator incOperator = new IterTestUtils.AddIntOp(1);
        IntUnaryOperator multiplyOperator = new IterTestUtils.MultiplyIntOp(factor);
        IIntUnaryOperator operator = incOperator.andThen(multiplyOperator);
        IIntUnaryOperator operator1 = multiplyOperator.compose(incOperator);
        IIntUnaryOperator operator2 = IntUnaryOperator.compose(new List<IIntUnaryOperator>{ incOperator, multiplyOperator });
        // Then
        for (Integer i : input) {
            Validate.assertEquals(i, identity.apply(i));
            Validate.assertEquals(constant, of10.apply(i));
            Validate.assertEquals(i + 1, incOperator.apply(i));
            Validate.assertEquals(i * factor, multiplyOperator.apply(i));
            Validate.assertEquals((i + 1) * 2, operator.apply(i));
            Validate.assertEquals((i + 1) * 2, operator1.apply(i));
            Validate.assertEquals((i + 1) * 2, operator2.apply(i));
        }
    }

}
