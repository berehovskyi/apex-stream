/**
 * @author Oleh Berehovskyi
 * @see IntPredicate
 */
@IsTest(IsParallel = true)
private class IntPredicateTest {

    private static List<Integer> input = new List<Integer>{ 0, -4, -5, 10, 13, -1, 4, -9, 1, 13 };
    private static List<Integer> primes = new List<Integer>{ 13 };

    /**
     * @see IntPredicate.orElse
     * @see IntPredicate.andAlso
     * @see IntPredicate.negate
     * @see IntPredicate.always
     */
    @IsTest
    static void defaultMethods() {
        // Given
        Boolean value = true;
        // When
        IntPredicate positivePredicate = IntPredicate.isPositive();
        IntPredicate evenPredicate = IntPredicate.isEven();
        IntPredicate primePredicate = IntPredicate.isPrime();
        IIntPredicate alwaysPredicate = IntPredicate.always(value);
        IIntPredicate positiveAndEvenPredicate = positivePredicate.andAlso(evenPredicate);
        IIntPredicate positiveOrEvenPredicate = positivePredicate.orElse(evenPredicate);
        IIntPredicate notPositivePredicate = positivePredicate.negate();
        IIntPredicate positiveEvenOrJustPrimePredicate = positivePredicate.andAlso(evenPredicate).orElse(primePredicate); // (1 AND 2) OR 3
        IIntPredicate positiveEvenOrPrimePredicate = positivePredicate.andAlso(evenPredicate.orElse(primePredicate)); // 1 AND (2 OR 3)
        // Then
        for (Integer i : input) {
            Validate.assertEquals(i > 0, positivePredicate.test(i));
            Validate.assertEquals(Math.mod(i, 2) == 0, evenPredicate.test(i));
            Validate.assertEquals(primes.contains(i), primePredicate.test(i));
            Validate.assertEquals(value, alwaysPredicate.test(i));
            Validate.assertEquals(i > 0 && Math.mod(i, 2) == 0, positiveAndEvenPredicate.test(i));
            Validate.assertEquals(i > 0 || Math.mod(i, 2) == 0, positiveOrEvenPredicate.test(i));
            Validate.assertEquals(!(i > 0), notPositivePredicate.test(i));
            Validate.assertEquals(i > 0 && Math.mod(i, 2) == 0 || primes.contains(i), positiveEvenOrJustPrimePredicate.test(i));
            Validate.assertEquals(i > 0 && (Math.mod(i, 2) == 0 || primes.contains(i)), positiveEvenOrPrimePredicate.test(i));
        }
    }

    /**
     * @see IntPredicate.some
     * @see IntPredicate.every
     * @see IntPredicate.negate
     */
    @IsTest
    static void staticMethods() {
        // Given
        IIntPredicate positivePredicate = IntPredicate.isPositive();
        IIntPredicate evenPredicate = IntPredicate.isEven();
        // Then
        for (Integer i : input) {
            Validate.assertEquals(i > 0 || Math.mod(i, 2) == 0, IntPredicate.some(new List<IIntPredicate>{ positivePredicate, evenPredicate }).test(i));
            Validate.assertEquals(i > 0 && Math.mod(i, 2) == 0, IntPredicate.every(new List<IIntPredicate>{ positivePredicate, evenPredicate }).test(i));
            Validate.assertEquals(!(i > 0), IntPredicate.negate(positivePredicate).test(i));
        }
    }

    /**
     * @see IntPredicate.isGreater
     * @see IntPredicate.isGreaterOrEqual
     * @see IntPredicate.isEqual
     * @see IntPredicate.isLess
     * @see IntPredicate.isLessOrEqual
     * @see IntPredicate.isIn
     * @see IntPredicate.isNotEqual
     * @see IntPredicate.isNotIn
     */
    @IsTest
    static void comparisonPredicates() {
        // Given
        Integer value = 1;
        Integer value1 = 13;
        List<Integer> subList = new List<Integer>{ -5, 11 };
        // Then
        for (Integer i : input) {
            Validate.assertEquals(i > value, IntPredicate.isGreater(value).test(i));
            Validate.assertEquals(i >= value, IntPredicate.isGreaterOrEqual(value).test(i));
            Validate.assertEquals(i < value, IntPredicate.isLess(value).test(i));
            Validate.assertEquals(i <= value, IntPredicate.isLessOrEqual(value).test(i));
            Validate.assertEquals(i == value1, IntPredicate.isEqual(value1).test(i));
            Validate.assertEquals(i != value1, IntPredicate.isNotEqual(value1).test(i));
            Validate.assertEquals(subList.contains(i), IntPredicate.isIn(subList).test(i));
            Validate.assertEquals(!subList.contains(i), IntPredicate.isNotIn(subList).test(i));
        }
    }

    /**
     * @see IntPredicate.isNull
     * @see IntPredicate.isNotNull
     * @see IntPredicate.isEven
     * @see IntPredicate.isFactorOf
     * @see IntPredicate.isNegative
     * @see IntPredicate.isNegativeOrZero
     * @see IntPredicate.isOdd
     * @see IntPredicate.isPositive
     * @see IntPredicate.isPositiveOrZero
     * @see IntPredicate.isPrime
     * @see IntPredicate.isZero
     * @see IntPredicate.hasDivisor
     */
    @IsTest
    static void intPredicates() {
        // Given
        Integer value = 0;
        Integer value1 = 10;
        Integer value2 = 3;
        // Then
        for (Integer i : input) {
            Validate.assertEquals(i == null, IntPredicate.isNull().test(i));
            Validate.assertEquals(i != null, IntPredicate.isNotNull().test(i));
            Validate.assertEquals(Math.mod(i, 2) == 0, IntPredicate.isEven().test(i));
            Validate.assertEquals(i != 0 && Math.mod(value1, i) == 0, IntPredicate.isNotEqual(value).andAlso(IntPredicate.isFactorOf(value1)).test(i));
            Validate.assertEquals(i < 0, IntPredicate.isNegative().test(i));
            Validate.assertEquals(i <= 0, IntPredicate.isNegativeOrZero().test(i));
            Validate.assertEquals(Math.mod(i, 2) != 0, IntPredicate.isOdd().test(i));
            Validate.assertEquals(i > 0, IntPredicate.isPositive().test(i));
            Validate.assertEquals(i >= 0, IntPredicate.isPositiveOrZero().test(i));
            Validate.assertEquals(primes.contains(i), IntPredicate.isPrime().test(i));
            Validate.assertEquals(Math.mod(i, value2) == 0, IntPredicate.hasDivisor(value2).test(i));
        }
    }

}
