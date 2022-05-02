/**
 * @author O. Berehovskyi>
 */
public class SObjectLimitIterator implements Iterator<SObject> {

    private final Iterator<SObject> iterator;
    private final Integer lim;
    private Integer i = 0;

    public SObjectLimitIterator(final Iterator<SObject> iterator, final Integer lim) {
        this.iterator = iterator;
        this.lim = lim;
    }

    public Boolean hasNext() {
        return (i < lim) && iterator.hasNext();
    }

    public SObject next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public SObject computeNext() {
        i++;
        return iterator.next();
    }

}
