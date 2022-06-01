/**
 * @author Oleh Berehovskyi
 */
public virtual inherited sharing class IntFilterIterator implements Iterator<Integer> {

    protected final Iterator<Integer> iterator;
    private final IIntPredicate predicate;
    protected Boolean hasNext = false, hasNextEvaluated = false;
    protected Integer next;

    public IntFilterIterator(final Iterator<Integer> iterator, final IIntPredicate predicate) {
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

    public Integer next() {
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
