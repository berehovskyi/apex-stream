/**
 * @description Inherits {@link IntSupplier} functional interface and provides
 * common class level implementations, and related utilities.
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

    // @end-group
    //</editor-fold>

}
