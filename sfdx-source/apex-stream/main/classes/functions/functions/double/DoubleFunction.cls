/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Inherits {@link IDoubleFunction} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see IDoubleIterable.mapToObject
 */
public abstract inherited sharing class DoubleFunction implements IDoubleFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Object apply(Double d);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `DoubleFunction` that returns a string that represents
     * the Double input argument using the locale of the context user.
     * @return the `SObjectFunction`
     * @see Double.format
     */
    public static DoubleFunction format() {
        return new Format();
    }

    /**
     * @description Returns a `DoubleFunction` that returns a string that represents
     * the Double input argument.
     * @return the `SObjectFunction`
     * @see String.valueOf
     */
    public static DoubleFunction toString() {
        return new ToString();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Format extends DoubleFunction {
        public override Object apply(Double x) { return x.format(); }
    }

    private class ToString extends DoubleFunction {
        public override Object apply(Double x) { return String.valueOf(x); }
    }
    // @end-group
    //</editor-fold>

}
