/**
 * @see OptionalDouble
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class OptionalDoubleTest {

    /**
     * @see OptionalDouble.of
     * @see OptionalDouble.ofNullable
     * @see OptionalDouble.empty
     * @see OptionalDouble.get
     * @see OptionalDouble.isPresent
     * @see OptionalDouble.isEmpty
     * @see OptionalDouble.ifPresent
     * @see OptionalDouble.ifPresentOrElse
     * @see OptionalDouble.orElse
     * @see OptionalDouble.orElseGet
     * @see OptionalDouble.orElseThrow
     * @see OptionalDouble.orElseThrow
     */
    @IsTest
    static void default() {
        // Given
        Double value = 42L;
        Double other = 0l;
        OptionalDouble optDouble = OptionalDouble.of(value);
        OptionalDouble emptyOpt = OptionalDouble.empty();
        OptionalDouble optNull = OptionalDouble.ofNullable(null);
        IDoubleConsumer cons = new IterTestUtils.DoNothingDoubleConsumer();
        IDoubleSupplier increment = DoubleSuppliers.random();
        ISupplier npeSupplier = Supplier.of(NullPointerException.class);
        // When
        Validate.assertEquals(value, optDouble.get());
        Validate.assertEquals(true, optDouble.isPresent());
        Validate.assertEquals(false, optNull.isPresent());
        Validate.assertEquals(false, optDouble.isEmpty());
        Validate.assertEquals(true, optNull.isEmpty());
        optDouble.ifPresent(cons);
        Validate.assertEquals(value, (optDouble.get()));
        optDouble.ifPresentOrElse(cons, new IterTestUtils.DoNothingRunnable());
        optNull.ifPresentOrElse(cons, new IterTestUtils.DoNothingRunnable());
        Validate.assertEquals(optDouble.get(), optDouble.orElse(other));
        Validate.assertEquals(other, optNull.orElse(other));
        Validate.assertEquals(optDouble.get(), optDouble.orElseGet(increment));
        Validate.assertNotEquals(null, optNull.orElseGet(increment));
        Validate.assertEquals(optDouble.get(), optDouble.orElseThrow(npeSupplier));
        Validate.assert(emptyOpt.equals(optNull));
        Validate.assertEquals(emptyOpt.hashCode(), optNull.hashCode());
        try {
            emptyOpt.get();
        } catch (Exception exc) {
            Validate.assertEquals(NoSuchElementException.class.getName(), exc.getTypeName());
        }
        try {
            optNull.get();
        } catch (Exception exc) {
            Validate.assertEquals(NoSuchElementException.class.getName(), exc.getTypeName());
        }
        try {
            optNull.orElseThrow(npeSupplier);
        } catch (Exception exc) {
            Validate.assertEquals(NullPointerException.class.getName(), exc.getTypeName());
        }
    }
}
