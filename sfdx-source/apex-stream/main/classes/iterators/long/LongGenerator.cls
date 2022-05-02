/**
 * @author O. Berehovskyi>
 */
public class LongGenerator implements Iterator<Long> {

    private final ILongSupplier supplier;

    public LongGenerator(final ILongSupplier supplier) {
        this.supplier = supplier;
    }

    public Boolean hasNext() {
        return true;
    }

    public Long next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Long computeNext() {
        return supplier.get();
    }
}
