/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Inherits {@link IDoubleToLongFunction} functional interface and provides
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class DoubleToLongFunction implements IDoubleToLongFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Long apply(Double d);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `IDoubleToLongFunction` that returns the Long value
     * of the Double input argument by casting it to an Long.
     * @return the `IDoubleToLongFunction`
     * @see Double.longValue
     */
    public static DoubleToLongFunction longValue() {
        return new LongValue();
    }

    /**
     * @description Returns a `IDoubleToLongFunction` that returns the closest Long
     * to the Double input argument.
     * @return the `IDoubleToLongFunction`
     * @see Math.roundToLong
     */
    public static DoubleToLongFunction roundToLong() {
        return new RoundToLong();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class LongValue extends DoubleToLongFunction {
        public override Long apply(Double x) { return x.longValue(); }
    }

    private class RoundToLong extends DoubleToLongFunction {
        public override Long apply(Double x) { return Math.roundToLong(x); }
    }
    // @end-group
    //</editor-fold>

}
