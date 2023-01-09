/**
 * @see SObjectBiPredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectBiPredicatesTest {

    private static final List<Account> INPUT = IterTestUtils.generateAccounts();
    private static final Account DELTA = new Account(Type = IterTestUtils.CONSTS.PARTNER, NumberOfEmployees = 100, BillingLatitude = -50.45);
    private static final ISObjectFunction GET_NUM_OF_EMPLOYEES = SObjectFunctions.get(IterTestUtils.CONSTS.Account.NumberOfEmployees);

    static {
        new SObjectBiPredicates();
    }

    /**
     * @see SObjectBiPredicates.isGreater
     */
    @IsTest
    static void isGreater() {
        // Given
        String numOfEmployeesFieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        // When
        ISObjectBiPredicate numOfEmployeesIsGreaterBiPredicate = SObjectBiPredicates.isGreater(GET_NUM_OF_EMPLOYEES, GET_NUM_OF_EMPLOYEES);
        ISObjectBiPredicate numOfEmployeesIsGreaterBiPredicate1 = SObjectBiPredicates.isGreater(GET_NUM_OF_EMPLOYEES);
        ISObjectBiPredicate numOfEmployeesIsGreaterBiPredicate2 = SObjectBiPredicates.isGreater(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesIsGreaterBiPredicate3 = SObjectBiPredicates.isGreater(accNumOfEmployeesField);
        // Then
        for (Account acc : INPUT) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) DELTA.get(accNumOfEmployeesField);
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate2.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate3.test(acc, DELTA));
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
        ISObjectBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate = SObjectBiPredicates.isGreaterOrEqual(GET_NUM_OF_EMPLOYEES, GET_NUM_OF_EMPLOYEES);
        ISObjectBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate1 = SObjectBiPredicates.isGreaterOrEqual(GET_NUM_OF_EMPLOYEES);
        ISObjectBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate2 = SObjectBiPredicates.isGreaterOrEqual(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate3 = SObjectBiPredicates.isGreaterOrEqual(accNumOfEmployeesField);
        // Then
        for (Account acc : INPUT) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) >= (Integer) DELTA.get(accNumOfEmployeesField);
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate2.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate3.test(acc, DELTA));
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
        ISObjectBiPredicate numOfEmployeesAreEqualBiPredicate = SObjectBiPredicates.areEqual(GET_NUM_OF_EMPLOYEES, GET_NUM_OF_EMPLOYEES);
        ISObjectBiPredicate numOfEmployeesAreEqualBiPredicate1 = SObjectBiPredicates.areEqual(GET_NUM_OF_EMPLOYEES);
        ISObjectBiPredicate numOfEmployeesAreEqualBiPredicate2 = SObjectBiPredicates.areEqual(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesAreEqualBiPredicate3 = SObjectBiPredicates.areEqual(accNumOfEmployeesField);
        ISObjectBiPredicate areEqualBiPredicate = SObjectBiPredicates.areEqual();
        // Then
        for (Account acc : INPUT) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) == (Integer) DELTA.get(accNumOfEmployeesField);
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreEqualBiPredicate.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreEqualBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreEqualBiPredicate2.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreEqualBiPredicate3.test(acc, DELTA));
            Assert.areEqual(acc == DELTA, areEqualBiPredicate.test(acc, DELTA));
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
        ISObjectBiPredicate numOfEmployeesAreNotEqualBiPredicate = SObjectBiPredicates.areNotEqual(GET_NUM_OF_EMPLOYEES, GET_NUM_OF_EMPLOYEES);
        ISObjectBiPredicate numOfEmployeesAreNotEqualBiPredicate1 = SObjectBiPredicates.areNotEqual(GET_NUM_OF_EMPLOYEES);
        ISObjectBiPredicate numOfEmployeesAreNotEqualBiPredicate2 = SObjectBiPredicates.areNotEqual(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesAreNotEqualBiPredicate3 = SObjectBiPredicates.areNotEqual(accNumOfEmployeesField);
        ISObjectBiPredicate areNotEqualBiPredicate = SObjectBiPredicates.areNotEqual();
        // Then
        for (Account acc : INPUT) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) != (Integer) DELTA.get(accNumOfEmployeesField);
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate2.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate3.test(acc, DELTA));
            Assert.areEqual(acc != DELTA, areNotEqualBiPredicate.test(acc, DELTA));
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
        ISObjectBiPredicate numOfEmployeesIsLessBiPredicate = SObjectBiPredicates.isLess(GET_NUM_OF_EMPLOYEES, GET_NUM_OF_EMPLOYEES);
        ISObjectBiPredicate numOfEmployeesIsLessBiPredicate1 = SObjectBiPredicates.isLess(GET_NUM_OF_EMPLOYEES);
        ISObjectBiPredicate numOfEmployeesIsLessBiPredicate2 = SObjectBiPredicates.isLess(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesIsLessBiPredicate3 = SObjectBiPredicates.isLess(accNumOfEmployeesField);
        // Then
        for (Account acc : INPUT) {
            Integer leftNumOfEmployees = (Integer) acc.get(accNumOfEmployeesField);
            Boolean isIncreasedNum = leftNumOfEmployees == null ? true : leftNumOfEmployees < (Integer) DELTA.get(accNumOfEmployeesField);
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessBiPredicate.test(acc, DELTA));
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessBiPredicate2.test(acc, DELTA));
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessBiPredicate3.test(acc, DELTA));
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
        ISObjectBiPredicate numOfEmployeesIsLessOrEqualBiPredicate = SObjectBiPredicates.isLessOrEqual(GET_NUM_OF_EMPLOYEES, GET_NUM_OF_EMPLOYEES);
        ISObjectBiPredicate numOfEmployeesIsLessOrEqualBiPredicate1 = SObjectBiPredicates.isLessOrEqual(GET_NUM_OF_EMPLOYEES);
        ISObjectBiPredicate numOfEmployeesIsLessOrEqualBiPredicate2 = SObjectBiPredicates.isLessOrEqual(numOfEmployeesFieldName);
        ISObjectBiPredicate numOfEmployeesIsLessOrEqualBiPredicate3 = SObjectBiPredicates.isLessOrEqual(accNumOfEmployeesField);
        // Then
        for (Account acc : INPUT) {
            Integer leftNumOfEmployees = (Integer) acc.get(accNumOfEmployeesField);
            Boolean isIncreasedNum = leftNumOfEmployees == null ? true : leftNumOfEmployees <= (Integer) DELTA.get(accNumOfEmployeesField);
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate.test(acc, DELTA));
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate2.test(acc, DELTA));
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate3.test(acc, DELTA));
        }
    }
    
}
