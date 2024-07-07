/**
 * @see SObjectSupplierProvider
 */
@IsTest(IsParallel = true)
private class SObjectSupplierProviderTest {
    private static final SObjectSupplierProvider SUP = new SObjectSupplierProvider();

    /**
     * @see SObjectSupplierProvider.of
     */
    @IsTest
    @SuppressWarnings('PMD.ApexUnitTestClassShouldHaveRunAs')
    static void of() {
        // Given
        ISupplier accSupplier = SUP.of(Account.SObjectType);
        // When
        Account actual = (Account) accSupplier.get();
        Account actual1 = (Account) accSupplier.get();
        // Then
        Assert.areEqual(new Account(), actual);
        Assert.areEqual(new Account(), actual1);
        Assert.isTrue(actual !== actual1);
    }
}
