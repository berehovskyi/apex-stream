/**
 * @author Oleh Berehovskyi
 * @see SObjectUnaryOperator
 */
@IsTest(IsParallel = true)
private class SObjectUnaryOperatorTest {

    private static List<Contact> input;

    static {
        Id accId0 = IterTestUtils.generateId(Account.SObjectType);
        Id accId1 = IterTestUtils.generateId(Account.SObjectType);
        Id accId2 = IterTestUtils.generateId(Account.SObjectType);
        Id accId3 = IterTestUtils.generateId(Account.SObjectType);
        Id accId4 = IterTestUtils.generateId(Account.SObjectType);
        Id accId5 = IterTestUtils.generateId(Account.SObjectType);
        Id accId6 = IterTestUtils.generateId(Account.SObjectType);
        Account acc = new Account(Id = accId0, Name = 'Test Acc', Type = 'Customer');
        Account acc1 = new Account(Id = accId1, Name = 'Test Acc1', Type = 'Customer');
        Account acc2 = new Account(Id = accId2, Name = 'Test Acc2', Type = 'Customer');
        Account acc3 = new Account(Id = accId3, Name = 'Test Acc3', Type = 'Partner');
        Account acc4 = new Account(Id = accId4, Name = 'Test Acc4', Type = 'Partner');
        Account acc5 = new Account(Id = accId5, Name = 'Test Acc5', Type = 'Partner');
        Account acc6 = new Account(Id = accId6, Name = 'Parent Account');
        acc.putSObject('Parent', acc6);
        acc1.putSObject('Parent', acc6);
        acc2.putSObject('Parent', acc6);
        acc3.putSObject('Parent', acc6);
        acc4.putSObject('Parent', acc6);
        acc5.putSObject('Parent', acc6);
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
        con.putSObject('Account', acc);
        con1.putSObject('Account', acc1);
        con2.putSObject('Account', acc2);
        con3.putSObject('Account', acc3);
        con4.putSObject('Account', acc4);
        con5.putSObject('Account', acc5);
        con = (Contact) IterTestUtils.setSObjects(con, Asset.ContactId, new List<Asset>{ as11, as12 });
        con1 = (Contact) IterTestUtils.setSObjects(con1, Asset.ContactId, new List<Asset>{ as21, as22 });
        con2 = (Contact) IterTestUtils.setSObjects(con2, Asset.ContactId, new List<Asset>{ as31, as32 });
        con3 = (Contact) IterTestUtils.setSObjects(con3, Asset.ContactId, new List<Asset>{ as41, as42 });

        input = new List<Contact>{ con, con1, con2, con3, con4, con5, con6 };
    }

    /**
     * @see SObjectUnaryOperator.andThen
     * @see SObjectUnaryOperator.compose
     * @see SObjectUnaryOperator.identity
     * @see SObjectUnaryOperator.constant
     */
    @IsTest
    static void defaultMethods() {
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
        ISObjectUnaryOperator operator = SObjectUnaryOperator.getSObject(conAccIdField).andThen(SObjectUnaryOperator.set(accDescriptionField, value));
        ISObjectUnaryOperator operator1 = SObjectUnaryOperator.set(accDescriptionField, value).compose(SObjectUnaryOperator.getSObject(conAccIdField));
        ISObjectUnaryOperator operator2 = SObjectUnaryOperator.compose(
                new List<ISObjectUnaryOperator>{
                        SObjectUnaryOperator.getSObject(accFieldName),
                        SObjectUnaryOperator.set(accDescriptionFieldName, value)
                }
        );
        // Then
        for (Contact con : input) {
            Validate.assertEquals(con, identity.apply(con));
            Validate.assertEquals(acc, constant.apply(con));
            if (con.Account != null) {
                Contact clone = (Contact) deepClone(con);
                clone.getSObject(conAccIdField).put(accDescriptionField, value);
                Validate.assertEquals(clone.getSObject(conAccIdField), operator.apply(deepClone(con)));
                Validate.assertEquals(clone.getSObject(conAccIdField), operator1.apply(deepClone(con)));
                Validate.assertEquals(clone.getSObject(conAccIdField), operator2.apply(deepClone(con)));
            }
        }
    }

