/**
 * @author O. Berehovskyi
 * @see IntBinaryOperator
 */
@IsTest(IsParallel = true)
private class IntBinaryOperatorTest {

    private static List<Integer> input = IterTestUtils.generateInts();

    /**
     * @see IntBinaryOperator.max
     * @see IntBinaryOperator.min
     * @see IntBinaryOperator.sum
     * @see IntBinaryOperator.product
     */
    @IsTest
    static void operators() {
        // When
        IIntBinaryOperator min = IntBinaryOperator.min();
        IIntBinaryOperator max = IntBinaryOperator.max();
        IIntBinaryOperator sum = IntBinaryOperator.sum();
        IIntBinaryOperator product = IntBinaryOperator.product();
        // Then
        for (Integer i : input) {
            Integer src = 5;
            Validate.assertEquals(Math.min(src, i), min.apply(src, i));
            Validate.assertEquals(Math.max(src, i), max.apply(src, i));
            Validate.assertEquals(src + i, sum.apply(src, i));
            Validate.assertEquals(src * i, product.apply(src, i));
        }
    }
}
