/**
 * @description Provides common implementations of {@link IntSupplier}
 * and related utilities.
 *
 * @see IntSupplier
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class IntSuppliers {

    @TestVisible
    private IntSuppliers() {}
    
    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `IntSupplier` that returns a next Integer value that has been
     * incremented by 1 starting at 0.
     * <p><strong>Note: </strong></p>
     * <p>This is a stateful function.</p>
     *
     * @return the `IntSupplier`
     */
    public static IntSupplier increment() {
        return new Increment(0, 1);
    }

    /**
     * @description Returns a `IntSupplier` that returns a next Integer value that has been
     * incremented by `step` starting at `fromInt` inclusively.
     * <p><strong>Note: </strong></p>
     * <p>This is a stateful function.</p>
     *
     * @param fromInt the starting value
     * @param step the incremental step
     *
     * @return the `IntSupplier`
     *
     * @throws NullPointerException if `fromInt` or `step` is null
     */
    public static IntSupplier increment(final Integer fromInt, final Integer step) {
        Validate.notNull(fromInt);
        Validate.notNull(step);
        return new Increment(fromInt, step);
    }

    /**
     * @description Returns a `IntSupplier` that returns a next fibonacci Integer value
     * starting at 1.
     * <p><strong>Note: </strong></p>
     * <p>This is a stateful function.</p>
     *
     * @return the `IntSupplier`
     */
    public static IntSupplier fibonacci() {
        return new Fibonacci();
    }

    /**
     * @description Returns a `IntSupplier` that returns a random Integer.
     *
     * @return the `IntSupplier`
     * 
     * @see Crypto.getRandomLong
     */
    public static IntSupplier random() {
        return new Random();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Increment extends IntSupplier {
        private Integer n0;
        private Integer dn;
        private Increment(Integer fromInt, Integer step) {
            this.n0 = fromInt;
            this.dn = step;
        }
        public override Integer get() {
            Integer n1 = n0;
            n0 += dn;
            return n1;
        }
    }

    private class Fibonacci extends IntSupplier {
        private Integer n0 = 0;
        private Integer n1 = 1;
        public override Integer get() {
            Integer n2 = n0 + n1;
            n0 = n1;
            n1 = n2;
            return n0;
        }
    }

    private class Random extends IntSupplier {
        public override Integer get() { return Crypto.getRandomInteger(); }
    }
    // @end-group
    //</editor-fold>

}
