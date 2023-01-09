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
        Assert.areEqual(value, optDouble.get());
        Assert.areEqual(true, optDouble.isPresent());
        Assert.areEqual(false, optNull.isPresent());
        Assert.areEqual(false, optDouble.isEmpty());
        Assert.areEqual(true, optNull.isEmpty());
        optDouble.ifPresent(cons);
        Assert.areEqual(value, (optDouble.get()));
        optDouble.ifPresentOrElse(cons, new IterTestUtils.DoNothingRunnable());
        optNull.ifPresentOrElse(cons, new IterTestUtils.DoNothingRunnable());
        Assert.areEqual(optDouble.get(), optDouble.orElse(other));
        Assert.areEqual(other, optNull.orElse(other));
        Assert.areEqual(optDouble.get(), optDouble.orElseGet(increment));
        Assert.areNotEqual(null, optNull.orElseGet(increment));
        Assert.areEqual(optDouble.get(), optDouble.orElseThrow(npeSupplier));
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
