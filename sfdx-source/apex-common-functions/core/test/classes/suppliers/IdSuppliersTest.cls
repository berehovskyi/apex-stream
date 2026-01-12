/**
 * @see IdSuppliers
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc')
private class IdSuppliersTest {
    static {
        new IdSuppliers();
    }

    /**
     * @see IdSuppliers.of
     */
    @IsTest
    static void default() {
        // Given
        SObjectType sObjectType = Account.SObjectType;
        ISupplier accIdSupplier = IdSuppliers.of(sObjectType);
        ISupplier accIdSupplier1 = IdSuppliers.of(sObjectType.toString());
        // When
        Id actual = (Id) accIdSupplier.get();
        Id actual1 = (Id) accIdSupplier1.get();
        // Then
        Assert.areEqual(sObjectType, actual.getSobjectType());
        Assert.areEqual(sObjectType, actual1.getSobjectType());
    }
}
