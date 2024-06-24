/**
 * @see IntOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexAssertionsShouldIncludeMessage')
private class IntOperatorsTest {

    private static final List<Integer> INPUT = AfTestData.generateInts();

    static {
        new IntOperators();
    }

    /**
     * @see IntOperators.abs
     * @see IntOperators.add
     * @see IntOperators.decrement
     * @see IntOperators.divide
     * @see IntOperators.increment
     * @see IntOperators.max
     * @see IntOperators.min
     * @see IntOperators.mod
     * @see IntOperators.multiply
     * @see IntOperators.subtract
     */
    @IsTest
    @SuppressWarnings('PMD.ApexUnitTestClassShouldHaveRunAs')
    static void intUnaryOperators() {
        // Given
        Integer inc = 10;
        Integer div = 2;
        Integer lim = 5;
        // Then
        for (Integer i : INPUT) {
            Assert.areEqual(Math.abs(i), IntOperators.abs().apply(i));
            Assert.areEqual(i + inc, IntOperators.add(inc).apply(i));
            Assert.areEqual(i - 1, IntOperators.decrement().apply(i));
            Assert.areEqual(i / div, IntOperators.divide(div).apply(i));
            Assert.areEqual(i + 1, IntOperators.increment().apply(i));
            Assert.areEqual(Math.max(i, lim), IntOperators.max(lim).apply(i));
            Assert.areEqual(Math.min(i, lim), IntOperators.min(lim).apply(i));
            Assert.areEqual(Math.mod(i, div), IntOperators.mod(div).apply(i));
            Assert.areEqual(i * div, IntOperators.multiply(div).apply(i));
            Assert.areEqual(i - inc, IntOperators.subtract(inc).apply(i));
        }
    }

}
