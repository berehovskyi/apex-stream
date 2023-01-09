/**
 * @description Provides common implementations of {@link Supplier}
 * and related utilities that are used by {@link Collectors}.
 *
 * @see Supplier
 * @see Collectors
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class CollectorSuppliers {

    @TestVisible
    private CollectorSuppliers() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Supplier` that returns a list container to track `identity`
     * mutation.
     *
     * @param identity the tracked Object
     *
     * @return the `Supplier`
     */
    public static Supplier box(final Object identity) {
        return new BoxSupplier(identity);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class BoxSupplier extends Supplier {
        private final Object identity;
        public BoxSupplier(Object identity) { this.identity = identity; }
        public override Object get() { return new List<Object>{ identity }; }
    }
    // @end-group
    //</editor-fold>

}
