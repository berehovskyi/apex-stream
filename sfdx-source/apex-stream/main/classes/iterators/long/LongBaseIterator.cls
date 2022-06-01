/**
 * @author Oleh Berehovskyi
 */
public abstract inherited sharing class LongBaseIterator implements Iterator<Long> {

    protected Long next;
    protected Boolean hasNext = false, isInit = false;

    public Boolean hasNext() {
        if (!isInit) {
            computeNext();
            isInit = true;
        }
        return hasNext;
    }

    public Long next() {
        if (!isInit) { hasNext(); }
        if (!hasNext) throw new NoSuchElementException();
        final Long result = next;
        computeNext();
        if (!hasNext) next = null;
        return result;
    }

    protected abstract void computeNext();

}
