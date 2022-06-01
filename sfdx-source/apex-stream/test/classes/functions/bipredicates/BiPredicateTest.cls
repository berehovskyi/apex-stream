/**
 * @author Oleh Berehovskyi
 * @see BiPredicate
 */
@IsTest(IsParallel = true)
private class BiPredicateTest {

    private static List<IterTestUtils.Person> input = IterTestUtils.generatePersons();
    private static IterTestUtils.Person change = new IterTestUtils.Person('Sam', 15, Date.newInstance(1990, 1, 2), 5L, true);
    private static IFunction getAgeFunction = new IterTestUtils.GetAgeFunction();
    private static IFunction getNameFunction = new IterTestUtils.GetNameFunction();

    /**
     * @see BiPredicate.orElse
     * @see BiPredicate.andAlso
     * @see BiPredicate.negate
     * @see BiPredicate.always
     */
    @IsTest
    static void default() {
        // Given
        Boolean value = true;
        // When
        IBiPredicate valueBiPredicate = BiPredicate.always(value);
        BiPredicate ageIsGreaterBiPredicate = BiPredicate.isGreater(getAgeFunction, getAgeFunction);
        BiPredicate namesAreEqualBiPredicate = BiPredicate.areEqual(getNameFunction, getNameFunction);
        IBiPredicate decreasedAgeAndTheSameNamesBiPredicate = ageIsGreaterBiPredicate.andAlso(namesAreEqualBiPredicate);
        IBiPredicate decreasedAgeOrTheSameNamesBiPredicate = ageIsGreaterBiPredicate.orElse(namesAreEqualBiPredicate);
        IBiPredicate notAgeIsNotGreaterBiPredicate = ageIsGreaterBiPredicate.negate();
        // Then
        for (IterTestUtils.Person person : input) {
            Boolean areSameNames = person.getName() == change.getName();
            Boolean isDecreasedAge = person.getAge() > change.getAge();
            Validate.assertEquals(value, valueBiPredicate.test(person, change));
            Validate.assertEquals(areSameNames && isDecreasedAge, decreasedAgeAndTheSameNamesBiPredicate.test(person, change));
            Validate.assertEquals(areSameNames || isDecreasedAge, decreasedAgeOrTheSameNamesBiPredicate.test(person, change));
            Validate.assertEquals(!isDecreasedAge, notAgeIsNotGreaterBiPredicate.test(person, change));
        }
    }

    /**
     * @see BiPredicate.some
     */
    @IsTest
    static void some() {
        // Given
        Integer value = 18;
        Object value1 = 'Sam';
        // When
        BiPredicate ageIsGreaterBiPredicate = BiPredicate.isGreater(getAgeFunction, getAgeFunction);
        BiPredicate namesAreEqualBiPredicate = BiPredicate.areEqual(getNameFunction, getNameFunction);
        IBiPredicate decreasedAgeOrTheSameNamesBiPredicate = BiPredicate.some(
                new List<IBiPredicate>{ ageIsGreaterBiPredicate, namesAreEqualBiPredicate }
        );
        IPredicate isAgeEquals = Predicate.isEqual(getAgeFunction, Function.constant(value));
        IPredicate isNameEquals = Predicate.isEqual(getNameFunction, Function.constant(value1));
        IBiPredicate isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate = BiPredicate.somePredicate(isNameEquals, isAgeEquals);
        // Then
        for (IterTestUtils.Person person : input) {
            Boolean areSameNames = person.getName() == change.getName();
            Boolean isDecreasedAge = person.getAge() > change.getAge();
            Validate.assertEquals(
                    areSameNames || isDecreasedAge,
                    decreasedAgeOrTheSameNamesBiPredicate.test(person, change)
            );
            Boolean isNameSam = person.getName() == value1;
            Boolean isAge18 = change.getAge() == value;
            Validate.assertEquals(
                    isNameSam || isAge18,
                    isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate.test(person, change)
            );
        }
    }

    /**
     * @see BiPredicate.every
     */
    @IsTest
    static void every() {
        // Given
        Integer value = 18;
        Object value1 = 'Sam';
        // When
        BiPredicate ageIsGreaterBiPredicate = BiPredicate.isGreater(getAgeFunction, getAgeFunction);
        BiPredicate namesAreEqualBiPredicate = BiPredicate.areEqual(getNameFunction, getNameFunction);
        IBiPredicate decreasedAgeOrTheSameNamesBiPredicate = BiPredicate.every(
                new List<IBiPredicate>{ ageIsGreaterBiPredicate, namesAreEqualBiPredicate }
        );
        IPredicate isAgeEquals = Predicate.isEqual(getAgeFunction, Function.constant(value));
        IPredicate isNameEquals = Predicate.isEqual(getNameFunction, Function.constant(value1));
        IBiPredicate isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate = BiPredicate.everyPredicate(isNameEquals, isAgeEquals);
        // Then
        for (IterTestUtils.Person person : input) {
            Boolean areSameNames = person.getName() == change.getName();
            Boolean isDecreasedAge = person.getAge() > change.getAge();
            Validate.assertEquals(
                    areSameNames && isDecreasedAge,
                    decreasedAgeOrTheSameNamesBiPredicate.test(person, change)
            );
            Boolean isNameSam = person.getName() == value1;
            Boolean isAge18 = change.getAge() == value;
            Validate.assertEquals(
                    isNameSam && isAge18,
                    isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate.test(person, change)
            );
        }
    }

