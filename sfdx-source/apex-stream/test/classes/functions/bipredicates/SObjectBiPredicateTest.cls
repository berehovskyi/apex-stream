/**
 * @author Oleh Berehovskyi
 * @see SObjectBiPredicate
 */
@IsTest(IsParallel = true)
private class SObjectBiPredicateTest {

    private static List<Account> input = IterTestUtils.generateAccounts();
    private static Account change = new Account(Type = IterTestUtils.CONSTS.PARTNER, NumberOfEmployees = 100, BillingLatitude = -50.45);
    private static ISObjectFunction getNumOfEmployees = SObjectFunction.get(IterTestUtils.CONSTS.Account.NumberOfEmployees);

    /**
     * @see SObjectBiPredicate.orElse
     * @see SObjectBiPredicate.andAlso
     * @see SObjectBiPredicate.negate
     * @see SObjectBiPredicate.always
     */
    @IsTest
    static void default() {
        // Given
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        Boolean value = true;
        // When
        ISObjectBiPredicate valueBiPredicate = SObjectBiPredicate.always(value);
        SObjectBiPredicate numOfEmployeesIsGreaterBiPredicate = SObjectBiPredicate.isGreater(accNumOfEmployeesField);
        SObjectBiPredicate typesAreEqualBiPredicate = SObjectBiPredicate.areEqual(accTypeField);
        ISObjectBiPredicate decreasedNumOfEmployeesAndWithTheSameTypesBiPredicate = numOfEmployeesIsGreaterBiPredicate.andAlso(typesAreEqualBiPredicate);
        ISObjectBiPredicate decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate = numOfEmployeesIsGreaterBiPredicate.orElse(typesAreEqualBiPredicate);
        ISObjectBiPredicate numOfEmployeesIsNotGreaterBiPredicate = numOfEmployeesIsGreaterBiPredicate.negate();
        // Then
        for (Account acc : input) {
            Boolean areSameTypes = acc.get(accTypeField) == change.get(accTypeField);
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) change.get(accNumOfEmployeesField);
            Validate.assertEquals(value, valueBiPredicate.test(acc, change));
            Validate.assertEquals(areSameTypes && isDecreasedNum, decreasedNumOfEmployeesAndWithTheSameTypesBiPredicate.test(acc, change));
            Validate.assertEquals(areSameTypes || isDecreasedNum, decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate.test(acc, change));
            Validate.assertEquals(!isDecreasedNum, numOfEmployeesIsNotGreaterBiPredicate.test(acc, change));
        }
    }

    /**
     * @see SObjectBiPredicate.some
     */
    @IsTest
    static void some() {
        // Given
        Integer value = 100;
        Object value1 = 'Customer';
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        // When
        SObjectBiPredicate numOfEmployeesIsGreaterBiPredicate = SObjectBiPredicate.isGreater(accNumOfEmployeesField);
        SObjectBiPredicate typesAreEqualBiPredicate = SObjectBiPredicate.areEqual(accTypeField);
        ISObjectBiPredicate decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate = SObjectBiPredicate.some(
                new List<ISObjectBiPredicate>{ numOfEmployeesIsGreaterBiPredicate, typesAreEqualBiPredicate }
        );
        ISObjectPredicate isNumOfEmployeesEquals = SObjectPredicate.isEqual(accNumOfEmployeesField, value);
        ISObjectPredicate isTypeEquals = SObjectPredicate.isEqual(accTypeField, value1);
        ISObjectBiPredicate isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate = SObjectBiPredicate.somePredicate(isTypeEquals, isNumOfEmployeesEquals);
        // Then
        for (Account acc : input) {
            Boolean areSameTypes = acc.get(accTypeField) == change.get(accTypeField);
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) change.get(accNumOfEmployeesField);
            Validate.assertEquals(
                    areSameTypes || isDecreasedNum,
                    decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate.test(acc, change)
            );
            Boolean isLeftTypeCustomer = acc.get(accTypeField) == value1;
            Boolean isRightNumOfEmployees = change.get(accNumOfEmployeesField) == value;
            Validate.assertEquals(
                    isLeftTypeCustomer || isRightNumOfEmployees,
                    isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate.test(acc, change)
            );
        }
    }

    /**
     * @see SObjectBiPredicate.every
     */
    @IsTest
    static void every() {
        // Given
        Integer value = 100;
        Object value1 = 'Customer';
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        // When
        SObjectBiPredicate numOfEmployeesIsGreaterBiPredicate = SObjectBiPredicate.isGreater(accNumOfEmployeesField);
        SObjectBiPredicate typesAreEqualBiPredicate = SObjectBiPredicate.areEqual(accTypeField);
        ISObjectBiPredicate decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate = SObjectBiPredicate.every(new List<ISObjectBiPredicate>{ numOfEmployeesIsGreaterBiPredicate, typesAreEqualBiPredicate });
        ISObjectPredicate isNumOfEmployeesEquals = SObjectPredicate.isEqual(accNumOfEmployeesField, value);
        ISObjectPredicate isTypeEquals = SObjectPredicate.isEqual(accTypeField, value1);
        ISObjectBiPredicate isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate = SObjectBiPredicate.everyPredicate(isTypeEquals, isNumOfEmployeesEquals);
        // Then
        for (Account acc : input) {
            Boolean areSameTypes = acc.get(accTypeField) == change.get(accTypeField);
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) change.get(accNumOfEmployeesField);
            Validate.assertEquals(
                    areSameTypes && isDecreasedNum,
                    decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate.test(acc, change)
            );
            Boolean isLeftTypeCustomer = acc.get(accTypeField) == value1;
            Boolean isRightNumOfEmployees = change.get(accNumOfEmployeesField) == value;
            Validate.assertEquals(
                    isLeftTypeCustomer && isRightNumOfEmployees,
                    isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate.test(acc, change)
            );
        }
    }

    /**
     * @see SObjectBiPredicate.negate
     */
    @IsTest
    static void negate() {
        // Given
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        // When
        SObjectBiPredicate numOfEmployeesIsGreaterBiPredicate = SObjectBiPredicate.isGreater(accNumOfEmployeesField);
        ISObjectBiPredicate numOfEmployeesIsNotGreaterBiPredicate = SObjectBiPredicate.negate(numOfEmployeesIsGreaterBiPredicate);
        // Then
        for (Account acc : input) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) change.get(accNumOfEmployeesField);
            Validate.assertEquals(!isDecreasedNum, numOfEmployeesIsNotGreaterBiPredicate.test(acc, change));
        }
    }

    /**
     * @see SObjectBiPredicate.isGreater
     */
    @IsTest
    static void isGreater() {
        // Given
        String numOfEmployeesFieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        // When
        ISObjectBiPredicate numOfEmployeesIsGreaterBiPredicate = SObjectBiPredicate.isGreater(getNumOfEmployees, getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesIsGreaterBiPredicate1 = SObjectBiPredicate.isGreater(getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesIsGreaterBiPredicate2 = SObjectBiPredicate.isGreater(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesIsGreaterBiPredicate3 = SObjectBiPredicate.isGreater(accNumOfEmployeesField);
        // Then
        for (Account acc : input) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) change.get(accNumOfEmployeesField);
            Validate.assertEquals(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate.test(acc, change));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate1.test(acc, change));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate2.test(acc, change));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate3.test(acc, change));
        }
    }

    /**
     * @see SObjectBiPredicate.isGreaterOrEqual
     */
    @IsTest
    static void isGreaterOrEqual() {
        // Given
        String numOfEmployeesFieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        // When
        ISObjectBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate = SObjectBiPredicate.isGreaterOrEqual(getNumOfEmployees, getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate1 = SObjectBiPredicate.isGreaterOrEqual(getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate2 = SObjectBiPredicate.isGreaterOrEqual(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate3 = SObjectBiPredicate.isGreaterOrEqual(accNumOfEmployeesField);
        // Then
        for (Account acc : input) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) >= (Integer) change.get(accNumOfEmployeesField);
            Validate.assertEquals(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate.test(acc, change));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate1.test(acc, change));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate2.test(acc, change));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate3.test(acc, change));
        }
    }

    /**
     * @see SObjectBiPredicate.areEqual
     */
    @IsTest
    static void areEqual() {
        // Given
        String numOfEmployeesFieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        // When
        ISObjectBiPredicate numOfEmployeesAreEqualBiPredicate = SObjectBiPredicate.areEqual(getNumOfEmployees, getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesAreEqualBiPredicate1 = SObjectBiPredicate.areEqual(getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesAreEqualBiPredicate2 = SObjectBiPredicate.areEqual(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesAreEqualBiPredicate3 = SObjectBiPredicate.areEqual(accNumOfEmployeesField);
        ISObjectBiPredicate areEqualBiPredicate = SObjectBiPredicate.areEqual();
        // Then
        for (Account acc : input) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) == (Integer) change.get(accNumOfEmployeesField);
            Validate.assertEquals(isDecreasedNum, numOfEmployeesAreEqualBiPredicate.test(acc, change));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesAreEqualBiPredicate1.test(acc, change));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesAreEqualBiPredicate2.test(acc, change));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesAreEqualBiPredicate3.test(acc, change));
            Validate.assertEquals(acc == change, areEqualBiPredicate.test(acc, change));
        }
    }

    /**
     * @see SObjectBiPredicate.areNotEqual
     */
    @IsTest
    static void areNotEqual() {
        // Given
        String numOfEmployeesFieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        // When
        ISObjectBiPredicate numOfEmployeesAreNotEqualBiPredicate = SObjectBiPredicate.areNotEqual(getNumOfEmployees, getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesAreNotEqualBiPredicate1 = SObjectBiPredicate.areNotEqual(getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesAreNotEqualBiPredicate2 = SObjectBiPredicate.areNotEqual(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesAreNotEqualBiPredicate3 = SObjectBiPredicate.areNotEqual(accNumOfEmployeesField);
        ISObjectBiPredicate areNotEqualBiPredicate = SObjectBiPredicate.areNotEqual();
        // Then
        for (Account acc : input) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) != (Integer) change.get(accNumOfEmployeesField);
            Validate.assertEquals(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate.test(acc, change));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate1.test(acc, change));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate2.test(acc, change));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate3.test(acc, change));
            Validate.assertEquals(acc != change, areNotEqualBiPredicate.test(acc, change));
        }
    }

    /**
     * @see SObjectBiPredicate.isLess
     */
    @IsTest
    static void isLess() {
        // Given
        String numOfEmployeesFieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        // When
        ISObjectBiPredicate numOfEmployeesIsLessBiPredicate = SObjectBiPredicate.isLess(getNumOfEmployees, getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesIsLessBiPredicate1 = SObjectBiPredicate.isLess(getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesIsLessBiPredicate2 = SObjectBiPredicate.isLess(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesIsLessBiPredicate3 = SObjectBiPredicate.isLess(accNumOfEmployeesField);
        // Then
        for (Account acc : input) {
            Integer leftNumOfEmployees = (Integer) acc.get(accNumOfEmployeesField);
            Boolean isIncreasedNum = leftNumOfEmployees == null ? true : leftNumOfEmployees < (Integer) change.get(accNumOfEmployeesField);
            Validate.assertEquals(isIncreasedNum, numOfEmployeesIsLessBiPredicate.test(acc, change));
            Validate.assertEquals(isIncreasedNum, numOfEmployeesIsLessBiPredicate1.test(acc, change));
            Validate.assertEquals(isIncreasedNum, numOfEmployeesIsLessBiPredicate2.test(acc, change));
            Validate.assertEquals(isIncreasedNum, numOfEmployeesIsLessBiPredicate3.test(acc, change));
        }
    }

    /**
     * @see SObjectBiPredicate.isLessOrEqual
     */
    @IsTest
    static void isLessOrEqual() {
        // Given
        String numOfEmployeesFieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        // When
        ISObjectBiPredicate numOfEmployeesIsLessOrEqualBiPredicate = SObjectBiPredicate.isLessOrEqual(getNumOfEmployees, getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesIsLessOrEqualBiPredicate1 = SObjectBiPredicate.isLessOrEqual(getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesIsLessOrEqualBiPredicate2 = SObjectBiPredicate.isLessOrEqual(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesIsLessOrEqualBiPredicate3 = SObjectBiPredicate.isLessOrEqual(accNumOfEmployeesField);
        // Then
        for (Account acc : input) {
            Integer leftNumOfEmployees = (Integer) acc.get(accNumOfEmployeesField);
            Boolean isIncreasedNum = leftNumOfEmployees == null ? true : leftNumOfEmployees <= (Integer) change.get(accNumOfEmployeesField);
            Validate.assertEquals(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate.test(acc, change));
            Validate.assertEquals(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate1.test(acc, change));
            Validate.assertEquals(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate2.test(acc, change));
            Validate.assertEquals(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate3.test(acc, change));
        }
    }
}
