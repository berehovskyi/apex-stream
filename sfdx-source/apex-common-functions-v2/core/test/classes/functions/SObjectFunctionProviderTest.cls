/**
 * @see SObjectFunctionProvider
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexUnitTestClassShouldHaveRunAs')
private class SObjectFunctionProviderTest {
    private static final List<Contact> INPUT = AfTestData.generateContacts();
    private static final SObjectFunctionProvider FN = new SObjectFunctionProvider();

    /**
     * @see SObjectFunctionProvider.get
     */
    @IsTest
    static void get() {
        // Given
        String fieldName = 'Name';
        SObjectField field = Contact.Name;
        String accountNameSafe = 'Account?.Name';
        String accountName = 'Account.Name';
        // When
        IFunction getName = FN.get(field);
        IFunction getName1 = FN.get(fieldName);
        IFunction getParentNameSafe = FN.get(accountNameSafe);
        IFunction getParentName = FN.get(accountName);
        // Then
        for (Contact con : INPUT) {
            Assert.areEqual(con.get(fieldName), getName.apply(con));
            Assert.areEqual(con.get(field), getName1.apply(con));
            Assert.areEqual(con.getSObject('Account')?.get('Name'), getParentNameSafe.apply(con));
            Assert.areEqual(con.getSObject('Account').get('Name'), getParentName.apply(con));
        }
    }

    /**
     * @see SObjectFunctionProvider.getSObject
     */
    @IsTest
    static void getSObject() {
        // Given
        String accFieldName = 'Account';
        SObjectField accIdField = Contact.AccountId;
        // When
        IFunction getAccount = FN.getSObject(accFieldName);
        IFunction getAccount1 = FN.getSObject(accIdField);
        IFunction getGrandAccount = FN.getSObject('Account?.Parent');
        // Then
        for (Contact con : INPUT) {
            Assert.areEqual(con.getSObject(accFieldName), getAccount.apply(con));
            Assert.areEqual(con.getSObject(accFieldName), getAccount1.apply(con));
            Assert.areEqual(con.getSObject(accFieldName)?.getSObject('Parent'), getGrandAccount.apply(con));
        }
    }

    /**
     * @see SObjectFunctionProvider.getSObjects
     */
    @IsTest
    static void getSObjects() {
        // Given
        String fieldName = 'Events';
        SObjectField field = Event.WhoId;
        String accountContactsSafe = 'Account?.Contacts';
        String accountContacts = 'Account.Contacts';
        // When
        IFunction getSObjects = FN.getSObjects(field);
        IFunction getSObjects1 = FN.getSObjects(fieldName);
        IFunction getParentSObjectsSafe = FN.getSObjects(accountContactsSafe);
        IFunction getParentSObjects = FN.getSObjects(accountContacts);
        // Then
        for (Contact con : INPUT) {
            Assert.areEqual(con.getSObjects(fieldName), getSObjects.apply(con));
            Assert.areEqual(con.getSObjects(field), getSObjects1.apply(con));
            Assert.areEqual(con.getSObject('Account')?.getSObjects('Contacts'), getParentSObjectsSafe.apply(con));
            Assert.areEqual(con.getSObject('Account').getSObjects('Contacts'), getParentSObjects.apply(con));
        }
    }

    /**
     * @see SObjectFunctionProvider.getPopulatedFieldsAsMap
     * @see SObjectFunctionProvider.getQuickActionName
     * @see SObjectFunctionProvider.getSObjectType
     */
    @IsTest
    static void others() {
        // When
        for (Contact con : INPUT) {
            Assert.areEqual(con.getPopulatedFieldsAsMap(), FN.getPopulatedFieldsAsMap().apply(con));
            Assert.areEqual(con.getQuickActionName(), FN.getQuickActionName().apply(con));
            Assert.areEqual(con.getSObjectType(), FN.getSObjectType().apply(con));
        }
    }

    /**
     * @see SObjectFunctionProvider.mapTo
     */
    @IsTest
    static void mapTo() {
        // Given
        SObjectType accSObjectType = Account.SObjectType;
        SObjectType leadSObjectType = Lead.SObjectType;
        SObjectField leadLastNameField = Lead.LastName;
        String lastNameFieldName = 'LastName';
        String ownerIdFieldName = 'OwnerId';
        SObjectField conLastNameField = Contact.LastName;
        Object constant = 'Value';
        Id userId = AfTestData.generateId(User.SObjectType);
        // When
        IFunction mapToAccount = FN.mapTo(accSObjectType);
        IFunction mapToLead = FN.mapTo(leadSObjectType).val(conLastNameField).to(leadLastNameField);
        IFunction mapToLead1 = FN.mapTo(new SObjectSupplierProvider().of(leadSObjectType)).val(lastNameFieldName).to(lastNameFieldName);
        IFunction mapToLead2 = FN.mapTo(leadSObjectType).val(new SObjectFunctionProvider().get(conLastNameField)).to(leadLastNameField);
        IFunction mapToLead3 = FN.mapTo(leadSObjectType).val(new SObjectFunctionProvider().get(lastNameFieldName)).to(lastNameFieldName);
        IFunction mapToLead4 = FN.mapTo(new SObjectSupplierProvider().of(leadSObjectType)).var(constant).to(leadLastNameField);
        IFunction mapToLead5 = FN.mapTo(leadSObjectType).var(constant).to(leadLastNameField);
        IFunction mapToLead6 = FN.mapTo(leadSObjectType).val(conLastNameField).to(leadLastNameField).var(userId).to(ownerIdFieldName);
        // Then
        for (Contact con : INPUT) {
            Assert.areEqual(accSObjectType.newSObject(), mapToAccount.apply(con));
            SObject newSObject = leadSObjectType.newSObject();
            newSObject.put(leadLastNameField, con.get(conLastNameField));
            Assert.areEqual(newSObject, mapToLead.apply(con));
            Assert.areEqual(newSObject, mapToLead1.apply(con));
            Assert.areEqual(newSObject, mapToLead2.apply(con));
            Assert.areEqual(newSObject, mapToLead3.apply(con));
            SObject newSObject1 = leadSObjectType.newSObject();
            newSObject1.put(leadLastNameField, constant);
            Assert.areEqual(newSObject1, mapToLead4.apply(con));
            Assert.areEqual(newSObject1, mapToLead5.apply(con));
            SObject newSObject2 = leadSObjectType.newSObject();
            newSObject2.put(leadLastNameField, con.get(conLastNameField));
            newSObject2.put(ownerIdFieldName, userId);
            Assert.areEqual(newSObject2, mapToLead6.apply(con));
        }
    }
}
