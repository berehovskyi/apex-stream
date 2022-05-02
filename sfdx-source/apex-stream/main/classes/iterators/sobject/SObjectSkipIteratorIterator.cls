/**
 * @author O. Berehovskyi>
 */
public class SObjectSkipIteratorIterator implements Iterator<SObject> {

    private final Iterator<SObject> iterator;
    private final Integer n;
    private Integer skipped = 0;

    public SObjectSkipIteratorIterator(final Iterator<SObject> iterator, final Integer n) {
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

    public SObject next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public SObject computeNext() {
        return iterator.next();
    }

}
