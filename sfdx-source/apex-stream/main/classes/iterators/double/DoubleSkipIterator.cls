/**
 * @author O. Berehovskyi>
 */
public class DoubleSkipIterator implements Iterator<Double> {

    private final Iterator<Double> iterator;
    private final Integer n;
    private Integer skipped = 0;

    public DoubleSkipIterator(final Iterator<Double> iterator, final Integer n) {
        this.iterator = iterator;
        this.n = n;
    }

    public Boolean hasNext() {
        while (skipped < n) {
            if (!iterator.hasNext()) {
                return false;
            }
            iterator.next();
            skipped++;
        }
        return iterator.hasNext();
    }

    public Double next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Double computeNext() {
        return iterator.next();
    }

}
