/**
 * @author Oleh Berehovskyi
 */
public virtual inherited sharing class LongFilterIterator implements Iterator<Long> {

    protected final Iterator<Long> iterator;
    private final ILongPredicate predicate;
    protected Boolean hasNext = false, hasNextEvaluated = false;
    protected Long next;

    public LongFilterIterator(final Iterator<Long> iterator, final ILongPredicate predicate) {
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

    public Long next() {
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
