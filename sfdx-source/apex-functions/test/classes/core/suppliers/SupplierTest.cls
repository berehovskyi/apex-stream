/**
 * @see Supplier
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage')
private class SupplierTest {
    
    /**
     * @see Supplier.of
     * @see Supplier.constant
     * @see Supplier.repeat
     */
    @IsTest
    @SuppressWarnings('PMD.MethodNamingConventions')
    static void default_sobject() {
        // Given
        Account acc = new Account(Name = 'Test');
        Account acc1 = new Account(Name = 'Test1');
        Account acc2 = new Account(Name = 'Test2');
        List<Object> accounts = new List<Account>{ acc, acc1, acc2 };
        ISupplier accSupplier = Supplier.of(Account.class);
        ISupplier constSupplier = Supplier.constant(new Account());
        ISupplier repeatSupplier = Supplier.repeat(accounts);
        // When
        Account actual = (Account) accSupplier.get();
        Account acc3 = (Account) constSupplier.get();
        acc3.Name = 'Name';
        Account actual1 = (Account) constSupplier.get();
        Account actual2 = (Account) repeatSupplier.get();
        Account actual3 = (Account) repeatSupplier.get();
        Account actual4 = (Account) repeatSupplier.get();
        Account actual5 = (Account) repeatSupplier.get();
        // Then
        Assert.areEqual(new Account(), actual);
        Assert.areEqual(new Account(Name = 'Name'), actual1);
        Assert.areEqual(acc, actual2);
        Assert.areEqual(acc1, actual3);
        Assert.areEqual(acc2, actual4);
        Assert.areEqual(acc, actual5);
    }

    /**
     * @see Supplier.of
     * @see Supplier.constant
     * @see Supplier.repeat
     */
    @IsTest
    static void default() {
        // Given
        List<Object> values = new List<String>{ 'a', '', null, 'b' };
        ISupplier stringListSupplier = Supplier.of(List<String>.class);
        ISupplier accIdSupplier = new AfTestCommons.IdSupplier(Account.SObjectType);
        ISupplier constSupplier = Supplier.constant(new AfPerson('Name', 18, Date.today(), 1L, true));
        ISupplier repeatSupplier = Supplier.repeat(values);
        // When
        List<String> actual = (List<String>) stringListSupplier.get();
        Id actual1 = (Id) accIdSupplier.get();
        AfPerson person = (AfPerson) constSupplier.get();
        person.setActive(false);
        AfPerson actual2 = (AfPerson) constSupplier.get();
        String actual3 = (String) repeatSupplier.get();
        String actual4 = (String) repeatSupplier.get();
        String actual5 = (String) repeatSupplier.get();
        String actual6 = (String) repeatSupplier.get();
        String actual7 = (String) repeatSupplier.get();
        // Then
        Assert.areEqual(new List<String>(), actual);
        Assert.areEqual(Account.SObjectType, actual1.getSobjectType());
        Assert.areEqual(false, actual2.isActive());
        Assert.areEqual(values[0], actual3);
        Assert.areEqual(values[1], actual4);
        Assert.areEqual(values[2], actual5);
        Assert.areEqual(values[3], actual6);
        Assert.areEqual(values[0], actual7);
    }
    
}
