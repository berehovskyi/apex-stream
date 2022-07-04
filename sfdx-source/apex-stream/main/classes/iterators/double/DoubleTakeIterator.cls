/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class DoubleTakeIterator implements Iterator<Double> {

    private final Iterator<Double> iterator;
    private final IDoublePredicate predicate;
    private Boolean hasNext = false, hasNextEvaluated = false, isNextCached = false;
    private Double next;

    public DoubleTakeIterator(final Iterator<Double> iterator, final IDoublePredicate predicate) {
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

    public Double next() {
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
