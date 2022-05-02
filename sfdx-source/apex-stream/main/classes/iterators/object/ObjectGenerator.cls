/**
 * @author O. Berehovskyi>
 */
public class ObjectGenerator implements Iterator<Object> {

    private final ISupplier supplier;

    public ObjectGenerator(final ISupplier supplier) {
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
