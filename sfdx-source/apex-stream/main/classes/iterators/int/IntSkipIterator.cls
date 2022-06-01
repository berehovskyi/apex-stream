/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class IntSkipIterator implements Iterator<Integer> {

    private final Iterator<Integer> iterator;
    private final Integer n;
    private Integer skipped = 0;

    public IntSkipIterator(final Iterator<Integer> iterator, final Integer n) {
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

    public Integer next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Integer computeNext() {
        return iterator.next();
    }

}
