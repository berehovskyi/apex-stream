/**
 * @description A provider class that supplies various `Supplier` instances capable of creating new `SObject` instances.
 * This class serves as a factory for generating suppliers that can instantiate specific SObject types.
 *
 * The `Supplier` interface returned by the methods of this class allows for flexible creation of SObject instances
 * based on the given SObjectType.
 *
 * @example
 * ISupplier accSupplier = new SObjectSupplierProvider().of(Account.SObjectType);
 * accSupplier.get(); // Account {}
 */
public virtual inherited sharing class SObjectSupplierProvider {
    /**
     * @description Returns a `Supplier` that returns a new `SObject` instance
     * of the given `sObjectType`.
     *
     * @param sObjectType SObjectType of the new instance to create
     *
     * @return the `Supplier`
     *
     * @throws NullPointerException if `sObjectType` is null
     *
     * @see SObjectType.newSObject
     *
     * @example
     * ISupplier accSupplier = new SObjectSupplierProvider().of(Account.SObjectType);
     * accSupplier.get(); // Account {}
     */
    public virtual Supplier of(final SObjectType sObjectType) {
        return new NewSObjectSupplier(sObjectType);
    }

    private class NewSObjectSupplier extends Supplier {
        private final SObjectType t;
        private NewSObjectSupplier(SObjectType t) {
            Validate.notNull(t);
            this.t = t;
        }
        public override Object get() { return t.newSObject(); }
    }
}
