/**
 * @author Oleh Berehovskyi
 * @see OptionalInt
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
    static void defaultMethods() {
        // Given
        Integer value = 42;
        Integer other = 0;
        OptionalInt optInt = OptionalInt.of(value);
        OptionalInt emptyOpt = OptionalInt.empty();
        OptionalInt optNull = OptionalInt.ofNullable(null);
        IIntConsumer setNewNameConsumer = IntConsumer.debug();
        IIntSupplier increment = IntSupplier.increment();
        ISupplier npeSupplier = Supplier.of(System.NullPointerException.class);
        // When
        Validate.assertEquals(value, optInt.get());
        Validate.assertEquals(true, optInt.isPresent());
        Validate.assertEquals(false, optNull.isPresent());
        Validate.assertEquals(false, optInt.isEmpty());
        Validate.assertEquals(true, optNull.isEmpty());
        optInt.ifPresent(setNewNameConsumer);
        Validate.assertEquals(value, (optInt.get()));
        optInt.ifPresentOrElse(setNewNameConsumer, new IterTestUtils.DoNothingRunnable());
        optNull.ifPresentOrElse(setNewNameConsumer, new IterTestUtils.DoNothingRunnable());
        Validate.assertEquals(optInt.get(), optInt.orElse(other));
        Validate.assertEquals(other, optNull.orElse(other));
        Validate.assertEquals(optInt.get(), optInt.orElseGet(increment));
        Validate.assertEquals(0, optNull.orElseGet(increment));
        Validate.assertEquals(optInt.get(), optInt.orElseThrow(npeSupplier));
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
