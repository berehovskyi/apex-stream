/**
 * @see BiPredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class BiPredicatesTest {
    
    private static final List<IterTestUtils.Person> INPUT = IterTestUtils.generatePersons();
    private static final IterTestUtils.Person CHANGE = new IterTestUtils.Person('Sam', 15, Date.newInstance(1990, 1, 2), 5L, true);
    private static final IFunction GET_AGE_FUNCTION = new IterTestUtils.GetAgeFunction();

    static {
        new BiPredicates();
    }
    
    /**
    * @see BiPredicates.isGreater
    */
    @IsTest
    static void isGreater() {
        // When
        BiPredicate ageIsGreaterBiPredicate = BiPredicates.isGreater(GET_AGE_FUNCTION, GET_AGE_FUNCTION);
        IBiPredicate isGreaterBiPredicate = BiPredicates.isGreater();
        // Then
        for (IterTestUtils.Person person : INPUT) {
            Boolean isDecreasedAge = person.getAge() > CHANGE.getAge();
            Boolean isGreater = person.compareTo(CHANGE) == 1;
            Validate.assertEquals(isDecreasedAge, ageIsGreaterBiPredicate.test(person, CHANGE));
            Validate.assertEquals(isGreater, isGreaterBiPredicate.test(person, CHANGE));
        }
    }

    /**
     * @see BiPredicates.isGreaterOrEqual
     */
    @IsTest
    static void isGreaterOrEqual() {
        // When
        BiPredicate ageIsGreaterOrEqualBiPredicate = BiPredicates.isGreaterOrEqual(GET_AGE_FUNCTION, GET_AGE_FUNCTION);
        IBiPredicate isGreaterOrEqualBiPredicate = BiPredicates.isGreaterOrEqual();
        // Then
        for (IterTestUtils.Person person : INPUT) {
            Boolean isDecreasedAge = person.getAge() >= CHANGE.getAge();
            Boolean isGreater = person.compareTo(CHANGE) >= 0;
            Validate.assertEquals(isDecreasedAge, ageIsGreaterOrEqualBiPredicate.test(person, CHANGE));
            Validate.assertEquals(isGreater, isGreaterOrEqualBiPredicate.test(person, CHANGE));
        }
    }

    /**
     * @see BiPredicates.areEqual
     */
    @IsTest
    static void areEqual() {
        // When
        BiPredicate agesAreEqualBiPredicate = BiPredicates.areEqual(GET_AGE_FUNCTION, GET_AGE_FUNCTION);
        IBiPredicate areEqualBiPredicate = BiPredicates.areEqual();
        // Then
        for (IterTestUtils.Person person : INPUT) {
            Boolean isDecreasedAge = person.getAge() == CHANGE.getAge();
            Boolean isGreater = person.compareTo(CHANGE) == 0;
            Validate.assertEquals(isDecreasedAge, agesAreEqualBiPredicate.test(person, CHANGE));
            Validate.assertEquals(isGreater, areEqualBiPredicate.test(person, CHANGE));
        }
    }

    /**
     * @see BiPredicates.areNotEqual
     */
    @IsTest
    static void areNotEqual() {
        // When
        BiPredicate agesAreNotEqualBiPredicate = BiPredicates.areNotEqual(GET_AGE_FUNCTION, GET_AGE_FUNCTION);
        IBiPredicate areNotEqualBiPredicate = BiPredicates.areNotEqual();
        // Then
        for (IterTestUtils.Person person : INPUT) {
            Boolean isDecreasedAge = person.getAge() != CHANGE.getAge();
            Boolean isGreater = person.compareTo(CHANGE) != 0;
            Validate.assertEquals(isDecreasedAge, agesAreNotEqualBiPredicate.test(person, CHANGE));
            Validate.assertEquals(isGreater, areNotEqualBiPredicate.test(person, CHANGE));
        }
    }

    /**
     * @see BiPredicates.isLess
     */
    @IsTest
    static void isLess() {
        // When
        BiPredicate ageIsLessBiPredicate = BiPredicates.isLess(GET_AGE_FUNCTION, GET_AGE_FUNCTION);
        IBiPredicate isLessBiPredicate = BiPredicates.isLess();
        // Then
        for (IterTestUtils.Person person : INPUT) {
            Boolean isIncreasedAge = person.getAge() == null ? true : person.getAge() < CHANGE.getAge();
            Boolean isLess = person.compareTo(CHANGE) == -1;
            Validate.assertEquals(isIncreasedAge, ageIsLessBiPredicate.test(person, CHANGE));
            Validate.assertEquals(isLess, isLessBiPredicate.test(person, CHANGE));
        }
    }

    /**
     * @see BiPredicates.isLessOrEqual
     */
    @IsTest
    static void isLessOrEqual() {
        // When
        BiPredicate ageIsLessOrEqualBiPredicate = BiPredicates.isLessOrEqual(GET_AGE_FUNCTION, GET_AGE_FUNCTION);
        IBiPredicate isLessOrEqualBiPredicate = BiPredicates.isLessOrEqual();
        // Then
        for (IterTestUtils.Person person : INPUT) {
            Boolean isIncreasedAge = person.getAge() == null ? true : person.getAge() <= CHANGE.getAge();
            Boolean isLessOrEqual = person.compareTo(CHANGE) <= 0;
            Validate.assertEquals(isIncreasedAge, ageIsLessOrEqualBiPredicate.test(person, CHANGE));
            Validate.assertEquals(isLessOrEqual, isLessOrEqualBiPredicate.test(person, CHANGE));
        }
    }
}
