/**
 * @author O. Berehovskyi
 * @see IntUnaryOperator
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
    static void defaultMethods() {
        // Given
        Integer constant = 10;
        Integer factor = 2;
        // When
        IIntUnaryOperator identity = IntUnaryOperator.identity();
        IIntUnaryOperator of10 = IntUnaryOperator.constant(constant);
        IntUnaryOperator incOperator = IntUnaryOperator.increment();
        IntUnaryOperator multiplyOperator = IntUnaryOperator.multiply(factor);
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

    /**
     * @see IntUnaryOperator.abs
     * @see IntUnaryOperator.add
     * @see IntUnaryOperator.decrement
     * @see IntUnaryOperator.divide
     * @see IntUnaryOperator.increment
     * @see IntUnaryOperator.max
     * @see IntUnaryOperator.min
     * @see IntUnaryOperator.mod
     * @see IntUnaryOperator.multiply
     * @see IntUnaryOperator.subtract
     */
    @IsTest
    static void intUnaryOperators() {
        // Given
        Integer inc = 10;
        Integer div = 2;
        Integer lim = 5;
        // Then
        for (Integer i : input) {
            Validate.assertEquals(Math.abs(i), IntUnaryOperator.abs().apply(i));
            Validate.assertEquals(i + inc, IntUnaryOperator.add(inc).apply(i));
            Validate.assertEquals(i - 1, IntUnaryOperator.decrement().apply(i));
            Validate.assertEquals(i / div, IntUnaryOperator.divide(div).apply(i));
            Validate.assertEquals(i + 1, IntUnaryOperator.increment().apply(i));
            Validate.assertEquals(Math.max(i, lim), IntUnaryOperator.max(lim).apply(i));
            Validate.assertEquals(Math.min(i, lim), IntUnaryOperator.min(lim).apply(i));
            Validate.assertEquals(Math.mod(i, div), IntUnaryOperator.mod(div).apply(i));
            Validate.assertEquals(i * div, IntUnaryOperator.multiply(div).apply(i));
            Validate.assertEquals(i - inc, IntUnaryOperator.subtract(inc).apply(i));
        }
    }

}
