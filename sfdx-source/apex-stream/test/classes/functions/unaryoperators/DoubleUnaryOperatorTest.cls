/**
 * @see DoubleUnaryOperator
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DoubleUnaryOperatorTest {

    private static final List<Double> INPUT = IterTestUtils.generateDoubles();

    /**
     * @see DoubleUnaryOperator.andThen
     * @see DoubleUnaryOperator.compose
     * @see DoubleUnaryOperator.identity
     * @see DoubleUnaryOperator.constant
     */
    @IsTest
    static void default() {
        // Given
        Double inc = 1;
        Double factor = 2;
        Double constant = 10.00;
        // When
        IDoubleUnaryOperator identity = DoubleUnaryOperator.identity();
        IDoubleUnaryOperator of1 = DoubleUnaryOperator.constant(constant);
        DoubleUnaryOperator incOperator = new IterTestUtils.AddDoubleOp(inc);
        DoubleUnaryOperator x2IntOperator = new IterTestUtils.MultiplyDoubleOp(factor);
        IDoubleUnaryOperator operator = incOperator.andThen(x2IntOperator);
        IDoubleUnaryOperator operator1 = x2IntOperator.compose(incOperator);
        IDoubleUnaryOperator operator2 = DoubleUnaryOperator.compose(new List<IDoubleUnaryOperator>{ incOperator, x2IntOperator });
        // Then
        for (Double d : INPUT) {
            Assert.areEqual(d, identity.apply(d));
            Assert.areEqual(constant, of1.apply(d));
            Assert.areEqual(d + inc, incOperator.apply(d));
            Assert.areEqual(d * factor, x2IntOperator.apply(d));
            Assert.areEqual((d + inc) * factor, operator.apply(d));
            Assert.areEqual((d + inc) * factor, operator1.apply(d));
            Assert.areEqual((d + inc) * factor, operator2.apply(d));
        }
    }

}
