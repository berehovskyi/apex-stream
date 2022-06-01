/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class LongSkipIterator implements Iterator<Long> {

    private final Iterator<Long> iterator;
    private final Integer n;
    private Integer skipped = 0;

    public LongSkipIterator(final Iterator<Long> iterator, final Integer n) {
        this.iterator = iterator;
        this.n = n;
    }

    public Boolean hasNext() {
        while (skipped < n) {
            if (!iterator.hasNext()) { return false; }
            iterator.next();
            skipped++;
        }
        return iterator.hasNext();
    }

    public Long next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Long computeNext() {
        return iterator.next();
    }

}
