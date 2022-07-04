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
     */
    @IsTest
    static void default() {
        // Given
        ISObjectSupplier accSupplier = SObjectSupplier.of(Account.SObjectType);
        ISObjectSupplier constSupplier = SObjectSupplier.constant(new Account());
        // When
        Account actual = (Account) accSupplier.get();
        Account acc = (Account) constSupplier.get();
        acc.Name = 'Name';
        Account actual1 = (Account) constSupplier.get();
        // Then
        Validate.assertEquals(new Account(), actual);
        Validate.assertEquals(new Account(Name = 'Name'), actual1);
    }
    
}
