/**
 * @description Provides common implementations of {@link LongSupplier}
 * and related utilities.
 *
 * @see LongSupplier
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class LongSuppliers {

    @TestVisible
    private LongSuppliers(){}
    
    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `LongSupplier` that returns a next Long value that has been
     * incremented by 1 starting at 0L.
     * <p><strong>Note: </strong></p>
     * <p>This is a stateful function.</p>
     *
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
     *
     * @param fromLong the starting value
     * @param step the incremental step
     *
     * @return the `LongSupplier`
     *
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
     *
     * @return the `LongSupplier`
     */
    public static LongSupplier fibonacci() {
        return new Fibonacci();
    }

    /**
     * @description Returns a `LongSupplier` that returns a random Long.
     *
     * @return the `LongSupplier`
     * 
     * @see Crypto.getRandomLong
     */
    public static LongSupplier random() {
        return new Random();
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

    private class Random extends LongSupplier {
        public override Long get() { return Crypto.getRandomLong(); }
    }
    // @end-group
    //</editor-fold>

}
