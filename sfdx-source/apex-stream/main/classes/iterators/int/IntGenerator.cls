/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class IntGenerator implements Iterator<Integer> {

    private final IIntSupplier supplier;

    public IntGenerator(final IIntSupplier supplier) {
        this.supplier = supplier;
    }

    public Boolean hasNext() {
        return true;
    }

    public Integer next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Integer computeNext() {
        return supplier.get();
    }

}
