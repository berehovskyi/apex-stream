/**
 * @description Provides common implementations of {@link DoubleSupplier}
 * and related utilities.
 *
 * @see DoubleSupplier
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class DoubleSuppliers {

    @TestVisible
    private DoubleSuppliers(){}
    
    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `DoubleSupplier` that returns a next random Double value.
     *
     * @return the `DoubleSupplier`
     *
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
