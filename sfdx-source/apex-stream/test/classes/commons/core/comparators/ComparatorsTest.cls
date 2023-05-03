/**
 * @see Comparators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ComparatorsTest {

    static {
        new Comparators();
    }
    
    /**
     * @see Comparators.compareNullables
     * @see Comparators.bools
     * @see Comparators.ids
     * @see Comparators.strings
     * @see Comparators.blobs
     * @see Comparators.dates
     * @see Comparators.datetimes
     * @see Comparators.times
     * @see Comparators.ints
     * @see Comparators.longs
     * @see Comparators.doubles
     * @see Comparators.sObjects
     * @see Comparators.comparables
     * @see Comparators.compareNullSafeUntyped
     */
    @IsTest
    static void default() {
        // Given
        Id id1 = IterTestUtils.generateId(Account.SObjectType);
        Id id2 = IterTestUtils.generateId(Account.SObjectType);
        IterTestUtils.Person frank = new IterTestUtils.Person('Frank', 20, Date.newInstance(1990, 1, 2), 1L, true);
        IterTestUtils.Person tom = new IterTestUtils.Person('Tom', 20, Date.newInstance(1990, 1, 2), 2L, true);
        // Then
        Assert.areEqual(-1, Comparators.compareNullables(null, 1));
        Assert.areEqual(0, Comparators.compareNullables(null, null));
        Assert.areEqual(1, Comparators.compareNullables(1, null));
        Assert.areEqual(1, Comparators.bools().compare(true, false));
        Assert.areEqual(1, Comparators.compareUntyped(true, false));
        Assert.areEqual(1, Comparators.ids().compare(id2, id1));
        Assert.areEqual(1, Comparators.compareUntyped(id2, id1));
        Assert.areEqual(1, Comparators.strings().compare('b', 'a'));
        Assert.areEqual(1, Comparators.compareUntyped('b', 'a'));
        Assert.areEqual(1, Comparators.blobs().compare(Blob.valueOf('a'), Blob.valueOf('b')));
        Assert.areEqual(1, Comparators.compareUntyped(Blob.valueOf('a'), Blob.valueOf('b')));
        Assert.areEqual(1, Comparators.dates().compare(Date.today().addDays(1), Date.today()));
        Assert.areEqual(1, Comparators.compareUntyped(Date.today().addDays(1), Date.today()));
        Assert.areEqual(1, Comparators.datetimes().compare(Datetime.now().addDays(1), Datetime.now()));
        Assert.areEqual(1, Comparators.compareUntyped(Datetime.now().addDays(1), Datetime.now()));
        Assert.areEqual(1, Comparators.times().compare(Time.newInstance(22, 0, 0, 0), Time.newInstance(21, 0, 0, 0)));
        Assert.areEqual(1, Comparators.compareUntyped(Time.newInstance(22, 0, 0, 0), Time.newInstance(21, 0, 0, 0)));
        Assert.areEqual(1, Comparators.ints().compare(1, 0));
        Assert.areEqual(1, Comparators.compareUntyped(1, 0));
        Assert.areEqual(1, Comparators.longs().compare(1L, 0L));
        Assert.areEqual(1, Comparators.compareUntyped(1L, 0L));
        Assert.areEqual(1, Comparators.doubles().compare((Double) 1.0, (Double) 0.0));
        Assert.areEqual(1, Comparators.compareUntyped((Double) 1.0, (Double) 0.0));
        Assert.areEqual(1, Comparators.sObjects().compare(new Account(Name = 'b'), new Account(Name = 'a')));
        Assert.areEqual(1, Comparators.compareUntyped(new Account(Name = 'b'), new Account(Name = 'a')));
        Assert.areEqual(1, Comparators.comparables().compare(tom, frank));
        Assert.areEqual(1, Comparators.compareUntyped(tom, frank));
        try {
            Comparators.compareUntyped(1, 'a');
        } catch (TypeException exc) {
            Assert.areEqual(String.format(Label.AS_ErrorMessage_TypesMismatch, new List<String>{ 'Integer', 'String' }), exc.getMessage());
        }
    }
    
}
