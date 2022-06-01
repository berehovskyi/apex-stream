/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class LongLimitIterator implements Iterator<Long> {

    private final Iterator<Long> iterator;
    private final Integer lim;
    private Integer i = 0;

    public LongLimitIterator(final Iterator<Long> iterator, final Integer lim) {
        this.iterator = iterator;
        this.lim = lim;
    }

    public Boolean hasNext() {
        return (i < lim) && iterator.hasNext();
    }

    public Long next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Long computeNext() {
        i++;
        return iterator.next();
    }

}
