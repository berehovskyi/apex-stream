/**
 * @author Oleh Berehovskyi
 * @see ToIntFunction
 */
@IsTest(IsParallel = true)
private class ToIntFunctionTest {

    private static List<Account> accounts = IterTestUtils.generateAccounts();

    /**
     * @see ToIntFunction.downcast
     */
    @IsTest
    static void staticMethods() {
        // Given
        Integer value = 42;
        // When
        IToIntFunction getNumOfEmployeesAsInt = ToIntFunction.downcast(SObjectFunction.get(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        IToIntFunction get42 = ToIntFunction.downcast(Function.constant(value));
        // Then
        for (Account acc : accounts) {
            Validate.assertEquals(acc.get(IterTestUtils.CONSTS.Account.NumberOfEmployees), getNumOfEmployeesAsInt.apply(acc));
            Validate.assertEquals(value, get42.apply(acc));
        }
    }

    /**
     * @see ToIntFunction.asInt
     * @see ToIntFunction.valueOf
     */
    @IsTest
    static void default() {
        // Given
        List<Object> input = new List<Object>{ 1, 2, 3 };
        List<Object> input1 = new List<Object>{ '123', 1, 2L, 3.0, '33' };
        // When
        IToIntFunction asInt = ToIntFunction.asInt();
        IToIntFunction intValue = ToIntFunction.valueOf();
        // Then
        for (Object o : input) {
            Validate.assertEquals((Integer) o, asInt.apply(o));
        }
        for (Object o : input1) {
            Validate.assertEquals(Integer.valueOf(o), intValue.apply(o));
        }
    }

}
