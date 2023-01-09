/**
 * @see ToSObjectFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ToSObjectFunctionsTest {
    
    private static final List<Object> INPUT = IterTestUtils.generateAccounts();

    static {
        new ToSObjectFunctions();
    }

    /**
     * @see ToSObjectFunctions.asSObject
     */
    @IsTest
    static void convert() {
        // When
        IToSObjectFunction asSObject = ToSObjectFunctions.asSObject();
        // Then
        for (Object acc : INPUT) {
            Assert.areEqual((SObject) acc, asSObject.apply(acc));
        }
    }
    
}
