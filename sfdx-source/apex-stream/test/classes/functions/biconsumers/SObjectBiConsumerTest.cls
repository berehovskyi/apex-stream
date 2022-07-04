/**
 * @see SObjectBiConsumer
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectBiConsumerTest {

    private static List<Contact> input = IterTestUtils.generateContacts();

    /**
     * @see SObjectBiConsumer.andThen
     * @see SObjectBiConsumer.compose
     */
    @IsTest
    static void default() {
        // Given
        Object constant = true;
        // When
        SObjectBiConsumer setDescFromDepartment = SObjectBiConsumers.set(IterTestUtils.CONSTS.Contact.Description, SObjectFunctions.get(IterTestUtils.CONSTS.Contact.Department));
        SObjectBiConsumer setDoNotCall = SObjectBiConsumers.set(IterTestUtils.CONSTS.DO_NOT_CALL, constant);
        ISObjectBiConsumer consumer = setDescFromDepartment.andThen(setDoNotCall);
        ISObjectBiConsumer consumer1 = setDoNotCall.compose(setDescFromDepartment);
        ISObjectBiConsumer consumer2 = SObjectBiConsumer.compose(new List<ISObjectBiConsumer>{ setDescFromDepartment, setDoNotCall });
        // Then
        for (Contact con : input) {
            Contact expected = new Contact(Description = con.Department, DoNotCall = true);
            SObject src = IterTestUtils.deepClone(con);
            SObject target = new Contact();
            consumer.accept(src, target);
            Validate.assertEquals(expected, target);
            SObject src1 = IterTestUtils.deepClone(con);
            SObject target1 = new Contact();
            consumer1.accept(src1, target1);
            Validate.assertEquals(expected, target1);
            SObject src2 = IterTestUtils.deepClone(con);
            SObject target2 = new Contact();
            consumer2.accept(src2, target2);
            Validate.assertEquals(expected, target2);
        }
    }

}
