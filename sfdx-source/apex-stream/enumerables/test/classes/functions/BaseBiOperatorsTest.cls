/**
 * @see BaseBiOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage, PMD.CognitiveComplexity')
private class BaseBiOperatorsTest {

    private static final List<Integer> INTS = AsTestData.generateInts();
    private static final List<Long> LONGS = AsTestData.generateLongs();
    private static final List<Double> DOUBLES = AsTestData.generateDoubles();

    static {
        new BaseBiOperators();
    }

    /**
     * @see BaseBiOperators.min
     */
    @IsTest
    @SuppressWarnings('PMD.CognitiveComplexity')
    static void min() {
        // When
        BiOperator min = BaseBiOperators.min();
        IBiOperator min1 = BaseBiOperators.min();
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
     * @see BaseBiOperators.max
     */
    @IsTest
    @SuppressWarnings('PMD.CognitiveComplexity')
    static void max() {
        // When
        BiOperator max = BaseBiOperators.max();
        IBiOperator max1 = BaseBiOperators.max();
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
