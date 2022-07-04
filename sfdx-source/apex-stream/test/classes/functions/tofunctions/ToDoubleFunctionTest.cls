/**
 * @see ToDoubleFunction
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ToDoubleFunctionTest {

    private static List<Object> accounts = IterTestUtils.generateAccounts();

    /**
     * @see ToDoubleFunction.compose
     */
    @IsTest
    static void default() {
        // Given
        Long value = 42L;
        // When
        IToDoubleFunction getNumOfEmployeesAsDouble = ToDoubleFunction.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        IToDoubleFunction get42 = ToDoubleFunction.compose(Function.constant(value));
        // Then
        for (Object acc : accounts) {
            Validate.assertEquals(((Account) acc).get(IterTestUtils.CONSTS.Account.NumberOfEmployees), getNumOfEmployeesAsDouble.apply(acc));
            Validate.assertEquals(value, get42.apply(acc));
        }
    }
   
}
