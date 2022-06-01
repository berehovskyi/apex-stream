/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class IntTakeIterator implements Iterator<Integer> {

    private final Iterator<Integer> iterator;
    private final IIntPredicate predicate;
    private Boolean hasNext = false, hasNextEvaluated = false, hasNextPresent = false;
    private Integer next;

    public IntTakeIterator(final Iterator<Integer> iterator, final IIntPredicate predicate) {
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

    public Integer next() {
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
