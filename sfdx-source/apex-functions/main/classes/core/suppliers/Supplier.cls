/**
 * @description Provides default and static methods of 
 * {@link ISupplier} functional interface.
 *
 * @see ISupplier
 * @see Collector
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
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class OfType extends Supplier {
        private final Type t;
        private OfType(Type t) {
            Validate.notNull(t);
            this.t = t;
        }
        public override Object get() { return t.newInstance(); }
    }

    private class Constant extends Supplier {
        private final Object identity;
        public Constant(Object identity) { this.identity = identity; }
        public override Object get() { return identity; }
    }

    private class Repeat extends Supplier {
        private final Iterable<Object> iterable;
        private Iterator<Object> iterator;
        private Repeat(Iterable<Object> iterable) { this.iterable = iterable; }
        public override Object get() {
            if (iterator?.hasNext() != true) { iterator = iterable.iterator(); }
            return iterator.next();
        }
    }
    // @end-group
    //</editor-fold>

}
