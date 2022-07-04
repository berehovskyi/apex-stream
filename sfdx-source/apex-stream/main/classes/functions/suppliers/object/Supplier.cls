/**
 * @description Provides default and static methods of 
 * {@link ISupplier} functional interface.
 *
 * @see ISupplier
 * @see Collector
 * @see SObjectCollector
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
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
     *
     * @param t Type of the new instance to create
     *
     * @return the `Supplier`
     *
     * @throws NullPointerException if `t` is null
     *
     * @see Type.newInstance
     */
    public static Supplier of(final Type t) {
        Validate.notNull(t);
        return new OfType(t);
    }

    /**
     * @description Returns a stateful `Supplier` that returns a reference of the `o` object.
     *
     * @param o the Object
     *
     * @return the `Supplier`
     *
     * @throws NullPointerException if `o` is null
     */
    public static Supplier constant(final Object o) {
        Validate.notNull(o);
        return new Constant(o);
    }

    /**
     * @description Returns a composed `Supplier` of the `IIntSupplier`.
     *
     * @param supplier the int supplier
     *
     * @return the composed `Supplier`
     *
     * @throws NullPointerException if `consumer` is null
     */
    public static Supplier compose(final IIntSupplier supplier) {
        Validate.notNull(supplier);
        return new ForIntSupplier(supplier);
    }

    /**
     * @description Returns a composed `Supplier` of the `ILongSupplier`.
     *
     * @param supplier the Long supplier
     *
     * @return the composed `Supplier`
     *
     * @throws NullPointerException if `consumer` is null
     */
    public static Supplier compose(final ILongSupplier supplier) {
        Validate.notNull(supplier);
        return new ForLongSupplier(supplier);
    }

    /**
     * @description Returns a composed `Supplier` of the `IDoubleSupplier`.
     *
     * @param supplier the Double supplier
     *
     * @return the composed `Supplier`
     *
     * @throws NullPointerException if `consumer` is null
     */
    public static Supplier compose(final IDoubleSupplier supplier) {
        Validate.notNull(supplier);
        return new ForDoubleSupplier(supplier);
    }

    /**
     * @description Returns a composed `Supplier` of the `ISObjectSupplier`.
     *
     * @param supplier the SObject supplier
     *
     * @return the composed `Supplier`
     *
     * @throws NullPointerException if `consumer` is null
     */
    public static Supplier compose(final ISObjectSupplier supplier) {
        Validate.notNull(supplier);
        return new ForSObjectSupplier(supplier);
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

    private class Constant extends Supplier {
        private final Object identity;
        public Constant(Object identity) { this.identity = identity; }
        public override Object get() { return identity; }
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
    // @end-group
    //</editor-fold>

}
