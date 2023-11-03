/**
 * @description Provides common implementations of {@link Supplier}
 * and related utilities that are used by {@link IEnumerable}.
 *
 * @see Supplier
 * @see BaseCollectors
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class BaseCollectorSuppliers {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected BaseCollectorSuppliers() {}
    
    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Supplier` that returns a list container to track Double averaging.
     *
     * @return the `Supplier`
     *
     * @see BaseCollectors.averagingDouble
     */
    public static Supplier averagingDouble() {
        return new AveragingDoubleSupplier();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AveragingDoubleSupplier extends Supplier {
        public override Object get() { return new List<Double>{ 0, 0, 0, 0 }; }
    }
    // @end-group
    //</editor-fold>
    
}
