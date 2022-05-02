/**
 * @author O. Berehovskyi>
 */
public class DoubleGenerator implements Iterator<Double> {

    private final IDoubleSupplier supplier;

    public DoubleGenerator(final IDoubleSupplier supplier) {
        this.supplier = supplier;
    }

    public Boolean hasNext() {
        return true;
    }

    public Double next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Double computeNext() {
        return supplier.get();
    }

}
