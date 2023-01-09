/**
 * @see SObjectConsumer
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectConsumerTest {

    private static final List<Contact> INPUT = IterTestUtils.generateContacts2();

    /**
     * @see SObjectConsumer.andThen
     * @see SObjectConsumer.compose
     */
    @IsTest
    static void default() {
        // Given
        Object constant = true;
        // When
        SObjectConsumer setDescFromDepartment = SObjectConsumers.set(IterTestUtils.CONSTS.Contact.Description, SObjectFunctions.get(IterTestUtils.CONSTS.Contact.Department));
        SObjectConsumer setDoNotCall = SObjectConsumers.set(IterTestUtils.CONSTS.DO_NOT_CALL, constant);
        ISObjectConsumer consumer = setDescFromDepartment.andThen(setDoNotCall);
        ISObjectConsumer consumer1 = SObjectConsumer.compose(new List<ISObjectConsumer>{ setDescFromDepartment, setDoNotCall });
        // Then
        for (Contact con : INPUT) {
            SObject clone = IterTestUtils.deepClone(con);
            clone.put(IterTestUtils.CONSTS.Contact.Description, clone.get(IterTestUtils.CONSTS.Contact.Department));
            SObject cloneToConsume = IterTestUtils.deepClone(con);
            setDescFromDepartment.accept(cloneToConsume);
            Validate.assertEquals(clone, cloneToConsume);
            SObject clone1 = IterTestUtils.deepClone(con);
            clone1.put(IterTestUtils.CONSTS.DO_NOT_CALL, constant);
            SObject cloneToConsume1 = IterTestUtils.deepClone(con);
            setDoNotCall.accept(cloneToConsume1);
            Validate.assertEquals(clone1, cloneToConsume1);
            SObject clone2 = IterTestUtils.deepClone(con);
            clone2.put(IterTestUtils.CONSTS.Contact.Description, clone2.get(IterTestUtils.CONSTS.Contact.Department));
            clone2.put(IterTestUtils.CONSTS.DO_NOT_CALL, constant);
            SObject cloneToConsume2 = IterTestUtils.deepClone(con);
            consumer.accept(cloneToConsume2);
            SObject cloneToConsume3 = IterTestUtils.deepClone(con);
            consumer1.accept(cloneToConsume3);
            Validate.assertEquals(clone2, cloneToConsume2);
            Validate.assertEquals(clone2, cloneToConsume3);
        }
    }

}
