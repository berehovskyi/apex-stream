/**
 * @author O. Berehovskyi
 * @see Optional
 */
@IsTest(IsParallel = true)
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
    static void defaultMethods() {
        // Given
        String initialName = 'Luke';
        Object luke = new IterTestUtils.Person(initialName, 15, Date.newInstance(2005, 2, 3), 4L, false);
        Object richard = new IterTestUtils.Person(initialName + initialName, 30, Date.newInstance(1990, 2, 3), 5L, true);
        Optional optObject = Optional.of(luke);
        Optional emptyOpt = Optional.empty();
        Optional optNull = Optional.ofNullable(null);
        String newName = 'New Name';
        String newName1 = 'New Name1';
        IConsumer setNewNameConsumer = new IterTestUtils.SetNameConsumer(newName);
        IConsumer setNewNameConsumer1 = new IterTestUtils.SetNameConsumer(newName1);
        IPredicate isNameChanged = new IterTestUtils.IsNameChangedPredicate(initialName);
        IFunction identity = Function.identity();
        ISupplier newAccountSupplier = Supplier.of(Account.class);
        ISupplier npeSupplier = Supplier.of(System.NullPointerException.class);
        IFunction getOptional = Function.constant(Optional.of(richard));
        // When
        Validate.assertEquals(luke, optObject.get());
        Validate.assertEquals(true, optObject.isPresent());
        Validate.assertEquals(false, optNull.isPresent());
        Validate.assertEquals(false, optObject.isEmpty());
        Validate.assertEquals(true, optNull.isEmpty());
        optObject.ifPresent(setNewNameConsumer);
        Validate.assertEquals(newName, ((IterTestUtils.Person) optObject.get()).getName());
        optObject.ifPresentOrElse(setNewNameConsumer1, new IterTestUtils.DoNothingRunnable());
        Validate.assertEquals(newName1, ((IterTestUtils.Person) optObject.get()).getName());
        optNull.ifPresentOrElse(setNewNameConsumer1, new IterTestUtils.DoNothingRunnable());
        Validate.assertEquals(optObject, optObject.filter(isNameChanged));
        Validate.assertEquals(optNull, optNull.filter(isNameChanged));
        Validate.assertEquals(optObject, optObject.mapTo(identity));
        Validate.assertEquals(Optional.empty(), optNull.mapTo(identity));
        Validate.assertEquals(Optional.of(richard), optObject.flatMapTo(getOptional));
        Validate.assertEquals(Optional.empty(), optNull.flatMapTo(getOptional));
        Validate.assertEquals(optObject, optObject.orGet(newAccountSupplier));
        Validate.assertEquals(Optional.of(Type.forName('Account').newInstance()), optNull.orGet(newAccountSupplier));
        Validate.assertEquals(optObject.get(), optObject.orElse(richard));
        Validate.assertEquals(richard, optNull.orElse(richard));
        Validate.assertEquals(optObject.get(), optObject.orElseGet(newAccountSupplier));
        Validate.assertEquals(Type.forName('Account').newInstance(), optNull.orElseGet(newAccountSupplier));
        Validate.assertEquals(optObject.get(), optObject.orElseThrow(npeSupplier));
        Validate.assertEquals(emptyOpt.hashCode(), optNull.hashCode());
        try {
            emptyOpt.get();
        } catch (Exception exc) {
            Validate.assertEquals('System.NoSuchElementException', exc.getTypeName());
        }
        try {
            optNull.get();
        } catch (Exception exc) {
            Validate.assertEquals('System.NoSuchElementException', exc.getTypeName());
        }
        try {
            optNull.orElseThrow(npeSupplier);
        } catch (Exception exc) {
            Validate.assertEquals('System.NullPointerException', exc.getTypeName());
        }
    }
}
