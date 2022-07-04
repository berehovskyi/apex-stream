/**
 * @see DoublePredicate
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DoublePredicateTest {

    private static List<Double> input = IterTestUtils.generateDoubles2();

    /**
     * @see DoublePredicate.orElse
     * @see DoublePredicate.andAlso
     * @see DoublePredicate.negate
     * @see DoublePredicate.always
     * @see DoublePredicate.some
     * @see DoublePredicate.every
     * @see DoublePredicate.negate
     */
    @IsTest
    static void default() {
        // Given
        Double value = 1;
        Double value1 = 13;
        Boolean value2 = true;
        // When
        DoublePredicate positivePredicate = DoublePredicates.isGreater(0);
        DoublePredicate gt1Predicate = DoublePredicates.isGreater(value);
        DoublePredicate le13Predicate = DoublePredicates.isLessOrEqual(value1);
        IDoublePredicate alwaysPredicate = DoublePredicate.always(value2);
        IDoublePredicate positiveAndGt1Predicate = positivePredicate.andAlso(gt1Predicate);
        IDoublePredicate positiveAndGt1Predicate1 = DoublePredicate.every(new List<IDoublePredicate>{ positivePredicate, gt1Predicate });
        IDoublePredicate positiveOrGt1Predicate = positivePredicate.orElse(gt1Predicate);
        IDoublePredicate positiveOrGt1Predicate1 = DoublePredicate.some(new List<IDoublePredicate>{ positivePredicate, gt1Predicate });
        IDoublePredicate notPositivePredicate = positivePredicate.negate();
        IDoublePredicate notPositivePredicate1 = DoublePredicate.negate(positivePredicate);
        DoublePredicate predicate = positivePredicate.andAlso(gt1Predicate).orElse(le13Predicate); // (1 AND 2) OR 3
        DoublePredicate predicate1 = positivePredicate.andAlso(gt1Predicate.orElse(le13Predicate)); // 1 AND (2 OR 3)
        // Then
        for (Double d : input) {
            Validate.assertEquals(d > 0, positivePredicate.test(d));
            Validate.assertEquals(d > value, gt1Predicate.test(d));
            Validate.assertEquals(d <= value1, le13Predicate.test(d));
            Validate.assertEquals(value2, alwaysPredicate.test(d));
            Validate.assertEquals(d > value, positiveAndGt1Predicate.test(d));
            Validate.assertEquals(d > value, positiveAndGt1Predicate1.test(d));
            Validate.assertEquals(d > 0, positiveOrGt1Predicate.test(d));
            Validate.assertEquals(d > 0, positiveOrGt1Predicate1.test(d));
            Validate.assertEquals(!(d > 0), notPositivePredicate.test(d));
            Validate.assertEquals(!(d > 0), notPositivePredicate1.test(d));
            Validate.assertEquals(((d > 0) && (d > value)) || d < value1, predicate.test(d));
            Validate.assertEquals((d > 0) && ((d > value) || (d < value1)), predicate1.test(d));
        }
    }

}
