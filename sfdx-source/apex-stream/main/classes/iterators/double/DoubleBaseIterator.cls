/**
 * @author Oleh Berehovskyi
 */
public abstract inherited sharing class DoubleBaseIterator implements Iterator<Double> {

    protected Double next;
    protected Boolean hasNext = false, isInit = false;

    public Boolean hasNext() {
        if (!isInit) {
            computeNext();
            isInit = true;
        }
        return hasNext;
    }

    public Double next() {
        if (!isInit) { hasNext(); }
        if (!hasNext) { throw new NoSuchElementException(); }
        final Double result = next;
        computeNext();
        if (!hasNext) { next = null; }
        return result;
    }

    protected abstract void computeNext();

}
