/**
 * @see BaseSObjectOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage, PMD.CognitiveComplexity') 
private class BaseSObjectOperatorsTest {

    private static final List<Contact> INPUT = AsTestData.generateContacts(false);

    static {
        new BaseSObjectOperators();
    }

    /**
     * @see BaseSObjectOperators.getSObject
     */
    @IsTest
    static void getSObject() {
        // Given
        String accFieldName = 'Account';
        SObjectField accIdField = Contact.AccountId;
        String accParentFieldSafe = 'Account?.Parent';
        String accParentField = 'Account.Parent';
        // When
        IOperator getAccount = BaseSObjectOperators.getSObject(accFieldName);
        IOperator getAccount1 = BaseSObjectOperators.getSObject(accIdField);
        Operator getGrandAccountSafe = BaseSObjectOperators.getSObject(accParentFieldSafe);
        Operator getGrandAccount = BaseSObjectOperators.getSObject(accParentField);
        // Then
        for (Contact con : INPUT) {
            Account acc = (Account) con.getSObject(accFieldName);
            Assert.areEqual(acc, getAccount.apply(con));
            Assert.areEqual(acc, getAccount1.apply(con));
            Assert.areEqual(acc?.getSObject('Parent'), getGrandAccountSafe.apply(con));
            Account actual;
            Exception exc;
            try {
                actual = (Account) getGrandAccount.apply(con);
            } catch (Exception ex) {
                exc = ex;
            }
            if (acc == null) {
                Assert.areEqual(NullPointerException.class.getName(), exc.getTypeName());
            } else {
                Assert.areEqual(null, exc);
                Assert.areEqual(acc.getSObject('Parent'), actual);
            }
        }
    }

}
