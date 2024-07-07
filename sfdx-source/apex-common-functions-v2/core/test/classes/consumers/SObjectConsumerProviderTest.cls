/**
 * @see SObjectConsumerProvider
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexUnitTestClassShouldHaveRunAs')
private class SObjectConsumerProviderTest {
    private static final List<Contact> INPUT = AfTestData.generateContacts2();
    private static final SObjectConsumerProvider CON = new SObjectConsumerProvider();

    /**
     * @see SObjectConsumerProvider.addError
     */
    @IsTest
    static void addError() {
        // Given
        String errorMessage = 'ErrorMsg';
        Exception exc = new IllegalArgumentException();
        String fieldName = AfTestConsts.DEPARTMENT;
        SObjectField field = AfTestConsts.Contact.Department;
        // When
        IConsumer addErrorMessage = CON.addError(errorMessage);
        IConsumer addFieldNameError = CON.addError(errorMessage).to(fieldName);
        IConsumer addFieldError = CON.addError(errorMessage).escape(false).to(field);
        IConsumer addErrorException = CON.addError(exc);
        IConsumer addErrorException1 = CON.addError(exc).escape(false);
        // Then
        for (Contact con : INPUT) {
            SObject clone = AfTestCommons.deepClone(con);
            SObject clone1 = AfTestCommons.deepClone(con);
            SObject clone2 = AfTestCommons.deepClone(con);
            SObject clone3 = AfTestCommons.deepClone(con);
            SObject clone4 = AfTestCommons.deepClone(con);
            addErrorMessage.accept(clone);
            addFieldNameError.accept(clone1);
            addFieldError.accept(clone2);
            addErrorException.accept(clone3);
            addErrorException1.accept(clone4);
            Assert.areEqual(errorMessage, clone.getErrors()[0].getMessage());
            Assert.areEqual(errorMessage, clone1.getErrors()[0].getMessage());
            Assert.areEqual(errorMessage, clone2.getErrors()[0].getMessage());
            try {
                clone3.getErrors();
            } catch (Exception e) {
                Assert.areEqual(exc, e);
            }
            try {
                clone4.getErrors();
            } catch (Exception e) {
                Assert.areEqual(exc, e);
            }
        }
    }

    /**
     * @see SObjectConsumerProvider.set
     */
    @IsTest
    static void set() {
        // Given
        Object constant = AfTestConsts.FINANCE;
        // When
        IConsumer setFinanceToDepartmentConsumer = CON.set(AfTestConsts.Contact.Department).var(constant);
        IConsumer setFinanceToDepartmentConsumer1 = CON.set(AfTestConsts.DEPARTMENT).var(constant);
        IConsumer setFinanceToDepartmentConsumer2 = CON.set(AfTestConsts.Contact.Department).val(Function.constant(constant));
        IConsumer setFinanceToDepartmentConsumer3 = CON.set(AfTestConsts.DEPARTMENT).val(Function.constant(constant));
        IConsumer setDepartmentFromParentConsumer = CON.set(AfTestConsts.DEPARTMENT).val(new SObjectFunctionProvider().get('Account?.Type'));
        IConsumer setDepartmentFromParentConsumer1 = CON.set(AfTestConsts.DEPARTMENT).val('Account?.Type');
        IConsumer setDepartmentFromParentConsumerUnsafe = CON.set(AfTestConsts.DEPARTMENT).val(new SObjectFunctionProvider().get('Account.Type'));
        IConsumer setDescriptionOnParentConsumer = CON.set('Account?.Description').val(new SObjectFunctionProvider().get(AfTestConsts.DEPARTMENT));
        IConsumer setDescriptionOnParentConsumerUnsafe = CON.set('Account.Description').val(new SObjectFunctionProvider().get(AfTestConsts.DEPARTMENT));
        IConsumer setLastNameFromDepartmentConsumer = CON.set(AfTestConsts.LAST_NAME).val(AfTestConsts.Contact.Department);
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
            SObject cloneToConsume5 = AfTestCommons.deepClone(con);
            setDepartmentFromParentConsumer1.accept(cloneToConsume5);
            Assert.areEqual(clone1, cloneToConsume5);
            SObject clone2 = AfTestCommons.deepClone(con);
            clone2.getSObject(AfTestConsts.Account.SOBJECT_NAME)?.put(AfTestConsts.DESCRIPTION, con.get(AfTestConsts.DEPARTMENT));
            SObject cloneToConsume6 = AfTestCommons.deepClone(con);
            setDescriptionOnParentConsumer.accept(cloneToConsume6);
            Assert.areEqual(clone2, cloneToConsume6);
            SObject clone3 = AfTestCommons.deepClone(con);
            clone3.put(AfTestConsts.LAST_NAME, con.get(AfTestConsts.Contact.Department));
            SObject cloneToConsume7 = AfTestCommons.deepClone(con);
            setLastNameFromDepartmentConsumer.accept(cloneToConsume7);
            Assert.areEqual(clone3, cloneToConsume7);
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
     * @see SObjectConsumerProvider.setSObject
     */
    @IsTest
    static void setSObject() {
        // Given
        Account constant = new Account(Id = AfTestData.generateId(Account.SObjectType), Name = 'Test Account');
        // When
        IConsumer setParentConsumer = CON.setSObject(AfTestConsts.Contact.AccountId).var(constant);
        IConsumer setParentConsumer1 = CON.setSObject(AfTestConsts.Account.SOBJECT_NAME).var(constant);
        IConsumer setParentConsumerByOperator = CON.setSObject(AfTestConsts.Contact.AccountId).val(new AfTestCommons.TestAccountOperator());
        IConsumer setParentConsumerByOperator1 = CON.setSObject(AfTestConsts.Account.SOBJECT_NAME).val(new AfTestCommons.TestAccountOperator());
        IConsumer setGrandParentConsumer = CON.setSObject('Account.Parent').var(constant);
        IConsumer setGrandParentConsumerSafe = CON.setSObject('Account?.Parent').var(constant);
        IConsumer setNullAccountConsumer = CON.setSObject(AfTestConsts.Account.SOBJECT_NAME).val('CreatedBy');
        IConsumer setNullAccountConsumer1 = CON.setSObject(AfTestConsts.Contact.AccountId).val(Contact.CreatedById);
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
            setNullAccountConsumer.accept(cloneToConsume5);
            Assert.areEqual(null, cloneToConsume5.getSObject(AfTestConsts.Account.SOBJECT_NAME));
            SObject cloneToConsume6 = AfTestCommons.deepClone(con);
            setNullAccountConsumer1.accept(cloneToConsume6);
            Assert.areEqual(null, cloneToConsume6.getSObject(AfTestConsts.Account.SOBJECT_NAME));
            if (con.getSObject(AfTestConsts.Account.SOBJECT_NAME) == null) {
                SObject cloneToConsume7 = AfTestCommons.deepClone(con);
                Exception exc;
                try {
                    setGrandParentConsumer.accept(cloneToConsume7);
                } catch (NullPointerException ex) {
                    exc = ex;
                }
                Assert.areEqual(NullPointerException.class.getName(), exc.getTypeName());
            }
        }
    }
}
