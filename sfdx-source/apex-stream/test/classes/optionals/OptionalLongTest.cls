/**
 * @author Oleh Berehovskyi
 * @see OptionalLong
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
    static void defaultMethods() {
        // Given
        Long value = 42L;
        Long other = 0l;
        OptionalLong optLong = OptionalLong.of(value);
        OptionalLong emptyOpt = OptionalLong.empty();
        OptionalLong optNull = OptionalLong.ofNullable(null);
        ILongConsumer setNewNameConsumer = LongConsumer.debug();
        ILongSupplier increment = LongSupplier.increment();
        ISupplier npeSupplier = Supplier.of(System.NullPointerException.class);
        // When
        Validate.assertEquals(value, optLong.get());
        Validate.assertEquals(true, optLong.isPresent());
        Validate.assertEquals(false, optNull.isPresent());
        Validate.assertEquals(false, optLong.isEmpty());
        Validate.assertEquals(true, optNull.isEmpty());
        optLong.ifPresent(setNewNameConsumer);
        Validate.assertEquals(value, (optLong.get()));
        optLong.ifPresentOrElse(setNewNameConsumer, new IterTestUtils.DoNothingRunnable());
        optNull.ifPresentOrElse(setNewNameConsumer, new IterTestUtils.DoNothingRunnable());
        Validate.assertEquals(optLong.get(), optLong.orElse(other));
        Validate.assertEquals(other, optNull.orElse(other));
        Validate.assertEquals(optLong.get(), optLong.orElseGet(increment));
        Validate.assertEquals(0, optNull.orElseGet(increment));
        Validate.assertEquals(optLong.get(), optLong.orElseThrow(npeSupplier));
        Validate.assert(emptyOpt.equals(optNull));
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
