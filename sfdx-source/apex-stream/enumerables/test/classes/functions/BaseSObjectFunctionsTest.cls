/**
 * @see BaseSObjectFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage, PMD.CognitiveComplexity')
private class BaseSObjectFunctionsTest {

    private static final List<Contact> INPUT = AsTestData.generateContacts(false);

    static {
        new BaseSObjectFunctions();
    }

    /**
     * @see BaseSObjectFunctions.get
     */
    @IsTest
    static void get() {
        // Given
        String fieldName = 'Name';
        SObjectField field = Contact.Name;
        String accountNameSafe = 'Account?.Name';
        String accountName = 'Account.Name';
        // When
        IFunction getName = BaseSObjectFunctions.get(field);
        IFunction getName1 = BaseSObjectFunctions.get(fieldName);
        IFunction getParentNameSafe = BaseSObjectFunctions.get(accountNameSafe);
        Function getParentName = BaseSObjectFunctions.get(accountName);
        // Then
        for (Contact con : INPUT) {
            Assert.areEqual(con.get(fieldName), getName.apply(con));
            Assert.areEqual(con.get(field), getName1.apply(con));
            Assert.areEqual(con.getSObject('Account')?.get('Name'), getParentNameSafe.apply(con));
            String actual;
            Exception exc;
            try {
                actual = (String) getParentName.apply(con);
            } catch (Exception ex) {
                exc = ex;
            }
            if (con.getSObject('Account') == null) {
                Assert.areEqual(NullPointerException.class.getName(), exc.getTypeName());
            } else {
                Assert.areEqual(null, exc);
                Assert.areEqual(con.getSObject('Account').get('Name'), actual);
            }
        }
    }

    /**
     * @see BaseSObjectFunctions.getSObjects
     */
    @IsTest
    static void getSObjects() {
        // Given
        String fieldName = 'Assets';
        SObjectField field = Asset.ContactId;
        String accountContactsSafe = 'Account?.Contacts';
        String accountContacts = 'Account.Contacts';
        // When
        IFunction getSObjects = BaseSObjectFunctions.getSObjects(field);
        IFunction getSObjects1 = BaseSObjectFunctions.getSObjects(fieldName);
        IFunction getParentSObjectsSafe = BaseSObjectFunctions.getSObjects(accountContactsSafe);
        Function getParentSObjects = BaseSObjectFunctions.getSObjects(accountContacts);
        // Then
        for (Contact con : INPUT) {
            Assert.areEqual(con.getSObjects(fieldName), getSObjects.apply(con));
            Assert.areEqual(con.getSObjects(field), getSObjects1.apply(con));
            Assert.areEqual(con.getSObject('Account')?.getSObjects('Contacts'), getParentSObjectsSafe.apply(con));
            List<Contact> actual;
            Exception exc;
            try {
                actual = (List<Contact>) getParentSObjects.apply(con);
            } catch (Exception ex) {
                exc = ex;
            }
            if (con.getSObject('Account') == null) {
                Assert.areEqual(NullPointerException.class.getName(), exc.getTypeName());
            } else {
                Assert.areEqual(null, exc);
                Assert.areEqual(con.getSObject('Account').getSObjects('Contacts'), actual);
            }
        }
    }

}
