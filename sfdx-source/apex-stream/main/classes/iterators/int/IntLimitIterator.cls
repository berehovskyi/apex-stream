/**
 * @author O. Berehovskyi>
 */
public class IntLimitIterator implements Iterator<Integer> {

    private final Iterator<Integer> iterator;
    private final Integer lim;
    private Integer i = 0;

    public IntLimitIterator(final Iterator<Integer> iterator, final Integer lim) {
        this.iterator = iterator;
        this.lim = lim;
    }

    public Boolean hasNext() {
        return (i < lim) && iterator.hasNext();
    }

    public Integer next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Integer computeNext() {
        i++;
        return iterator.next();
    }

}
