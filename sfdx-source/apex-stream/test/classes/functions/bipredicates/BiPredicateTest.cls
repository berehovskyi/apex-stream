/**
 * @see BiPredicate
 *
 * @author Oleh Berehovskyi
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
        BiPredicate ageIsGreaterBiPredicate = new IterTestUtils.CompareBiPredicate(getAgeFunction, 1);
        BiPredicate namesAreEqualBiPredicate = new IterTestUtils.CompareBiPredicate(getNameFunction, 0);
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
        BiPredicate ageIsGreaterBiPredicate = new IterTestUtils.CompareBiPredicate(getAgeFunction, 1);
        BiPredicate namesAreEqualBiPredicate = new IterTestUtils.CompareBiPredicate(getNameFunction, 0);
        IBiPredicate decreasedAgeOrTheSameNamesBiPredicate = BiPredicate.some(
                new List<IBiPredicate>{ ageIsGreaterBiPredicate, namesAreEqualBiPredicate }
        );
        IPredicate isAgeEquals = Predicates.isEqual(getAgeFunction, Function.constant(value));
        IPredicate isNameEquals = Predicates.isEqual(getNameFunction, Function.constant(value1));
        IBiPredicate isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate = BiPredicate.some(isNameEquals, isAgeEquals);
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
        BiPredicate ageIsGreaterBiPredicate = new IterTestUtils.CompareBiPredicate(getAgeFunction,  1);
        BiPredicate namesAreEqualBiPredicate = new IterTestUtils.CompareBiPredicate(getNameFunction, 0);
        IBiPredicate decreasedAgeOrTheSameNamesBiPredicate = BiPredicate.every(
                new List<IBiPredicate>{ ageIsGreaterBiPredicate, namesAreEqualBiPredicate }
        );
        IPredicate isAgeEquals = Predicates.isEqual(getAgeFunction, Function.constant(value));
        IPredicate isNameEquals = Predicates.isEqual(getNameFunction, Function.constant(value1));
        IBiPredicate isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate = BiPredicate.every(isNameEquals, isAgeEquals);
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
        BiPredicate ageIsGreaterBiPredicate = new IterTestUtils.CompareBiPredicate(getAgeFunction, 1);
        IBiPredicate notAgeIsNotGreaterBiPredicate = BiPredicate.negate(ageIsGreaterBiPredicate);
        // Then
        for (IterTestUtils.Person person : input) {
            Boolean isDecreasedAge = person.getAge() > change.getAge();
            Validate.assertEquals(!isDecreasedAge, notAgeIsNotGreaterBiPredicate.test(person, change));
        }
    }
    
}
