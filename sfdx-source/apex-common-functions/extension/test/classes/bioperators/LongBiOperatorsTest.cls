/**
 * @see LongBiOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage')
private class LongBiOperatorsTest {

    private static final List<Long> INPUT = AfTestData.generateLongs();

    static {
        new LongBiOperators();
    }

    /**
     * @see LongBiOperators.max
     * @see LongBiOperators.min
     * @see LongBiOperators.sum
     * @see LongBiOperators.product
     */
    @IsTest
    static void operators() {
        // When
        IBiOperator min = LongBiOperators.min();
        IBiOperator max = LongBiOperators.max();
        IBiOperator sum = LongBiOperators.sum();
        IBiOperator product = LongBiOperators.product();
        // Then
        for (Long l : INPUT) {
            Long src = 5;
            Assert.areEqual(Math.min(src, l), min.apply(src, l));
            Assert.areEqual(Math.max(src, l), max.apply(src, l));
            Assert.areEqual(src + l, sum.apply(src, l));
            Assert.areEqual(src * l, product.apply(src, l));
        }
    }
    
}
