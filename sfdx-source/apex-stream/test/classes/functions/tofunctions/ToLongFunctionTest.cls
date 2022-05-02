/**
 * @author O. Berehovskyi
 * @see ToLongFunction
 */
@IsTest(IsParallel = true)
private class ToLongFunctionTest {

    private static List<Account> accounts = IterTestUtils.generateAccounts();

    /**
     * @see ToLongFunction.downcast
     */
    @IsTest
    static void staticMethods() {
        // Given
        Long value = 42L;
        // When
        IToLongFunction getNumOfEmployeesAsLong = ToLongFunction.downcast(SObjectFunction.get(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        IToLongFunction get42 = ToLongFunction.downcast(Function.constant(value));
        // Then
        for (Account acc : accounts) {
            Validate.assertEquals(acc.get(IterTestUtils.CONSTS.Account.NumberOfEmployees), getNumOfEmployeesAsLong.apply(acc));
            Validate.assertEquals(value, get42.apply(acc));
        }
    }

    /**
     * @see DatetimeToLongFunction.getTime
     * @see ToLongFunction.asLong
     * @see StringToLongFunction.longValueOf
     */
    @IsTest
    static void objectToLong() {
        // Given
        List<Datetime> datetimes = IterTestUtils.generateDatetimes1();
        List<Object> input = new List<Object>{ 1, 2, 3 };
        List<String> input1 = new List<String>{ '123', '1', '2', '-3', '33' };
        // When
        IToLongFunction getTime = DatetimeToLongFunction.getTime();
        IToLongFunction asLong = ToLongFunction.asLong();
        IToLongFunction longValue = StringToLongFunction.valueOf();
        // Then
        for (Datetime o : datetimes) {
            Validate.assertEquals(o.getTime(), getTime.apply(o));
        }
        for (Object o : input) {
            Validate.assertEquals((Long) o, asLong.apply(o));
        }
        for (String s : input1) {
            Validate.assertEquals(Long.valueOf(s), longValue.apply(s));
        }
    }
}
