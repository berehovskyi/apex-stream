/**
 * @description Provides common implementations of {@link Supplier}
 * and related utilities that are used by {@link SObjectCollectors}.
 *
 * @see Supplier
 * @see SObjectCollectors
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class CollectorBaseSuppliers {

    @TestVisible
    private CollectorBaseSuppliers() {}
    
    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Supplier` that returns a list container to track joining String.
     *
     * @return the `Supplier`
     *
     * @see SObjectCollectors.joining
     */
    public static Supplier joiningString() {
        return new JoiningStringSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track Integer averaging.
     *
     * @return the `Supplier`
     *
     * @see SObjectCollectors.averagingInt
     */
    public static Supplier averagingInt() {
        return new AveragingIntSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track Long averaging.
     *
     * @return the `Supplier`
     *
     * @see SObjectCollectors.averagingLong
     */
    public static Supplier averagingLong() {
        return new AveragingLongSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track Double averaging.
     *
     * @return the `Supplier`
     *
     * @see SObjectCollectors.averagingDouble
     */
    public static Supplier averagingDouble() {
        return new AveragingDoubleSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track Integer summing.
     *
     * @return the `Supplier`
     *
     * @see SObjectCollectors.summingInt
     */
    public static Supplier summingInt() {
        return new SummingIntSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track Long summing.
     *
     * @return the `Supplier`
     *
     * @see SObjectCollectors.summingLong
     */
    public static Supplier summingLong() {
        return new SummingLongSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track Double summing.
     *
     * @return the `Supplier`
     *
     * @see SObjectCollectors.summingDouble
     */
    public static Supplier summingDouble() {
        return new SummingDoubleSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track `identity`
     * mutation.
     *
     * @param identity the tracked SObject
     *
     * @return the `Supplier`
     *
     * @see SObjectCollectors.reducing
     */
    public static Supplier sObjectBox(final SObject identity) {
        return new SObjectBoxSupplier(identity);
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
        public override Object get() { return new List<Long>{ 0, 0 }; }
    }

    private class AveragingDoubleSupplier extends Supplier {
        public override Object get() { return new List<Double>{ 0, 0, 0, 0 }; }
    }

    private class SummingIntSupplier extends Supplier {
        public override Object get() { return new List<Integer>{ 0 }; }
    }

    private class SummingLongSupplier extends Supplier {
        public override Object get() { return new List<Long>{ 0L }; }
    }

    private class SummingDoubleSupplier extends Supplier {
        public override Object get() { return new List<Double>{ 0, 0, 0 }; }
    }

    private class SObjectBoxSupplier extends Supplier {
        private final SObject identity;
        public SObjectBoxSupplier(SObject identity) { this.identity = identity; }
        public override Object get() { return new List<SObject>{ identity }; }
    }
    // @end-group
    //</editor-fold>
    
}
