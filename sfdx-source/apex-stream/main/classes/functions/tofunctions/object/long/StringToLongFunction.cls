/**
 * @description Extends `ToLongFunction` functions and provides `StringToLongFunction`
 * common class level implementations, and related utilities.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class StringToLongFunction extends ToLongFunction {

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `ToLongFunction` that returns the Long value
     * of the String input argument.
     *
     * @return the `ToLongFunction`
     *
     * @see Long.valueOf
     */
    public static ToLongFunction valueOf() {
        return new LongValueOf();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class LongValueOf extends ToLongFunction {
        public override Long apply(Object o) { return Long.valueOf((String) o); }
    }
    // @end-group
    //</editor-fold>

}
