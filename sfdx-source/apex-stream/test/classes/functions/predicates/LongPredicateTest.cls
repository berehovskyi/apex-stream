/**
 * @author O. Berehovskyi
 * @see LongPredicate
 */
@IsTest(IsParallel = true)
private class LongPredicateTest {

    private static List<Long> input = new List<Long>{ 0L, -4L, -5L, 10, 13, -1L, 42L, -9L, 1L, 13L };
    private static List<Long> primes = new List<Long>{ 13L };

    /**
     * @see LongPredicate.orElse
     * @see LongPredicate.andAlso
     * @see LongPredicate.negate
     * @see LongPredicate.always
     */
    @IsTest
    static void defaultMethods() {
        // Given
        Boolean value = true;
        // When
        LongPredicate positivePredicate = LongPredicate.isPositive();
        LongPredicate evenPredicate = LongPredicate.isEven();
        LongPredicate primePredicate = LongPredicate.isPrime();
        ILongPredicate alwaysPredicate = LongPredicate.always(value);
        ILongPredicate positiveAndEvenPredicate = positivePredicate.andAlso(evenPredicate);
        ILongPredicate positiveOrEvenPredicate = positivePredicate.orElse(evenPredicate);
        ILongPredicate notPositivePredicate = positivePredicate.negate();
        ILongPredicate positiveEvenOrJustPrimePredicate = positivePredicate.andAlso(evenPredicate).orElse(primePredicate); // (1 AND 2) OR 3
        ILongPredicate positiveEvenOrPrimePredicate = positivePredicate.andAlso(evenPredicate.orElse(primePredicate)); // 1 AND (2 OR 3)
        // Then
        for (Long l : input) {
            Validate.assertEquals(l > 0, positivePredicate.test(l));
            Validate.assertEquals(Math.mod(l, 2) == 0, evenPredicate.test(l));
            Validate.assertEquals(primes.contains(l), primePredicate.test(l));
            Validate.assertEquals(value, alwaysPredicate.test(l));
            Validate.assertEquals(l > 0 && Math.mod(l, 2) == 0, positiveAndEvenPredicate.test(l));
            Validate.assertEquals(l > 0 || Math.mod(l, 2) == 0, positiveOrEvenPredicate.test(l));
            Validate.assertEquals(!(l > 0), notPositivePredicate.test(l));
            Validate.assertEquals(l > 0 && Math.mod(l, 2) == 0 || primes.contains(l), positiveEvenOrJustPrimePredicate.test(l));
            Validate.assertEquals(l > 0 && (Math.mod(l, 2) == 0 || primes.contains(l)), positiveEvenOrPrimePredicate.test(l));
        }
    }

    /**
     * @see LongPredicate.some
     * @see LongPredicate.every
     * @see LongPredicate.negate
     */
    @IsTest
    static void staticMethods() {
        // Given
        ILongPredicate positivePredicate = LongPredicate.isPositive();
        ILongPredicate evenPredicate = LongPredicate.isEven();
        // Then
        for (Long l : input) {
            Validate.assertEquals(l > 0 || Math.mod(l, 2) == 0, LongPredicate.some(new List<ILongPredicate>{ positivePredicate, evenPredicate }).test(l));
            Validate.assertEquals(l > 0 || Math.mod(l, 2) == 0, LongPredicate.some(positivePredicate, evenPredicate).test(l));
            Validate.assertEquals(l > 0 && Math.mod(l, 2) == 0, LongPredicate.every(new List<ILongPredicate>{ positivePredicate, evenPredicate }).test(l));
            Validate.assertEquals(l > 0 && Math.mod(l, 2) == 0, LongPredicate.every(positivePredicate, evenPredicate).test(l));
            Validate.assertEquals(!(l > 0), LongPredicate.negate(positivePredicate).test(l));
        }
    }

    /**
     * @see LongPredicate.isGreater
     * @see LongPredicate.isGreaterOrEqual
     * @see LongPredicate.isEqual
     * @see LongPredicate.isLess
     * @see LongPredicate.isLessOrEqual
     * @see LongPredicate.isIn
     * @see LongPredicate.isNotEqual
     * @see LongPredicate.isNotIn
     */
    @IsTest
    static void comparisonPredicates() {
        // Given
        Long value = 1L;
        Long value1 = 13;
        List<Long> subList = new List<Long>{ -5L, 11L };
        // Then
        for (Long l : input) {
            Validate.assertEquals(l > value, LongPredicate.isGreater(value).test(l));
            Validate.assertEquals(l >= value, LongPredicate.isGreaterOrEqual(value).test(l));
            Validate.assertEquals(l < value, LongPredicate.isLess(value).test(l));
            Validate.assertEquals(l <= value, LongPredicate.isLessOrEqual(value).test(l));
            Validate.assertEquals(l == value1, LongPredicate.isEqual(value1).test(l));
            Validate.assertEquals(l != value1, LongPredicate.isNotEqual(value1).test(l));
            Validate.assertEquals(subList.contains(l), LongPredicate.isIn(subList).test(l));
            Validate.assertEquals(!subList.contains(l), LongPredicate.isNotIn(subList).test(l));
        }
    }

    /**
     * @see LongPredicate.isNull
     * @see LongPredicate.isNotNull
     * @see LongPredicate.isEven
     * @see LongPredicate.isFactorOf
     * @see LongPredicate.isNegative
     * @see LongPredicate.isNegativeOrZero
     * @see LongPredicate.isOdd
     * @see LongPredicate.isPositive
     * @see LongPredicate.isPositiveOrZero
     * @see LongPredicate.isPrime
     * @see LongPredicate.isZero
     * @see LongPredicate.hasDivisor
     */
    @IsTest
    static void longPredicates() {
        // Given
        Long value = 0;
        Long value1 = 10L;
        Long value2 = 3L;
        // Then
        for (Long l : input) {
            Validate.assertEquals(l == null, LongPredicate.isNull().test(l));
            Validate.assertEquals(l != null, LongPredicate.isNotNull().test(l));
            Validate.assertEquals(Math.mod(l, 2) == 0, LongPredicate.isEven().test(l));
            Validate.assertEquals(l != 0 && Math.mod(value1, l) == 0, LongPredicate.isNotEqual(value).andAlso(LongPredicate.isFactorOf(value1)).test(l));
            Validate.assertEquals(l < 0, LongPredicate.isNegative().test(l));
            Validate.assertEquals(l <= 0, LongPredicate.isNegativeOrZero().test(l));
            Validate.assertEquals(Math.mod(l, 2) != 0, LongPredicate.isOdd().test(l));
            Validate.assertEquals(l > 0, LongPredicate.isPositive().test(l));
            Validate.assertEquals(l >= 0, LongPredicate.isPositiveOrZero().test(l));
            Validate.assertEquals(l == 0, LongPredicate.isZero().test(l));
            Validate.assertEquals(primes.contains(l), LongPredicate.isPrime().test(l));
            Validate.assertEquals(Math.mod(l, value2) == 0, LongPredicate.hasDivisor(value2).test(l));
        }
    }

}
