/**
 * @see SObjectToDoubleFunction
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectToDoubleFunctionTest {
    
    private static List<Account> accounts = IterTestUtils.generateAccounts();

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
        for (Account acc : accounts) {
            Validate.assertEquals(acc.get(IterTestUtils.CONSTS.Account.NumberOfEmployees), getNumOfEmployeesAsDouble.apply(acc));
            Validate.assertEquals(value, get42.apply(acc));
        }
    }
    
}
