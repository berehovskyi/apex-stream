/**
 * @see SObjectFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings(
    'PMD.ApexAssertionsShouldIncludeMessage, PMD.CognitiveComplexity, PMD.ApexUnitTestClassShouldHaveRunAs'
)
private class SObjectFunctionsTest {

    private static final List<Contact> INPUT = AfTestData.generateContacts();

    static {
        new SObjectFunctions();
    }

    /**
     * @see SObjectFunctions.get
     */
    @IsTest
    static void get() {
        // Given
        String fieldName = 'Name';
        SObjectField field = Contact.Name;
        String accountNameSafe = 'Account?.Name';
        String accountName = 'Account.Name';
        // When
        IFunction getName = SObjectFunctions.get(field);
        IFunction getName1 = SObjectFunctions.get(fieldName);
        IFunction getParentNameSafe = SObjectFunctions.get(accountNameSafe);
        IFunction getParentName = SObjectFunctions.get(accountName);
        // Then
        for (Contact con : INPUT) {
            Assert.areEqual(con.get(fieldName), getName.apply(con));
            Assert.areEqual(con.get(field), getName1.apply(con));
            Assert.areEqual(con.getSObject('Account')?.get('Name'), getParentNameSafe.apply(con));
            Assert.areEqual(con.getSObject('Account').get('Name'), getParentName.apply(con));
        }
    }

    /**
     * @see SObjectFunctions.getSObjects
     */
    @IsTest
    static void getSObjects() {
        // Given
        String fieldName = 'Assets';
        SObjectField field = Asset.ContactId;
        String accountContactsSafe = 'Account?.Contacts';
        String accountContacts = 'Account.Contacts';
        // When
        IFunction getSObjects = SObjectFunctions.getSObjects(field);
        IFunction getSObjects1 = SObjectFunctions.getSObjects(fieldName);
        IFunction getParentSObjectsSafe = SObjectFunctions.getSObjects(accountContactsSafe);
        IFunction getParentSObjects = SObjectFunctions.getSObjects(accountContacts);
        // Then
        for (Contact con : INPUT) {
            Assert.areEqual(con.getSObjects(fieldName), getSObjects.apply(con));
            Assert.areEqual(con.getSObjects(field), getSObjects1.apply(con));
            Assert.areEqual(con.getSObject('Account')?.getSObjects('Contacts'), getParentSObjectsSafe.apply(con));
            Assert.areEqual(con.getSObject('Account').getSObjects('Contacts'), getParentSObjects.apply(con));
        }
    }

    /**
     * @see SObjectFunctions.put
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
        IFunction putName = SObjectFunctions.put(field, constant);
        IFunction putName1 = SObjectFunctions.put(fieldName, constant);
        IFunction putName2 = SObjectFunctions.put(field, Function.constant(constant));
        IFunction putName3 = SObjectFunctions.put(fieldName, Function.constant(constant));
        IFunction putName4 = SObjectFunctions.put(accountName, Function.constant(constant));
        IFunction putName5 = SObjectFunctions.put(accountNameSafe, Function.constant(constant));
        // Then
        for (Contact con : INPUT) {
            Assert.areEqual(AfTestCommons.deepClone(con).put(field, constant), putName.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(AfTestCommons.deepClone(con).put(fieldName, constant), putName1.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(AfTestCommons.deepClone(con).put(field, constant), putName2.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(AfTestCommons.deepClone(con).put(fieldName, constant), putName3.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(AfTestCommons.deepClone(con).getSObject('Account').put('Name', constant), putName4.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(AfTestCommons.deepClone(con).getSObject('Account')?.put('Name', constant), putName5.apply(AfTestCommons.deepClone(con)));
        }
    }

    /**
     * @see SObjectFunctions.getPopulatedFieldsAsMap
     * @see SObjectFunctions.getQuickActionName
     * @see SObjectFunctions.getSObjectType
     */
    @IsTest
    static void others() {
        // When
        for (Contact con : INPUT) {
            Assert.areEqual(con.getPopulatedFieldsAsMap(), SObjectFunctions.getPopulatedFieldsAsMap().apply(con));
            Assert.areEqual(con.getQuickActionName(), SObjectFunctions.getQuickActionName().apply(con));
            Assert.areEqual(con.getSObjectType(), SObjectFunctions.getSObjectType().apply(con));
        }
    }

}
