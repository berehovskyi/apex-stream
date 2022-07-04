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
        ISupplier npeSupplier = Supplier.of(System.NullPointerException.class);
        // When
        Validate.assertEquals(acc, optSObject.get());
        Validate.assertEquals(true, optSObject.isPresent());
        Validate.assertEquals(false, optNull.isPresent());
        Validate.assertEquals(false, optSObject.isEmpty());
        Validate.assertEquals(true, optNull.isEmpty());
        optSObject.ifPresent(setNewNameConsumer);
        Validate.assertEquals(newName, optSObject.get().get(fieldName));
        optSObject.ifPresentOrElse(setNewNameConsumer1, new IterTestUtils.DoNothingRunnable());
        Validate.assertEquals(newName1, optSObject.get().get(fieldName));
        optNull.ifPresentOrElse(setNewNameConsumer1, new IterTestUtils.DoNothingRunnable());
        Validate.assertEquals(optSObject, optSObject.filter(isNameChanged));
        Validate.assertEquals(optNull, optNull.filter(isNameChanged));
        Validate.assertEquals(Optional.of(acc.Name), optSObject.mapTo(getName));
        Validate.assertEquals(Optional.empty(), optNull.mapTo(getName));
        Validate.assertEquals(Optional.of(acc1), optSObject.flatMapTo(getAcc1Optional));
        Validate.assertEquals(Optional.empty(), optNull.flatMapTo(getAcc1Optional));
        Validate.assertEquals(optSObject, optSObject.orGet(newAccountSupplier));
        Validate.assertEquals(OptionalSObject.of(Account.SObjectType.newSObject()), optNull.orGet(newAccountSupplier));
        Validate.assertEquals(optSObject.get(), optSObject.orElse(acc1));
        Validate.assertEquals(acc1, optNull.orElse(acc1));
        Validate.assertEquals(optSObject.get(), optSObject.orElseGet(newAccountSupplier));
        Validate.assertEquals(Account.SObjectType.newSObject(), optNull.orElseGet(newAccountSupplier));
        Validate.assertEquals(optSObject.get(), optSObject.orElseThrow(npeSupplier));
        Validate.assertEquals(emptyOpt.hashCode(), optNull.hashCode());
        try {
            emptyOpt.get();
        } catch (Exception exc) {
            Validate.assertEquals(System.NoSuchElementException.class.getName(), exc.getTypeName());
        }
        try {
            optNull.get();
        } catch (Exception exc) {
            Validate.assertEquals(System.NoSuchElementException.class.getName(), exc.getTypeName());
        }
        try {
            optNull.orElseThrow(npeSupplier);
        } catch (Exception exc) {
            Validate.assertEquals(System.NullPointerException.class.getName(), exc.getTypeName());
        }
    }
}
