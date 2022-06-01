/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class LongTakeIterator implements Iterator<Long> {

    private final Iterator<Long> iterator;
    private final ILongPredicate predicate;
    private Boolean hasNext = false, hasNextEvaluated = false, hasNextPresent = false;
    private Long next;

    public LongTakeIterator(final Iterator<Long> iterator, final ILongPredicate predicate) {
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

    public Long next() {
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
