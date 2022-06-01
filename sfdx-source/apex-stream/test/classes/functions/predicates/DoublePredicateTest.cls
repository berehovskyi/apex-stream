/**
 * @author Oleh Berehovskyi
 * @see DoublePredicate
 */
@IsTest(IsParallel = true)
private class DoublePredicateTest {

    private static List<Double> input = new List<Double>{ 0.0, 4.5, -5.2, 10.1, 13.3, -1.0, 42.2, -9.2, 1.0 };

    /**
     * @see DoublePredicate.orElse
     * @see DoublePredicate.andAlso
     * @see DoublePredicate.negate
     * @see DoublePredicate.always
     */
    @IsTest
    static void defaultMethods() {
        // Given
        Double value = 1;
        Double value1 = 13;
        Boolean value2 = true;
        // When
        DoublePredicate positivePredicate = DoublePredicate.isPositive();
        DoublePredicate gt1Predicate = DoublePredicate.isGreater(value);
        DoublePredicate le13Predicate = DoublePredicate.isLessOrEqual(value1);
        IDoublePredicate alwaysPredicate = DoublePredicate.always(value2);
        IDoublePredicate positiveAndGt1Predicate = positivePredicate.andAlso(gt1Predicate);
        IDoublePredicate positiveOrGt1Predicate = positivePredicate.orElse(gt1Predicate);
        IDoublePredicate notPositivePredicate = positivePredicate.negate();
        DoublePredicate predicate = positivePredicate.andAlso(gt1Predicate).orElse(le13Predicate); // (1 AND 2) OR 3
        DoublePredicate predicate1 = positivePredicate.andAlso(gt1Predicate.orElse(le13Predicate)); // 1 AND (2 OR 3)
        // Then
        for (Double d : input) {
            Validate.assertEquals(d > 0, positivePredicate.test(d));
            Validate.assertEquals(d > value, gt1Predicate.test(d));
            Validate.assertEquals(d <= value1, le13Predicate.test(d));
            Validate.assertEquals(value2, alwaysPredicate.test(d));
            Validate.assertEquals(d > value, positiveAndGt1Predicate.test(d));
            Validate.assertEquals(d > 0, positiveOrGt1Predicate.test(d));
            Validate.assertEquals(!(d > 0), notPositivePredicate.test(d));
            Validate.assertEquals(((d > 0) && (d > 1)) || d < 13, predicate.test(d));
            Validate.assertEquals((d > 0) && ((d > 1) || (d < 13)), predicate1.test(d));
        }
    }

    /**
     * @see DoublePredicate.some
     * @see DoublePredicate.every
     * @see DoublePredicate.negate
     */
    @IsTest
    static void staticMethods() {
        // Given
        Double value = 13;
        // When
        DoublePredicate positivePredicate = DoublePredicate.isPositive();
        DoublePredicate le13Predicate = DoublePredicate.isLessOrEqual(value);
        IDoublePredicate positiveOrLessPredicate = DoublePredicate.some(new List<IDoublePredicate>{ positivePredicate, le13Predicate });
        IDoublePredicate positiveAndLessPredicate = DoublePredicate.every(new List<IDoublePredicate>{ positivePredicate, le13Predicate });
        IDoublePredicate notPositivePredicate = DoublePredicate.negate(positivePredicate);
        // Then
        for (Double d : input) {
            Validate.assertEquals(d > 0 || d < value, positiveOrLessPredicate.test(d));
            Validate.assertEquals(d > 0 && d < value, positiveAndLessPredicate.test(d));
            Validate.assertEquals(!(d > 0), notPositivePredicate.test(d));

        }
    }

    /**
     * @see DoublePredicate.isGreater
     * @see DoublePredicate.isGreaterOrEqual
     * @see DoublePredicate.isEqual
     * @see DoublePredicate.isLess
     * @see DoublePredicate.isLessOrEqual
     * @see DoublePredicate.isIn
     * @see DoublePredicate.isNotEqual
     * @see DoublePredicate.isNotIn
     */
    @IsTest
    static void comparisonPredicates() {
        // Given
        Double value = 1.0;
        Double value1 = 13;
        List<Double> subList = new List<Double>{ -5.2, 11L };
        // When
        for(Double d : input) {
            Validate.assertEquals(d > value, DoublePredicate.isGreater(value).test(d));
            Validate.assertEquals(d >= value, DoublePredicate.isGreaterOrEqual(value).test(d));
            Validate.assertEquals(d < value, DoublePredicate.isLess(value).test(d));
            Validate.assertEquals(d <= value, DoublePredicate.isLessOrEqual(value).test(d));
            Validate.assertEquals(d == value1, DoublePredicate.isEqual(value1).test(d));
            Validate.assertEquals(d != value1, DoublePredicate.isNotEqual(value1).test(d));
            Validate.assertEquals(subList.contains(d), DoublePredicate.isIn(subList).test(d));
            Validate.assertEquals(!subList.contains(d), DoublePredicate.isNotIn(subList).test(d));
        }
    }

    /**
     * @see DoublePredicate.isNull
     * @see DoublePredicate.isNotNull
     * @see DoublePredicate.isNegative
     * @see DoublePredicate.isNegativeOrZero
     * @see DoublePredicate.isPositive
     * @see DoublePredicate.isPositiveOrZero
     * @see DoublePredicate.isZero
     */
    @IsTest
    static void doublePredicates() {
        // When
        for(Double d : input) {
            Validate.assertEquals(d == null, DoublePredicate.isNull().test(d));
            Validate.assertEquals(d != null, DoublePredicate.isNotNull().test(d));
            Validate.assertEquals(d < 0, DoublePredicate.isNegative().test(d));
            Validate.assertEquals(d <= 0, DoublePredicate.isNegativeOrZero().test(d));
            Validate.assertEquals(d > 0, DoublePredicate.isPositive().test(d));
            Validate.assertEquals(d >= 0, DoublePredicate.isPositiveOrZero().test(d));
            Validate.assertEquals(d == 0, DoublePredicate.isZero().test(d));
        }
    }

}
