/**
 * @author Oleh Berehovskyi
 * @see Supplier
 */
@IsTest(IsParallel = true)
private class SupplierTest {

    /**
     * @see Supplier.of
     * @see Supplier.constant
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
        ISupplier constSupplier = Supplier.constant(new IterTestUtils.Person('Name', 18, Date.today(), 1L, true));
        // When
        List<String> actual = (List<String>) stringListSupplier.get();
        Id actual1 = (Id) accIdSupplier.get();
        Integer actual2 = (Integer) forIntSupplier.get();
        Long actual3 = (Long) forLongSupplier.get();
        Double actual4 = (Double) forDoubleSupplier.get();
        Account actual5 = (Account) forSObjectSupplier.get();
        IterTestUtils.Person person = (IterTestUtils.Person) constSupplier.get();
        person.setActive(false);
        IterTestUtils.Person actual6 = (IterTestUtils.Person) constSupplier.get();
        // Then
        Validate.assertEquals(new List<String>(), actual);
        Validate.assertEquals(Account.SObjectType, actual1.getSobjectType());
        Validate.assertEquals(0, actual2);
        Validate.assertEquals(0L, actual3);
        Validate.assertNotEquals(null, actual4);
        Validate.assertEquals(new Account(), actual5);
        Validate.assertEquals(false, actual6.isActive());
    }

}
