/**
 * @author Oleh Berehovskyi
 */
@SuppressWarnings('PMD.ApexDoc')
public inherited sharing class SupplierGenerator implements Iterator<Object> {
    private final ISupplier supplier;

    public SupplierGenerator(final ISupplier supplier) {
        AfSupport.notNull(supplier);
        this.supplier = supplier;
    }

    public Boolean hasNext() {
        return true;
    }

    public Object next() {
        return supplier.get();
    }
}
