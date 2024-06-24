/**
 * @see SObjectBiPredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings(
    'PMD.ApexAssertionsShouldIncludeMessage, PMD.ApexUnitTestClassShouldHaveRunAs, PMD.CognitiveComplexity'
)
private class SObjectBiPredicatesTest {

    private static final List<Account> INPUT = AfTestData.generateAccounts();
    private static final Account DELTA = new Account(Type = AfTestConsts.PARTNER, NumberOfEmployees = 100, BillingLatitude = -50.45);

    static {
        new SObjectBiPredicates();
    }

    /**
     * @see SObjectBiPredicates.isGreater
     */
    @IsTest
    static void isGreater() {
        // Given
        String numOfEmployeesFieldName = AfTestConsts.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = AfTestConsts.Account.NumberOfEmployees;
        IFunction getNumOfEmployees = SObjectFunctions.get(numOfEmployeesFieldName);
        IFunction getNumOfEmployees1 = SObjectFunctions.get(accNumOfEmployeesField);
        // When
        IBiPredicate numOfEmployeesIsGreaterBiPredicate = SObjectBiPredicates.isGreater(getNumOfEmployees, getNumOfEmployees1);
        IBiPredicate numOfEmployeesIsGreaterBiPredicate1 = SObjectBiPredicates.isGreater(numOfEmployeesFieldName);
        IBiPredicate numOfEmployeesIsGreaterBiPredicate2 = SObjectBiPredicates.isGreater(accNumOfEmployeesField);
        // Then
        for (Account acc : INPUT) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) DELTA.get(accNumOfEmployeesField);
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate2.test(acc, DELTA));
        }
    }

    /**
     * @see SObjectBiPredicates.isGreaterOrEqual
     */
    @IsTest
    static void isGreaterOrEqual() {
        // Given
        String numOfEmployeesFieldName = AfTestConsts.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = AfTestConsts.Account.NumberOfEmployees;
        IFunction getNumOfEmployees = SObjectFunctions.get(numOfEmployeesFieldName);
        IFunction getNumOfEmployees1 = SObjectFunctions.get(accNumOfEmployeesField);
        // When
        IBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate = SObjectBiPredicates.isGreaterOrEqual(getNumOfEmployees, getNumOfEmployees1);
        IBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate1 = SObjectBiPredicates.isGreaterOrEqual(numOfEmployeesFieldName);
        IBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate2 = SObjectBiPredicates.isGreaterOrEqual(accNumOfEmployeesField);
        // Then
        for (Account acc : INPUT) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) >= (Integer) DELTA.get(accNumOfEmployeesField);
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate2.test(acc, DELTA));
        }
    }

    /**
     * @see SObjectBiPredicates.areEqual
     */
    @IsTest
    static void areEqual() {
        // Given
        String numOfEmployeesFieldName = AfTestConsts.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = AfTestConsts.Account.NumberOfEmployees;
        IFunction getNumOfEmployees = SObjectFunctions.get(numOfEmployeesFieldName);
        IFunction getNumOfEmployees1 = SObjectFunctions.get(accNumOfEmployeesField);
        // When
        IBiPredicate numOfEmployeesAreEqualBiPredicate = SObjectBiPredicates.areEqual(getNumOfEmployees, getNumOfEmployees1);
        IBiPredicate numOfEmployeesAreEqualBiPredicate1 = SObjectBiPredicates.areEqual(numOfEmployeesFieldName);
        IBiPredicate numOfEmployeesAreEqualBiPredicate2 = SObjectBiPredicates.areEqual(accNumOfEmployeesField);
        IBiPredicate areEqualBiPredicate = SObjectBiPredicates.areEqual();
        // Then
        for (Account acc : INPUT) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) == (Integer) DELTA.get(accNumOfEmployeesField);
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreEqualBiPredicate.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreEqualBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreEqualBiPredicate2.test(acc, DELTA));
            Assert.areEqual(acc == DELTA, areEqualBiPredicate.test(acc, DELTA));
        }
    }

    /**
     * @see SObjectBiPredicates.areNotEqual
     */
    @IsTest
    static void areNotEqual() {
        // Given
        String numOfEmployeesFieldName = AfTestConsts.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = AfTestConsts.Account.NumberOfEmployees;
        IFunction getNumOfEmployees = SObjectFunctions.get(numOfEmployeesFieldName);
        IFunction getNumOfEmployees1 = SObjectFunctions.get(accNumOfEmployeesField);
        // When
        IBiPredicate numOfEmployeesAreNotEqualBiPredicate = SObjectBiPredicates.areNotEqual(getNumOfEmployees, getNumOfEmployees1);
        IBiPredicate numOfEmployeesAreNotEqualBiPredicate1 = SObjectBiPredicates.areNotEqual(numOfEmployeesFieldName);
        IBiPredicate numOfEmployeesAreNotEqualBiPredicate2 = SObjectBiPredicates.areNotEqual(accNumOfEmployeesField);
        IBiPredicate areNotEqualBiPredicate = SObjectBiPredicates.areNotEqual();
        // Then
        for (Account acc : INPUT) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) != (Integer) DELTA.get(accNumOfEmployeesField);
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate2.test(acc, DELTA));
            Assert.areEqual(acc != DELTA, areNotEqualBiPredicate.test(acc, DELTA));
        }
    }

    /**
     * @see SObjectBiPredicates.isLess
     */
    @IsTest
    static void isLess() {
        // Given
        String numOfEmployeesFieldName = AfTestConsts.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = AfTestConsts.Account.NumberOfEmployees;
        IFunction getNumOfEmployees = SObjectFunctions.get(numOfEmployeesFieldName);
        IFunction getNumOfEmployees1 = SObjectFunctions.get(accNumOfEmployeesField);
        // When
        IBiPredicate numOfEmployeesIsLessBiPredicate = SObjectBiPredicates.isLess(getNumOfEmployees, getNumOfEmployees1);
        IBiPredicate numOfEmployeesIsLessBiPredicate1 = SObjectBiPredicates.isLess(numOfEmployeesFieldName);
        IBiPredicate numOfEmployeesIsLessBiPredicate2 = SObjectBiPredicates.isLess(accNumOfEmployeesField);
        // Then
        for (Account acc : INPUT) {
            Integer leftNumOfEmployees = (Integer) acc.get(accNumOfEmployeesField);
            Boolean isIncreasedNum = leftNumOfEmployees == null ? true : leftNumOfEmployees < (Integer) DELTA.get(accNumOfEmployeesField);
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessBiPredicate.test(acc, DELTA));
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessBiPredicate2.test(acc, DELTA));
        }
    }

    /**
     * @see SObjectBiPredicates.isLessOrEqual
     */
    @IsTest
    static void isLessOrEqual() {
        // Given
        String numOfEmployeesFieldName = AfTestConsts.NUMBER_OF_EMPLOYEES;
        SObjectField accNumOfEmployeesField = AfTestConsts.Account.NumberOfEmployees;
        IFunction getNumOfEmployees = SObjectFunctions.get(numOfEmployeesFieldName);
        IFunction getNumOfEmployees1 = SObjectFunctions.get(accNumOfEmployeesField);
        // When
        IBiPredicate numOfEmployeesIsLessOrEqualBiPredicate = SObjectBiPredicates.isLessOrEqual(getNumOfEmployees, getNumOfEmployees1);
        IBiPredicate numOfEmployeesIsLessOrEqualBiPredicate1 = SObjectBiPredicates.isLessOrEqual(numOfEmployeesFieldName);
        IBiPredicate numOfEmployeesIsLessOrEqualBiPredicate2 = SObjectBiPredicates.isLessOrEqual(accNumOfEmployeesField);
        // Then
        for (Account acc : INPUT) {
            Integer leftNumOfEmployees = (Integer) acc.get(accNumOfEmployeesField);
            Boolean isIncreasedNum = leftNumOfEmployees == null ? true : leftNumOfEmployees <= (Integer) DELTA.get(accNumOfEmployeesField);
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate.test(acc, DELTA));
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate2.test(acc, DELTA));
        }
    }

}
