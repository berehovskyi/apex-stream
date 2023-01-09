/**
 * @description Provides common implementations of {@link LongToDoubleFunction}
 * and related utilities.
 *
 * @see LongToDoubleFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class LongToDoubleFunctions {

    @TestVisible
    private LongToDoubleFunctions() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `LongToDoubleFunction` that returns the Double value
     * of the Long input argument.
     *
     * @return the `LongToDoubleFunction`
     *
     * @see Double.valueOf
     */
    public static LongToDoubleFunction valueOf() {
        return new LongToDouble();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class LongToDouble extends LongToDoubleFunction {
        public override Double apply(Long l) { return Double.valueOf(l); }
    }
    // @end-group
    //</editor-fold>

}
