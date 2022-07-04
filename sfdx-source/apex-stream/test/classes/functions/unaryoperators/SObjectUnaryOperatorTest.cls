/**
 * @see SObjectUnaryOperator
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectUnaryOperatorTest {

    private static List<Contact> input = IterTestUtils.generateContacts2();

    /**
     * @see SObjectUnaryOperator.andThen
     * @see SObjectUnaryOperator.compose
     * @see SObjectUnaryOperator.identity
     * @see SObjectUnaryOperator.constant
     * @see SObjectUnaryOperator.compose
     */
    @IsTest
    static void default() {
        // Given
        Object value = 'Value';
        SObject acc = new Account(Id = IterTestUtils.generateId(Account.SObjectType));
        SObjectField conAccIdField = Contact.AccountId;
        SObjectField accDescriptionField = Account.Description;
        String accFieldName = 'Account';
        String accDescriptionFieldName = 'Description';
        // When
        ISObjectUnaryOperator identity = SObjectUnaryOperator.identity();
        ISObjectUnaryOperator constant = SObjectUnaryOperator.constant(acc);
        ISObjectUnaryOperator operator = SObjectUnaryOperators.getSObject(conAccIdField).andThen(SObjectUnaryOperators.set(accDescriptionField, value));
        ISObjectUnaryOperator operator1 = SObjectUnaryOperators.set(accDescriptionField, value).compose(SObjectUnaryOperators.getSObject(conAccIdField));
        ISObjectUnaryOperator operator2 = SObjectUnaryOperator.compose(
                new List<ISObjectUnaryOperator>{
                        SObjectUnaryOperators.getSObject(accFieldName),
                        SObjectUnaryOperators.set(accDescriptionFieldName, value)
                }
        );
        // Then
        for (Contact con : input) {
            Validate.assertEquals(con, identity.apply(con));
            Validate.assertEquals(acc, constant.apply(con));
            if (con.Account != null) {
                Contact clone = (Contact) IterTestUtils.deepClone(con);
                clone.getSObject(conAccIdField).put(accDescriptionField, value);
                Validate.assertEquals(clone.getSObject(conAccIdField), operator.apply(IterTestUtils.deepClone(con)));
                Validate.assertEquals(clone.getSObject(conAccIdField), operator1.apply(IterTestUtils.deepClone(con)));
                Validate.assertEquals(clone.getSObject(conAccIdField), operator2.apply(IterTestUtils.deepClone(con)));
            }
        }
    }

}
