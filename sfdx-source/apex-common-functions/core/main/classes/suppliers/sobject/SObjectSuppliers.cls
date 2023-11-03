/**
 * @description Provides common implementations of `SObject` {@link Supplier}
 * and related utilities.
 *
 * @see Supplier
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class SObjectSuppliers {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected SObjectSuppliers() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
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
    public static Supplier of(final SObjectType sObjectType) {
        return new OfSObjectType(sObjectType);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class OfSObjectType extends Supplier {
        private final SObjectType t;
        private OfSObjectType(SObjectType t) {
            Validate.notNull(t);
            this.t = t;
        }
        public override Object get() { return t.newSObject(); }
    }
    // @end-group
    //</editor-fold>

}
