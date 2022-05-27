/**
 * @author O. Berehovskyi
 * @see SObjectFunction
 */
@IsTest(IsParallel = true)
private class SObjectFunctionTest {

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

        Asset as11 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId0, InstallDate = Date.today());
        Asset as12 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId0, InstallDate = Date.today());
        Asset as21 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId1, InstallDate = Date.today().addDays(-1));
        Asset as22 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId1, InstallDate = Date.today().addDays(-1));
        Asset as31 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId2, InstallDate = Date.today());
        Asset as32 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId2, InstallDate = Date.today().addDays(-1));
        Asset as41 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId3);
        Asset as42 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId3, InstallDate = Date.today().addDays(-1));
        Asset as5 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId4);
        Asset as6 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId5, InstallDate = Date.today().addDays(-1));
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
        con4 = (Contact) IterTestUtils.setSObjects(con4, Asset.ContactId, new List<Asset>{ as5 });
        con5 = (Contact) IterTestUtils.setSObjects(con5, Asset.ContactId, new List<Asset>{ as6 });
        input = new List<Contact>{ con, con1, con2, con3, con4, con5 };
    }

    /**
     * @see SObjectFunction.identity
     * @see SObjectFunction.constant
     * @see SObjectFunction.forOperator
     */
    @IsTest
    static void staticMethods() {
        // Given
        Object constant = 42;
        String fieldName = 'Assets';
        SObjectField field = Contact.AccountId;
        SObjectType accSObjectType = Account.SObjectType;
        // When
        ISObjectFunction identity = SObjectFunction.identity();
        ISObjectFunction get42 = SObjectFunction.constant(constant);
        ISObjectFunction hasAssets = SObjectFunction.forPredicate(SObjectPredicate.hasSObjects(fieldName));
        ISObjectFunction getParent = SObjectFunction.forOperator(SObjectUnaryOperator.getSObject(field));
        ISObjectFunction generateAccId = SObjectFunction.forSupplier(IdSupplier.of(accSObjectType));
        // Then
        for (Contact con : input) {
            Validate.assertEquals(con, identity.apply(con));
            Validate.assertEquals(constant, get42.apply(con));
            Validate.assertEquals(!(con.getSObjects('Assets')).isEmpty(), hasAssets.apply(con));
            Validate.assertEquals(con.getSObject(field), getParent.apply(con));
            Validate.assertEquals(accSObjectType, ((Id) generateAccId.apply(con)).getSobjectType());
        }
    }

    /**
     * @see SObjectFunction.get
     */
    @IsTest
    static void get() {
        // Given
        String fieldName = 'Name';
        SObjectField field = Contact.Name;
        String accountNameSafe = 'Account?.Name';
        String accountName = 'Account.Name';
        // When
        ISObjectFunction getName = SObjectFunction.get(field);
        ISObjectFunction getName1 = SObjectFunction.get(fieldName);
        ISObjectFunction getParentNameSafe = SObjectFunction.get(accountNameSafe);
        ISObjectFunction getParentName = SObjectFunction.get(accountName);
        // Then
        for (Contact con : input) {
            Validate.assertEquals(con.get(fieldName), getName.apply(con));
            Validate.assertEquals(con.get(field), getName1.apply(con));
            Validate.assertEquals(con.getSObject('Account')?.get('Name'), getParentNameSafe.apply(con));
            Validate.assertEquals(con.getSObject('Account').get('Name'), getParentName.apply(con));
        }
    }

    /**
     * @see SObjectFunction.getSObjects
     */
    @IsTest
    static void getSObjects() {
        // Given
        String fieldName = 'Assets';
        SObjectField field = Asset.ContactId;
        String accountContactsSafe = 'Account?.Contacts';
        String accountContacts = 'Account.Contacts';
        // When
        ISObjectFunction getSObjects = SObjectFunction.getSObjects(field);
        ISObjectFunction getSObjects1 = SObjectFunction.getSObjects(fieldName);
        ISObjectFunction getParentSObjectsSafe = SObjectFunction.getSObjects(accountContactsSafe);
        ISObjectFunction getParentSObjects = SObjectFunction.getSObjects(accountContacts);
        // Then
        for (Contact con : input) {
            Validate.assertEquals(con.getSObjects(fieldName), getSObjects.apply(con));
            Validate.assertEquals(con.getSObjects(field), getSObjects1.apply(con));
            Validate.assertEquals(con.getSObject('Account')?.getSObjects('Contacts'), getParentSObjectsSafe.apply(con));
            Validate.assertEquals(con.getSObject('Account').getSObjects('Contacts'), getParentSObjects.apply(con));
        }
    }

    /**
     * @see SObjectFunction.put
     */
    @IsTest
    static void put() {
        // Given
        Object constant = 'Value';
        String fieldName = 'LastName';
        SObjectField field = Contact.LastName;
        String accountName = 'Account.Name';
        String accountNameSafe = 'Account?.Name';
        // When
        ISObjectFunction putName = SObjectFunction.put(field, constant);
        ISObjectFunction putName1 = SObjectFunction.put(fieldName, constant);
        ISObjectFunction putName2 = SObjectFunction.put(field, SObjectFunction.constant(constant));
        ISObjectFunction putName3 = SObjectFunction.put(fieldName, SObjectFunction.constant(constant));
        ISObjectFunction putName4 = SObjectFunction.put(accountName, SObjectFunction.constant(constant));
        ISObjectFunction putName5 = SObjectFunction.put(accountNameSafe, SObjectFunction.constant(constant));
        // Then
        for (Contact con : input) {
            Validate.assertEquals(IterTestUtils.deepClone(con).put(field, constant), putName.apply(IterTestUtils.deepClone(con)));
            Validate.assertEquals(IterTestUtils.deepClone(con).put(fieldName, constant), putName1.apply(IterTestUtils.deepClone(con)));
            Validate.assertEquals(IterTestUtils.deepClone(con).put(field, constant), putName2.apply(IterTestUtils.deepClone(con)));
            Validate.assertEquals(IterTestUtils.deepClone(con).put(fieldName, constant), putName3.apply(IterTestUtils.deepClone(con)));
            Validate.assertEquals(IterTestUtils.deepClone(con).getSObject('Account').put('Name', constant), putName4.apply(IterTestUtils.deepClone(con)));
            Validate.assertEquals(IterTestUtils.deepClone(con).getSObject('Account')?.put('Name', constant), putName5.apply(IterTestUtils.deepClone(con)));
        }
    }

    /**
     * @see SObjectFunction.getPopulatedFieldsAsMap
     * @see SObjectFunction.getQuickActionName
     * @see SObjectFunction.getSObjectType
     */
    @IsTest
    static void others() {
        // When
        for (Contact con : input) {
            Validate.assertEquals(con.getPopulatedFieldsAsMap(), SObjectFunction.getPopulatedFieldsAsMap().apply(con));
            Validate.assertEquals(con.getQuickActionName(), SObjectFunction.getQuickActionName().apply(con));
            Validate.assertEquals(con.getSObjectType(), SObjectFunction.getSObjectType().apply(con));
        }
    }

}