    /**
     * @see SObjectUnaryOperator.newSObject
     */
    @IsTest
    static void newSObject() {
        // Given
        SObjectType accSObjectType = Account.SObjectType;
        // When
        ISObjectUnaryOperator newAccountOperator = SObjectUnaryOperator.newSObject(accSObjectType);
        // Then
        for (Contact con : input) {
            Validate.assertEquals(accSObjectType.newSObject(), newAccountOperator.apply(con));
        }
    }

    /**
     * @see SObjectUnaryOperator.getSObject
     */
    @IsTest
    static void getSObject() {
        // Given
        String accFieldName = 'Account';
        SObjectField accIdField = Contact.AccountId;
        // When
        ISObjectUnaryOperator getAccount = SObjectUnaryOperator.getSObject(accFieldName);
        ISObjectUnaryOperator getAccount1 = SObjectUnaryOperator.getSObject(accIdField);
        ISObjectUnaryOperator getGrandAccount = SObjectUnaryOperator.getSObject('Account?.Parent');
        // Then
        for (Contact con : input) {
            Validate.assertEquals(con.getSObject(accFieldName), getAccount.apply(con));
            Validate.assertEquals(con.getSObject(accFieldName), getAccount1.apply(con));
            Validate.assertEquals(con.getSObject(accFieldName)?.getSObject('Parent'), getGrandAccount.apply(con));
        }
    }

    /**
     * @see SObjectUnaryOperator.newSObject
     */
    @IsTest
    static void toSObject() {
        // Given
        SObjectType leadSObjectType = Lead.SObjectType;
        SObjectField leadLastNameField = Lead.LastName;
        String leadLastNameFieldName = 'LastName';
        SObjectField conLastNameField = Contact.LastName;
        Object constant = 'Value';
        // When
        ISObjectUnaryOperator convertToLead = SObjectUnaryOperator.newSObject(leadSObjectType, SObjectBinaryOperator.forBiConsumer(SObjectBiConsumer.set(leadLastNameField, SObjectFunction.get(conLastNameField))));
        ISObjectUnaryOperator convertToLead1 = SObjectUnaryOperator.newSObject(leadSObjectType, leadLastNameField, SObjectFunction.get(conLastNameField));
        ISObjectUnaryOperator convertToLead2 = SObjectUnaryOperator.newSObject(leadSObjectType, leadLastNameFieldName, SObjectFunction.get(leadLastNameFieldName));
        ISObjectUnaryOperator convertToLead5 = SObjectUnaryOperator.newSObject(leadSObjectType, leadLastNameField, constant);
        ISObjectUnaryOperator convertToLead6 = SObjectUnaryOperator.newSObject(leadSObjectType, leadLastNameFieldName, constant);
        // Then
        for (Contact con : input) {
            SObject newSObject = leadSObjectType.newSObject();
            newSObject.put(leadLastNameField, con.get(conLastNameField));
            Validate.assertEquals(newSObject, convertToLead.apply(con));
            Validate.assertEquals(newSObject, convertToLead1.apply(con));
            Validate.assertEquals(newSObject, convertToLead2.apply(con));
            SObject newSObject1 = leadSObjectType.newSObject();
            newSObject1.put(leadLastNameField, constant);
            Validate.assertEquals(newSObject1, convertToLead5.apply(con));
            Validate.assertEquals(newSObject1, convertToLead6.apply(con));
        }
    }

