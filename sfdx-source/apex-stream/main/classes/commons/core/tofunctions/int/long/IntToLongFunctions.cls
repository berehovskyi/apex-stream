/**
 * @description Provides common implementations of {@link IntToLongFunction}
 * and related utilities.
 *
 * @see IntToLongFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class IntToLongFunctions {

    @TestVisible
    private IntToLongFunctions() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `IIntToLongFunction` that returns the Long value
     * of the Integer input argument by casting it to a Long.
     *
     * @return the `IIntToLongFunction`
     */
    public static IntToLongFunction asLong() {
        return new IntToLong();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class IntToLong extends IntToLongFunction {
        public override Long apply(Integer i) { return (Long) i; }
    }
    // @end-group
    //</editor-fold>

}
