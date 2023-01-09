/**
 * @description Provides common implementations of {@link LongToIntFunction}
 * and related utilities.
 *
 * @see LongToIntFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class LongToIntFunctions {

    @TestVisible
    private LongToIntFunctions() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `ILongToIntFunction` that returns the Integer value
     * of the Long input argument.
     *
     * @return the `ILongToIntFunction`
     *
     * @see Integer.valueOf
     */
    public static LongToIntFunction valueOf() {
        return new LongToInt();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class LongToInt extends LongToIntFunction {
        public override Integer apply(Long l) { return Integer.valueOf(l); }
    }
    // @end-group
    //</editor-fold>

}
