/**
 * @see IntPredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class IntPredicatesTest {

    private static List<Integer> input = IterTestUtils.generateInts2();

    /**
     * @see IntPredicates.isGreater
     * @see IntPredicates.isGreaterOrEqual
     * @see IntPredicates.isEqual
     * @see IntPredicates.isLess
     * @see IntPredicates.isLessOrEqual
     * @see IntPredicates.isIn
     * @see IntPredicates.isNotEqual
     * @see IntPredicates.isNotIn
     * @see IntPredicates.isNull
     * @see IntPredicates.isNotNull
     * @see IntPredicates.isEven
     * @see IntPredicates.isFactorOf
     * @see IntPredicates.isOdd
     * @see IntPredicates.isPrime
     * @see IntPredicates.hasDivisor
     */
    @IsTest
    static void predicates() {
        // Given
        Integer value = 1;
        Integer value1 = 13;
        Integer value2 = 0;
        Integer value3 = 10;
        Integer value4 = 3;
        List<Integer> subList = new List<Integer>{ -5, 11 };
        List<Integer> primes = new List<Integer>{ 13, 17 };
        new IntPredicates();
        // Then
        for (Integer i : input) {
            Validate.assertEquals(i > value, IntPredicates.isGreater(value).test(i));
            Validate.assertEquals(i >= value, IntPredicates.isGreaterOrEqual(value).test(i));
            Validate.assertEquals(i < value, IntPredicates.isLess(value).test(i));
            Validate.assertEquals(i <= value, IntPredicates.isLessOrEqual(value).test(i));
            Validate.assertEquals(i == value1, IntPredicates.isEqual(value1).test(i));
            Validate.assertEquals(i != value1, IntPredicates.isNotEqual(value1).test(i));
            Validate.assertEquals(subList.contains(i), IntPredicates.isIn(subList).test(i));
            Validate.assertEquals(!subList.contains(i), IntPredicates.isNotIn(subList).test(i));
            Validate.assertEquals(i == null, IntPredicates.isNull().test(i));
            Validate.assertEquals(i != null, IntPredicates.isNotNull().test(i));
            Validate.assertEquals(Math.mod(i, 2) == 0, IntPredicates.isEven().test(i));
            Validate.assertEquals(i != 0 && Math.mod(value3, i) == 0, IntPredicates.isNotEqual(value2).andAlso(IntPredicates.isFactorOf(value3)).test(i));
            Validate.assertEquals(Math.mod(i, 2) != 0, IntPredicates.isOdd().test(i));
            Validate.assertEquals(primes.contains(i), IntPredicates.isPrime().test(i));
            Validate.assertEquals(Math.mod(i, value4) == 0, IntPredicates.hasDivisor(value4).test(i));
        }
    }
    
}
