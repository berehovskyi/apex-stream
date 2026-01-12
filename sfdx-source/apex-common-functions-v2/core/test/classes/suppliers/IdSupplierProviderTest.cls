/**
 * @see IdSupplierProvider
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc')
private class IdSupplierProviderTest {
    private static final IdSupplierProvider SUP = new IdSupplierProvider();

    /**
     * @see IdSupplierProvider.of
     */
    @IsTest
    static void default() {
        // Given
        SObjectType sObjectType = Account.SObjectType;
        ISupplier accIdSupplier = SUP.of(sObjectType);
        ISupplier accIdSupplier1 = SUP.of(sObjectType.toString());
        // When
        Id actual = (Id) accIdSupplier.get();
        Id actual1 = (Id) accIdSupplier.get();
        Id actual2 = (Id) accIdSupplier1.get();
        // Then
        Assert.areEqual(sObjectType, actual.getSobjectType());
        Assert.areEqual(sObjectType, actual1.getSobjectType());
        Assert.areEqual(sObjectType, actual2.getSobjectType());
        Assert.areNotEqual(actual, actual1);
    }
}
