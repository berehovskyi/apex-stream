/**
 * @see SObjectBiPredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectBiPredicatesTest {

    private static List<Account> input = IterTestUtils.generateAccounts();
    private static Account delta = new Account(Type = IterTestUtils.CONSTS.PARTNER, NumberOfEmployees = 100, BillingLatitude = -50.45);
    private static ISObjectFunction getNumOfEmployees = SObjectFunctions.get(IterTestUtils.CONSTS.Account.NumberOfEmployees);

    /**
     * @see SObjectBiPredicates.isGreater
     */
    @IsTest
    static void isGreater() {
        // Given
        String numOfEmployeesFieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        // When
        new SObjectBiPredicates();
        ISObjectBiPredicate numOfEmployeesIsGreaterBiPredicate = SObjectBiPredicates.isGreater(getNumOfEmployees, getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesIsGreaterBiPredicate1 = SObjectBiPredicates.isGreater(getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesIsGreaterBiPredicate2 = SObjectBiPredicates.isGreater(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesIsGreaterBiPredicate3 = SObjectBiPredicates.isGreater(accNumOfEmployeesField);
        // Then
        for (Account acc : input) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) delta.get(accNumOfEmployeesField);
            Validate.assertEquals(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate.test(acc, delta));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate1.test(acc, delta));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate2.test(acc, delta));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate3.test(acc, delta));
        }
    }

    /**
     * @see SObjectBiPredicates.isGreaterOrEqual
     */
    @IsTest
    static void isGreaterOrEqual() {
        // Given
        String numOfEmployeesFieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        // When
        ISObjectBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate = SObjectBiPredicates.isGreaterOrEqual(getNumOfEmployees, getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate1 = SObjectBiPredicates.isGreaterOrEqual(getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate2 = SObjectBiPredicates.isGreaterOrEqual(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate3 = SObjectBiPredicates.isGreaterOrEqual(accNumOfEmployeesField);
        // Then
        for (Account acc : input) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) >= (Integer) delta.get(accNumOfEmployeesField);
            Validate.assertEquals(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate.test(acc, delta));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate1.test(acc, delta));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate2.test(acc, delta));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate3.test(acc, delta));
        }
    }

    /**
     * @see SObjectBiPredicates.areEqual
     */
    @IsTest
    static void areEqual() {
        // Given
        String numOfEmployeesFieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        // When
        ISObjectBiPredicate numOfEmployeesAreEqualBiPredicate = SObjectBiPredicates.areEqual(getNumOfEmployees, getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesAreEqualBiPredicate1 = SObjectBiPredicates.areEqual(getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesAreEqualBiPredicate2 = SObjectBiPredicates.areEqual(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesAreEqualBiPredicate3 = SObjectBiPredicates.areEqual(accNumOfEmployeesField);
        ISObjectBiPredicate areEqualBiPredicate = SObjectBiPredicates.areEqual();
        // Then
        for (Account acc : input) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) == (Integer) delta.get(accNumOfEmployeesField);
            Validate.assertEquals(isDecreasedNum, numOfEmployeesAreEqualBiPredicate.test(acc, delta));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesAreEqualBiPredicate1.test(acc, delta));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesAreEqualBiPredicate2.test(acc, delta));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesAreEqualBiPredicate3.test(acc, delta));
            Validate.assertEquals(acc == delta, areEqualBiPredicate.test(acc, delta));
        }
    }

    /**
     * @see SObjectBiPredicates.areNotEqual
     */
    @IsTest
    static void areNotEqual() {
        // Given
        String numOfEmployeesFieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        // When
        ISObjectBiPredicate numOfEmployeesAreNotEqualBiPredicate = SObjectBiPredicates.areNotEqual(getNumOfEmployees, getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesAreNotEqualBiPredicate1 = SObjectBiPredicates.areNotEqual(getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesAreNotEqualBiPredicate2 = SObjectBiPredicates.areNotEqual(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesAreNotEqualBiPredicate3 = SObjectBiPredicates.areNotEqual(accNumOfEmployeesField);
        ISObjectBiPredicate areNotEqualBiPredicate = SObjectBiPredicates.areNotEqual();
        // Then
        for (Account acc : input) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) != (Integer) delta.get(accNumOfEmployeesField);
            Validate.assertEquals(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate.test(acc, delta));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate1.test(acc, delta));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate2.test(acc, delta));
            Validate.assertEquals(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate3.test(acc, delta));
            Validate.assertEquals(acc != delta, areNotEqualBiPredicate.test(acc, delta));
        }
    }

    /**
     * @see SObjectBiPredicates.isLess
     */
    @IsTest
    static void isLess() {
        // Given
        String numOfEmployeesFieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        // When
        ISObjectBiPredicate numOfEmployeesIsLessBiPredicate = SObjectBiPredicates.isLess(getNumOfEmployees, getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesIsLessBiPredicate1 = SObjectBiPredicates.isLess(getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesIsLessBiPredicate2 = SObjectBiPredicates.isLess(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesIsLessBiPredicate3 = SObjectBiPredicates.isLess(accNumOfEmployeesField);
        // Then
        for (Account acc : input) {
            Integer leftNumOfEmployees = (Integer) acc.get(accNumOfEmployeesField);
            Boolean isIncreasedNum = leftNumOfEmployees == null ? true : leftNumOfEmployees < (Integer) delta.get(accNumOfEmployeesField);
            Validate.assertEquals(isIncreasedNum, numOfEmployeesIsLessBiPredicate.test(acc, delta));
            Validate.assertEquals(isIncreasedNum, numOfEmployeesIsLessBiPredicate1.test(acc, delta));
            Validate.assertEquals(isIncreasedNum, numOfEmployeesIsLessBiPredicate2.test(acc, delta));
            Validate.assertEquals(isIncreasedNum, numOfEmployeesIsLessBiPredicate3.test(acc, delta));
        }
    }

    /**
     * @see SObjectBiPredicates.isLessOrEqual
     */
    @IsTest
    static void isLessOrEqual() {
        // Given
        String numOfEmployeesFieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        // When
        ISObjectBiPredicate numOfEmployeesIsLessOrEqualBiPredicate = SObjectBiPredicates.isLessOrEqual(getNumOfEmployees, getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesIsLessOrEqualBiPredicate1 = SObjectBiPredicates.isLessOrEqual(getNumOfEmployees);
        ISObjectBiPredicate numOfEmployeesIsLessOrEqualBiPredicate2 = SObjectBiPredicates.isLessOrEqual(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesIsLessOrEqualBiPredicate3 = SObjectBiPredicates.isLessOrEqual(accNumOfEmployeesField);
        // Then
        for (Account acc : input) {
            Integer leftNumOfEmployees = (Integer) acc.get(accNumOfEmployeesField);
            Boolean isIncreasedNum = leftNumOfEmployees == null ? true : leftNumOfEmployees <= (Integer) delta.get(accNumOfEmployeesField);
            Validate.assertEquals(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate.test(acc, delta));
            Validate.assertEquals(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate1.test(acc, delta));
            Validate.assertEquals(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate2.test(acc, delta));
            Validate.assertEquals(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate3.test(acc, delta));
        }
    }
    
}
