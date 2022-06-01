/**
 * @author Oleh Berehovskyi
 */
public abstract inherited sharing class SObjectBaseIterator implements Iterator<SObject> {

    protected SObject next;
    protected Boolean hasNext = false, isInit = false;

    public Boolean hasNext() {
        if (!isInit) {
            computeNext();
            isInit = true;
        }
        return hasNext;
    }

    public SObject next() {
        if (!isInit) { hasNext(); }
        if (!hasNext) { throw new NoSuchElementException(); }
        final SObject result = next;
        computeNext();
        if (!hasNext) { next = null; }
        return result;
    }

    protected abstract void computeNext();

}
