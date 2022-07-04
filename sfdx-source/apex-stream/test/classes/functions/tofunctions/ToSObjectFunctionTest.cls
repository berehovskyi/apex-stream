/**
 * @see ToSObjectFunction
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ToSObjectFunctionTest {

    private static List<Object> accounts = IterTestUtils.generateAccounts();

    /**
     * @see ToSObjectFunction.compose
     */
    @IsTest
    static void default() {
        // Given
        SObject value = new Contact();
        // When
        IToSObjectFunction getValue = ToSObjectFunction.compose(Function.constant(value));
        // Then
        for (Object acc : accounts) {
            Validate.assertEquals(value, getValue.apply(acc));
        }
    }
    
}
