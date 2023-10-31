/**
 * @see IdSuppliers
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
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
        // When
        Id actual = (Id) accIdSupplier.get();
        // Then
        Assert.areEqual(sObjectType, actual.getSobjectType());
    }
    
}