/**
 * @see LongPredicate
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class LongPredicateTest {

    private static List<Long> input = IterTestUtils.generateLongs2();

    /**
     * @see LongPredicate.orElse
     * @see LongPredicate.andAlso
     * @see LongPredicate.negate
     * @see LongPredicate.always
     */
    @IsTest
    static void default() {
        // Given
        Boolean value = true;
        List<Long> primes = new List<Long>{ 13L, 17L };
        // When
        LongPredicate positivePredicate = LongPredicates.isGreater(0);
        LongPredicate evenPredicate = LongPredicates.isEven();
        LongPredicate primePredicate = LongPredicates.isPrime();
        ILongPredicate alwaysPredicate = LongPredicate.always(value);
        ILongPredicate positiveAndEvenPredicate = positivePredicate.andAlso(evenPredicate);
        ILongPredicate positiveAndEvenPredicate1 = LongPredicate.every(new List<ILongPredicate>{ positivePredicate, evenPredicate });
        ILongPredicate positiveOrEvenPredicate = positivePredicate.orElse(evenPredicate);
        ILongPredicate positiveOrEvenPredicate1 = LongPredicate.some(new List<ILongPredicate>{ positivePredicate, evenPredicate });
        ILongPredicate notPositivePredicate = positivePredicate.negate();
        ILongPredicate notPositivePredicate1 = LongPredicate.negate(positivePredicate);
        ILongPredicate positiveEvenOrJustPrimePredicate = positivePredicate.andAlso(evenPredicate).orElse(primePredicate); // (1 AND 2) OR 3
        ILongPredicate positiveEvenOrPrimePredicate = positivePredicate.andAlso(evenPredicate.orElse(primePredicate)); // 1 AND (2 OR 3)
        // Then
        for (Long l : input) {
            Validate.assertEquals(l > 0, positivePredicate.test(l));
            Validate.assertEquals(Math.mod(l, 2) == 0, evenPredicate.test(l));
            Validate.assertEquals(primes.contains(l), primePredicate.test(l));
            Validate.assertEquals(value, alwaysPredicate.test(l));
            Validate.assertEquals(l > 0 && Math.mod(l, 2) == 0, positiveAndEvenPredicate.test(l));
            Validate.assertEquals(l > 0 && Math.mod(l, 2) == 0, positiveAndEvenPredicate1.test(l));
            Validate.assertEquals(l > 0 || Math.mod(l, 2) == 0, positiveOrEvenPredicate.test(l));
            Validate.assertEquals(l > 0 || Math.mod(l, 2) == 0, positiveOrEvenPredicate1.test(l));
            Validate.assertEquals(!(l > 0), notPositivePredicate.test(l));
            Validate.assertEquals(!(l > 0), notPositivePredicate1.test(l));
            Validate.assertEquals(l > 0 && Math.mod(l, 2) == 0 || primes.contains(l), positiveEvenOrJustPrimePredicate.test(l));
            Validate.assertEquals(l > 0 && (Math.mod(l, 2) == 0 || primes.contains(l)), positiveEvenOrPrimePredicate.test(l));
        }
    }

}
