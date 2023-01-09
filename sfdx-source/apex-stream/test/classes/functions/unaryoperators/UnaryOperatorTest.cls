/**
 * @see UnaryOperator
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class UnaryOperatorTest {

    private static final List<Object> INTS = IterTestUtils.generateInts();
    private static final List<Object> ACCOUNTS = IterTestUtils.generateAccounts();

    /**
     * @see UnaryOperator.andThen
     * @see UnaryOperator.compose
     * @see UnaryOperator.identity
     * @see UnaryOperator.constant
     * @see UnaryOperator.compose
     */
    @IsTest
    static void default() {
        // Given
        Integer factor = 2;
        Object constant = '1';
        // When
        IUnaryOperator identity = UnaryOperator.identity();
        IUnaryOperator ofConst = UnaryOperator.constant(constant);
        UnaryOperator incOperator = UnaryOperator.compose(new IterTestUtils.AddIntOp(1));
        UnaryOperator x2IntOperator = UnaryOperator.compose(new IterTestUtils.MultiplyIntOp(factor));
        IUnaryOperator x2LongOperator = UnaryOperator.compose(new IterTestUtils.MultiplyLongOp(factor));
        IUnaryOperator x2DoubleOperator = UnaryOperator.compose(new IterTestUtils.MultiplyDoubleOp(factor));
        IUnaryOperator sObjectIdentity = UnaryOperator.compose(SObjectUnaryOperator.identity());
        IUnaryOperator operator = incOperator.andThen(x2IntOperator);
        IUnaryOperator operator1 = x2IntOperator.compose(incOperator);
        IUnaryOperator operator2 = UnaryOperator.compose(new List<IUnaryOperator>{ incOperator, x2IntOperator });
        // Then
        for (Object o : INTS) {
            Assert.areEqual(o, identity.apply(o));
            Assert.areEqual(constant, ofConst.apply(o));
            Assert.areEqual(((Integer) o) + 1, incOperator.apply(o));
            Assert.areEqual(((Integer) o) * factor, x2IntOperator.apply(o));
            Assert.areEqual(((Long) o) * factor, x2LongOperator.apply(o));
            Assert.areEqual(((Double) o) * factor, x2DoubleOperator.apply(o));
            Assert.areEqual((((Integer) o) + 1) * factor, operator.apply(o));
            Assert.areEqual((((Integer) o) + 1) * factor, operator1.apply(o));
            Assert.areEqual((((Integer) o) + 1) * factor, operator2.apply(o));
        }
        for (Object o : ACCOUNTS) {
            Assert.areEqual(o, sObjectIdentity.apply(o));
        }
    }

}
