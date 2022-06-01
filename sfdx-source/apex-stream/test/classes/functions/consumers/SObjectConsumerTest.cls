/**
 * @author Oleh Berehovskyi
 * @see SObjectConsumer
 */
@IsTest(IsParallel = true)
private class SObjectConsumerTest {

    private static List<Contact> input;

    static {
        Id accId0 = IterTestUtils.generateId(Account.SObjectType);
        Id accId1 = IterTestUtils.generateId(Account.SObjectType);
        Id accId2 = IterTestUtils.generateId(Account.SObjectType);
        Id accId3 = IterTestUtils.generateId(Account.SObjectType);
        Id accId4 = IterTestUtils.generateId(Account.SObjectType);
        Id accId5 = IterTestUtils.generateId(Account.SObjectType);
        Account acc = new Account(Id = accId0, Name = 'Test Acc', Type = 'Customer');
        Account acc1 = new Account(Id = accId1, Name = 'Test Acc1', Type = 'Customer');
        Account acc2 = new Account(Id = accId2, Name = 'Test Acc2', Type = 'Customer');
        Account acc3 = new Account(Id = accId3, Name = 'Test Acc3', Type = 'Partner');
        Account acc4 = new Account(Id = accId4, Name = 'Test Acc4', Type = 'Partner');
        Account acc5 = new Account(Id = accId5, Name = 'Test Acc5', Type = 'Partner');
        Id conId0 = IterTestUtils.generateId(Contact.SObjectType);
        Id conId1 = IterTestUtils.generateId(Contact.SObjectType);
        Id conId2 = IterTestUtils.generateId(Contact.SObjectType);
        Id conId3 = IterTestUtils.generateId(Contact.SObjectType);
        Id conId4 = IterTestUtils.generateId(Contact.SObjectType);
        Id conId5 = IterTestUtils.generateId(Contact.SObjectType);
        Contact con = new Contact(Id = conId0, AccountId = accId0, LastName = 'Test Name', Department = 'Finance', DoNotCall = true);
        Contact con1 = new Contact(Id = conId1, AccountId = accId1, LastName = 'Test Name1', Department = 'Finance', DoNotCall = false);
        Contact con2 = new Contact(Id = conId2, AccountId = accId2, LastName = 'Test Name2', Department = 'Finance', DoNotCall = true);
        Contact con3 = new Contact(Id = conId3, AccountId = accId3, LastName = 'Test Name3', Department = 'HR', DoNotCall = false);
        Contact con4 = new Contact(Id = conId4, AccountId = accId4, LastName = 'Test Name4', Department = 'HR', DoNotCall = true);
        Contact con5 = new Contact(Id = conId5, AccountId = accId5, LastName = 'Test Name5', Department = 'Finance');
        Contact con6 = new Contact(LastName = 'Test Name6', Department = null, DoNotCall = true);
        Asset as11 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId0, InstallDate = Date.today());
        Asset as12 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId0, InstallDate = Date.today());
        Asset as21 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId1, InstallDate = Date.today().addDays(-1));
        Asset as22 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId1, InstallDate = Date.today().addDays(-1));
        Asset as31 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId2, InstallDate = Date.today());
        Asset as32 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId2, InstallDate = Date.today().addDays(-1));
        Asset as41 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId3);
        Asset as42 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId3, InstallDate = Date.today().addDays(-1));
        con.putSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME, acc);
        con1.putSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME, acc1);
        con2.putSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME, acc2);
        con3.putSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME, acc3);
        con4.putSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME, acc4);
        con5.putSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME, acc5);
        con = (Contact) IterTestUtils.setSObjects(con, Asset.ContactId, new List<Asset>{ as11, as12 });
        con1 = (Contact) IterTestUtils.setSObjects(con1, Asset.ContactId, new List<Asset>{ as21, as22 });
        con2 = (Contact) IterTestUtils.setSObjects(con2, Asset.ContactId, new List<Asset>{ as31, as32 });
        con3 = (Contact) IterTestUtils.setSObjects(con3, Asset.ContactId, new List<Asset>{ as41, as42 });

        input = new List<Contact>{ con, con1, con2, con3, con4, con5, con6 };
    }

    /**
     * @see SObjectConsumer.andThen
     * @see SObjectConsumer.compose
     */
    @IsTest
    static void defaultMethods() {
        // Given
        Object constant = true;
        // When
        SObjectConsumer setDescFromDepartment = SObjectConsumer.set(IterTestUtils.CONSTS.Contact.Description, SObjectFunction.get(IterTestUtils.CONSTS.Contact.Department));
        SObjectConsumer setDoNotCall = SObjectConsumer.set(IterTestUtils.CONSTS.DO_NOT_CALL, constant);
        ISObjectConsumer consumer = setDescFromDepartment.andThen(setDoNotCall);
        ISObjectConsumer consumer1 = SObjectConsumer.compose(new List<ISObjectConsumer>{ setDescFromDepartment, setDoNotCall });
        // Then
        for (Contact con : input) {
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

    /**
     * @see SObjectConsumer.debug
     * @see SObjectConsumer.debugPretty
     */
    @IsTest
    static void debug() {
        // Given
        String message = 'message ';
        // When
        ISObjectConsumer debugConsumer = SObjectConsumer.debug();
        ISObjectConsumer debugConsumer1 = SObjectConsumer.debug(LoggingLevel.DEBUG, message);
        ISObjectConsumer debugPrettyConsumer = SObjectConsumer.debugPretty();
        ISObjectConsumer debugPrettyConsumer1 = SObjectConsumer.debugPretty(LoggingLevel.DEBUG, message);
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            List<Contact> clone = input.clone();
            debugConsumer.accept(clone[i]);
            debugPrettyConsumer.accept(clone[i]);
            debugConsumer1.accept(clone[i]);
            debugPrettyConsumer1.accept(clone[i]);
            Validate.assertEquals(clone[i], input[i], Label.InputMutatedErrorMessage);
        }
    }

    /**
     * @see SObjectConsumer.addError
     */
    @IsTest
    static void addError() {
        // Given
        String errorMessage = 'ErrorMsg';
        Exception exc = new IllegalArgumentException();
        String fieldName = IterTestUtils.CONSTS.DEPARTMENT;
        SObjectField field = IterTestUtils.CONSTS.Contact.Department;
        // When
        ISObjectConsumer addErrorMessage = SObjectConsumer.addError(errorMessage);
        ISObjectConsumer addFieldNameError = SObjectConsumer.addError(fieldName, errorMessage);
        ISObjectConsumer addFieldError = SObjectConsumer.addError(field, errorMessage);
        ISObjectConsumer addErrorException = SObjectConsumer.addError(exc);
        // Then
        for (Contact con : input) {
            SObject clone = IterTestUtils.deepClone(con);
            SObject clone1 = IterTestUtils.deepClone(con);
            SObject clone2 = IterTestUtils.deepClone(con);
            SObject clone3 = IterTestUtils.deepClone(con);
            addErrorMessage.accept(clone);
            addFieldNameError.accept(clone1);
            addFieldError.accept(clone2);
            addErrorException.accept(clone3);
            Validate.assertEquals(errorMessage, clone.getErrors()[0].getMessage());
            Validate.assertEquals(errorMessage, clone1.getErrors()[0].getMessage());
            Validate.assertEquals(errorMessage, clone2.getErrors()[0].getMessage());
            try {
                clone3.getErrors();
            } catch (Exception e) {
                Validate.assertEquals(exc, e);
            }
        }
    }

    /**
     * @see SObjectConsumer.set
     */
    @IsTest
    static void set() {
        // Given
        Object constant = IterTestUtils.CONSTS.FINANCE;
        // When
        ISObjectConsumer setFinanceToDepartmentConsumer = SObjectConsumer.set(IterTestUtils.CONSTS.Contact.Department, constant);
        ISObjectConsumer setFinanceToDepartmentConsumer1 = SObjectConsumer.set(IterTestUtils.CONSTS.DEPARTMENT, constant);
        ISObjectConsumer setFinanceToDepartmentConsumer2 = SObjectConsumer.set(IterTestUtils.CONSTS.Contact.Department, SObjectFunction.constant(constant));
        ISObjectConsumer setFinanceToDepartmentConsumer3 = SObjectConsumer.set(IterTestUtils.CONSTS.DEPARTMENT, SObjectFunction.constant(constant));
        ISObjectConsumer setDepartmentFromParentConsumer = SObjectConsumer.set(IterTestUtils.CONSTS.DEPARTMENT, SObjectFunction.get('Account?.Type'));
        ISObjectConsumer setDepartmentFromParentConsumerUnsafe = SObjectConsumer.set(IterTestUtils.CONSTS.DEPARTMENT, SObjectFunction.get('Account.Type'));
        ISObjectConsumer setDescriptionOnParentConsumer = SObjectConsumer.set('Account?.Description', SObjectFunction.get(IterTestUtils.CONSTS.DEPARTMENT));
        ISObjectConsumer setDescriptionOnParentConsumerUnsafe = SObjectConsumer.set('Account.Description', SObjectFunction.get(IterTestUtils.CONSTS.DEPARTMENT));
        // Then
        for (Contact con : input) {
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
            Validate.assertEquals(clone, cloneToConsume);
            Validate.assertEquals(clone, cloneToConsume1);
            Validate.assertEquals(clone, cloneToConsume2);
            Validate.assertEquals(clone, cloneToConsume3);
            SObject clone1 = IterTestUtils.deepClone(con);
            clone1.put(IterTestUtils.CONSTS.DEPARTMENT, con.getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME)?.get(IterTestUtils.CONSTS.TYPE));
            SObject cloneToConsume4 = IterTestUtils.deepClone(con);
            setDepartmentFromParentConsumer.accept(cloneToConsume4);
            Validate.assertEquals(clone1, cloneToConsume4);
            SObject clone2 = IterTestUtils.deepClone(con);
            clone2.getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME)?.put(IterTestUtils.CONSTS.DESCRIPTION, con.get(IterTestUtils.CONSTS.DEPARTMENT));
            SObject cloneToConsume5 = IterTestUtils.deepClone(con);
            setDescriptionOnParentConsumer.accept(cloneToConsume5);
            Validate.assertEquals(clone2, cloneToConsume5);
            String expectedException = 'System.NullPointerException';
            try {
                setDepartmentFromParentConsumerUnsafe.accept(con);
            } catch (Exception exc) {
                Validate.assertEquals(expectedException, exc.getTypeName());
            }
            try {
                setDescriptionOnParentConsumerUnsafe.accept(con);
            } catch (Exception exc) {
                Validate.assertEquals(expectedException, exc.getTypeName());
            }
        }
    }

    /**
     * @see SObjectConsumer.setSObject
     */
    @IsTest
    static void setSObject() {
        // Given
        Account constant = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Test Account');
        // When
        ISObjectConsumer setParentConsumer = SObjectConsumer.setSObject(IterTestUtils.CONSTS.Contact.AccountId, constant);
        ISObjectConsumer setParentConsumer1 = SObjectConsumer.setSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME, constant);
        ISObjectConsumer setParentConsumerByOperator = SObjectConsumer.setSObject(IterTestUtils.CONSTS.Contact.AccountId, new IterTestUtils.TestAccountOperator());
        ISObjectConsumer setParentConsumerByOperator1 = SObjectConsumer.setSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME, new IterTestUtils.TestAccountOperator());
        ISObjectConsumer setGrandParentConsumer = SObjectConsumer.setSObject('Account.Parent', constant);
        ISObjectConsumer setGrandParentConsumerSafe = SObjectConsumer.setSObject('Account?.Parent', constant);
        // Then
        IterTestUtils.TestAccountOperator testAccountOperator = new IterTestUtils.TestAccountOperator();
        for (Contact con : input) {
            SObject clone = IterTestUtils.deepClone(con);
            clone.putSObject(IterTestUtils.CONSTS.Contact.AccountId, constant);
            SObject cloneToConsume = IterTestUtils.deepClone(con);
            setParentConsumer.accept(cloneToConsume);
            SObject cloneToConsume1 = IterTestUtils.deepClone(con);
            setParentConsumer1.accept(cloneToConsume1);
            Validate.assertEquals(clone, cloneToConsume);
            Validate.assertEquals(clone, cloneToConsume1);
            SObject clone1 = IterTestUtils.deepClone(con);
            clone1.putSObject(IterTestUtils.CONSTS.Contact.AccountId, testAccountOperator.apply(con));
            SObject cloneToConsume2 = IterTestUtils.deepClone(con);
            setParentConsumerByOperator.accept(cloneToConsume2);
            SObject cloneToConsume3 = IterTestUtils.deepClone(con);
            setParentConsumerByOperator1.accept(cloneToConsume3);
            Validate.assertEquals(clone1, cloneToConsume2);
            Validate.assertEquals(clone1, cloneToConsume3);
            SObject clone2 = IterTestUtils.deepClone(con);
            clone2.getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME)?.putSObject(IterTestUtils.CONSTS.PARENT, constant);
            SObject cloneToConsume4 = IterTestUtils.deepClone(con);
            setGrandParentConsumerSafe.accept(cloneToConsume4);
            Validate.assertEquals(clone2, cloneToConsume4);
            SObject cloneToConsume5 = IterTestUtils.deepClone(con);
            if (con.getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME) == null) {
                try {
                    setGrandParentConsumer.accept(cloneToConsume5);
                } catch (NullPointerException exc) {
                    Validate.assertEquals('System.NullPointerException', exc.getTypeName());
                }
            }
        }
    }

}
