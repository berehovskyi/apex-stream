/**
 * @see BiPredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class BiPredicatesTest {
    
    private static List<IterTestUtils.Person> input = IterTestUtils.generatePersons();
    private static IterTestUtils.Person change = new IterTestUtils.Person('Sam', 15, Date.newInstance(1990, 1, 2), 5L, true);
    private static IFunction getAgeFunction = new IterTestUtils.GetAgeFunction();
    
    /**
    * @see BiPredicates.isGreater
    */
    @IsTest
    static void isGreater() {
        // When
        new BiPredicates();
        BiPredicate ageIsGreaterBiPredicate = BiPredicates.isGreater(getAgeFunction, getAgeFunction);
        IBiPredicate isGreaterBiPredicate = BiPredicates.isGreater();
        // Then
        for (IterTestUtils.Person person : input) {
            Boolean isDecreasedAge = person.getAge() > change.getAge();
            Boolean isGreater = person.compareTo(change) == 1;
            Validate.assertEquals(isDecreasedAge, ageIsGreaterBiPredicate.test(person, change));
            Validate.assertEquals(isGreater, isGreaterBiPredicate.test(person, change));
        }
    }

    /**
     * @see BiPredicates.isGreaterOrEqual
     */
    @IsTest
    static void isGreaterOrEqual() {
        // When
        BiPredicate ageIsGreaterOrEqualBiPredicate = BiPredicates.isGreaterOrEqual(getAgeFunction, getAgeFunction);
        IBiPredicate isGreaterOrEqualBiPredicate = BiPredicates.isGreaterOrEqual();
        // Then
        for (IterTestUtils.Person person : input) {
            Boolean isDecreasedAge = person.getAge() >= change.getAge();
            Boolean isGreater = person.compareTo(change) >= 0;
            Validate.assertEquals(isDecreasedAge, ageIsGreaterOrEqualBiPredicate.test(person, change));
            Validate.assertEquals(isGreater, isGreaterOrEqualBiPredicate.test(person, change));
        }
    }

    /**
     * @see BiPredicates.areEqual
     */
    @IsTest
    static void areEqual() {
        // When
        BiPredicate agesAreEqualBiPredicate = BiPredicates.areEqual(getAgeFunction, getAgeFunction);
        IBiPredicate areEqualBiPredicate = BiPredicates.areEqual();
        // Then
        for (IterTestUtils.Person person : input) {
            Boolean isDecreasedAge = person.getAge() == change.getAge();
            Boolean isGreater = person.compareTo(change) == 0;
            Validate.assertEquals(isDecreasedAge, agesAreEqualBiPredicate.test(person, change));
            Validate.assertEquals(isGreater, areEqualBiPredicate.test(person, change));
        }
    }

    /**
     * @see BiPredicates.areNotEqual
     */
    @IsTest
    static void areNotEqual() {
        // When
        BiPredicate agesAreNotEqualBiPredicate = BiPredicates.areNotEqual(getAgeFunction, getAgeFunction);
        IBiPredicate areNotEqualBiPredicate = BiPredicates.areNotEqual();
        // Then
        for (IterTestUtils.Person person : input) {
            Boolean isDecreasedAge = person.getAge() != change.getAge();
            Boolean isGreater = person.compareTo(change) != 0;
            Validate.assertEquals(isDecreasedAge, agesAreNotEqualBiPredicate.test(person, change));
            Validate.assertEquals(isGreater, areNotEqualBiPredicate.test(person, change));
        }
    }

    /**
     * @see BiPredicates.isLess
     */
    @IsTest
    static void isLess() {
        // When
        BiPredicate ageIsLessBiPredicate = BiPredicates.isLess(getAgeFunction, getAgeFunction);
        IBiPredicate isLessBiPredicate = BiPredicates.isLess();
        // Then
        for (IterTestUtils.Person person : input) {
            Boolean isIncreasedAge = person.getAge() == null ? true : person.getAge() < change.getAge();
            Boolean isLess = person.compareTo(change) == -1;
            Validate.assertEquals(isIncreasedAge, ageIsLessBiPredicate.test(person, change));
            Validate.assertEquals(isLess, isLessBiPredicate.test(person, change));
        }
    }

    /**
     * @see BiPredicates.isLessOrEqual
     */
    @IsTest
    static void isLessOrEqual() {
        // When
        BiPredicate ageIsLessOrEqualBiPredicate = BiPredicates.isLessOrEqual(getAgeFunction, getAgeFunction);
        IBiPredicate isLessOrEqualBiPredicate = BiPredicates.isLessOrEqual();
        // Then
        for (IterTestUtils.Person person : input) {
            Boolean isIncreasedAge = person.getAge() == null ? true : person.getAge() <= change.getAge();
            Boolean isLessOrEqual = person.compareTo(change) <= 0;
            Validate.assertEquals(isIncreasedAge, ageIsLessOrEqualBiPredicate.test(person, change));
            Validate.assertEquals(isLessOrEqual, isLessOrEqualBiPredicate.test(person, change));
        }
    }
}