    /**
     * @see SObjectUnaryOperator.set
     */
    @IsTest
    static void set() {
        // Given
        SObjectField conDescriptionField = Contact.Description;
        SObjectField conDepartmentField = Contact.Department;
        String conDescriptionFieldName = 'Description';
        String conDepartmentFieldName = 'Department';
        Object constant = 'Value';
        // When
        ISObjectUnaryOperator setDescriptionFromDepartment = SObjectUnaryOperator.set(conDescriptionField, SObjectFunction.get(conDepartmentField));
        ISObjectUnaryOperator setDescriptionFromDepartment1 = SObjectUnaryOperator.set(conDescriptionFieldName, SObjectFunction.get(conDepartmentFieldName));
        ISObjectUnaryOperator setDescriptionValue = SObjectUnaryOperator.set(conDescriptionField, constant);
        ISObjectUnaryOperator setDescriptionValue1 = SObjectUnaryOperator.set(conDescriptionFieldName, constant);
        // Then
        for (Contact con : input) {
            SObject clone = deepClone(con);
            clone.put(conDescriptionField, clone.get(conDepartmentField));
            Validate.assertEquals(clone, setDescriptionFromDepartment.apply(deepClone(con)));
            Validate.assertEquals(clone, setDescriptionFromDepartment1.apply(deepClone(con)));
            SObject clone1 = deepClone(con);
            clone1.put(conDescriptionField, constant);
            Validate.assertEquals(clone1, setDescriptionValue.apply(deepClone(con)));
            Validate.assertEquals(clone1, setDescriptionValue1.apply(deepClone(con)));
        }
    }

    /**
     * @see SObjectUnaryOperator.setSObject
     */
    @IsTest
    static void setSObject() {
        // Given
        Account parent = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Parent Account');
        SObjectField conAccountIdField = Contact.AccountId;
        String conAccountFieldName = 'Account';
        // When
        ISObjectUnaryOperator setSObjectOperator = SObjectUnaryOperator.setSObject(conAccountIdField, SObjectUnaryOperator.constant(parent));
        ISObjectUnaryOperator setSObjectOperator1 = SObjectUnaryOperator.setSObject(conAccountFieldName, SObjectUnaryOperator.constant(parent));
        ISObjectUnaryOperator setSObjectOperator2 = SObjectUnaryOperator.setSObject(conAccountIdField, parent);
        ISObjectUnaryOperator setSObjectOperator3 = SObjectUnaryOperator.setSObject(conAccountFieldName, parent);
        // Then
        for (Contact con : input) {
            SObject clone = deepClone(con);
            clone.putSObject(conAccountIdField, parent);
            Validate.assertEquals(clone, setSObjectOperator.apply(deepClone(con)));
            Validate.assertEquals(clone, setSObjectOperator1.apply(deepClone(con)));
            Validate.assertEquals(clone, setSObjectOperator2.apply(deepClone(con)));
            Validate.assertEquals(clone, setSObjectOperator3.apply(deepClone(con)));
        }
    }

    /**
     * @see SObjectUnaryOperator.setSObjects
     */
    @IsTest
    static void setSObjects() {
        // Given
        List<Asset> children = new List<Asset>{
                new Asset(Id = IterTestUtils.generateId(Asset.SObjectType)),
                new Asset(Id = IterTestUtils.generateId(Asset.SObjectType))
        };
        SObjectField assetContactIdField = Asset.ContactId;
        String assetsFieldName = 'Assets';
        // When
        ISObjectUnaryOperator setSObjectsOperator = SObjectUnaryOperator.setSObjects(assetContactIdField, SObjectFunction.constant(children));
        ISObjectUnaryOperator setSObjectsOperator1 = SObjectUnaryOperator.setSObjects(assetsFieldName, SObjectFunction.constant(children));
        ISObjectUnaryOperator setSObjectsOperator2 = SObjectUnaryOperator.setSObjects(assetContactIdField, children);
        ISObjectUnaryOperator setSObjectsOperator3 = SObjectUnaryOperator.setSObjects(assetsFieldName, children);
        // Then
        for (Contact con : input) {
            Validate.assertEquals(children, setSObjectsOperator.apply(deepClone(con)).getSObjects(assetsFieldName));
            Validate.assertEquals(children, setSObjectsOperator1.apply(deepClone(con)).getSObjects(assetContactIdField));
            Validate.assertEquals(children, setSObjectsOperator2.apply(deepClone(con)).getSObjects(assetsFieldName));
            Validate.assertEquals(children, setSObjectsOperator3.apply(deepClone(con)).getSObjects(assetContactIdField));
        }
    }

    private static SObject deepClone(SObject sObj) {
        return sObj.clone(true, true, true);
    }

}
