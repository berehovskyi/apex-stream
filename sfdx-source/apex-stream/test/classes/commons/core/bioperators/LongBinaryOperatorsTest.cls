/**
 * @see LongBinaryOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class LongBinaryOperatorsTest {

    private static final List<Long> INPUT = IterTestUtils.generateLongs();

    static {
        new LongBinaryOperators();
    }

    /**
     * @see LongBinaryOperators.max
     * @see LongBinaryOperators.min
     * @see LongBinaryOperators.sum
     * @see LongBinaryOperators.product
     */
    @IsTest
    static void operators() {
        // When
        ILongBinaryOperator min = LongBinaryOperators.min();
        ILongBinaryOperator max = LongBinaryOperators.max();
        ILongBinaryOperator sum = LongBinaryOperators.sum();
        ILongBinaryOperator product = LongBinaryOperators.product();
        // Then
        for (Long l : INPUT) {
            Long src = 5;
            Validate.assertEquals(Math.min(src, l), min.apply(src, l));
            Validate.assertEquals(Math.max(src, l), max.apply(src, l));
            Validate.assertEquals(src + l, sum.apply(src, l));
            Validate.assertEquals(src * l, product.apply(src, l));
        }
    }
    
}
