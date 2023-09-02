/**
 * @author Oleh Berehovskyi
 */
public virtual inherited sharing class FilterIterator implements Iterator<Object> {

    protected final Iterator<Object> iterator;
    private final IPredicate predicate;
    protected Boolean hasNext = false, hasNextEvaluated = false;
    protected Object next;

    public FilterIterator(final Iterator<Object> iterator, final IPredicate predicate) {
        this.iterator = iterator;
        this.predicate = predicate;
    }

    public Boolean hasNext() {
        if (!hasNextEvaluated) {
            computeNext();
            hasNextEvaluated = true;
        }
        return hasNext;
    }

    public Object next() {
        if (!hasNextEvaluated) { hasNext = hasNext(); }
        if (!hasNext) { throw new NoSuchElementException(); }
        hasNextEvaluated = false;
        return next;
    }

    protected virtual void computeNext() {
        while (iterator.hasNext()) {
            next = iterator.next();
            if (predicate.test(next)) {
                hasNext = true;
                return;
            }
        }
        hasNext = false;
    }

}
