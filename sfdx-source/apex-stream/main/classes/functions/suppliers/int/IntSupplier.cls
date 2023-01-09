/**
 * @description Provides default and static methods of 
 * {@link IIntSupplier} functional interface.
 *
 * @see IIntSupplier
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class IntSupplier implements IIntSupplier {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Integer get();
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a `IntSupplier` that returns a `value`.
     *
     * @param value the value
     *
     * @return the `IntSupplier`
     * 
     * @example 
     * IIntSupplier constant = IntSupplier.constant(42);
     * constant.get(); // 42
     * constant.get(); // 42
     * constant.get(); // 42
     */
    public static IntSupplier constant(final Integer value) {
        return new Constant(value);
    }

    /**
     * @description Returns a `IntSupplier` that infinitely returns the elements in order.
     *
     * @param iterable the iterable
     *
     * @return the `IntSupplier`
     * 
     * @example
     * IIntSupplier repeat = IntSupplier.repeat(new List<Integer>{ 1, 3, 8 });
     * repeat.get(); // 1
     * repeat.get(); // 3
     * repeat.get(); // 8
     * repeat.get(); // 1
     */
    public static IntSupplier repeat(final Iterable<Integer> iterable) {
        Validate.notNull(iterable);
        return new Repeat(iterable);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Constant extends IntSupplier {
        private final Integer identity;
        public Constant(Integer identity) { this.identity = identity; }
        public override Integer get() { return identity; }
    }

    private class Repeat extends IntSupplier {
        private final List<Integer> values;
        private final Integer size;
        private Integer i = 0;
        private Repeat(Iterable<Integer> iterable) {
            values = Iterators.toIntList(iterable.iterator());
            size = values.size();
        }
        public override Integer get() { return values[Math.mod(i++, size)]; }
    }
    // @end-group
    //</editor-fold>

}
