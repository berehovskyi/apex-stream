/**
 * @see SObjectSuppliers
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage')
private class SObjectSuppliersTest {

    static {
        new SObjectSuppliers();
    }

    /**
     * @see Supplier.of
     */
    @IsTest
    @SuppressWarnings('PMD.ApexUnitTestClassShouldHaveRunAs')
    static void default() {
        // Given
        ISupplier accSupplier = SObjectSuppliers.of(Account.SObjectType);
        // When
        Account actual = (Account) accSupplier.get();
        // Then
        Assert.areEqual(new Account(), actual);
    }

}
