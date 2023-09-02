/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class SupplierGenerator implements Iterator<Object> {

    private final ISupplier supplier;

    public SupplierGenerator(final ISupplier supplier) {
        this.supplier = supplier;
    }

    public Boolean hasNext() {
        return true;
    }

    public Object next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Object computeNext() {
        return supplier.get();
    }

}
