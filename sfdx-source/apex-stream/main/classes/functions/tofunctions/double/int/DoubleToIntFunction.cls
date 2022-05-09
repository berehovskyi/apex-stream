/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link IDoubleToIntFunction} functional interface and provides
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class DoubleToIntFunction implements IDoubleToIntFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Integer apply(Double d);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `DoubleToIntFunction` that returns the Integer value
     * of the Double input argument by casting it to an Integer.
     * @return the `DoubleToIntFunction`
     * @see Double.intValue
     */
    public static DoubleToIntFunction intValue() {
        return new IntValue();
    }

    /**
     * @description Returns a `DoubleToIntFunction` that returns the closest Integer to the Double
     * input argument. If the result is less than -2,147,483,648 or greater than 2,147,483,647,
     * Apex generates an error.
     * @return the `DoubleToIntFunction`
     * @see Math.round
     * @deprecated use {@link Math.roundToLong} instead.
     */
    public static DoubleToIntFunction round() {
        return new RoundToInt();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class IntValue extends DoubleToIntFunction {
        public override Integer apply(Double x) { return x.intValue(); }
    }

    private class RoundToInt extends DoubleToIntFunction {
        public override Integer apply(Double x) { return Math.round(x); }
    }
    // @end-group
    //</editor-fold>

}
