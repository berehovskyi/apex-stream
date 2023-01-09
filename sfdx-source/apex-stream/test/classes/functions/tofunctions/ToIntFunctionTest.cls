/**
 * @see ToIntFunction
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ToIntFunctionTest {

    private static final List<Account> INPUT = IterTestUtils.generateAccounts();

    /**
     * @see ToIntFunction.compose
     */
    @IsTest
    static void default() {
        // Given
        Integer value = 42;
        // When
        IToIntFunction getNumOfEmployeesAsInt = ToIntFunction.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        IToIntFunction get42 = ToIntFunction.compose(Function.constant(value));
        // Then
        for (Account acc : INPUT) {
            Assert.areEqual(acc.get(IterTestUtils.CONSTS.Account.NumberOfEmployees), getNumOfEmployeesAsInt.apply(acc));
            Assert.areEqual(value, get42.apply(acc));
        }
    }

}
