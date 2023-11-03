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
public virtual inherited sharing class CollectorSuppliers extends BaseCollectorSuppliers {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected CollectorSuppliers() {}
    
    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Supplier` that returns a list container to track joining String.
     *
     * @return the `Supplier`
     *
     * @see Collectors.joining
     */
    public static Supplier joiningString() {
        return new JoiningStringSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track Integer averaging.
     *
     * @return the `Supplier`
     *
     * @see Collectors.averagingInt
     */
    public static Supplier averagingInt() {
        return new AveragingIntSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track Long averaging.
     *
     * @return the `Supplier`
     *
     * @see Collectors.averagingLong
     */
    public static Supplier averagingLong() {
        return new AveragingLongSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track `identity`
     * mutation.
     *
     * @param identity the tracked SObject
     *
     * @return the `Supplier`
     *
     * @see Collectors.reducing
     */
    public static Supplier box(final Object identity) {
        return new BoxSupplier(identity);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class JoiningStringSupplier extends Supplier {
        public override Object get() { return new List<String>{ '' }; }
    }

    private class AveragingIntSupplier extends Supplier {
        public override Object get() { return new List<Integer>{ 0, 0 }; }
    }

    private class AveragingLongSupplier extends Supplier {
        public override Object get() { return new List<Long>{ 0L, 0L }; }
    }

    private class BoxSupplier extends Supplier {
        private final Object identity;
        public BoxSupplier(Object identity) { this.identity = identity; }
        public override Object get() { return new List<Object>{ identity }; }
    }
    // @end-group
    //</editor-fold>
    
}
