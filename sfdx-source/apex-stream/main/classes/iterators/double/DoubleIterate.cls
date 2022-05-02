/**
 * @author O. Berehovskyi>
 */
public class DoubleIterate implements Iterator<Double> {

    private final IDoubleUnaryOperator operator;
    private Double next;

    public DoubleIterate(final Double seed, final IDoubleUnaryOperator operator) {
        this.operator = operator;
        next = seed;
    }

    public Boolean hasNext() {
        return true;
    }

    public Double next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Double computeNext() {
        final Double prev = next;
        next = operator.apply(next);
        return prev;
    }

}
