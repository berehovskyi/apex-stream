/**
 * @see BiPredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage, PMD.CognitiveComplexity')
private class BiPredicatesTest {
    
    private static final List<AfPerson> INPUT = AfTestData.generatePersons();
    private static final AfPerson CHANGE = new AfPerson('Sam', 15, Date.newInstance(1990, 1, 2), 5L, true);
    private static final IFunction GET_AGE_FUNCTION = new AfTestCommons.GetAgeFunction();

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
        for (AfPerson person : INPUT) {
            Boolean isDecreasedAge = person.getAge() > CHANGE.getAge();
            Boolean isGreater = person.compareTo(CHANGE) == 1;
            Assert.areEqual(isDecreasedAge, ageIsGreaterBiPredicate.test(person, CHANGE));
            Assert.areEqual(isGreater, isGreaterBiPredicate.test(person, CHANGE));
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
        for (AfPerson person : INPUT) {
            Boolean isDecreasedAge = person.getAge() >= CHANGE.getAge();
            Boolean isGreater = person.compareTo(CHANGE) >= 0;
            Assert.areEqual(isDecreasedAge, ageIsGreaterOrEqualBiPredicate.test(person, CHANGE));
            Assert.areEqual(isGreater, isGreaterOrEqualBiPredicate.test(person, CHANGE));
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
        for (AfPerson person : INPUT) {
            Boolean isDecreasedAge = person.getAge() == CHANGE.getAge();
            Boolean isGreater = person.compareTo(CHANGE) == 0;
            Assert.areEqual(isDecreasedAge, agesAreEqualBiPredicate.test(person, CHANGE));
            Assert.areEqual(isGreater, areEqualBiPredicate.test(person, CHANGE));
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
        for (AfPerson person : INPUT) {
            Boolean isDecreasedAge = person.getAge() != CHANGE.getAge();
            Boolean isGreater = person.compareTo(CHANGE) != 0;
            Assert.areEqual(isDecreasedAge, agesAreNotEqualBiPredicate.test(person, CHANGE));
            Assert.areEqual(isGreater, areNotEqualBiPredicate.test(person, CHANGE));
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
        for (AfPerson person : INPUT) {
            Boolean isIncreasedAge = person.getAge() == null ? true : person.getAge() < CHANGE.getAge();
            Boolean isLess = person.compareTo(CHANGE) == -1;
            Assert.areEqual(isIncreasedAge, ageIsLessBiPredicate.test(person, CHANGE));
            Assert.areEqual(isLess, isLessBiPredicate.test(person, CHANGE));
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
        for (AfPerson person : INPUT) {
            Boolean isIncreasedAge = person.getAge() == null ? true : person.getAge() <= CHANGE.getAge();
            Boolean isLessOrEqual = person.compareTo(CHANGE) <= 0;
            Assert.areEqual(isIncreasedAge, ageIsLessOrEqualBiPredicate.test(person, CHANGE));
            Assert.areEqual(isLessOrEqual, isLessOrEqualBiPredicate.test(person, CHANGE));
        }
    }

}
