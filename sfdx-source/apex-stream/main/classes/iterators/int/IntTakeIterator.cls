/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class IntTakeIterator implements Iterator<Integer> {

    private final Iterator<Integer> iterator;
    private final IIntPredicate predicate;
    private Boolean hasNext = false, hasNextEvaluated = false, isNextCached = false;
    private Integer next;

    public IntTakeIterator(final Iterator<Integer> iterator, final IIntPredicate predicate) {
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

    public Integer next() {
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
