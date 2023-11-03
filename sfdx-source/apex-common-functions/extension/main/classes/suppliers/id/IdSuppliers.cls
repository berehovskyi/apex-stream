/**
 * @description Provides common implementations of `Id` {@link Supplier}
 * and related utilities.
 *
 * @see Supplier
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class IdSuppliers {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected IdSuppliers() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Supplier` that returns the next `Id` value
     * for the given `sObjectType`.
     * <p><strong>Note: </strong></p>
     * <p>This is a stateful function.</p>
     *
     * @param sObjectType SObjectType of the new id to create
     *
     * @return the `Supplier`
     *
     * @throws NullPointerException if `sObjectType` is null
     *
     * @example
     * ISupplier idSupp = IdSuppliers.of(Account.SObjectType);
     * idSupp.get(); // '000000000000000AAA'
     * idSupp.get(); // '000000000000001AAA'
     */
    public static Supplier of(final SObjectType sObjectType) {
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
            Validate.notNull(sObjectType);
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
