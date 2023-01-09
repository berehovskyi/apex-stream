/**
 * @see OptionalSObject
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class OptionalSObjectTest {

    /**
     * @see OptionalSObject.of
     * @see OptionalSObject.ofNullable
     * @see OptionalSObject.empty
     * @see OptionalSObject.get
     * @see OptionalSObject.isPresent
     * @see OptionalSObject.isEmpty
     * @see OptionalSObject.ifPresent
     * @see OptionalSObject.ifPresentOrElse
     * @see OptionalSObject.filter
     * @see OptionalSObject.mapTo
     * @see OptionalSObject.flatMapTo
     * @see OptionalSObject.orGet
     * @see OptionalSObject.orElse
     * @see OptionalSObject.orElseGet
     * @see OptionalSObject.orElseThrow
     */
    @IsTest
    static void default() {
        // Given
        String initialName = 'New Name';
        Account acc = new Account(Name = initialName);
        Account acc1 = new Account(Name = initialName + initialName);
        OptionalSObject optSObject = OptionalSObject.of(acc);
        OptionalSObject emptyOpt = OptionalSObject.empty();
        OptionalSObject optNull = OptionalSObject.ofNullable(null);
        String newName = 'New Name';
        String newName1 = 'New Name1';
        String fieldName = 'Name';
        ISObjectConsumer setNewNameConsumer = SObjectConsumers.set(fieldName, newName);
        ISObjectConsumer setNewNameConsumer1 = SObjectConsumers.set(fieldName, newName1);
        ISObjectPredicate isNameChanged = SObjectPredicates.isNotEqual(fieldName, initialName);
        ISObjectFunction getName = SObjectFunctions.get(fieldName);
        ISObjectSupplier newAccountSupplier = SObjectSupplier.of(Account.SObjectType);
        ISObjectFunction getAcc1Optional = SObjectFunction.constant(Optional.of(acc1));
        ISupplier npeSupplier = Supplier.of(NullPointerException.class);
        // When
        Assert.areEqual(acc, optSObject.get());
        Assert.areEqual(true, optSObject.isPresent());
        Assert.areEqual(false, optNull.isPresent());
        Assert.areEqual(false, optSObject.isEmpty());
        Assert.areEqual(true, optNull.isEmpty());
        optSObject.ifPresent(setNewNameConsumer);
        Assert.areEqual(newName, optSObject.get().get(fieldName));
        optSObject.ifPresentOrElse(setNewNameConsumer1, new IterTestUtils.DoNothingRunnable());
        Assert.areEqual(newName1, optSObject.get().get(fieldName));
        optNull.ifPresentOrElse(setNewNameConsumer1, new IterTestUtils.DoNothingRunnable());
        Assert.areEqual(optSObject, optSObject.filter(isNameChanged));
        Assert.areEqual(optNull, optNull.filter(isNameChanged));
        Assert.areEqual(Optional.of(acc.Name), optSObject.mapTo(getName));
        Assert.areEqual(Optional.empty(), optNull.mapTo(getName));
        Assert.areEqual(Optional.of(acc1), optSObject.flatMapTo(getAcc1Optional));
        Assert.areEqual(Optional.empty(), optNull.flatMapTo(getAcc1Optional));
        Assert.areEqual(optSObject, optSObject.orGet(newAccountSupplier));
        Assert.areEqual(OptionalSObject.of(Account.SObjectType.newSObject()), optNull.orGet(newAccountSupplier));
        Assert.areEqual(optSObject.get(), optSObject.orElse(acc1));
        Assert.areEqual(acc1, optNull.orElse(acc1));
        Assert.areEqual(optSObject.get(), optSObject.orElseGet(newAccountSupplier));
        Assert.areEqual(Account.SObjectType.newSObject(), optNull.orElseGet(newAccountSupplier));
        Assert.areEqual(optSObject.get(), optSObject.orElseThrow(npeSupplier));
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
