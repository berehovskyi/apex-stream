/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Inherits {@link ISObjectSupplier} functional interface and provides
 * common class level implementations, and related utilities.
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
     * @param sObjectType SObjectType of the new instance to create
     * @return the `SObjectSupplier`
     * @throws NullPointerException if `sObjectType` is null
     * @see SObjectType.newSObject
     */
    public static SObjectSupplier of(final SObjectType sObjectType) {
        Validate.notNull(sObjectType);
        return new OfType(sObjectType);
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
    // @end-group
    //</editor-fold>

}
