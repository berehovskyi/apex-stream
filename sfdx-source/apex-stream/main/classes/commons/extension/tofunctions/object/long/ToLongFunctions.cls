/**
 * @description Provides common implementations of {@link ToLongFunction}
 * and related utilities.
 *
 * @see ToLongFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class ToLongFunctions {

    @TestVisible
    private ToLongFunctions() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `ToLongFunction` that returns the Long value
     * of the Object input argument by casting it to an Long.
     *
     * @return the `ToLongFunction`
     */
    public static ToLongFunction asLong() {
        return new AsLong();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AsLong extends ToLongFunction {
        public override Long apply(Object o) { return (Long) o; }
    }
    // @end-group
    //</editor-fold>

}
