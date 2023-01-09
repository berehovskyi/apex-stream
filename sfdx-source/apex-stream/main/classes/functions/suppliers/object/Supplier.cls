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
     * 
     * @example
     * ISupplier of = Supplier.of(List<Account>.class);
     * List<Account> accounts = (List<Account>) of.get(); // new List<Account>()
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
     * @example 
     * ISupplier constant = Supplier.constant('a');
     * constant.get(); // 'a'
     * constant.get(); // 'a'
     * constant.get(); // 'a'
     */
    public static Supplier constant(final Object o) {
        return new Constant(o);
    }

    /**
     * @description Returns a `Supplier` that infinitely returns the elements in order.
     *
     * @param iterable the iterable
     *
     * @return the `Supplier`
     * 
     * @example
     * ISupplier repeat = Supplier.repeat(new List<Object>{ 'a', 'b', 'c' });
     * repeat.get(); // 'a'
     * repeat.get(); // 'b'
     * repeat.get(); // 'c'
     * repeat.get(); // 'a'
     */
    public static Supplier repeat(final Iterable<Object> iterable) {
        Validate.notNull(iterable);
        return new Repeat(iterable);
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

    private class Repeat extends Supplier {
        private final List<Object> values;
        private final Integer size;
        private Integer i = 0;
        private Repeat(Iterable<Object> iterable) {
            values = Iterators.toObjectList(iterable.iterator());
            size = values.size();
        }
        public override Object get() { return values[Math.mod(i++, size)]; }
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
