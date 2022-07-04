/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class SObjectTakeIterator implements Iterator<SObject> {

    private final Iterator<SObject> iterator;
    private final ISObjectPredicate predicate;
    private Boolean hasNext = false, hasNextEvaluated = false, isNextCached = false;
    private SObject next;

    public SObjectTakeIterator(final Iterator<SObject> iterator, final ISObjectPredicate predicate) {
        this.iterator = iterator;
        this.predicate = predicate;
    }

    public Boolean hasNext() {
        if (hasNextEvaluated) { return hasNext; }
        hasNext = iterator.hasNext();
        hasNextEvaluated = true;
        if (hasNext) { isNextCached = testNext(); }
        return hasNext;
    }

    public SObject next() {
        if (hasNextEvaluated && !hasNext) { throw new NoSuchElementException(); }
        hasNextEvaluated = false;
        if (isNextCached) {
            isNextCached = false;
            return next;
        }
        if (testNext()) {
            return next;
        } else {
            throw new NoSuchElementException();
        }
    }

    private Boolean testNext() {
        next = iterator.next();
        return (hasNext = predicate.test(next));
    }

}
