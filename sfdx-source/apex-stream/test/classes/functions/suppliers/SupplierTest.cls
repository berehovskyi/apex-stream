/**
 * @author O. Berehovskyi
 * @see Supplier
 */
@IsTest(IsParallel = true)
private class SupplierTest {

    /**
     * @see Supplier.of
     * @see Supplier.upcast
     */
    @IsTest
    static void default() {
        // Given
        ISupplier stringListSupplier = Supplier.of(List<String>.class);
        ISupplier accIdSupplier = IdSupplier.of(Account.SObjectType);
        ISupplier forIntSupplier = Supplier.upcast(IntSupplier.increment());
        ISupplier forLongSupplier = Supplier.upcast(LongSupplier.increment());
        ISupplier forDoubleSupplier = Supplier.upcast(DoubleSupplier.random());
        ISupplier forSObjectSupplier = Supplier.upcast(SObjectSupplier.of(Account.SObjectType));
        // When
        List<String> actual = (List<String>) stringListSupplier.get();
        Id actual1 = (Id) accIdSupplier.get();
        Integer actual2 = (Integer) forIntSupplier.get();
        Long actual3 = (Long) forLongSupplier.get();
        Double actual4 = (Double) forDoubleSupplier.get();
        Account actual5 = (Account) forSObjectSupplier.get();
        // Then
        Validate.assertEquals(new List<String>(), actual);
        Validate.assertEquals(Account.SObjectType, actual1.getSobjectType());
        Validate.assertEquals(0, actual2);
        Validate.assertEquals(0L, actual3);
        Validate.assertNotEquals(null, actual4);
        Validate.assertEquals(new Account(), actual5);
    }

}
