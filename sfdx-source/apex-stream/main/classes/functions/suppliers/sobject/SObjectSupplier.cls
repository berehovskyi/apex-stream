/**
 * @description Provides default and static methods of 
 * {@link ISObjectSupplier} functional interface.
 *
 * @see ISObjectSupplier
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class SObjectSupplier implements ISObjectSupplier {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract SObject get();
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a `SObjectSupplier` that returns a new `SObject` instance
     * of the given `sObjectType`.
     *
     * @param sObjectType SObjectType of the new instance to create
     *
     * @return the `SObjectSupplier`
     *
     * @throws NullPointerException if `sObjectType` is null
     *
     * @see SObjectType.newSObject
     */
    public static SObjectSupplier of(final SObjectType sObjectType) {
        Validate.notNull(sObjectType);
        return new OfType(sObjectType);
    }

    /**
     * @description Returns a stateful `Supplier` that returns a reference of the `sObj` SObject.
     *
     * @param sObj the SObject
     *
     * @return the `SObjectSupplier`
     *
     * @throws NullPointerException if `sObj` is null
     */
    public static SObjectSupplier constant(final SObject sObj) {
        Validate.notNull(sObj);
        return new Constant(sObj);
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
    public static SObjectSupplier repeat(final Iterable<SObject> iterable) {
        Validate.notNull(iterable);
        return new Repeat(iterable);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class OfType extends SObjectSupplier {
        private final SObjectType t;
        private OfType(SObjectType t) { this.t = t; }
        public override SObject get() { return t.newSObject(); }
    }

    private class Constant extends SObjectSupplier {
        private final SObject identity;
        public Constant(SObject identity) { this.identity = identity; }
        public override SObject get() { return identity; }
    }

    private class Repeat extends SObjectSupplier {
        private final List<SObject> values;
        private final Integer size;
        private Integer i = 0;
        private Repeat(Iterable<SObject> iterable) { 
            values = Iterators.toSObjectList(iterable.iterator());
            size = values.size();
        }
        public override SObject get() { return values[Math.mod(i++, size)]; }
    }
    // @end-group
    //</editor-fold>

}
