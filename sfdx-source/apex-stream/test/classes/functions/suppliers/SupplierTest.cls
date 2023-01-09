/**
 * @see Supplier
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SupplierTest {

    /**
     * @see Supplier.of
     * @see Supplier.constant
     * @see Supplier.compose
     * @see Supplier.repeat
     */
    @IsTest
    static void default() {
        // Given
        List<Object> values = new List<String>{ 'a', '', null, 'b' };
        IObjectIterable stringStream = ObjectStream.of(values);
        ISupplier stringListSupplier = Supplier.of(List<String>.class);
        ISupplier accIdSupplier = IdSuppliers.of(Account.SObjectType);
        ISupplier forIntSupplier = Supplier.compose(IntSuppliers.increment());
        ISupplier forLongSupplier = Supplier.compose(LongSuppliers.increment());
        ISupplier forDoubleSupplier = Supplier.compose(DoubleSuppliers.random());
        ISupplier forSObjectSupplier = Supplier.compose(SObjectSupplier.of(Account.SObjectType));
        ISupplier constSupplier = Supplier.constant(new IterTestUtils.Person('Name', 18, Date.today(), 1L, true));
        ISupplier repeatSupplier = Supplier.repeat(values);
        ISupplier repeatSupplier1 = Supplier.repeat(stringStream);
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
        String actual7 = (String) repeatSupplier.get();
        String actual8 = (String) repeatSupplier.get();
        String actual9 = (String) repeatSupplier.get();
        String actual10 = (String) repeatSupplier.get();
        String actual11 = (String) repeatSupplier.get();
        String actual12 = (String) repeatSupplier1.get();
        String actual13 = (String) repeatSupplier1.get();
        String actual14 = (String) repeatSupplier1.get();
        String actual15 = (String) repeatSupplier1.get();
        String actual16 = (String) repeatSupplier1.get();
        // Then
        Validate.assertEquals(new List<String>(), actual);
        Validate.assertEquals(Account.SObjectType, actual1.getSobjectType());
        Validate.assertEquals(0, actual2);
        Validate.assertEquals(0L, actual3);
        Validate.assertNotEquals(null, actual4);
        Validate.assertEquals(new Account(), actual5);
        Validate.assertEquals(false, actual6.isActive());
        Validate.assertEquals(values[0], actual7);
        Validate.assertEquals(values[1], actual8);
        Validate.assertEquals(values[2], actual9);
        Validate.assertEquals(values[3], actual10);
        Validate.assertEquals(values[0], actual11);
        Validate.assertEquals(values[0], actual12);
        Validate.assertEquals(values[1], actual13);
        Validate.assertEquals(values[2], actual14);
        Validate.assertEquals(values[3], actual15);
        Validate.assertEquals(values[0], actual16);
        Validate.assert(((ObjectStream) stringStream).isOperated);
    }

}
