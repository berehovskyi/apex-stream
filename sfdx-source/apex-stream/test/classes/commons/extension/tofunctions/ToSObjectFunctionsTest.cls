/**
 * @see ToSObjectFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ToSObjectFunctionsTest {
    
    private static List<Object> accounts = IterTestUtils.generateAccounts();

    /**
     * @see ToSObjectFunctions.asSObject
     */
    @IsTest
    static void convert() {
        // When
        IToSObjectFunction asSObject = ToSObjectFunctions.asSObject();
        // Then
        new ToSObjectFunctions();
        for (Object acc : accounts) {
            Validate.assertEquals((SObject) acc, asSObject.apply(acc));
        }
    }
    
}
