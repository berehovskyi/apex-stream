/**
 * @see SObjectConsumers
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectConsumersTest {

    private static final List<Contact> INPUT = IterTestUtils.generateContacts2();

    static {
        new SObjectConsumers();
    }

    /**
     * @see SObjectConsumers.addError
     */
    @IsTest
    static void addError() {
        // Given
        String errorMessage = 'ErrorMsg';
        Exception exc = new IllegalArgumentException();
        String fieldName = IterTestUtils.CONSTS.DEPARTMENT;
        SObjectField field = IterTestUtils.CONSTS.Contact.Department;
        // When
        ISObjectConsumer addErrorMessage = SObjectConsumers.addError(errorMessage);
        ISObjectConsumer addFieldNameError = SObjectConsumers.addError(fieldName, errorMessage);
        ISObjectConsumer addFieldError = SObjectConsumers.addError(field, errorMessage);
        ISObjectConsumer addErrorException = SObjectConsumers.addError(exc);
        // Then
        for (Contact con : INPUT) {
            SObject clone = IterTestUtils.deepClone(con);
            SObject clone1 = IterTestUtils.deepClone(con);
            SObject clone2 = IterTestUtils.deepClone(con);
            SObject clone3 = IterTestUtils.deepClone(con);
            addErrorMessage.accept(clone);
            addFieldNameError.accept(clone1);
            addFieldError.accept(clone2);
            addErrorException.accept(clone3);
            Assert.areEqual(errorMessage, clone.getErrors()[0].getMessage());
            Assert.areEqual(errorMessage, clone1.getErrors()[0].getMessage());
            Assert.areEqual(errorMessage, clone2.getErrors()[0].getMessage());
            try {
                clone3.getErrors();
            } catch (Exception e) {
                Assert.areEqual(exc, e);
            }
        }
    }

    /**
     * @see SObjectConsumers.set
     */
    @IsTest
    static void set() {
        // Given
        Object constant = IterTestUtils.CONSTS.FINANCE;
        // When
        ISObjectConsumer setFinanceToDepartmentConsumer = SObjectConsumers.set(IterTestUtils.CONSTS.Contact.Department, constant);
        ISObjectConsumer setFinanceToDepartmentConsumer1 = SObjectConsumers.set(IterTestUtils.CONSTS.DEPARTMENT, constant);
        ISObjectConsumer setFinanceToDepartmentConsumer2 = SObjectConsumers.set(IterTestUtils.CONSTS.Contact.Department, SObjectFunction.constant(constant));
        ISObjectConsumer setFinanceToDepartmentConsumer3 = SObjectConsumers.set(IterTestUtils.CONSTS.DEPARTMENT, SObjectFunction.constant(constant));
        ISObjectConsumer setDepartmentFromParentConsumer = SObjectConsumers.set(IterTestUtils.CONSTS.DEPARTMENT, SObjectFunctions.get('Account?.Type'));
        ISObjectConsumer setDepartmentFromParentConsumerUnsafe = SObjectConsumers.set(IterTestUtils.CONSTS.DEPARTMENT, SObjectFunctions.get('Account.Type'));
        ISObjectConsumer setDescriptionOnParentConsumer = SObjectConsumers.set('Account?.Description', SObjectFunctions.get(IterTestUtils.CONSTS.DEPARTMENT));
        ISObjectConsumer setDescriptionOnParentConsumerUnsafe = SObjectConsumers.set('Account.Description', SObjectFunctions.get(IterTestUtils.CONSTS.DEPARTMENT));
        // Then
        for (Contact con : INPUT) {
            SObject clone = IterTestUtils.deepClone(con);
            clone.put(IterTestUtils.CONSTS.Contact.Department, constant);
            SObject cloneToConsume = IterTestUtils.deepClone(con);
            setFinanceToDepartmentConsumer.accept(cloneToConsume);
            SObject cloneToConsume1 = IterTestUtils.deepClone(con);
            setFinanceToDepartmentConsumer1.accept(cloneToConsume1);
            SObject cloneToConsume2 = IterTestUtils.deepClone(con);
            setFinanceToDepartmentConsumer2.accept(cloneToConsume2);
            SObject cloneToConsume3 = IterTestUtils.deepClone(con);
            setFinanceToDepartmentConsumer3.accept(cloneToConsume3);
            Assert.areEqual(clone, cloneToConsume);
            Assert.areEqual(clone, cloneToConsume1);
            Assert.areEqual(clone, cloneToConsume2);
            Assert.areEqual(clone, cloneToConsume3);
            SObject clone1 = IterTestUtils.deepClone(con);
            clone1.put(IterTestUtils.CONSTS.DEPARTMENT, con.getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME)?.get(IterTestUtils.CONSTS.TYPE));
            SObject cloneToConsume4 = IterTestUtils.deepClone(con);
            setDepartmentFromParentConsumer.accept(cloneToConsume4);
            Assert.areEqual(clone1, cloneToConsume4);
            SObject clone2 = IterTestUtils.deepClone(con);
            clone2.getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME)?.put(IterTestUtils.CONSTS.DESCRIPTION, con.get(IterTestUtils.CONSTS.DEPARTMENT));
            SObject cloneToConsume5 = IterTestUtils.deepClone(con);
            setDescriptionOnParentConsumer.accept(cloneToConsume5);
            Assert.areEqual(clone2, cloneToConsume5);
            String expectedException = NullPointerException.class.getName();
            try {
                setDepartmentFromParentConsumerUnsafe.accept(con);
            } catch (Exception exc) {
                Assert.areEqual(expectedException, exc.getTypeName());
            }
            try {
                setDescriptionOnParentConsumerUnsafe.accept(con);
            } catch (Exception exc) {
                Assert.areEqual(expectedException, exc.getTypeName());
            }
        }
    }

    /**
     * @see SObjectConsumers.setSObject
     */
    @IsTest
    static void setSObject() {
        // Given
        Account constant = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Test Account');
        // When
        ISObjectConsumer setParentConsumer = SObjectConsumers.setSObject(IterTestUtils.CONSTS.Contact.AccountId, constant);
        ISObjectConsumer setParentConsumer1 = SObjectConsumers.setSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME, constant);
        ISObjectConsumer setParentConsumerByOperator = SObjectConsumers.setSObject(IterTestUtils.CONSTS.Contact.AccountId, new IterTestUtils.TestAccountOperator());
        ISObjectConsumer setParentConsumerByOperator1 = SObjectConsumers.setSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME, new IterTestUtils.TestAccountOperator());
        ISObjectConsumer setGrandParentConsumer = SObjectConsumers.setSObject('Account.Parent', constant);
        ISObjectConsumer setGrandParentConsumerSafe = SObjectConsumers.setSObject('Account?.Parent', constant);
        // Then
        IterTestUtils.TestAccountOperator testAccountOperator = new IterTestUtils.TestAccountOperator();
        for (Contact con : INPUT) {
            SObject clone = IterTestUtils.deepClone(con);
            clone.putSObject(IterTestUtils.CONSTS.Contact.AccountId, constant);
            SObject cloneToConsume = IterTestUtils.deepClone(con);
            setParentConsumer.accept(cloneToConsume);
            SObject cloneToConsume1 = IterTestUtils.deepClone(con);
            setParentConsumer1.accept(cloneToConsume1);
            Assert.areEqual(clone, cloneToConsume);
            Assert.areEqual(clone, cloneToConsume1);
            SObject clone1 = IterTestUtils.deepClone(con);
            clone1.putSObject(IterTestUtils.CONSTS.Contact.AccountId, testAccountOperator.apply(con));
            SObject cloneToConsume2 = IterTestUtils.deepClone(con);
            setParentConsumerByOperator.accept(cloneToConsume2);
            SObject cloneToConsume3 = IterTestUtils.deepClone(con);
            setParentConsumerByOperator1.accept(cloneToConsume3);
            Assert.areEqual(clone1, cloneToConsume2);
            Assert.areEqual(clone1, cloneToConsume3);
            SObject clone2 = IterTestUtils.deepClone(con);
            clone2.getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME)?.putSObject(IterTestUtils.CONSTS.PARENT, constant);
            SObject cloneToConsume4 = IterTestUtils.deepClone(con);
            setGrandParentConsumerSafe.accept(cloneToConsume4);
            Assert.areEqual(clone2, cloneToConsume4);
            SObject cloneToConsume5 = IterTestUtils.deepClone(con);
            if (con.getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME) == null) {
                try {
                    setGrandParentConsumer.accept(cloneToConsume5);
                } catch (NullPointerException exc) {
                    Assert.areEqual(NullPointerException.class.getName(), exc.getTypeName());
                }
            }
        }
    }
}
