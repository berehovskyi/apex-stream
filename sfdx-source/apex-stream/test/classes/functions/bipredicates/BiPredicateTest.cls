/**
 * @see BiPredicate
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class BiPredicateTest {

    private static final List<IterTestUtils.Person> INPUT = IterTestUtils.generatePersons();
    private static final IterTestUtils.Person CHANGE = new IterTestUtils.Person('Sam', 15, Date.newInstance(1990, 1, 2), 5L, true);
    private static final IFunction GET_AGE_FUNCTION = new IterTestUtils.GetAgeFunction();
    private static final IFunction GET_NAME_FUNCTION = new IterTestUtils.GetNameFunction();

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
        BiPredicate ageIsGreaterBiPredicate = new IterTestUtils.CompareBiPredicate(GET_AGE_FUNCTION, 1);
        BiPredicate namesAreEqualBiPredicate = new IterTestUtils.CompareBiPredicate(GET_NAME_FUNCTION, 0);
        IBiPredicate decreasedAgeAndTheSameNamesBiPredicate = ageIsGreaterBiPredicate.andAlso(namesAreEqualBiPredicate);
        IBiPredicate decreasedAgeOrTheSameNamesBiPredicate = ageIsGreaterBiPredicate.orElse(namesAreEqualBiPredicate);
        IBiPredicate notAgeIsNotGreaterBiPredicate = ageIsGreaterBiPredicate.negate();
        // Then
        for (IterTestUtils.Person person : INPUT) {
            Boolean areSameNames = person.getName() == CHANGE.getName();
            Boolean isDecreasedAge = person.getAge() > CHANGE.getAge();
            Assert.areEqual(value, valueBiPredicate.test(person, CHANGE));
            Assert.areEqual(areSameNames && isDecreasedAge, decreasedAgeAndTheSameNamesBiPredicate.test(person, CHANGE));
            Assert.areEqual(areSameNames || isDecreasedAge, decreasedAgeOrTheSameNamesBiPredicate.test(person, CHANGE));
            Assert.areEqual(!isDecreasedAge, notAgeIsNotGreaterBiPredicate.test(person, CHANGE));
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
        BiPredicate ageIsGreaterBiPredicate = new IterTestUtils.CompareBiPredicate(GET_AGE_FUNCTION, 1);
        BiPredicate namesAreEqualBiPredicate = new IterTestUtils.CompareBiPredicate(GET_NAME_FUNCTION, 0);
        IBiPredicate decreasedAgeOrTheSameNamesBiPredicate = BiPredicate.some(
                new List<IBiPredicate>{ ageIsGreaterBiPredicate, namesAreEqualBiPredicate }
        );
        IPredicate isAgeEquals = Predicates.isEqual(GET_AGE_FUNCTION, Function.constant(value));
        IPredicate isNameEquals = Predicates.isEqual(GET_NAME_FUNCTION, Function.constant(value1));
        IBiPredicate isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate = BiPredicate.some(isNameEquals, isAgeEquals);
        // Then
        for (IterTestUtils.Person person : INPUT) {
            Boolean areSameNames = person.getName() == CHANGE.getName();
            Boolean isDecreasedAge = person.getAge() > CHANGE.getAge();
            Assert.areEqual(
                    areSameNames || isDecreasedAge,
                    decreasedAgeOrTheSameNamesBiPredicate.test(person, CHANGE)
            );
            Boolean isNameSam = person.getName() == value1;
            Boolean isAge18 = CHANGE.getAge() == value;
            Assert.areEqual(
                    isNameSam || isAge18,
                    isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate.test(person, CHANGE)
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
        BiPredicate ageIsGreaterBiPredicate = new IterTestUtils.CompareBiPredicate(GET_AGE_FUNCTION,  1);
        BiPredicate namesAreEqualBiPredicate = new IterTestUtils.CompareBiPredicate(GET_NAME_FUNCTION, 0);
        IBiPredicate decreasedAgeOrTheSameNamesBiPredicate = BiPredicate.every(
                new List<IBiPredicate>{ ageIsGreaterBiPredicate, namesAreEqualBiPredicate }
        );
        IPredicate isAgeEquals = Predicates.isEqual(GET_AGE_FUNCTION, Function.constant(value));
        IPredicate isNameEquals = Predicates.isEqual(GET_NAME_FUNCTION, Function.constant(value1));
        IBiPredicate isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate = BiPredicate.every(isNameEquals, isAgeEquals);
        // Then
        for (IterTestUtils.Person person : INPUT) {
            Boolean areSameNames = person.getName() == CHANGE.getName();
            Boolean isDecreasedAge = person.getAge() > CHANGE.getAge();
            Assert.areEqual(
                    areSameNames && isDecreasedAge,
                    decreasedAgeOrTheSameNamesBiPredicate.test(person, CHANGE)
            );
            Boolean isNameSam = person.getName() == value1;
            Boolean isAge18 = CHANGE.getAge() == value;
            Assert.areEqual(
                    isNameSam && isAge18,
                    isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate.test(person, CHANGE)
            );
        }
    }

    /**
     * @see BiPredicate.negate
     */
    @IsTest
    static void negate() {
        // When
        BiPredicate ageIsGreaterBiPredicate = new IterTestUtils.CompareBiPredicate(GET_AGE_FUNCTION, 1);
        IBiPredicate notAgeIsNotGreaterBiPredicate = BiPredicate.negate(ageIsGreaterBiPredicate);
        // Then
        for (IterTestUtils.Person person : INPUT) {
            Boolean isDecreasedAge = person.getAge() > CHANGE.getAge();
            Assert.areEqual(!isDecreasedAge, notAgeIsNotGreaterBiPredicate.test(person, CHANGE));
        }
    }
    
}
