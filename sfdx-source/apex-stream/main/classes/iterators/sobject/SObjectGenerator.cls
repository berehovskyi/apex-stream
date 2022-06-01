/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class SObjectGenerator implements Iterator<SObject> {

    private final ISObjectSupplier supplier;

    public SObjectGenerator(final ISObjectSupplier supplier) {
        this.supplier = supplier;
    }

    public Boolean hasNext() {
        return true;
    }

    public SObject next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public SObject computeNext() {
        return supplier.get();
    }
}
