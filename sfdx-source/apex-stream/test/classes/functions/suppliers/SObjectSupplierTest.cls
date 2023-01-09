/**
 * @see SObjectSupplier
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectSupplierTest {
    
    /**
     * @see SObjectSupplier.of
     * @see SObjectSupplier.constant
     * @see SObjectSupplier.repeat
     */
    @IsTest
    static void default() {
        // Given
        Account acc = new Account(Name = 'Test');
        Account acc1 = new Account(Name = 'Test1');
        Account acc2 = new Account(Name = 'Test2');
        List<Account> accounts = new List<Account>{ acc, acc1, acc2 };
        ISObjectIterable accStream = SObjectStream.of(accounts);
        ISObjectSupplier accSupplier = SObjectSupplier.of(Account.SObjectType);
        ISObjectSupplier constSupplier = SObjectSupplier.constant(new Account());
        ISObjectSupplier repeatSupplier = SObjectSupplier.repeat(accounts);
        ISObjectSupplier repeatSupplier1 = SObjectSupplier.repeat(accStream);
        // When
        Account actual = (Account) accSupplier.get();
        Account acc3 = (Account) constSupplier.get();
        acc3.Name = 'Name';
        Account actual1 = (Account) constSupplier.get();
        Account actual2 = (Account) repeatSupplier.get();
        Account actual3 = (Account) repeatSupplier.get();
        Account actual4 = (Account) repeatSupplier.get();
        Account actual5 = (Account) repeatSupplier.get();
        Account actual6 = (Account) repeatSupplier1.get();
        Account actual7 = (Account) repeatSupplier1.get();
        Account actual8 = (Account) repeatSupplier1.get();
        Account actual9 = (Account) repeatSupplier1.get();
        // Then
        Assert.areEqual(new Account(), actual);
        Assert.areEqual(new Account(Name = 'Name'), actual1);
        Assert.areEqual(acc, actual2);
        Assert.areEqual(acc1, actual3);
        Assert.areEqual(acc2, actual4);
        Assert.areEqual(acc, actual5);
        Assert.areEqual(acc, actual6);
        Assert.areEqual(acc1, actual7);
        Assert.areEqual(acc2, actual8);
        Assert.areEqual(acc, actual9);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
    }
    
}
