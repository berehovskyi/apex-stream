/**
 * @see ToLongFunction
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ToLongFunctionTest {

    private static List<Account> accounts = IterTestUtils.generateAccounts();

    /**
     * @see ToLongFunction.compose
     */
    @IsTest
    static void default() {
        // Given
        Long value = 42L;
        // When
        IToLongFunction getNumOfEmployeesAsLong = ToLongFunction.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        IToLongFunction get42 = ToLongFunction.compose(Function.constant(value));
        // Then
        for (Account acc : accounts) {
            Validate.assertEquals(acc.get(IterTestUtils.CONSTS.Account.NumberOfEmployees), getNumOfEmployeesAsLong.apply(acc));
            Validate.assertEquals(value, get42.apply(acc));
        }
    }
    
}
