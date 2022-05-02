/**
 * @author O. Berehovskyi>
 */
public virtual class SObjectFilterIterator implements Iterator<SObject> {

    protected final Iterator<SObject> iterator;
    private final ISObjectPredicate predicate;
    protected Boolean hasNext = false, hasNextEvaluated = false;
    protected SObject next;

    public SObjectFilterIterator(final Iterator<SObject> iterator, final ISObjectPredicate predicate) {
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

    public SObject next() {
        if (!hasNextEvaluated) hasNext = hasNext();
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
