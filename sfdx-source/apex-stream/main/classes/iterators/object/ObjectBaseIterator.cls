/**
 * @author Oleh Berehovskyi
 */
public abstract inherited sharing class ObjectBaseIterator implements Iterator<Object> {

    protected Object next;
    protected Boolean hasNext = false, isInit = false;

    public Boolean hasNext() {
        if (!isInit) {
            computeNext();
            isInit = true;
        }
        return hasNext;
    }

    public Object next() {
        if (!isInit) { hasNext(); }
        if (!hasNext) { throw new NoSuchElementException(); }
        final Object result = next;
        computeNext();
        if (!hasNext) { next = null; }
        return result;
    }

    protected abstract void computeNext();

}
