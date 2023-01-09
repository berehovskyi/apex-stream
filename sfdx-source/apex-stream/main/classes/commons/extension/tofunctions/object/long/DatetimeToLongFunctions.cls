/**
 * @description Provides common implementations of `Datetime` {@link ToLongFunction}
 * and related utilities.
 * 
 * @see ToLongFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class DatetimeToLongFunctions {

    @TestVisible
    private DatetimeToLongFunctions() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `ToLongFunction` that returns the number of milliseconds
     * since January 1, 1970, 00:00:00 GMT represented by the DateTime input argument.
     *
     * @return the `ToLongFunction`
     *
     * @see Datetime.getTime
     */
    public static ToLongFunction getTime() {
        return new GetTime();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class GetTime extends ToLongFunction {
        public override Long apply(Object o) { return ((Datetime) o).getTime(); }
    }
    // @end-group
    //</editor-fold>

}
