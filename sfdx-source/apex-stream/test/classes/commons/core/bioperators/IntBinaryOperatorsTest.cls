/**
 * @see IntBinaryOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class IntBinaryOperatorsTest {

    private static final List<Integer> INPUT = IterTestUtils.generateInts();

    static {
        new IntBinaryOperators();
    }

    /**
     * @see IntBinaryOperators.max
     * @see IntBinaryOperators.min
     * @see IntBinaryOperators.sum
     * @see IntBinaryOperators.product
     */
    @IsTest
    static void operators() {
        // When
        IIntBinaryOperator min = IntBinaryOperators.min();
        IIntBinaryOperator max = IntBinaryOperators.max();
        IIntBinaryOperator sum = IntBinaryOperators.sum();
        IIntBinaryOperator product = IntBinaryOperators.product();
        // Then
        for (Integer i : INPUT) {
            Integer src = 5;
            Validate.assertEquals(Math.min(src, i), min.apply(src, i));
            Validate.assertEquals(Math.max(src, i), max.apply(src, i));
            Validate.assertEquals(src + i, sum.apply(src, i));
            Validate.assertEquals(src * i, product.apply(src, i));
        }
    }
    
}