    /**
     * @see BiPredicate.negate
     */
    @IsTest
    static void negate() {
        // When
        BiPredicate ageIsGreaterBiPredicate = BiPredicate.isGreater(getAgeFunction, getAgeFunction);
        IBiPredicate notAgeIsNotGreaterBiPredicate = BiPredicate.negate(ageIsGreaterBiPredicate);
        // Then
        for (IterTestUtils.Person person : input) {
            Boolean isDecreasedAge = person.getAge() > change.getAge();
            Validate.assertEquals(!isDecreasedAge, notAgeIsNotGreaterBiPredicate.test(person, change));
        }
    }

    /**
     * @see BiPredicate.isGreater
     */
    @IsTest
    static void isGreater() {
        // When
        BiPredicate ageIsGreaterBiPredicate = BiPredicate.isGreater(getAgeFunction, getAgeFunction);
        IBiPredicate isGreaterBiPredicate = BiPredicate.isGreater();
        // Then
        for (IterTestUtils.Person person : input) {
            Boolean isDecreasedAge = person.getAge() > change.getAge();
            Boolean isGreater = person.compareTo(change) == 1;
            Validate.assertEquals(isDecreasedAge, ageIsGreaterBiPredicate.test(person, change));
            Validate.assertEquals(isGreater, isGreaterBiPredicate.test(person, change));
        }
    }

    /**
     * @see BiPredicate.isGreaterOrEqual
     */
    @IsTest
    static void isGreaterOrEqual() {
        // When
        BiPredicate ageIsGreaterOrEqualBiPredicate = BiPredicate.isGreaterOrEqual(getAgeFunction, getAgeFunction);
        IBiPredicate isGreaterOrEqualBiPredicate = BiPredicate.isGreaterOrEqual();
        // Then
        for (IterTestUtils.Person person : input) {
            Boolean isDecreasedAge = person.getAge() >= change.getAge();
            Boolean isGreater = person.compareTo(change) >= 0;
            Validate.assertEquals(isDecreasedAge, ageIsGreaterOrEqualBiPredicate.test(person, change));
            Validate.assertEquals(isGreater, isGreaterOrEqualBiPredicate.test(person, change));
        }
    }

    /**
     * @see BiPredicate.areEqual
     */
    @IsTest
    static void areEqual() {
        // When
        BiPredicate agesAreEqualBiPredicate = BiPredicate.areEqual(getAgeFunction, getAgeFunction);
        IBiPredicate areEqualBiPredicate = BiPredicate.areEqual();
        // Then
        for (IterTestUtils.Person person : input) {
            Boolean isDecreasedAge = person.getAge() == change.getAge();
            Boolean isGreater = person.compareTo(change) == 0;
            Validate.assertEquals(isDecreasedAge, agesAreEqualBiPredicate.test(person, change));
            Validate.assertEquals(isGreater, areEqualBiPredicate.test(person, change));
        }
    }

    /**
     * @see BiPredicate.areNotEqual
     */
    @IsTest
    static void areNotEqual() {
        // When
        BiPredicate agesAreNotEqualBiPredicate = BiPredicate.areNotEqual(getAgeFunction, getAgeFunction);
        IBiPredicate areNotEqualBiPredicate = BiPredicate.areNotEqual();
        // Then
        for (IterTestUtils.Person person : input) {
            Boolean isDecreasedAge = person.getAge() != change.getAge();
            Boolean isGreater = person.compareTo(change) != 0;
            Validate.assertEquals(isDecreasedAge, agesAreNotEqualBiPredicate.test(person, change));
            Validate.assertEquals(isGreater, areNotEqualBiPredicate.test(person, change));
        }
    }

    /**
     * @see BiPredicate.isLess
     */
    @IsTest
    static void isLess() {
        // When
        BiPredicate ageIsLessBiPredicate = BiPredicate.isLess(getAgeFunction, getAgeFunction);
        IBiPredicate isLessBiPredicate = BiPredicate.isLess();
        // Then
        for (IterTestUtils.Person person : input) {
            Boolean isIncreasedAge = person.getAge() == null ? true : person.getAge() < change.getAge();
            Boolean isLess = person.compareTo(change) == -1;
            Validate.assertEquals(isIncreasedAge, ageIsLessBiPredicate.test(person, change));
            Validate.assertEquals(isLess, isLessBiPredicate.test(person, change));
        }
    }

    /**
     * @see BiPredicate.isLessOrEqual
     */
    @IsTest
    static void isLessOrEqual() {
        // When
        BiPredicate ageIsLessOrEqualBiPredicate = BiPredicate.isLessOrEqual(getAgeFunction, getAgeFunction);
        IBiPredicate isLessOrEqualBiPredicate = BiPredicate.isLessOrEqual();
        // Then
        for (IterTestUtils.Person person : input) {
            Boolean isIncreasedAge = person.getAge() == null ? true : person.getAge() <= change.getAge();
            Boolean isLessOrEqual = person.compareTo(change) <= 0;
            Validate.assertEquals(isIncreasedAge, ageIsLessOrEqualBiPredicate.test(person, change));
            Validate.assertEquals(isLessOrEqual, isLessOrEqualBiPredicate.test(person, change));
        }
    }
}
