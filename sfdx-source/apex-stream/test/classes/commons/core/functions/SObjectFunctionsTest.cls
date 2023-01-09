/**
 * @see SObjectFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectFunctionsTest {

    private static final List<Contact> INPUT = IterTestUtils.generateContacts();

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
        ISObjectFunction getName = SObjectFunctions.get(field);
        ISObjectFunction getName1 = SObjectFunctions.get(fieldName);
        ISObjectFunction getParentNameSafe = SObjectFunctions.get(accountNameSafe);
        ISObjectFunction getParentName = SObjectFunctions.get(accountName);
        // Then
        for (Contact con : INPUT) {
            Validate.assertEquals(con.get(fieldName), getName.apply(con));
            Validate.assertEquals(con.get(field), getName1.apply(con));
            Validate.assertEquals(con.getSObject('Account')?.get('Name'), getParentNameSafe.apply(con));
            Validate.assertEquals(con.getSObject('Account').get('Name'), getParentName.apply(con));
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
        ISObjectFunction getSObjects = SObjectFunctions.getSObjects(field);
        ISObjectFunction getSObjects1 = SObjectFunctions.getSObjects(fieldName);
        ISObjectFunction getParentSObjectsSafe = SObjectFunctions.getSObjects(accountContactsSafe);
        ISObjectFunction getParentSObjects = SObjectFunctions.getSObjects(accountContacts);
        // Then
        for (Contact con : INPUT) {
            Validate.assertEquals(con.getSObjects(fieldName), getSObjects.apply(con));
            Validate.assertEquals(con.getSObjects(field), getSObjects1.apply(con));
            Validate.assertEquals(con.getSObject('Account')?.getSObjects('Contacts'), getParentSObjectsSafe.apply(con));
            Validate.assertEquals(con.getSObject('Account').getSObjects('Contacts'), getParentSObjects.apply(con));
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
        ISObjectFunction putName = SObjectFunctions.put(field, constant);
        ISObjectFunction putName1 = SObjectFunctions.put(fieldName, constant);
        ISObjectFunction putName2 = SObjectFunctions.put(field, SObjectFunction.constant(constant));
        ISObjectFunction putName3 = SObjectFunctions.put(fieldName, SObjectFunction.constant(constant));
        ISObjectFunction putName4 = SObjectFunctions.put(accountName, SObjectFunction.constant(constant));
        ISObjectFunction putName5 = SObjectFunctions.put(accountNameSafe, SObjectFunction.constant(constant));
        // Then
        for (Contact con : INPUT) {
            Validate.assertEquals(IterTestUtils.deepClone(con).put(field, constant), putName.apply(IterTestUtils.deepClone(con)));
            Validate.assertEquals(IterTestUtils.deepClone(con).put(fieldName, constant), putName1.apply(IterTestUtils.deepClone(con)));
            Validate.assertEquals(IterTestUtils.deepClone(con).put(field, constant), putName2.apply(IterTestUtils.deepClone(con)));
            Validate.assertEquals(IterTestUtils.deepClone(con).put(fieldName, constant), putName3.apply(IterTestUtils.deepClone(con)));
            Validate.assertEquals(IterTestUtils.deepClone(con).getSObject('Account').put('Name', constant), putName4.apply(IterTestUtils.deepClone(con)));
            Validate.assertEquals(IterTestUtils.deepClone(con).getSObject('Account')?.put('Name', constant), putName5.apply(IterTestUtils.deepClone(con)));
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
            Validate.assertEquals(con.getPopulatedFieldsAsMap(), SObjectFunctions.getPopulatedFieldsAsMap().apply(con));
            Validate.assertEquals(con.getQuickActionName(), SObjectFunctions.getQuickActionName().apply(con));
            Validate.assertEquals(con.getSObjectType(), SObjectFunctions.getSObjectType().apply(con));
        }
    }
    
}
