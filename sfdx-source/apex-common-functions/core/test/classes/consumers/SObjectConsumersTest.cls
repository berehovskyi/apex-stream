/**
 * @see SObjectConsumers
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectConsumersTest {

    private static final List<Contact> INPUT = AfTestData.generateContacts2();

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
        String fieldName = AfTestConsts.DEPARTMENT;
        SObjectField field = AfTestConsts.Contact.Department;
        // When
        IConsumer addErrorMessage = SObjectConsumers.addError(errorMessage);
        IConsumer addFieldNameError = SObjectConsumers.addError(fieldName, errorMessage);
        IConsumer addFieldError = SObjectConsumers.addError(field, errorMessage);
        IConsumer addErrorException = SObjectConsumers.addError(exc);
        // Then
        for (Contact con : INPUT) {
            SObject clone = AfTestCommons.deepClone(con);
            SObject clone1 = AfTestCommons.deepClone(con);
            SObject clone2 = AfTestCommons.deepClone(con);
            SObject clone3 = AfTestCommons.deepClone(con);
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
        Object constant = AfTestConsts.FINANCE;
        // When
        IConsumer setFinanceToDepartmentConsumer = SObjectConsumers.set(AfTestConsts.Contact.Department, constant);
        IConsumer setFinanceToDepartmentConsumer1 = SObjectConsumers.set(AfTestConsts.DEPARTMENT, constant);
        IConsumer setFinanceToDepartmentConsumer2 = SObjectConsumers.set(AfTestConsts.Contact.Department, Function.constant(constant));
        IConsumer setFinanceToDepartmentConsumer3 = SObjectConsumers.set(AfTestConsts.DEPARTMENT, Function.constant(constant));
        IConsumer setDepartmentFromParentConsumer = SObjectConsumers.set(AfTestConsts.DEPARTMENT, SObjectFunctions.get('Account?.Type'));
        IConsumer setDepartmentFromParentConsumerUnsafe = SObjectConsumers.set(AfTestConsts.DEPARTMENT, SObjectFunctions.get('Account.Type'));
        IConsumer setDescriptionOnParentConsumer = SObjectConsumers.set('Account?.Description', SObjectFunctions.get(AfTestConsts.DEPARTMENT));
        IConsumer setDescriptionOnParentConsumerUnsafe = SObjectConsumers.set('Account.Description', SObjectFunctions.get(AfTestConsts.DEPARTMENT));
        // Then
        for (Contact con : INPUT) {
            SObject clone = AfTestCommons.deepClone(con);
            clone.put(AfTestConsts.Contact.Department, constant);
            SObject cloneToConsume = AfTestCommons.deepClone(con);
            setFinanceToDepartmentConsumer.accept(cloneToConsume);
            SObject cloneToConsume1 = AfTestCommons.deepClone(con);
            setFinanceToDepartmentConsumer1.accept(cloneToConsume1);
            SObject cloneToConsume2 = AfTestCommons.deepClone(con);
            setFinanceToDepartmentConsumer2.accept(cloneToConsume2);
            SObject cloneToConsume3 = AfTestCommons.deepClone(con);
            setFinanceToDepartmentConsumer3.accept(cloneToConsume3);
            Assert.areEqual(clone, cloneToConsume);
            Assert.areEqual(clone, cloneToConsume1);
            Assert.areEqual(clone, cloneToConsume2);
            Assert.areEqual(clone, cloneToConsume3);
            SObject clone1 = AfTestCommons.deepClone(con);
            clone1.put(AfTestConsts.DEPARTMENT, con.getSObject(AfTestConsts.Account.SOBJECT_NAME)?.get(AfTestConsts.TYPE));
            SObject cloneToConsume4 = AfTestCommons.deepClone(con);
            setDepartmentFromParentConsumer.accept(cloneToConsume4);
            Assert.areEqual(clone1, cloneToConsume4);
            SObject clone2 = AfTestCommons.deepClone(con);
            clone2.getSObject(AfTestConsts.Account.SOBJECT_NAME)?.put(AfTestConsts.DESCRIPTION, con.get(AfTestConsts.DEPARTMENT));
            SObject cloneToConsume5 = AfTestCommons.deepClone(con);
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
        Account constant = new Account(Id = AfTestData.generateId(Account.SObjectType), Name = 'Test Account');
        // When
        IConsumer setParentConsumer = SObjectConsumers.setSObject(AfTestConsts.Contact.AccountId, constant);
        IConsumer setParentConsumer1 = SObjectConsumers.setSObject(AfTestConsts.Account.SOBJECT_NAME, constant);
        IConsumer setParentConsumerByOperator = SObjectConsumers.setSObject(AfTestConsts.Contact.AccountId, new AfTestCommons.TestAccountOperator());
        IConsumer setParentConsumerByOperator1 = SObjectConsumers.setSObject(AfTestConsts.Account.SOBJECT_NAME, new AfTestCommons.TestAccountOperator());
        IConsumer setGrandParentConsumer = SObjectConsumers.setSObject('Account.Parent', constant);
        IConsumer setGrandParentConsumerSafe = SObjectConsumers.setSObject('Account?.Parent', constant);
        // Then
        IOperator testAccountOperator = new AfTestCommons.TestAccountOperator();
        for (Contact con : INPUT) {
            SObject clone = AfTestCommons.deepClone(con);
            clone.putSObject(AfTestConsts.Contact.AccountId, constant);
            SObject cloneToConsume = AfTestCommons.deepClone(con);
            setParentConsumer.accept(cloneToConsume);
            SObject cloneToConsume1 = AfTestCommons.deepClone(con);
            setParentConsumer1.accept(cloneToConsume1);
            Assert.areEqual(clone, cloneToConsume);
            Assert.areEqual(clone, cloneToConsume1);
            SObject clone1 = AfTestCommons.deepClone(con);
            clone1.putSObject(AfTestConsts.Contact.AccountId, (SObject) testAccountOperator.apply(con));
            SObject cloneToConsume2 = AfTestCommons.deepClone(con);
            setParentConsumerByOperator.accept(cloneToConsume2);
            SObject cloneToConsume3 = AfTestCommons.deepClone(con);
            setParentConsumerByOperator1.accept(cloneToConsume3);
            Assert.areEqual(clone1, cloneToConsume2);
            Assert.areEqual(clone1, cloneToConsume3);
            SObject clone2 = AfTestCommons.deepClone(con);
            clone2.getSObject(AfTestConsts.Account.SOBJECT_NAME)?.putSObject(AfTestConsts.PARENT, constant);
            SObject cloneToConsume4 = AfTestCommons.deepClone(con);
            setGrandParentConsumerSafe.accept(cloneToConsume4);
            Assert.areEqual(clone2, cloneToConsume4);
            SObject cloneToConsume5 = AfTestCommons.deepClone(con);
            if (con.getSObject(AfTestConsts.Account.SOBJECT_NAME) == null) {
                try {
                    setGrandParentConsumer.accept(cloneToConsume5);
                } catch (NullPointerException exc) {
                    Assert.areEqual(NullPointerException.class.getName(), exc.getTypeName());
                }
            }
        }
    }
}
