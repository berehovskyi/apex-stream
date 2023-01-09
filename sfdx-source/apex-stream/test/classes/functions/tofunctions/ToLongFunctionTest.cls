/**
 * @see ToLongFunction
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ToLongFunctionTest {

    private static final List<Account> INPUT = IterTestUtils.generateAccounts();

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
        for (Account acc : INPUT) {
            Assert.areEqual(acc.get(IterTestUtils.CONSTS.Account.NumberOfEmployees), getNumOfEmployeesAsLong.apply(acc));
            Assert.areEqual(value, get42.apply(acc));
        }
    }
    
}
