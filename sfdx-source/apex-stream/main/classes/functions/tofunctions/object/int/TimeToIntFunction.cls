/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Extends `ToIntFunction` functions and provides `TimeToIntFunction`
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class TimeToIntFunction extends ToIntFunction {

    //<editor-fold desc="Time To Int Functions">
    // @start-group Time To Int Functions
    /**
     * @description Returns a `ToIntFunction` that returns the hour component
     * of the Time input argument.
     * @return the `ToIntFunction`
     * @see Time.hour
     */
    public static ToIntFunction hour() {
        return new Hour();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the millisecond component
     * of the Time input argument.
     * @return the `ToIntFunction`
     * @see Time.millisecond
     */
    public static ToIntFunction millisecond() {
        return new Millisecond();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the minute component
     * of the Time input argument.
     * @return the `ToIntFunction`
     * @see Time.minute
     */
    public static ToIntFunction minute() {
        return new Minute();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the second component
     * of the Time input argument.
     * @return the `ToIntFunction`
     * @see Time.second
     */
    public static ToIntFunction second() {
        return new Second();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Hour extends ToIntFunction {
        public override Integer apply(Object o) { return ((Time) o).hour(); }
    }

    private class Millisecond extends ToIntFunction {
        public override Integer apply(Object o) { return ((Time) o).millisecond(); }
    }

    private class Minute extends ToIntFunction {
        public override Integer apply(Object o) { return ((Time) o).minute(); }
    }

    private class Second extends ToIntFunction {
        public override Integer apply(Object o) { return ((Time) o).second(); }
    }
    // @end-group
    //</editor-fold>

}
