/**
 * @see SObjectFunction
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectFunctionTest {

    private static final List<Contact> INPUT = IterTestUtils.generateContacts();

    /**
     * @see SObjectFunction.identity
     * @see SObjectFunction.constant
     * @see SObjectFunction.compose
     */
    @IsTest
    static void default() {
        // Given
        Object constant = 42;
        String fieldName = 'Assets';
        SObjectField field = Contact.AccountId;
        SObjectType accSObjectType = Account.SObjectType;
        // When
        ISObjectFunction identity = SObjectFunction.identity();
        ISObjectFunction get42 = SObjectFunction.constant(constant);
        ISObjectFunction hasAssets = SObjectFunction.compose(SObjectPredicates.hasSObjects(fieldName));
        ISObjectFunction getParent = SObjectFunction.compose(SObjectUnaryOperators.getSObject(field));
        ISObjectFunction generateAccId = SObjectFunction.compose(IdSuppliers.of(accSObjectType));
        // Then
        for (Contact con : INPUT) {
            Validate.assertEquals(con, identity.apply(con));
            Validate.assertEquals(constant, get42.apply(con));
            Validate.assertEquals(!(con.getSObjects('Assets')).isEmpty(), hasAssets.apply(con));
            Validate.assertEquals(con.getSObject(field), getParent.apply(con));
            Validate.assertEquals(accSObjectType, ((Id) generateAccId.apply(con)).getSobjectType());
        }
    }

}
