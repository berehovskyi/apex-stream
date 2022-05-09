/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link IDoubleSupplier} functional interface and provides
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class DoubleSupplier implements IDoubleSupplier {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Double get();
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `DoubleSupplier` that returns a next random Double value.
     * @return the `DoubleSupplier`
     * @see Math.random
     */
    public static DoubleSupplier random() {
        return new Random();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Random extends DoubleSupplier {
        public override Double get() { return Math.random(); }
    }
    // @end-group
    //</editor-fold>

}
