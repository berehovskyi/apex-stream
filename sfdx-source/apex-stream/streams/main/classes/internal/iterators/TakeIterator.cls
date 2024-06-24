/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class TakeIterator implements Iterator<Object> {

    private final Iterator<Object> iterator;
    private final IPredicate predicate;
    private Boolean hasNext = false, hasNextEvaluated = false, isNextCached = false; // NOPMD
    private Object next;

    public TakeIterator(final Iterator<Object> iterator, final IPredicate predicate) {
        Validate.notNull(iterator);
        Validate.notNull(predicate);
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

    public Object next() {
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
