/**
 * @see OptionalInt
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class OptionalIntTest {

    /**
     * @see OptionalInt.of
     * @see OptionalInt.ofNullable
     * @see OptionalInt.empty
     * @see OptionalInt.get
     * @see OptionalInt.isPresent
     * @see OptionalInt.isEmpty
     * @see OptionalInt.ifPresent
     * @see OptionalInt.ifPresentOrElse
     * @see OptionalInt.orElse
     * @see OptionalInt.orElseGet
     * @see OptionalInt.orElseThrow
     * @see OptionalInt.orElseThrow
     */
    @IsTest
    static void default() {
        // Given
        Integer value = 42;
        Integer other = 0;
        OptionalInt optInt = OptionalInt.of(value);
        OptionalInt emptyOpt = OptionalInt.empty();
        OptionalInt optNull = OptionalInt.ofNullable(null);
        IIntConsumer cons = new IterTestUtils.DoNothingIntConsumer();
        IIntSupplier increment = IntSuppliers.increment();
        ISupplier npeSupplier = Supplier.of(NullPointerException.class);
        // When
        Assert.areEqual(value, optInt.get());
        Assert.areEqual(true, optInt.isPresent());
        Assert.areEqual(false, optNull.isPresent());
        Assert.areEqual(false, optInt.isEmpty());
        Assert.areEqual(true, optNull.isEmpty());
        optInt.ifPresent(cons);
        Assert.areEqual(value, (optInt.get()));
        optInt.ifPresentOrElse(cons, new IterTestUtils.DoNothingRunnable());
        optNull.ifPresentOrElse(cons, new IterTestUtils.DoNothingRunnable());
        Assert.areEqual(optInt.get(), optInt.orElse(other));
        Assert.areEqual(other, optNull.orElse(other));
        Assert.areEqual(optInt.get(), optInt.orElseGet(increment));
        Assert.areEqual(0, optNull.orElseGet(increment));
        Assert.areEqual(optInt.get(), optInt.orElseThrow(npeSupplier));
        Assert.isTrue(emptyOpt.equals(optNull));
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
