/**
 * @author O. Berehovskyi
 * @see ToSObjectFunction
 */
@IsTest(IsParallel = true)
private class ToSObjectFunctionTest {

    private static List<Object> accounts = IterTestUtils.generateAccounts();

    /**
     * @see ToSObjectFunction.downcast
     * @see ToSObjectFunction.asSObject
     */
    @IsTest
    static void staticMethods() {
        // Given
        SObject value = new Contact();
        // When
        IToSObjectFunction asSObject = ToSObjectFunction.asSObject();
        IToSObjectFunction getValue = ToSObjectFunction.downcast(Function.constant(value));
        // Then
        for (Object acc : accounts) {
            Validate.assertEquals((SObject) acc, asSObject.apply(acc));
            Validate.assertEquals(value, getValue.apply(acc));
        }
    }
}
