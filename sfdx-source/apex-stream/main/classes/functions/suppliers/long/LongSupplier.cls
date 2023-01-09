/**
 * @description Provides default and static methods of 
 * {@link ILongSupplier} functional interface.
 *
 * @see ILongSupplier
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class LongSupplier implements ILongSupplier {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Long get();
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a `LongSupplier` that returns a `value`.
     *
     * @param value the value
     *
     * @return the `LongSupplier`
     * 
     * @example 
     * ILongSupplier constant = LongSupplier.constant(42L);
     * constant.get(); // 42L
     * constant.get(); // 42L
     * constant.get(); // 42L
     */
    public static LongSupplier constant(final Long value) {
        return new Constant(value);
    }

    /**
     * @description Returns a `LongSupplier` that infinitely returns the elements in order.
     *
     * @param iterable the iterable
     *
     * @return the `LongSupplier`
     * 
     * @example
     * ILongSupplier repeat = LongSupplier.repeat(new List<Long>{ 1L, 3L, 8L });
     * repeat.get(); // 1L
     * repeat.get(); // 3L
     * repeat.get(); // 8L
     * repeat.get(); // 1L
     */
    public static LongSupplier repeat(final Iterable<Long> iterable) {
        Validate.notNull(iterable);
        return new Repeat(iterable);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Constant extends LongSupplier {
        private final Long identity;
        public Constant(Long identity) { this.identity = identity; }
        public override Long get() { return identity; }
    }

    private class Repeat extends LongSupplier {
        private final List<Long> values;
        private final Integer size;
        private Integer i = 0;
        private Repeat(Iterable<Long> iterable) {
            values = Iterators.toLongList(iterable.iterator());
            size = values.size();
        }
        public override Long get() { return values[Math.mod(i++, size)]; }
    }
    // @end-group
    //</editor-fold>

}
