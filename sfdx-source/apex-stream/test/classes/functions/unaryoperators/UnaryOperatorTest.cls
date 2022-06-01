/**
 * @author Oleh Berehovskyi
 * @see UnaryOperator
 */
@IsTest(IsParallel = true)
private class UnaryOperatorTest {

    private static List<Object> input = IterTestUtils.generateInts();
    private static List<Object> input1 = IterTestUtils.generateAccounts();

    /**
     * @see UnaryOperator.andThen
     * @see UnaryOperator.compose
     * @see UnaryOperator.identity
     * @see UnaryOperator.constant
     * @see UnaryOperator.upcast
     */
    @IsTest
    static void defaultMethods() {
        // Given
        Integer factor = 2;
        Object constant = '1';
        // When
        IUnaryOperator identity = UnaryOperator.identity();
        IUnaryOperator ofConst = UnaryOperator.constant(constant);
        UnaryOperator incOperator = UnaryOperator.upcast(IntUnaryOperator.increment());
        UnaryOperator x2IntOperator = UnaryOperator.upcast(IntUnaryOperator.multiply(factor));
        IUnaryOperator x2LongOperator = UnaryOperator.upcast(LongUnaryOperator.multiply(factor));
        IUnaryOperator x2DoubleOperator = UnaryOperator.upcast(DoubleUnaryOperator.multiply(factor));
        IUnaryOperator sObjectIdentity = UnaryOperator.upcast(SObjectUnaryOperator.identity());
        IUnaryOperator operator = incOperator.andThen(x2IntOperator);
        IUnaryOperator operator1 = x2IntOperator.compose(incOperator);
        IUnaryOperator operator2 = UnaryOperator.compose(new List<IUnaryOperator>{ incOperator, x2IntOperator });
        // Then
        for (Object o : input) {
            Validate.assertEquals(o, identity.apply(o));
            Validate.assertEquals(constant, ofConst.apply(o));
            Validate.assertEquals(((Integer) o) + 1, incOperator.apply(o));
            Validate.assertEquals(((Integer) o) * factor, x2IntOperator.apply(o));
            Validate.assertEquals(((Long) o) * factor, x2LongOperator.apply(o));
            Validate.assertEquals(((Double) o) * factor, x2DoubleOperator.apply(o));
            Validate.assertEquals((((Integer) o) + 1) * factor, operator.apply(o));
            Validate.assertEquals((((Integer) o) + 1) * factor, operator1.apply(o));
            Validate.assertEquals((((Integer) o) + 1) * factor, operator2.apply(o));
        }
        for (Object o : input1) {
            Validate.assertEquals(o, sObjectIdentity.apply(o));
        }
    }

}
