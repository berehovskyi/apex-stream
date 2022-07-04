/**
 * @description Provides common implementations of `String` {@link ToLongFunction}
 * and related utilities.
 * 
 * @see ToLongFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class StringToLongFunctions {

    @TestVisible
    private StringToLongFunctions(){}

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
