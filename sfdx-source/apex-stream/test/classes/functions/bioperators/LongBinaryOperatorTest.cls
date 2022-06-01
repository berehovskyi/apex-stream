/**
 * @author Oleh Berehovskyi
 * @see LongBinaryOperator
 */
@IsTest(IsParallel = true)
private class LongBinaryOperatorTest {

    private static List<Long> input = IterTestUtils.generateLongs();

    /**
     * @see LongBinaryOperator.max
     * @see LongBinaryOperator.min
     * @see LongBinaryOperator.sum
     * @see LongBinaryOperator.product
     */
    @IsTest
    static void operators() {
        // When
        ILongBinaryOperator min = LongBinaryOperator.min();
        ILongBinaryOperator max = LongBinaryOperator.max();
        ILongBinaryOperator sum = LongBinaryOperator.sum();
        ILongBinaryOperator product = LongBinaryOperator.product();
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
