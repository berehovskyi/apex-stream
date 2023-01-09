/**
 * @see SObjectToDoubleFunction
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectToDoubleFunctionTest {
    
    private static final List<Account> INPUT = IterTestUtils.generateAccounts();

    /**
     * @see SObjectToDoubleFunction.downcast
     */
    @IsTest
    static void default() {
        // Given
        Long value = 42L;
        // When
        ISObjectToDoubleFunction getNumOfEmployeesAsDouble = SObjectToDoubleFunction.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        ISObjectToDoubleFunction get42 = SObjectToDoubleFunction.downcast(Function.constant(value));
        // Then
        for (Account acc : INPUT) {
            Assert.areEqual(acc.get(IterTestUtils.CONSTS.Account.NumberOfEmployees), getNumOfEmployeesAsDouble.apply(acc));
            Assert.areEqual(value, get42.apply(acc));
        }
    }
    
}
