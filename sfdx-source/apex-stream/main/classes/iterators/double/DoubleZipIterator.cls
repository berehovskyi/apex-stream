/**
 * @author O. Berehovskyi>
 */
public class DoubleZipIterator implements Iterator<Double> {

    private final Iterator<Double> iterator1;
    private final Iterator<Double> iterator2;
    private final IDoubleBinaryOperator combiner;

    public DoubleZipIterator(final Iterator<Double> iterator1, final Iterator<Double> iterator2, final IDoubleBinaryOperator combiner) {
        this.iterator1 = iterator1;
        this.iterator2 = iterator2;
        this.combiner = combiner;
    }

    public Double next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Boolean hasNext() {
        return iterator1.hasNext() && iterator2.hasNext();
    }

    private Double computeNext() {
        return combiner.apply(iterator1.next(), iterator2.next());
    }

}
