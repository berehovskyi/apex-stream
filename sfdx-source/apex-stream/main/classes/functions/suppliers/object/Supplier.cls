/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link ISupplier} functional interface and provides
 * common class level implementations, and related utilities.
 * @see Collector
 * @see SObjectCollector
 */
public abstract inherited sharing class Supplier implements ISupplier {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Object get();
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a `Supplier` that returns a new instance of the given type.
     * @param t Type of the new instance to create
     * @return the `Supplier`
     * @throws NullPointerException if `t` is null
     * @see Type.newInstance
     */
    public static Supplier of(final Type t) {
        Validate.notNull(t);
        return new OfType(t);
    }

    /**
     * @description Returns a composed `Supplier` of the `IIntSupplier`.
     * @param supplier the int supplier
     * @return the composed `Supplier`
     * @throws NullPointerException if `consumer` is null
     */
    public static Supplier upcast(final IIntSupplier supplier) {
        Validate.notNull(supplier);
        return new ForIntSupplier(supplier);
    }

    /**
     * @description Returns a composed `Supplier` of the `ILongSupplier`.
     * @param supplier the Long supplier
     * @return the composed `Supplier`
     * @throws NullPointerException if `consumer` is null
     */
    public static Supplier upcast(final ILongSupplier supplier) {
        Validate.notNull(supplier);
        return new ForLongSupplier(supplier);
    }

    /**
     * @description Returns a composed `Supplier` of the `IDoubleSupplier`.
     * @param supplier the Double supplier
     * @return the composed `Supplier`
     * @throws NullPointerException if `consumer` is null
     */
    public static Supplier upcast(final IDoubleSupplier supplier) {
        Validate.notNull(supplier);
        return new ForDoubleSupplier(supplier);
    }

    /**
     * @description Returns a composed `Supplier` of the `ISObjectSupplier`.
     * @param supplier the SObject supplier
     * @return the composed `Supplier`
     * @throws NullPointerException if `consumer` is null
     */
    public static Supplier upcast(final ISObjectSupplier supplier) {
        Validate.notNull(supplier);
        return new ForSObjectSupplier(supplier);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Supplier` that returns a list container to track joining string.
     * @return the `Supplier`
     * @see Collector.joining
     * @see SObjectCollector.joining
     */
    public static Supplier joiningString() {
        return new JoiningStringSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track int averaging.
     * @return the `Supplier`
     * @see Collector.averagingInt
     * @see SObjectCollector.averagingInt
     */
    public static Supplier averagingInt() {
        return new AveragingIntSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track Long averaging.
     * @return the `Supplier`
     * @see Collector.averagingLong
     * @see SObjectCollector.averagingLong
     */
    public static Supplier averagingLong() {
        return new AveragingLongSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track Double averaging.
     * @return the `Supplier`
     * @see Collector.averagingDouble
     * @see SObjectCollector.averagingDouble
     */
    public static Supplier averagingDouble() {
        return new AveragingDoubleSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track int summing.
     * @return the `Supplier`
     * @see Collector.summingInt
     * @see SObjectCollector.summingInt
     */
    public static Supplier summingInt() {
        return new SummingIntSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track Long summing.
     * @return the `Supplier`
     * @see Collector.summingLong
     * @see SObjectCollector.summingLong
     */
    public static Supplier summingLong() {
        return new SummingLongSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track Double summing.
     * @return the `Supplier`
     * @see Collector.summingDouble
     * @see SObjectCollector.summingDouble
     */
    public static Supplier summingDouble() {
        return new SummingDoubleSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track `identity`
     * mutation.
     * @return the `Supplier`
     * @see Collector.reducing
     */
    public static Supplier box(final Object identity) {
        return new BoxSupplier(identity);
    }

    /**
     * @description Returns a `Supplier` that returns a list container to track `identity`
     * mutation.
     * @return the `Supplier`
     * @see SObjectCollector.reducing
     */
    public static Supplier sObjectBox(final SObject identity) {
        return new SObjectBoxSupplier(identity);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class OfType extends Supplier {
        private final Type t;
        private OfType(Type t) { this.t = t; }
        public override Object get() { return t.newInstance(); }
    }

    private class ForIntSupplier extends Supplier {
        private final IIntSupplier supplier;
        private ForIntSupplier(IIntSupplier supplier) { this.supplier = supplier; }
        public override Object get() { return supplier.get(); }
    }

    private class ForLongSupplier extends Supplier {
        private final ILongSupplier supplier;
        private ForLongSupplier(ILongSupplier supplier) { this.supplier = supplier; }
        public override Object get() { return supplier.get(); }
    }

    private class ForDoubleSupplier extends Supplier {
        private final IDoubleSupplier supplier;
        private ForDoubleSupplier(IDoubleSupplier supplier) { this.supplier = supplier; }
        public override Object get() { return supplier.get(); }
    }

    private class ForSObjectSupplier extends Supplier {
        private final ISObjectSupplier supplier;
        private ForSObjectSupplier(ISObjectSupplier supplier) { this.supplier = supplier; }
        public override Object get() { return supplier.get(); }
    }

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

    private class BoxSupplier extends Supplier {
        private final Object identity;
        public BoxSupplier(Object identity) { this.identity = identity; }
        public override Object get() { return new List<Object>{ identity }; }
    }

    private class SObjectBoxSupplier extends Supplier {
        private final SObject identity;
        public SObjectBoxSupplier(SObject identity) { this.identity = identity; }
        public override Object get() { return new List<SObject>{ identity }; }
    }
    // @end-group
    //</editor-fold>

}
