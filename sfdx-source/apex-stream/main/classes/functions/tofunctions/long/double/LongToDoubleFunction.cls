/**
 * @description Inherits {@link ILongToDoubleFunction} functional interface and provides
 * common class level implementations, and related utilities.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class LongToDoubleFunction implements ILongToDoubleFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Double apply(Long l);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `LongToDoubleFunction` that returns the Double value
     * of the Long input argument.
     *
     * @return the `LongToDoubleFunction`
     *
     * @see Double.valueOf
     */
    public static LongToDoubleFunction valueOf() {
        return new LongToDouble();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class LongToDouble extends LongToDoubleFunction {
        public override Double apply(Long l) { return Double.valueOf(l); }
    }
    // @end-group
    //</editor-fold>

}
