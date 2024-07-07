/**
 * @see SObjectApexComparerBiPredicateProvider
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexUnitTestClassShouldHaveRunAs')
private class SObjectApexComparerBiPredicateProvTest {
    private static final List<Account> INPUT = AfTestData.generateAccounts();
    private static final Account DELTA = new Account(Type = AfTestConsts.PARTNER, NumberOfEmployees = 100, BillingLatitude = -50.45);
    private static final SObjectComparerBiPredicateProvider BI_PRED = new SObjectApexComparerBiPredicateProvider();
    private static final SObjectField ACC_NUM_OF_EMPLOYEES_FIELD = AfTestConsts.Account.NumberOfEmployees;
    private static final String NUM_OF_EMPLOYEES_FIELD_NAME = 'NumberOfEmployees';

    /**
     * @see SObjectComparerBiPredicateProvider.ComparisonOperator.gt
     */
    @IsTest
    static void isGreater() {
        // Given
        IFunction getNumOfEmployees = new SObjectFunctionProvider().get(NUM_OF_EMPLOYEES_FIELD_NAME);
        IFunction getNumOfEmployees1 = new SObjectFunctionProvider().get(ACC_NUM_OF_EMPLOYEES_FIELD);
        // When
        IBiPredicate numOfEmployeesIsGreaterBiPredicate = BI_PRED.isL(getNumOfEmployees).gt().rVal(getNumOfEmployees1);
        IBiPredicate numOfEmployeesIsGreaterBiPredicate1 = BI_PRED.isL(NUM_OF_EMPLOYEES_FIELD_NAME).gt().rVal(NUM_OF_EMPLOYEES_FIELD_NAME);
        IBiPredicate numOfEmployeesIsGreaterBiPredicate2 = BI_PRED.isL(ACC_NUM_OF_EMPLOYEES_FIELD).gt().rVal(ACC_NUM_OF_EMPLOYEES_FIELD);
        // Then
        for (Account acc : INPUT) {
            Boolean isDecreasedNum = (Integer) acc.get(ACC_NUM_OF_EMPLOYEES_FIELD) > (Integer) DELTA.get(ACC_NUM_OF_EMPLOYEES_FIELD);
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterBiPredicate2.test(acc, DELTA));
        }
    }

    /**
     * @see SObjectComparerBiPredicateProvider.ComparisonOperator.ge
     */
    @IsTest
    static void isGreaterOrEqual() {
        // Given
        IFunction getNumOfEmployees = new SObjectFunctionProvider().get(NUM_OF_EMPLOYEES_FIELD_NAME);
        IFunction getNumOfEmployees1 = new SObjectFunctionProvider().get(ACC_NUM_OF_EMPLOYEES_FIELD);
        // When
        IBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate = BI_PRED.isL(getNumOfEmployees).ge().rVal(getNumOfEmployees1);
        IBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate1 = BI_PRED.isL(NUM_OF_EMPLOYEES_FIELD_NAME).ge().rVal(NUM_OF_EMPLOYEES_FIELD_NAME);
        IBiPredicate numOfEmployeesIsGreaterOrEqualBiPredicate2 = BI_PRED.isL(ACC_NUM_OF_EMPLOYEES_FIELD).ge().rVal(ACC_NUM_OF_EMPLOYEES_FIELD);
        // Then
        for (Account acc : INPUT) {
            Boolean isDecreasedNum = (Integer) acc.get(ACC_NUM_OF_EMPLOYEES_FIELD) >= (Integer) DELTA.get(ACC_NUM_OF_EMPLOYEES_FIELD);
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesIsGreaterOrEqualBiPredicate2.test(acc, DELTA));
        }
    }

    /**
     * @see SObjectComparerBiPredicateProvider.ComparisonOperator.eq
     * @see SObjectComparerBiPredicateProvider.areEq
     */
    @IsTest
    static void areEqual() {
        // Given
        IFunction getNumOfEmployees = new SObjectFunctionProvider().get(NUM_OF_EMPLOYEES_FIELD_NAME);
        IFunction getNumOfEmployees1 = new SObjectFunctionProvider().get(ACC_NUM_OF_EMPLOYEES_FIELD);
        // When
        IBiPredicate numOfEmployeesAreEqualBiPredicate = BI_PRED.isL(getNumOfEmployees).eq().rVal(getNumOfEmployees1);
        IBiPredicate numOfEmployeesAreEqualBiPredicate1 = BI_PRED.isL(NUM_OF_EMPLOYEES_FIELD_NAME).eq().rVal(NUM_OF_EMPLOYEES_FIELD_NAME);
        IBiPredicate numOfEmployeesAreEqualBiPredicate2 = BI_PRED.isL(ACC_NUM_OF_EMPLOYEES_FIELD).eq().rVal(ACC_NUM_OF_EMPLOYEES_FIELD);
        IBiPredicate areEqualBiPredicate = BI_PRED.areEq();
        IBiPredicate areEqualBiPredicate1 = BI_PRED.isL().eq().rVal();
        IBiPredicate areEqualBiPredicate2 = BI_PRED.isLVar(DELTA).eq().rVal();
        IBiPredicate areEqualBiPredicate3 = BI_PRED.isL().eq().rVar(DELTA);
        // Then
        for (Account acc : INPUT) {
            Boolean isDecreasedNum = (Integer) acc.get(ACC_NUM_OF_EMPLOYEES_FIELD) == (Integer) DELTA.get(ACC_NUM_OF_EMPLOYEES_FIELD);
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreEqualBiPredicate.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreEqualBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreEqualBiPredicate2.test(acc, DELTA));
            Assert.areEqual(acc == DELTA, areEqualBiPredicate.test(acc, DELTA));
            Assert.areEqual(acc == DELTA, areEqualBiPredicate1.test(acc, DELTA));
            Assert.areEqual(true, areEqualBiPredicate2.test(acc, DELTA));
            Assert.areEqual(acc == DELTA, areEqualBiPredicate3.test(acc, DELTA));
        }
    }

    /**
     * @see SObjectComparerBiPredicateProvider.ComparisonOperator.ne
     * @see SObjectComparerBiPredicateProvider.areNe
     */
    @IsTest
    static void areNotEqual() {
        // Given
        IFunction getNumOfEmployees = new SObjectFunctionProvider().get(NUM_OF_EMPLOYEES_FIELD_NAME);
        IFunction getNumOfEmployees1 = new SObjectFunctionProvider().get(ACC_NUM_OF_EMPLOYEES_FIELD);
        // When
        IBiPredicate numOfEmployeesAreNotEqualBiPredicate = BI_PRED.isL(getNumOfEmployees).ne().rVal(getNumOfEmployees1);
        IBiPredicate numOfEmployeesAreNotEqualBiPredicate1 = BI_PRED.isL(NUM_OF_EMPLOYEES_FIELD_NAME).ne().rVal(NUM_OF_EMPLOYEES_FIELD_NAME);
        IBiPredicate numOfEmployeesAreNotEqualBiPredicate2 = BI_PRED.isL(ACC_NUM_OF_EMPLOYEES_FIELD).ne().rVal(ACC_NUM_OF_EMPLOYEES_FIELD);
        IBiPredicate areNotEqualBiPredicate = BI_PRED.areNe();
        IBiPredicate areNotEqualBiPredicate1 = BI_PRED.isL().ne().rVal();
        // Then
        for (Account acc : INPUT) {
            Boolean isDecreasedNum = (Integer) acc.get(ACC_NUM_OF_EMPLOYEES_FIELD) != (Integer) DELTA.get(ACC_NUM_OF_EMPLOYEES_FIELD);
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isDecreasedNum, numOfEmployeesAreNotEqualBiPredicate2.test(acc, DELTA));
            Assert.areEqual(acc != DELTA, areNotEqualBiPredicate.test(acc, DELTA));
            Assert.areEqual(acc != DELTA, areNotEqualBiPredicate1.test(acc, DELTA));
        }
    }

    /**
     * @see SObjectComparerBiPredicateProvider.ComparisonOperator.lt
     */
    @IsTest
    static void isLess() {
        // Given
        IFunction getNumOfEmployees = new SObjectFunctionProvider().get(NUM_OF_EMPLOYEES_FIELD_NAME);
        IFunction getNumOfEmployees1 = new SObjectFunctionProvider().get(ACC_NUM_OF_EMPLOYEES_FIELD);
        // When
        IBiPredicate numOfEmployeesIsLessBiPredicate = BI_PRED.isL(getNumOfEmployees).lt().rVal(getNumOfEmployees1);
        IBiPredicate numOfEmployeesIsLessBiPredicate1 = BI_PRED.isL(NUM_OF_EMPLOYEES_FIELD_NAME).lt().rVal(NUM_OF_EMPLOYEES_FIELD_NAME);
        IBiPredicate numOfEmployeesIsLessBiPredicate2 = BI_PRED.isL(ACC_NUM_OF_EMPLOYEES_FIELD).lt().rVal(ACC_NUM_OF_EMPLOYEES_FIELD);
        // Then
        for (Account acc : INPUT) {
            Integer leftNumOfEmployees = (Integer) acc.get(ACC_NUM_OF_EMPLOYEES_FIELD);
            Boolean isIncreasedNum = leftNumOfEmployees < (Integer) DELTA.get(ACC_NUM_OF_EMPLOYEES_FIELD);
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessBiPredicate.test(acc, DELTA));
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessBiPredicate2.test(acc, DELTA));
        }
    }

    /**
     * @see SObjectComparerBiPredicateProvider.ComparisonOperator.le
     */
    @IsTest
    static void isLessOrEqual() {
        // Given
        IFunction getNumOfEmployees = new SObjectFunctionProvider().get(NUM_OF_EMPLOYEES_FIELD_NAME);
        IFunction getNumOfEmployees1 = new SObjectFunctionProvider().get(ACC_NUM_OF_EMPLOYEES_FIELD);
        // When
        IBiPredicate numOfEmployeesIsLessOrEqualBiPredicate = BI_PRED.isL(getNumOfEmployees).le().rVal(getNumOfEmployees1);
        IBiPredicate numOfEmployeesIsLessOrEqualBiPredicate1 = BI_PRED.isL(NUM_OF_EMPLOYEES_FIELD_NAME).le().rVal(NUM_OF_EMPLOYEES_FIELD_NAME);
        IBiPredicate numOfEmployeesIsLessOrEqualBiPredicate2 = BI_PRED.isL(ACC_NUM_OF_EMPLOYEES_FIELD).le().rVal(ACC_NUM_OF_EMPLOYEES_FIELD);
        // Then
        for (Account acc : INPUT) {
            Integer leftNumOfEmployees = (Integer) acc.get(ACC_NUM_OF_EMPLOYEES_FIELD);
            Boolean isIncreasedNum = leftNumOfEmployees <= (Integer) DELTA.get(ACC_NUM_OF_EMPLOYEES_FIELD);
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate.test(acc, DELTA));
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate1.test(acc, DELTA));
            Assert.areEqual(isIncreasedNum, numOfEmployeesIsLessOrEqualBiPredicate2.test(acc, DELTA));
        }
    }
}
