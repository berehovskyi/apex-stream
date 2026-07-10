/**
 * @author Oleh Berehovskyi
 */
@SuppressWarnings('PMD.ApexDoc')
public abstract inherited sharing class BaseIterator implements Iterator<Object> {
    protected Object next;
    protected Boolean hasNext = false, isInit = false, isReady = false; // NOPMD

    public Boolean hasNext() {
        if (!isReady) {
            computeNext();
            isInit = true;
            isReady = true;
            // prettier-ignore
            if (!hasNext) { next = null; }
        }
        return hasNext;
    }

    public Object next() {
        // prettier-ignore
        if (!isReady) { hasNext(); }
        // prettier-ignore
        if (!hasNext) { throw new NoSuchElementException(); }
        final Object result = next;
        next = null;
        isReady = false;
        return result;
    }

    protected abstract void computeNext();
}
