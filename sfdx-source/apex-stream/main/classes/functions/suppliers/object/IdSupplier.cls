/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Provides common class level implementations, and related utilities for
 * `IdSuppliers`.
 */
public abstract inherited sharing class IdSupplier extends Supplier {

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a `Supplier` that returns the next `Id` value
     * for the given `sObjectType`.
     * <p><strong>Note: </strong></p>
     * <p>This is a stateful function.</p>
     * @example
     * ISupplier idSupp = IdSupplier.of(Account.SObjectType);
     * idSupp.get(); // '000000000000000AAA'
     * idSupp.get(); // '000000000000001AAA'
     * @param sObjectType SObjectType of the new id to create
     * @return the `Supplier`
     * @throws NullPointerException if `sObjectType` is null
     * @see SObjectType.newSObject
     */
    public static Supplier of(final SObjectType sObjectType) {
        Validate.notNull(sObjectType);
        return new OfType(sObjectType);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class OfType extends Supplier {
        private Integer i = 0;
        private final String keyPrefix;
        private final String placeholder = '000000000000';
        private OfType(SObjectType sObjectType) {
            this.keyPrefix = sObjectType.getDescribe().getKeyPrefix();
        }
        public override Object get() {
            return Id.valueOf(
                    keyPrefix
                            + placeholder.substring(0, 12 - String.valueOf(i).length())
                            + i++
            );
        }
    }
    // @end-group
    //</editor-fold>

}
