/**
 * @author Oleh Berehovskyi
 */
@SuppressWarnings('PMD.ApexDoc')
public inherited sharing class SkipIterator implements Iterator<Object> {
    private final Iterator<Object> iterator;
    private final Integer n;
    private Integer skipped = 0;

    public SkipIterator(final Iterator<Object> iterator, final Integer n) {
        Validate.notNull(iterator);
        Validate.notNull(n);
        Validate.isTrue(n >= 0, Label.AS_ErrorMessage_ArgumentNotPositive, new List<Object>{ n });
        this.iterator = iterator;
        this.n = n;
    }

    public Boolean hasNext() {
        while (skipped < n) {
            // prettier-ignore
            if (!iterator.hasNext()) { return false; }
            iterator.next();
            skipped++;
        }
        return iterator.hasNext();
    }

    public Object next() {
        // prettier-ignore
        if (!hasNext()) { throw new NoSuchElementException(); }
        return iterator.next();
    }
}
