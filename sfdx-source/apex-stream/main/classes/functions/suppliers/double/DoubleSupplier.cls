/**
 * @description Provides default and static methods of 
 * {@link IDoubleSupplier} functional interface.
 *
 * @see IDoubleSupplier
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class DoubleSupplier implements IDoubleSupplier {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Double get();
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a `DoubleSupplier` that returns a `value`.
     *
     * @param value the value
     *
     * @return the `DoubleSupplier`
     * 
     * @example 
     * IDoubleSupplier constant = DoubleSupplier.constant((Double) 42.0);
     * constant.get(); // 42.0
     * constant.get(); // 42.0
     * constant.get(); // 42.0
     */
    public static DoubleSupplier constant(final Double value) {
        return new Constant(value);
    }

    /**
     * @description Returns a `DoubleSupplier` that infinitely returns the elements in order.
     *
     * @param iterable the iterable
     *
     * @return the `DoubleSupplier`
     * 
     * @example
     * IDoubleSupplier repeat = DoubleSupplier.repeat(new List<Double>{ 1.35, 3.6, 8.2 });
     * repeat.get(); // 1.35
     * repeat.get(); // 3.6
     * repeat.get(); // 8.2
     * repeat.get(); // 1.35
     */
    public static DoubleSupplier repeat(final Iterable<Double> iterable) {
        Validate.notNull(iterable);
        return new Repeat(iterable);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Constant extends DoubleSupplier {
        private final Double identity;
        public Constant(Double identity) { this.identity = identity; }
        public override Double get() { return identity; }
    }

    private class Repeat extends DoubleSupplier {
        private final List<Double> values;
        private final Integer size;
        private Integer i = 0;
        private Repeat(Iterable<Double> iterable) {
            values = Iterators.toDoubleList(iterable.iterator());
            size = values.size();
        }
        public override Double get() { return values[Math.mod(i++, size)]; }
    }
    // @end-group
    //</editor-fold>

}
