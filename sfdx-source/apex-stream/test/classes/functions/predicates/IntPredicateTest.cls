/**
 * @see IntPredicate
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class IntPredicateTest {

    private static final List<Integer> INPUT = IterTestUtils.generateInts2();

    /**
     * @see IntPredicate.orElse
     * @see IntPredicate.andAlso
     * @see IntPredicate.negate
     * @see IntPredicate.always
     * @see IntPredicate.some
     * @see IntPredicate.every
     * @see IntPredicate.negate
     */
    @IsTest
    static void default() {
        // Given
        Boolean value = true;
        List<Integer> primes = new List<Integer>{ 13, 17 };
        // When
        IntPredicate positivePredicate = IntPredicates.isGreater(0);
        IntPredicate evenPredicate = IntPredicates.isEven();
        IntPredicate primePredicate = IntPredicates.isPrime();
        IIntPredicate alwaysPredicate = IntPredicate.always(value);
        IIntPredicate positiveAndEvenPredicate = positivePredicate.andAlso(evenPredicate);
        IIntPredicate positiveAndEvenPredicate1 = IntPredicate.every(new List<IIntPredicate>{ positivePredicate, evenPredicate });
        IIntPredicate positiveOrEvenPredicate = positivePredicate.orElse(evenPredicate);
        IIntPredicate positiveOrEvenPredicate1 = IntPredicate.some(new List<IIntPredicate>{ positivePredicate, evenPredicate });
        IIntPredicate notPositivePredicate = positivePredicate.negate();
        IIntPredicate notPositivePredicate1 = IntPredicate.negate(positivePredicate);
        IIntPredicate positiveEvenOrJustPrimePredicate = positivePredicate.andAlso(evenPredicate).orElse(primePredicate); // (1 AND 2) OR 3
        IIntPredicate positiveEvenOrPrimePredicate = positivePredicate.andAlso(evenPredicate.orElse(primePredicate)); // 1 AND (2 OR 3)
        // Then
        for (Integer i : INPUT) {
            Assert.areEqual(i > 0, positivePredicate.test(i));
            Assert.areEqual(Math.mod(i, 2) == 0, evenPredicate.test(i));
            Assert.areEqual(primes.contains(i), primePredicate.test(i));
            Assert.areEqual(value, alwaysPredicate.test(i));
            Assert.areEqual(i > 0 && Math.mod(i, 2) == 0, positiveAndEvenPredicate.test(i));
            Assert.areEqual(i > 0 && Math.mod(i, 2) == 0, positiveAndEvenPredicate1.test(i));
            Assert.areEqual(i > 0 || Math.mod(i, 2) == 0, positiveOrEvenPredicate.test(i));
            Assert.areEqual(i > 0 || Math.mod(i, 2) == 0, positiveOrEvenPredicate1.test(i));
            Assert.areEqual(!(i > 0), notPositivePredicate.test(i));
            Assert.areEqual(!(i > 0), notPositivePredicate1.test(i));
            Assert.areEqual(i > 0 && Math.mod(i, 2) == 0 || primes.contains(i), positiveEvenOrJustPrimePredicate.test(i));
            Assert.areEqual(i > 0 && (Math.mod(i, 2) == 0 || primes.contains(i)), positiveEvenOrPrimePredicate.test(i));
        }
    }

}
