/**
 * @see Function
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexAssertionsShouldIncludeMessage, PMD.ApexUnitTestClassShouldHaveRunAs')
private class FunctionTest {

    private static final List<Contact> CONTACTS = AfTestData.generateContacts();
    private static final List<String> STRINGS = AfTestData.generateStrings();

    /**
     * @see Function.andThen
     * @see Function.identity
     * @see Function.constant
     * @see Function.compose
     */
    @IsTest
    @SuppressWarnings('PMD.MethodNamingConventions')
    static void default_sobject() {
        // Given
        Object constant = 42;
        String fieldName = 'Assets';
        SObjectField field = Contact.AccountId;
        SObjectType accSObjectType = Account.SObjectType;
        // When
        IFunction identity = Function.identity();
        IFunction get42 = Function.constant(constant);
        IFunction hasAssets = Function.compose(new AfTestCommons.HasSObjectsPredicate(fieldName));
        IFunction getParent = new AfTestCommons.GetSObjectOperator(field);
        IFunction generateAccId = Function.compose(new AfTestCommons.IdSupplier(accSObjectType));
        // Then
        for (Contact con : CONTACTS) {
            Assert.areEqual(con, identity.apply(con));
            Assert.areEqual(constant, get42.apply(con));
            Assert.areEqual(!(con.getSObjects(fieldName)).isEmpty(), hasAssets.apply(con));
            Assert.areEqual(con.getSObject(field), getParent.apply(con));
            Assert.areEqual(accSObjectType, ((Id) generateAccId.apply(con)).getSobjectType());
        }
    }

    /**
     * @see Function.andThen
     * @see Function.identity
     * @see Function.compose
     * @see Function.constant
     */
    @IsTest
    static void default() {
        // Given
        Object constant = 42;
        Integer maxWidth = 5;
        String val = 's';
        // When
        IFunction identity = Function.identity();
        IFunction get42 = Function.constant(constant);
        IFunction startsWithS = Function.compose(new AfTestCommons.StartsWith(val));
        Function capitalize = new AfTestCommons.Capitalize();
        Function abbreviate5 = new AfTestCommons.Abbreviate(maxWidth);
        IFunction capitalizeAndAbbreviate = capitalize.andThen(abbreviate5);
        IFunction capitalizeAndAbbreviate1 = abbreviate5.compose(capitalize);
        IFunction capitalizeAndAbbreviate2 = Function.compose(new List<IFunction>{ capitalize, abbreviate5 });
        // Then
        for (String str : STRINGS) {
            Assert.areEqual(str, identity.apply(str));
            Assert.areEqual(constant, get42.apply(str));
            Assert.areEqual(str.startsWith(val), startsWithS.apply(str));
            Assert.areEqual(str.capitalize().abbreviate(maxWidth), capitalizeAndAbbreviate.apply(str));
            Assert.areEqual(str.capitalize().abbreviate(maxWidth), capitalizeAndAbbreviate1.apply(str));
            Assert.areEqual(str.capitalize().abbreviate(maxWidth), capitalizeAndAbbreviate2.apply(str));
        }
    }

}
