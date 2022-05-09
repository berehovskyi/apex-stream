/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link IIntToDoubleFunction} functional interface and provides
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class IntToDoubleFunction implements IIntToDoubleFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Double apply(Integer i);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `IIntToDoubleFunction` that returns the Double value
     * of the Integer input argument.
     * @return the `IIntToDoubleFunction`
     * @see Double.valueOf
     */
    public static IntToDoubleFunction valueOf() {
        return new IntToDouble();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class IntToDouble extends IntToDoubleFunction {
        public override Double apply(Integer i) { return Double.valueOf(i); }
    }
    // @end-group
    //</editor-fold>

}
