/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class LimitIterator implements Iterator<Object> {

    private final Iterator<Object> iterator;
    private final Integer lim;
    private Integer i = 0;

    public LimitIterator(final Iterator<Object> iterator, final Integer lim) {
        this.iterator = iterator;
        this.lim = lim;
    }

    public Boolean hasNext() {
        return (i < lim) && iterator.hasNext();
    }

    public Object next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Object computeNext() {
        i++;
        return iterator.next();
    }

}
