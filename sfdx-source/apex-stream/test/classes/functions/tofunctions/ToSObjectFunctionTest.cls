/**
 * @see ToSObjectFunction
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ToSObjectFunctionTest {

    private static final List<Object> INPUT = IterTestUtils.generateAccounts();

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
        for (Object acc : INPUT) {
            Assert.areEqual(value, getValue.apply(acc));
        }
    }
    
}
