/**
 * @see LongPredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class LongPredicatesTest {

    private static final List<Long> INPUT = IterTestUtils.generateLongs2();

    static {
        new LongPredicates();
    }

    /**
     * @see LongPredicates.isGreater
     * @see LongPredicates.isGreaterOrEqual
     * @see LongPredicates.isEqual
     * @see LongPredicates.isLess
     * @see LongPredicates.isLessOrEqual
     * @see LongPredicates.isIn
     * @see LongPredicates.isNotEqual
     * @see LongPredicates.isNotIn
     * @see LongPredicates.isNull
     * @see LongPredicates.isNotNull
     * @see LongPredicates.isEven
     * @see LongPredicates.isOdd
     * @see LongPredicates.isPrime
     * @see LongPredicates.hasDivisor
     */
    @IsTest
    static void predicates() {
        // Given
        Long value = 1L;
        Long value1 = 13;
        Long value2 = 0;
        Long value3 = 10L;
        Long value4 = 3L;
        List<Long> subList = new List<Long>{ -5L, 11L };
        List<Long> primes = new List<Long>{ 13L, 17L };
        // Then
        for (Long l : INPUT) {
            Validate.assertEquals(l > value, LongPredicates.isGreater(value).test(l));
            Validate.assertEquals(l >= value, LongPredicates.isGreaterOrEqual(value).test(l));
            Validate.assertEquals(l < value, LongPredicates.isLess(value).test(l));
            Validate.assertEquals(l <= value, LongPredicates.isLessOrEqual(value).test(l));
            Validate.assertEquals(l == value1, LongPredicates.isEqual(value1).test(l));
            Validate.assertEquals(l != value1, LongPredicates.isNotEqual(value1).test(l));
            Validate.assertEquals(subList.contains(l), LongPredicates.isIn(subList).test(l));
            Validate.assertEquals(!subList.contains(l), LongPredicates.isNotIn(subList).test(l));
            Validate.assertEquals(l == null, LongPredicates.isNull().test(l));
            Validate.assertEquals(l != null, LongPredicates.isNotNull().test(l));
            Validate.assertEquals(Math.mod(l, 2) == 0, LongPredicates.isEven().test(l));
            Validate.assertEquals(l != 0 && Math.mod(value3, l) == 0, LongPredicates.isNotEqual(value2).andAlso(LongPredicates.isFactorOf(value3)).test(l));
            Validate.assertEquals(Math.mod(l, 2) != 0, LongPredicates.isOdd().test(l));
            Validate.assertEquals(primes.contains(l), LongPredicates.isPrime().test(l));
            Validate.assertEquals(Math.mod(l, value4) == 0, LongPredicates.hasDivisor(value4).test(l));
        }
    }
    
}
