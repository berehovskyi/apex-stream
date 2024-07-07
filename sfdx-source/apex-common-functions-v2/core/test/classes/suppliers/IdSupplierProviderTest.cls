/**
 * @see IdSupplierProvider
 */
@IsTest(IsParallel = true)
private class IdSupplierProviderTest {
    private static final IdSupplierProvider SUP = new IdSupplierProvider();

    /**
     * @see IdSupplierProvider.of
     */
    @IsTest
    @SuppressWarnings('PMD.ApexUnitTestClassShouldHaveRunAs')
    static void default() {
        // Given
        SObjectType sObjectType = Account.SObjectType;
        ISupplier accIdSupplier = SUP.of(sObjectType);
        // When
        Id actual = (Id) accIdSupplier.get();
        Id actual1 = (Id) accIdSupplier.get();
        // Then
        Assert.areEqual(sObjectType, actual.getSobjectType());
        Assert.areEqual(sObjectType, actual1.getSobjectType());
        Assert.areNotEqual(actual, actual1);
    }
}
