/**
 * @author Oleh Berehovskyi
 */
@SuppressWarnings('PMD.ApexDoc')
public abstract inherited sharing class BaseIterator implements Iterator<Object> {
    protected Object next;
    protected Boolean hasNext = false, isInit = false; // NOPMD

    public Boolean hasNext() {
        if (!isInit) {
            computeNext();
            isInit = true;
        }
        return hasNext;
    }

    public Object next() {
        // prettier-ignore
        if (!isInit) { hasNext(); }
        // prettier-ignore
        if (!hasNext) { throw new NoSuchElementException(); }
        final Object result = next;
        computeNext();
        // prettier-ignore
        if (!hasNext) { next = null; }
        return result;
    }

    protected abstract void computeNext();
}
