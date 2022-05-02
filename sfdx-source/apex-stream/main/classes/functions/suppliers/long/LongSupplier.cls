/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Inherits {@link ILongSupplier} functional interface and provides
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class LongSupplier implements ILongSupplier {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Long get();
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `LongSupplier` that returns a next Long value that has been
     * incremented by 1 starting at 0L.
     * <p><strong>Note: </strong></p>
     * <p>This is a stateful function.</p>
     * @return the `LongSupplier`
     */
    public static LongSupplier increment() {
        return new Increment(0L, 1);
    }

    /**
     * @description Returns a `LongSupplier` that returns a next Long value that has been
     * incremented by `step` starting at `fromLong` inclusively.
     * <p><strong>Note: </strong></p>
     * <p>This is a stateful function.</p>
     * @return the `LongSupplier`
     * @throws NullPointerException if `fromLong` or `step` is null
     */
    public static LongSupplier increment(final Long fromLong, final Integer step) {
        Validate.notNull(fromLong);
        Validate.notNull(step);
        return new Increment(fromLong, step);
    }

    /**
     * @description Returns a `LongSupplier` that returns a next fibonacci Long value
     * starting at 1L.
     * <p><strong>Note: </strong></p>
     * <p>This is a stateful function.</p>
     * @return the `LongSupplier`
     */
    public static LongSupplier fibonacci() {
        return new Fibonacci();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Increment extends LongSupplier {
        private Long n0;
        private Integer dn;
        private Increment(Long fromLong, Integer step) {
            this.n0 = fromLong;
            this.dn = step;
        }
        public override Long get() {
            Long n1 = n0;
            n0 += dn;
            return n1;
        }
    }
    private class Fibonacci extends LongSupplier {
        private Long n0 = 0L;
        private Long n1 = 1L;
        public override Long get() {
            Long n2 = n0 + n1;
            n0 = n1;
            n1 = n2;
            return n0;
        }
    }
    // @end-group
    //</editor-fold>

}
