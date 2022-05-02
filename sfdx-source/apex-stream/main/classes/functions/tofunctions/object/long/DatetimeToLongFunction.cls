/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Extends `ToLongFunction` functions and provides `DatetimeToLongFunction`
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class DatetimeToLongFunction extends ToLongFunction {

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `ToLongFunction` that returns the number of milliseconds
     * since January 1, 1970, 00:00:00 GMT represented by the DateTime input argument.
     * @return the `ToLongFunction`
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
