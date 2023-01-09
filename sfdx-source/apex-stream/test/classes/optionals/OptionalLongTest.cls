/**
 * @see OptionalLong
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class OptionalLongTest {

    /**
     * @see OptionalLong.of
     * @see OptionalLong.ofNullable
     * @see OptionalLong.empty
     * @see OptionalLong.get
     * @see OptionalLong.isPresent
     * @see OptionalLong.isEmpty
     * @see OptionalLong.ifPresent
     * @see OptionalLong.ifPresentOrElse
     * @see OptionalLong.orElse
     * @see OptionalLong.orElseGet
     * @see OptionalLong.orElseThrow
     * @see OptionalLong.orElseThrow
     */
    @IsTest
    static void default() {
        // Given
        Long value = 42L;
        Long other = 0l;
        OptionalLong optLong = OptionalLong.of(value);
        OptionalLong emptyOpt = OptionalLong.empty();
        OptionalLong optNull = OptionalLong.ofNullable(null);
        ILongConsumer cons = new IterTestUtils.DoNothingLongConsumer();
        ILongSupplier increment = LongSuppliers.increment();
        ISupplier npeSupplier = Supplier.of(NullPointerException.class);
        // When
        Assert.areEqual(value, optLong.get());
        Assert.areEqual(true, optLong.isPresent());
        Assert.areEqual(false, optNull.isPresent());
        Assert.areEqual(false, optLong.isEmpty());
        Assert.areEqual(true, optNull.isEmpty());
        optLong.ifPresent(cons);
        Assert.areEqual(value, (optLong.get()));
        optLong.ifPresentOrElse(cons, new IterTestUtils.DoNothingRunnable());
        optNull.ifPresentOrElse(cons, new IterTestUtils.DoNothingRunnable());
        Assert.areEqual(optLong.get(), optLong.orElse(other));
        Assert.areEqual(other, optNull.orElse(other));
        Assert.areEqual(optLong.get(), optLong.orElseGet(increment));
        Assert.areEqual(0, optNull.orElseGet(increment));
        Assert.areEqual(optLong.get(), optLong.orElseThrow(npeSupplier));
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
