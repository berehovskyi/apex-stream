/**
 * @see IntBiOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class IntBiOperatorsTest {

    private static final List<Integer> INPUT = AfTestData.generateInts();

    static {
        new IntBiOperators();
    }

    /**
     * @see IntBiOperators.max
     * @see IntBiOperators.min
     * @see IntBiOperators.sum
     * @see IntBiOperators.product
     */
    @IsTest
    static void operators() {
        // When
        IBiOperator min = IntBiOperators.min();
        IBiOperator max = IntBiOperators.max();
        IBiOperator sum = IntBiOperators.sum();
        IBiOperator product = IntBiOperators.product();
        // Then
        for (Integer i : INPUT) {
            Integer src = 5;
            Assert.areEqual(Math.min(src, i), min.apply(src, i));
            Assert.areEqual(Math.max(src, i), max.apply(src, i));
            Assert.areEqual(src + i, sum.apply(src, i));
            Assert.areEqual(src * i, product.apply(src, i));
        }
    }
    
}
