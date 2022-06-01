/**
 * @author Oleh Berehovskyi
 * @see ToDoubleFunction
 */
@IsTest(IsParallel = true)
private class ToDoubleFunctionTest {

    private static List<Account> accounts = IterTestUtils.generateAccounts();

    /**
     * @see ToDoubleFunction.downcast
     */
    @IsTest
    static void staticMethods() {
        // Given
        Long value = 42L;
        // When
        IToDoubleFunction getNumOfEmployeesAsDouble = ToDoubleFunction.downcast(SObjectFunction.get(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        IToDoubleFunction get42 = ToDoubleFunction.downcast(Function.constant(value));
        // Then
        for (Account acc : accounts) {
            Validate.assertEquals(acc.get(IterTestUtils.CONSTS.Account.NumberOfEmployees), getNumOfEmployeesAsDouble.apply(acc));
            Validate.assertEquals(value, get42.apply(acc));
        }
    }

    /**
     * @see ToDoubleFunction.asDouble
     * @see ToDoubleFunction.valueOf
     */
    @IsTest
    static void objectToDouble() {
        // Given
        List<Object> input = new List<Object>{ 1, 2.02, 3L };
        List<String> input1 = new List<String>{ '123', '1.02', '2.35', '-3', '33' };
        // When
        IToDoubleFunction asDouble = ToDoubleFunction.asDouble();
        IToDoubleFunction doubleValue = ToDoubleFunction.valueOf();
        // Then
        for (Object o : input) {
            Validate.assertEquals((Double) o, asDouble.apply(o));
        }
        for (String s : input1) {
            Validate.assertEquals(Double.valueOf(s), doubleValue.apply(s));
        }
    }
}
