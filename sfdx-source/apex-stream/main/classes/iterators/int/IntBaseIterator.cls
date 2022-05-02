/**
 * @author O. Berehovskyi>
 */
public abstract class IntBaseIterator implements Iterator<Integer> {

    protected Integer next;
    protected Boolean hasNext = false, isInit = false;

    public Boolean hasNext() {
        if (!isInit) {
            computeNext();
            isInit = true;
        }
        return hasNext;
    }

    public Integer next() {
        if (!isInit) { hasNext(); }
        if (!hasNext) { throw new NoSuchElementException(); }
        final Integer result = next;
        computeNext();
        if (!hasNext) { next = null; }
        return result;
    }

    protected abstract void computeNext();

}
