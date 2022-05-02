/**
 * @author O. Berehovskyi>
 */
public class DoubleLimitIterator implements Iterator<Double> {

    private final Iterator<Double> iterator;
    private final Integer lim;
    private Integer i = 0;

    public DoubleLimitIterator(final Iterator<Double> iterator, final Integer lim) {
        this.iterator = iterator;
        this.lim = lim;
    }

    public Boolean hasNext() {
        return (i < lim) && iterator.hasNext();
    }

    public Double next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Double computeNext() {
        i++;
        return iterator.next();
    }

}
