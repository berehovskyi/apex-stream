/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class SkipIterator implements Iterator<Object> {

    private final Iterator<Object> iterator;
    private final Integer n;
    private Integer skipped = 0;

    public SkipIterator(final Iterator<Object> iterator, final Integer n) {
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

    public Object next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Object computeNext() {
        return iterator.next();
    }

}
