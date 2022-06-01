/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class SObjectTakeIterator implements Iterator<SObject> {

    private final Iterator<SObject> iterator;
    private final ISObjectPredicate predicate;
    private Boolean hasNext = false, hasNextEvaluated = false, hasNextPresent = false;
    private SObject next;

    public SObjectTakeIterator(final Iterator<SObject> iterator, final ISObjectPredicate predicate) {
        this.iterator = iterator;
        this.predicate = predicate;
    }

    public Boolean hasNext() {
        if (hasNextEvaluated) { return hasNext; }
        hasNext = iterator.hasNext();
        hasNextEvaluated = true;
        if (hasNext) { hasNextPresent = testNext(); }
        return hasNext;
    }

    public SObject next() {
        if (hasNextEvaluated && !hasNext) {
            next = null;
            throw new NoSuchElementException();
        }
        hasNextEvaluated = false;
        if (hasNextPresent) {
            hasNextPresent = false;
            return next;
        }
        if (testNext()) {
            return next;
        } else {
            next = null;
            hasNextPresent = true;
            throw new NoSuchElementException();
        }
    }

    private Boolean testNext() {
        next = iterator.next();
        hasNext = predicate.test(next);
        return hasNext;
    }

}
