/**
 * @see BiPredicate
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage')
private class BiPredicateTest {

    private static final List<AfPerson> PEOPLE = AfTestData.generatePersons();
    private static final List<Account> ACCOUNTS = AfTestData.generateAccounts();
    private static final Account ACCOUNT_DELTA = new Account(Type = AfTestConsts.PARTNER, NumberOfEmployees = 100, BillingLatitude = -50.45);
    private static final AfPerson PERSON_DELTA = new AfPerson('Sam', 15, Date.newInstance(1990, 1, 2), 5L, true);
    private static final IFunction GET_AGE_FUNCTION = new AfTestCommons.GetAgeFunction();
    private static final IFunction GET_NAME_FUNCTION = new AfTestCommons.GetNameFunction();

    /**
     * @see BiPredicate.orElse
     * @see BiPredicate.andAlso
     * @see BiPredicate.negate
     * @see BiPredicate.always
     */
    @IsTest
    @SuppressWarnings('PMD.MethodNamingConventions')
    static void default_sobject() {
        // Given
        SObjectField accNumOfEmployeesField = Account.NumberOfEmployees;
        SObjectField accTypeField = Account.Type;
        Boolean value = true;
        // When
        IBiPredicate valueBiPredicate = BiPredicate.always(value);
        BiPredicate numOfEmployeesIsGreaterBiPredicate = new AfTestCommons.IsGreaterBiPredicate(accNumOfEmployeesField);
        BiPredicate typesAreEqualBiPredicate = new AfTestCommons.AreEqualBiPredicate(accTypeField);
        IBiPredicate decreasedNumOfEmployeesAndWithTheSameTypesBiPredicate = numOfEmployeesIsGreaterBiPredicate.andAlso(typesAreEqualBiPredicate);
        IBiPredicate decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate = numOfEmployeesIsGreaterBiPredicate.orElse(typesAreEqualBiPredicate);
        IBiPredicate numOfEmployeesIsNotGreaterBiPredicate = numOfEmployeesIsGreaterBiPredicate.negate();
        // Then
        for (Account acc : ACCOUNTS) {
            Boolean areSameTypes = acc.get(accTypeField) == ACCOUNT_DELTA.get(accTypeField);
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) ACCOUNT_DELTA.get(accNumOfEmployeesField);
            Assert.areEqual(value, valueBiPredicate.test(acc, ACCOUNT_DELTA));
            Assert.areEqual(areSameTypes && isDecreasedNum, decreasedNumOfEmployeesAndWithTheSameTypesBiPredicate.test(acc, ACCOUNT_DELTA));
            Assert.areEqual(areSameTypes || isDecreasedNum, decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate.test(acc, ACCOUNT_DELTA));
            Assert.areEqual(!isDecreasedNum, numOfEmployeesIsNotGreaterBiPredicate.test(acc, ACCOUNT_DELTA));
        }
    }

    /**
     * @see BiPredicate.some
     */
    @IsTest
    @SuppressWarnings('PMD.MethodNamingConventions')
    static void some_sobject() {
        // Given
        Integer value = 100;
        Object value1 = 'Customer';
        SObjectField accNumOfEmployeesField = Account.NumberOfEmployees;
        SObjectField accTypeField = Account.Type;
        // When
        BiPredicate numOfEmployeesIsGreaterBiPredicate = new AfTestCommons.IsGreaterBiPredicate(accNumOfEmployeesField);
        BiPredicate typesAreEqualBiPredicate = new AfTestCommons.AreEqualBiPredicate(accTypeField);
        IBiPredicate decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate = BiPredicate.some(
            new List<IBiPredicate>{ numOfEmployeesIsGreaterBiPredicate, typesAreEqualBiPredicate }
        );
        IPredicate isNumOfEmployeesEquals = new AfTestCommons.IsEqualPredicate(accNumOfEmployeesField, value);
        IPredicate isTypeEquals = new AfTestCommons.IsEqualPredicate(accTypeField, value1);
        IBiPredicate isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate = BiPredicate.some(isTypeEquals, isNumOfEmployeesEquals);
        // Then
        for (Account acc : ACCOUNTS) {
            Boolean areSameTypes = acc.get(accTypeField) == ACCOUNT_DELTA.get(accTypeField);
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) ACCOUNT_DELTA.get(accNumOfEmployeesField);
            Assert.areEqual(
                areSameTypes || isDecreasedNum,
                decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate.test(acc, ACCOUNT_DELTA)
            );
            Boolean isLeftTypeCustomer = acc.get(accTypeField) == value1;
            Boolean isRightNumOfEmployees = ACCOUNT_DELTA.get(accNumOfEmployeesField) == value;
            Assert.areEqual(
                isLeftTypeCustomer || isRightNumOfEmployees,
                isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate.test(acc, ACCOUNT_DELTA)
            );
        }
    }

    /**
     * @see BiPredicate.every
     */
    @IsTest
    @SuppressWarnings('PMD.MethodNamingConventions')
    static void every_sobject() {
        // Given
        Integer value = 100;
        Object value1 = 'Customer';
        SObjectField accNumOfEmployeesField = Account.NumberOfEmployees;
        SObjectField accTypeField = Account.Type;
        // When
        BiPredicate numOfEmployeesIsGreaterBiPredicate = new AfTestCommons.IsGreaterBiPredicate(accNumOfEmployeesField);
        BiPredicate typesAreEqualBiPredicate = new AfTestCommons.AreEqualBiPredicate(accTypeField);
        IBiPredicate decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate = BiPredicate.every(new List<IBiPredicate>{ numOfEmployeesIsGreaterBiPredicate, typesAreEqualBiPredicate });
        IPredicate isNumOfEmployeesEquals = new AfTestCommons.IsEqualPredicate(accNumOfEmployeesField, value);
        IPredicate isTypeEquals = new AfTestCommons.IsEqualPredicate(accTypeField, value1);
        IBiPredicate isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate = BiPredicate.every(isTypeEquals, isNumOfEmployeesEquals);
        // Then
        for (Account acc : ACCOUNTS) {
            Boolean areSameTypes = acc.get(accTypeField) == ACCOUNT_DELTA.get(accTypeField);
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) ACCOUNT_DELTA.get(accNumOfEmployeesField);
            Assert.areEqual(
                areSameTypes && isDecreasedNum,
                decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate.test(acc, ACCOUNT_DELTA)
            );
            Boolean isLeftTypeCustomer = acc.get(accTypeField) == value1;
            Boolean isRightNumOfEmployees = ACCOUNT_DELTA.get(accNumOfEmployeesField) == value;
            Assert.areEqual(
                isLeftTypeCustomer && isRightNumOfEmployees,
                isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate.test(acc, ACCOUNT_DELTA)
            );
        }
    }

    /**
     * @see BiPredicate.negate
     */
    @IsTest
    @SuppressWarnings('PMD.MethodNamingConventions')
    static void negate_sobject() {
        // Given
        SObjectField accNumOfEmployeesField = Account.NumberOfEmployees;
        // When
        BiPredicate numOfEmployeesIsGreaterBiPredicate = new AfTestCommons.IsGreaterBiPredicate(accNumOfEmployeesField);
        IBiPredicate numOfEmployeesIsNotGreaterBiPredicate = BiPredicate.negate(numOfEmployeesIsGreaterBiPredicate);
        // Then
        for (Account acc : ACCOUNTS) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) ACCOUNT_DELTA.get(accNumOfEmployeesField);
            Assert.areEqual(!isDecreasedNum, numOfEmployeesIsNotGreaterBiPredicate.test(acc, ACCOUNT_DELTA));
        }
    }

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
        BiPredicate ageIsGreaterBiPredicate = new AfTestCommons.CompareBiPredicate(GET_AGE_FUNCTION, 1);
        BiPredicate namesAreEqualBiPredicate = new AfTestCommons.CompareBiPredicate(GET_NAME_FUNCTION, 0);
        IBiPredicate decreasedAgeAndTheSameNamesBiPredicate = ageIsGreaterBiPredicate.andAlso(namesAreEqualBiPredicate);
        IBiPredicate decreasedAgeOrTheSameNamesBiPredicate = ageIsGreaterBiPredicate.orElse(namesAreEqualBiPredicate);
        IBiPredicate notAgeIsNotGreaterBiPredicate = ageIsGreaterBiPredicate.negate();
        // Then
        for (AfPerson person : PEOPLE) {
            Boolean areSameNames = person.getName() == PERSON_DELTA.getName();
            Boolean isDecreasedAge = person.getAge() > PERSON_DELTA.getAge();
            Assert.areEqual(value, valueBiPredicate.test(person, PERSON_DELTA));
            Assert.areEqual(areSameNames && isDecreasedAge, decreasedAgeAndTheSameNamesBiPredicate.test(person, PERSON_DELTA));
            Assert.areEqual(areSameNames || isDecreasedAge, decreasedAgeOrTheSameNamesBiPredicate.test(person, PERSON_DELTA));
            Assert.areEqual(!isDecreasedAge, notAgeIsNotGreaterBiPredicate.test(person, PERSON_DELTA));
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
        BiPredicate ageIsGreaterBiPredicate = new AfTestCommons.CompareBiPredicate(GET_AGE_FUNCTION, 1);
        BiPredicate namesAreEqualBiPredicate = new AfTestCommons.CompareBiPredicate(GET_NAME_FUNCTION, 0);
        IBiPredicate decreasedAgeOrTheSameNamesBiPredicate = BiPredicate.some(
            new List<IBiPredicate>{ ageIsGreaterBiPredicate, namesAreEqualBiPredicate }
        );
        IPredicate isAgeEquals = new AfTestCommons.IsEqualPredicate(GET_AGE_FUNCTION, Function.constant(value));
        IPredicate isNameEquals = new AfTestCommons.IsEqualPredicate(GET_NAME_FUNCTION, Function.constant(value1));
        IBiPredicate isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate = BiPredicate.some(isNameEquals, isAgeEquals);
        // Then
        for (AfPerson person : PEOPLE) {
            Boolean areSameNames = person.getName() == PERSON_DELTA.getName();
            Boolean isDecreasedAge = person.getAge() > PERSON_DELTA.getAge();
            Assert.areEqual(
                areSameNames || isDecreasedAge,
                decreasedAgeOrTheSameNamesBiPredicate.test(person, PERSON_DELTA)
            );
            Boolean isNameSam = person.getName() == value1;
            Boolean isAge18 = PERSON_DELTA.getAge() == value;
            Assert.areEqual(
                isNameSam || isAge18,
                isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate.test(person, PERSON_DELTA)
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
        BiPredicate ageIsGreaterBiPredicate = new AfTestCommons.CompareBiPredicate(GET_AGE_FUNCTION, 1);
        BiPredicate namesAreEqualBiPredicate = new AfTestCommons.CompareBiPredicate(GET_NAME_FUNCTION, 0);
        IBiPredicate decreasedAgeOrTheSameNamesBiPredicate = BiPredicate.every(
            new List<IBiPredicate>{ ageIsGreaterBiPredicate, namesAreEqualBiPredicate }
        );
        IPredicate isAgeEquals = new AfTestCommons.IsEqualPredicate(GET_AGE_FUNCTION, Function.constant(value));
        IPredicate isNameEquals = new AfTestCommons.IsEqualPredicate(GET_NAME_FUNCTION, Function.constant(value1));
        IBiPredicate isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate = BiPredicate.every(isNameEquals, isAgeEquals);
        // Then
        for (AfPerson person : PEOPLE) {
            Boolean areSameNames = person.getName() == PERSON_DELTA.getName();
            Boolean isDecreasedAge = person.getAge() > PERSON_DELTA.getAge();
            Assert.areEqual(
                areSameNames && isDecreasedAge,
                decreasedAgeOrTheSameNamesBiPredicate.test(person, PERSON_DELTA)
            );
            Boolean isNameSam = person.getName() == value1;
            Boolean isAge18 = PERSON_DELTA.getAge() == value;
            Assert.areEqual(
                isNameSam && isAge18,
                isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate.test(person, PERSON_DELTA)
            );
        }
    }

    /**
     * @see BiPredicate.negate
     */
    @IsTest
    static void negate() {
        // When
        BiPredicate ageIsGreaterBiPredicate = new AfTestCommons.CompareBiPredicate(GET_AGE_FUNCTION, 1);
        IBiPredicate notAgeIsNotGreaterBiPredicate = BiPredicate.negate(ageIsGreaterBiPredicate);
        // Then
        for (AfPerson person : PEOPLE) {
            Boolean isDecreasedAge = person.getAge() > PERSON_DELTA.getAge();
            Assert.areEqual(!isDecreasedAge, notAgeIsNotGreaterBiPredicate.test(person, PERSON_DELTA));
        }
    }

}
