/**
 * @see LongBinaryOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class LongBinaryOperatorsTest {

    private static List<Long> input = IterTestUtils.generateLongs();

    /**
     * @see LongBinaryOperators.max
     * @see LongBinaryOperators.min
     * @see LongBinaryOperators.sum
     * @see LongBinaryOperators.product
     */
    @IsTest
    static void operators() {
        // When
        new LongBinaryOperators();
        ILongBinaryOperator min = LongBinaryOperators.min();
        ILongBinaryOperator max = LongBinaryOperators.max();
        ILongBinaryOperator sum = LongBinaryOperators.sum();
        ILongBinaryOperator product = LongBinaryOperators.product();
        // Then
        for (Long l : input) {
            Long src = 5;
            Validate.assertEquals(Math.min(src, l), min.apply(src, l));
            Validate.assertEquals(Math.max(src, l), max.apply(src, l));
            Validate.assertEquals(src + l, sum.apply(src, l));
            Validate.assertEquals(src * l, product.apply(src, l));
        }
    }
    
}
