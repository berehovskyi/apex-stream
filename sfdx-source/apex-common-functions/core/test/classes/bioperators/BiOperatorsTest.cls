/**
 * @see BiOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings(
    'PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage, PMD.ApexUnitTestClassShouldHaveRunAs, PMD.CognitiveComplexity'
)
private class BiOperatorsTest {

    private static final List<Integer> INTS = AsTestData.generateInts();
    private static final List<Long> LONGS = AsTestData.generateLongs();
    private static final List<Double> DOUBLES = AsTestData.generateDoubles();

    static {
        new BiOperators();
    }

    /**
     * @see BiOperators.min
     */
    @IsTest
    @SuppressWarnings('PMD.OneDeclarationPerLine')
    static void min() {
        // When
        BiOperator min = BiOperators.min();
        IBiOperator min1 = BiOperators.min();
        // Then
        for (Integer i = 0, size = INTS.size(); i < size; i++) {
            Integer d = INTS[i];
            Integer src = 5;
            Assert.areEqual(Math.min(src, d), min.apply(src, d));
            Assert.areEqual(Math.min(src, d), min1.apply(src, d));
        }
        for (Integer i = 0, size = LONGS.size(); i < size; i++) {
            Long d = LONGS[i];
            Long src = 5L;
            Assert.areEqual(Math.min(src, d), min.apply(src, d));
            Assert.areEqual(Math.min(src, d), min1.apply(src, d));
        }
        for (Integer i = 0, size = DOUBLES.size(); i < size; i++) {
            Double d = DOUBLES[i];
            Double src = 5.0;
            Assert.areEqual(Math.min(src, d), min.apply(src, d));
            Assert.areEqual(Math.min(src, d), min1.apply(src, d));
        }
    }

    /**
     * @see BiOperators.max
     */
    @IsTest
    @SuppressWarnings('PMD.OneDeclarationPerLine')
    static void max() {
        // When
        BiOperator max = BiOperators.max();
        IBiOperator max1 = BiOperators.max();
        // Then
        for (Integer i = 0, size = INTS.size(); i < size; i++) {
            Integer d = INTS[i];
            Integer src = 5;
            Assert.areEqual(Math.max(src, d), max.apply(src, d));
            Assert.areEqual(Math.max(src, d), max1.apply(src, d));
        }
        for (Integer i = 0, size = LONGS.size(); i < size; i++) {
            Long d = LONGS[i];
            Long src = 5L;
            Assert.areEqual(Math.max(src, d), max.apply(src, d));
            Assert.areEqual(Math.max(src, d), max1.apply(src, d));
        }
        for (Integer i = 0, size = DOUBLES.size(); i < size; i++) {
            Double d = DOUBLES[i];
            Double src = 5.0;
            Assert.areEqual(Math.max(src, d), max.apply(src, d));
            Assert.areEqual(Math.max(src, d), max1.apply(src, d));
        }
    }

}
