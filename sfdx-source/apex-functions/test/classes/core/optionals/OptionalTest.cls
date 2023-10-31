/**
 * @see Optional
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage')
private class OptionalTest {

    /**
     * @see Optional.of
     * @see Optional.ofNullable
     * @see Optional.empty
     * @see Optional.get
     * @see Optional.isPresent
     * @see Optional.isEmpty
     * @see Optional.ifPresent
     * @see Optional.ifPresentOrElse
     * @see Optional.filter
     * @see Optional.mapTo
     * @see Optional.flatMapTo
     * @see Optional.orGet
     * @see Optional.orElse
     * @see Optional.orElseGet
     * @see Optional.orElseThrow
     * @see Optional.orElseThrow
     */
    @IsTest
    static void default() {
        // Given
        String initialName = 'Luke';
        Object luke = new AfPerson(initialName, 15, Date.newInstance(2005, 2, 3), 4L, false);
        Object richard = new AfPerson(initialName + initialName, 30, Date.newInstance(1990, 2, 3), 5L, true);
        Optional optObject = Optional.of(luke);
        Optional emptyOpt = Optional.empty();
        Optional optNull = Optional.ofNullable(null);
        String newName = 'New Name';
        String newName1 = 'New Name1';
        IConsumer setNewNameConsumer = new AfTestCommons.SetNameConsumer(newName);
        IConsumer setNewNameConsumer1 = new AfTestCommons.SetNameConsumer(newName1);
        IPredicate isNameChanged = new AfTestCommons.IsNameChangedPredicate(initialName);
        IFunction identity = Function.identity();
        ISupplier newAccountSupplier = Supplier.of(Account.class);
        ISupplier npeSupplier = Supplier.of(NullPointerException.class);
        IFunction getOptional = Function.constant(Optional.of(richard));
        // When
        Assert.areEqual(luke, optObject.get());
        Assert.areEqual(true, optObject.isPresent());
        Assert.areEqual(false, optNull.isPresent());
        Assert.areEqual(false, optObject.isEmpty());
        Assert.areEqual(true, optNull.isEmpty());
        optObject.ifPresent(setNewNameConsumer);
        Assert.areEqual(newName, ((AfPerson) optObject.get()).getName());
        optObject.ifPresentOrElse(setNewNameConsumer1, new AfTestCommons.DoNothingRunnable());
        Assert.areEqual(newName1, ((AfPerson) optObject.get()).getName());
        optNull.ifPresentOrElse(setNewNameConsumer1, new AfTestCommons.DoNothingRunnable());
        Assert.areEqual(optObject, optObject.filter(isNameChanged));
        Assert.areEqual(optNull, optNull.filter(isNameChanged));
        Assert.areEqual(optObject, optObject.mapTo(identity));
        Assert.areEqual(Optional.empty(), optNull.mapTo(identity));
        Assert.areEqual(Optional.of(richard), optObject.flatMapTo(getOptional));
        Assert.areEqual(Optional.empty(), optNull.flatMapTo(getOptional));
        Assert.areEqual(optObject, optObject.orGet(newAccountSupplier));
        Assert.areEqual(Optional.of(Type.forName('Account').newInstance()), optNull.orGet(newAccountSupplier));
        Assert.areEqual(optObject.get(), optObject.orElse(richard));
        Assert.areEqual(richard, optNull.orElse(richard));
        Assert.areEqual(optObject.get(), optObject.orElseGet(newAccountSupplier));
        Assert.areEqual(Type.forName('Account').newInstance(), optNull.orElseGet(newAccountSupplier));
        Assert.areEqual(optObject.get(), optObject.orElseThrow(npeSupplier));
        Assert.areEqual(emptyOpt.hashCode(), optNull.hashCode());
        try {
            emptyOpt.get();
        } catch (Exception exc) {
            Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
        }
        try {
            optNull.get();
        } catch (Exception exc) {
            Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
        }
        try {
            optNull.orElseThrow(npeSupplier);
        } catch (Exception exc) {
            Assert.areEqual(NullPointerException.class.getName(), exc.getTypeName());
        }
    }

}
